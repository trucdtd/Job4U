package demo.Controllers;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.entity.UsersEntity;
import demo.services.SessionService;
import demo.services.UserRepository;
import demo.services.UserService;
import demo.util.MaHoa;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller

@RequestMapping("/QuenMatKhau")
public class quenMatKhauController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserService userService; // Dịch vụ xử lý logic người dùng

	@Autowired
	ServletRequest req;;

	@GetMapping("")
	public String hienThiQuenMatKhauForm() {
		return "quenMatKhau"; // Trả về trang form quên mật khẩu
	}

	@GetMapping("/NhapMa")
	public String hienThiNhapMaMatKhauForm() {
		return "nhapMa"; // Trả về trang form quên mật khẩu
	}

	@GetMapping("/Datlaimatkhau")
	public String hienThiNhapLaiMatKhauForm() {
		return "datLaiMatKhau"; // Trả về trang form quên mật khẩu
	}

	@PostMapping("/submit")
	public String quenMatKhau(@RequestParam("email") String userEmail, Model model, HttpSession session) {
		if (!isValidEmail(userEmail)) {
			model.addAttribute("error", "Email không đúng định dạng.");
			return "quenMatKhau"; // Trang nhập email
		}

		if (!userService.isEmailExists(userEmail)) {
			model.addAttribute("error", "Email này không tồn tại trong hệ thống.");
			return "quenMatKhau"; // Trang nhập email
		}

		String token = generateToken();
		UsersEntity user = userRepository.findByEmail(userEmail);
		user.setToken(token); // Lưu token vào cơ sở dữ liệu
		userRepository.save(user);

		// Lưu mã token vào session
		session.setAttribute("resetToken", token);
		sendEmail(userEmail, token);

		return "redirect:/QuenMatKhau/NhapMa";
	}

	public boolean isValidEmail(String email) {
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
		Pattern pattern = Pattern.compile(emailRegex);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}

	public void sendEmail(String userEmail, String token) {
		try {
			// Lấy thông tin người dùng từ cơ sở dữ liệu
			UsersEntity user = userRepository.findByEmail(userEmail);
			String username = user != null ? user.getUsername() : "User"; // Tránh lỗi nếu không tìm thấy người dùng

			// Tạo đối tượng MimeMessage
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			// Cấu hình người nhận và tiêu đề
			helper.setTo(userEmail);
			helper.setSubject("Yêu cầu đặt lại mật khẩu");

			// // Nội dung HTML của email
			String htmlContent = "<!DOCTYPE html>\n" + "<html lang=\"en\">\n" + "<head>\n"
					+ "    <meta charset=\"UTF-8\">\n"
					+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
					+ "    <title>Reset Password</title>\n" + "</head>\n"
					+ "<body style=\"font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;\">\n"
					+ "    <table align=\"center\" width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ffffff; margin: 40px auto; border-radius: 10px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); border: 1px solid #e0e0e0;\">\n"
					+ "        <!-- Header -->\n" + "        <tr>\n"
					+ "            <td style=\"padding: 30px 20px; text-align: left;\">\n"
					+ "                <h2 style=\"margin: 0; font-size: 20px; color: #333;\">Yêu cầu đặt lại mật khẩu</h2>\n"
					+ "            </td>\n" + "        </tr>\n" + "        <!-- Body -->\n" + "        <tr>\n"
					+ "            <td style=\"padding: 40px 20px; text-align: left; color: #333;\">\n"
					+ "                <p style=\"margin: 0; font-size: 16px; color: #333;\">Xin chào <span style=\"color: #28a745; font-weight: bold; font-style: italic;\">"
					+ username + "</span>,</p>\n"
					+ "                <p style=\"margin: 10px 0; font-size: 16px; color: #333;\">Mã xác thực để đặt lại mật khẩu của bạn là:</p>\n"
					+ "                <div style=\"text-align: center; margin: 30px 0;\">\n"
					+ "                    <span style=\"display: inline-block; background-color: #e8f0fe; padding: 20px 40px; border-radius: 10px; font-size: 24px; font-weight: bold; color: #333; border: 1px solid #c3d4e9;\">"
					+ token + "</span>\n" + "                </div>\n"
					+ "                <p style=\"margin: 10px 0; font-size: 16px; color: #333;\">Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.</p>\n"
					+ "            </td>\n" + "        </tr>\n" + "        <!-- Footer -->\n" + "        <tr>\n"
					+ "            <td style=\"padding: 30px 20px; text-align: center; font-size: 12px; color: #888;\">\n"
					+ "                <p style=\"margin: 0;\">&copy; 2024 Job4U. All rights reserved.</p>\n"
					+ "            </td>\n" + "        </tr>\n" + "    </table>\n" + "</body>\n" + "</html>";

			// Thiết lập nội dung email là HTML
			helper.setText(htmlContent, true);

			// Gửi email
			mailSender.send(message);
		} catch (MessagingException e) {
			// Xử lý lỗi nếu có
			System.out.println("Error sending email: " + e.getMessage());
		}
	}

	private static final String NUMERIC_CHARACTERS = "0123456789";
	private static final int TOKEN_LENGTH = 6;

	// Sinh mã token không mã hóa
	public static String generateToken() {
		SecureRandom random = new SecureRandom();
		StringBuilder token = new StringBuilder(TOKEN_LENGTH);

		// Sinh token chỉ gồm số
		for (int i = 0; i < TOKEN_LENGTH; i++) {
			token.append(NUMERIC_CHARACTERS.charAt(random.nextInt(NUMERIC_CHARACTERS.length())));
		}

		return token.toString(); // Trả về token dạng chuỗi số
	}

	// Mã hóa token thành chuỗi Base64
	public static String encodeToken(String token) {
		return Base64.getEncoder().encodeToString(token.getBytes());
	}

	// Giải mã chuỗi Base64 thành token gốc
	public static String decodeToken(String encodedToken) {
		byte[] decodedBytes = Base64.getDecoder().decode(encodedToken);
		return new String(decodedBytes);
	}

	@PostMapping("/NhapMa")
	public String hienThiNhapMaForm(@RequestParam("token") String token, Model model, HttpSession session) {
		// Kiểm tra xem token có trống hay không
		if (token == null || token.isEmpty()) {
			model.addAttribute("error", "Mã token bị trống.");
			return "nhapMa"; // Trang nhập mã
		}

		// Lấy token đã gửi từ session
		String sessionToken = (String) session.getAttribute("resetToken");

		// Kiểm tra mã token có khớp không
		if (sessionToken == null || !sessionToken.equals(token)) {
			model.addAttribute("error", "Mã token không hợp lệ.");
			return "nhapMa"; // Trang nhập mã
		}

		// Truyền token vào model nếu hợp lệ
		model.addAttribute("token", token);

		// Chuyển hướng đến trang đặt lại mật khẩu
		return "datLaiMatKhau";
	}

	@PostMapping("/DatLaiMatKhau")
	public String xuLyDatLaiMatKhau(@RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword, Model model, RedirectAttributes redirectAttributes,
			HttpSession session) {

		// Lấy token từ session
		String sessionToken = (String) session.getAttribute("resetToken");
		if (sessionToken == null) {
			model.addAttribute("error", "Phiên đã hết hạn hoặc mã token không hợp lệ.");
			return "datLaiMatKhau"; // Trả về trang đặt lại mật khẩu với thông báo lỗi
		}

		// Kiểm tra lỗi cho mật khẩu
		if (newPassword.isEmpty()) {
			model.addAttribute("error", "Mật khẩu không được để trống.");
			return "datLaiMatKhau";
		} else if (!isValidPassword(newPassword)) {
			model.addAttribute("error", "Mật khẩu có ít nhất 8 ký tự, chứa ít nhất một số và một chữ cái.");
			return "datLaiMatKhau";
		}

		// Kiểm tra mật khẩu mới và xác nhận mật khẩu có khớp không
		if (!newPassword.equals(confirmPassword)) {
			model.addAttribute("error", "Mật khẩu và xác nhận mật khẩu không khớp.");
			return "datLaiMatKhau"; // Trả về trang đặt lại mật khẩu với thông báo lỗi
		}

		// Tìm người dùng dựa trên token đã lưu trong session
		UsersEntity user = userRepository.findByToken(sessionToken);
		if (user == null) {
			model.addAttribute("error", "Mã token không hợp lệ.");
			return "datLaiMatKhau";
		}

		// Mã hóa mật khẩu trước khi lưu (nếu cần)
		// String encodedPassword = passwordEncoder.encode(newPassword);
		// user.setPassword(encodedPassword);
		newPassword = MaHoa.toSHA1(newPassword);
		user.setPassword(newPassword); // Nếu không mã hóa mật khẩu, chỉ lưu mật khẩu mới
		user.setToken(null); // Hủy token sau khi mật khẩu đã được đặt lại
		userRepository.save(user); // Lưu thông tin vào cơ sở dữ liệu

		// Xóa token khỏi session
		session.removeAttribute("resetToken");

		// Thêm thông báo thành công vào redirectAttributes
		redirectAttributes.addFlashAttribute("message", "Mật khẩu đã được thay đổi thành công");

		// Chuyển hướng đến trang đăng nhập
		return "dangnhap";
	}

	// Xác thực token
	public boolean validatePasswordResetToken(String token, String code) {
		// Giải mã token
		String decodedToken = decodeToken(token);
		UsersEntity user = userRepository.findByToken(decodedToken);
		return user != null && user.getToken().equals(code);
	}

	// Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không
	public boolean isEmailExists(String email) {
		return userRepository.findByEmail(email) != null;
	}

	private boolean isValidPassword(String password) {
		// Kiểm tra mật khẩu có ít nhất 8 ký tự, chứa ít nhất một số và một chữ cái
		return password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$");
	}

}
