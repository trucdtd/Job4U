package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.services.UserService;

@Controller

@RequestMapping("/QuenMatKhau")
public class quenMatKhauController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private UserService userService; // Dịch vụ xử lý logic người dùng
	
	@GetMapping("")
	public String hienThiQuenMatKhauForm() {
	    return "quenMatKhau"; // Trả về trang form quên mật khẩu
	}

	@PostMapping("/submit")
    public String quenMatKhau(@RequestParam("email") String userEmail, Model model) {
        // Kiểm tra xem email có tồn tại trong hệ thống không
        if (!userService.isEmailExists(userEmail)) {
            model.addAttribute("error", "Email này không tồn tại trong hệ thống.");
            return "quenMatKhau"; // Trang hiện tại để hiển thị lỗi
        }

        // Tạo mã code hoặc token đặt lại mật khẩu
        String token = userService.createPasswordResetToken(userEmail);

        // Tạo liên kết đặt lại mật khẩu
        String resetLink = "http://yourdomain.com/job4u/DatLaiMatKhau?token=" + token;

        // Gửi email với mã đặt lại mật khẩu
        sendEmail(userEmail, resetLink);

        // Chuyển hướng đến trang nhập mã code
        return "redirect:/job4u/NhapMaDatLaiMatKhau?token=" + token;
    }

    private void sendEmail(String userEmail, String resetLink) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(userEmail);
        message.setSubject("Yêu cầu đặt lại mật khẩu");
        message.setText("Click vào liên kết dưới đây để đặt lại mật khẩu của bạn:\n" + resetLink + "\n\n" +
                        "Nếu bạn không yêu cầu thay đổi mật khẩu, vui lòng bỏ qua email này.");
        mailSender.send(message);
    }
}
