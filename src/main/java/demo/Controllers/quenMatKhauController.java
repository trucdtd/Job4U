package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.services.UserService;

@Controller
@RequestMapping("/job4u")
public class quenMatKhauController {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private UserService userService; // Dịch vụ xử lý logic người dùng

    @PostMapping("/QuenMatKhau")
    public String quenMatKhau(@RequestParam("email") String userEmail) {
        // Tạo token đặt lại mật khẩu
        String token = userService.createPasswordResetToken(userEmail);

        // Tạo liên kết đặt lại mật khẩu
        String resetLink = "http://yourdomain.com/job4u/DatLaiMatKhau?token=" + token;

        // Gửi email
        sendEmail(userEmail, resetLink);

        return "redirect:/job4u/ThongBaoGuiMail"; // Chuyển hướng đến trang thông báo
    }

    private void sendEmail(String userEmail, String resetLink) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(userEmail);
        message.setSubject("Yêu cầu đặt lại mật khẩu");
        message.setText("Click vào liên kết dưới đây để đặt lại mật khẩu của bạn:\n" + resetLink);
        mailSender.send(message);
    }
}
