package demo.Controllers;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
	private UserService userService; // Dịch vụ xử lý logic người dùng
	
	@GetMapping("")
    public String hienThiQuenMatKhauForm() {
        return "quenMatKhau"; // Trả về trang form quên mật khẩu
    }

	/*
	 * @PostMapping("/submit") public String quenMatKhau(@RequestParam("email")
	 * String userEmail, Model model) { if (!userService.isEmailExists(userEmail)) {
	 * model.addAttribute("error", "Email này không tồn tại trong hệ thống.");
	 * return "quenMatKhau"; }
	 * 
	 * String token = userService.createPasswordResetToken(userEmail);
	 * 
	 * // Mã hóa token bằng Base64 String encodedToken =
	 * Base64.getEncoder().encodeToString(token.getBytes());
	 * 
	 * // Gửi email với mã token userService.sendPasswordResetEmail(userEmail,
	 * token); return "redirect:/QuenMatKhau/NhapMa?token=" + encodedToken; }
	 */

	/*
	 * @GetMapping("/NhapMa") public String hienThiNhapMaForm(@RequestParam("token")
	 * String encodedToken, Model model) { // Giải mã token từ Base64 String token =
	 * new String(Base64.getDecoder().decode(encodedToken));
	 * 
	 * model.addAttribute("token", token); return "nhapMa"; }
	 * 
	 * @PostMapping("/validateToken") public String
	 * validateToken(@RequestParam("code") String code, @RequestParam("token")
	 * String encodedToken, Model model) { // Giải mã token từ Base64 String token =
	 * new String(Base64.getDecoder().decode(encodedToken));
	 * 
	 * // Kiểm tra mã token if (userService.isTokenValid(token, code)) { return
	 * "redirect:/QuenMatKhau/DatLaiMatKhau?token=" + encodedToken; } else {
	 * model.addAttribute("error", "Mã token không hợp lệ hoặc đã hết hạn."); return
	 * "nhapMa"; // Trả về trang nhập mã với thông báo lỗi } }
	 * 
	 * @GetMapping("/DatLaiMatKhau") public String
	 * hienThiDatLaiMatKhauForm(@RequestParam("token") String encodedToken, Model
	 * model) { // Giải mã token từ Base64 String token = new
	 * String(Base64.getDecoder().decode(encodedToken));
	 * 
	 * model.addAttribute("token", token); return "datLaiMatKhau"; }
	 * 
	 * @PostMapping("/DatLaiMatKhau") public String
	 * datLaiMatKhau(@RequestParam("token") String encodedToken,
	 * 
	 * @RequestParam("password") String newPassword,
	 * 
	 * @RequestParam("confirmPassword") String confirmPassword, Model model) { if
	 * (!newPassword.equals(confirmPassword)) { model.addAttribute("error",
	 * "Mật khẩu mới và mật khẩu xác nhận không khớp."); return "datLaiMatKhau"; }
	 * 
	 * // Giải mã token từ Base64 String token = new
	 * String(Base64.getDecoder().decode(encodedToken));
	 * 
	 * if (userService.isTokenValid(token, token)) {
	 * userService.updatePassword(token, newPassword); return "redirect:/Login"; }
	 * else { model.addAttribute("error", "Mã token không hợp lệ hoặc đã hết hạn.");
	 * return "datLaiMatKhau"; } }
	 */

}
