package demo.Controllers;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.entity.UsersEntity;
import demo.services.UserService;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;

@Controller

@RequestMapping("/QuenMatKhau")
public class quenMatKhauController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UserService userService; // Dịch vụ xử lý logic người dùng

	@GetMapping("")
    public String hienThiQuenMatKhauForm() {
        return "quenMatKhau"; // Trả về trang form quên mật khẩu
    }

	@PostMapping("/submit")
    public String quenMatKhau(@RequestParam("email") String userEmail, Model model) {
        if (!userService.isEmailExists(userEmail)) {
            model.addAttribute("error", "Email này không tồn tại trong hệ thống.");
            return "quenMatKhau";
        }

        String token = userService.createPasswordResetToken(userEmail);

        // Mã hóa token bằng Base64
        String encodedToken = Base64.getEncoder().encodeToString(token.getBytes());

        // Gửi email với mã token
        userService.sendPasswordResetEmail(userEmail, token);

        return "redirect:/QuenMatKhau/NhapMa?token=" + encodedToken;
    }

    // Hiển thị form nhập mã token
    @GetMapping("/NhapMa")
    public String hienThiNhapMaForm(@RequestParam("token") String encodedToken, Model model) {
        // Giải mã token từ Base64
        String token = new String(Base64.getDecoder().decode(encodedToken));

        model.addAttribute("token", token);
        return "nhapMa";
    }

    // Xác thực token
    @PostMapping("/validateToken")
    public String validateToken(
            @RequestParam("token") String encodedToken,
            Model model) {

        // Giải mã token từ Base64
        String token = new String(Base64.getDecoder().decode(encodedToken));

        // Kiểm tra mã token
        if (userService.isTokenValid(token)) {
            // Mã token hợp lệ, chuyển hướng đến trang đặt lại mật khẩu
            return "redirect:/QuenMatKhau/DatLaiMatKhau?token=" + encodedToken;
        } else {
            // Mã token không hợp lệ, hiển thị thông báo lỗi
            model.addAttribute("error", "Mã token không hợp lệ hoặc đã hết hạn.");
            return "nhapMa"; // Quay lại trang nhập mã với thông báo lỗi
        }
    }

    // Xử lý đặt lại mật khẩu
    @PostMapping("/DatLaiMatKhau")
    public String datLaiMatKhau(@RequestParam("token") String encodedToken,
                                @RequestParam("password") String newPassword,
                                @RequestParam("confirmPassword") String confirmPassword,
                                Model model) {
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Mật khẩu mới và mật khẩu xác nhận không khớp.");
            return "datLaiMatKhau";
        }

        // Giải mã token từ Base64
        String token = new String(Base64.getDecoder().decode(encodedToken));

        if (userService.isTokenValid(token)) {
            // Mã hóa mật khẩu mới trước khi lưu vào cơ sở dữ liệu
            String encodedPassword = passwordEncoder.encode(newPassword);
            userService.updatePassword(token, encodedPassword);
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập sau khi đặt lại mật khẩu
        } else {
            model.addAttribute("error", "Mã token không hợp lệ hoặc đã hết hạn.");
            return "datLaiMatKhau";
        }
    }
}
