package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private RestTemplate restTemplate;

	private final String apiUrl = "https://api-inference.huggingface.co/models/gpt2";

	@PostMapping("/send")
	public ResponseEntity<Map<String, String>> chat(@RequestBody Map<String, String> payload) {
		String userMessage = payload.get("message");
		try {
			String response = callChatBot(userMessage);
			Map<String, String> responseMap = new HashMap<>();
			responseMap.put("reply", response);
			return ResponseEntity.ok(responseMap);
		} catch (Exception e) {
			e.printStackTrace(); // In ra chi tiết lỗi
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(Map.of("error", "Có lỗi xảy ra: " + e.getMessage()));
		}
	}

	private String callChatBot(String userMessage) {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer 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"); // Thay thế bằng API key của bạn
		headers.set("Content-Type", "application/json");

		Map<String, Object> requestPayload = new HashMap<>();
		requestPayload.put("inputs", userMessage);

		HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestPayload, headers);

		for (int i = 0; i < 3; i++) { // Thử lại tối đa 3 lần
			try {
				ResponseEntity<List<Map<String, Object>>> responseEntity = restTemplate.exchange(apiUrl,
						HttpMethod.POST, requestEntity, new ParameterizedTypeReference<List<Map<String, Object>>>() {
						});

				List<Map<String, Object>> responseBody = responseEntity.getBody();
				System.out.println("Response body: " + responseBody); // Log toàn bộ phản hồi

				if (responseEntity.getStatusCode() == HttpStatus.OK && responseBody != null
						&& !responseBody.isEmpty()) {
					Map<String, Object> generatedText = responseBody.get(0);
					if (generatedText.containsKey("generated_text")) {
						return (String) generatedText.get("generated_text");
					}
				}
				break; // Nếu thành công, thoát khỏi vòng lặp
			} catch (HttpServerErrorException e) {
				if (e.getStatusCode() == HttpStatus.SERVICE_UNAVAILABLE) {
					System.out.println("Mô hình đang tải, đợi 5 giây trước khi thử lại...");
					try {
						Thread.sleep(5000); // Đợi 5 giây trước khi thử lại
					} catch (InterruptedException ie) {
						Thread.currentThread().interrupt(); // Khôi phục trạng thái gián đoạn
					}
				} else {
					throw e; // Ném lại lỗi khác
				}
			}
		}

		throw new RuntimeException("Không có phản hồi từ AI");
	}
}
