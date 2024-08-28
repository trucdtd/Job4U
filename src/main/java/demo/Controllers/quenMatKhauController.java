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

import demo.entity.UsersEntity;
import demo.services.UserRepository;
import demo.services.UserService;

@Controller

@RequestMapping("/QuenMatKhau")
public class quenMatKhauController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private UserRepository userRepository;

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
        String resetLink = "http://yourdomain.com/job4u/NhapMaDatLaiMatKhau?token=" + token;
        sendEmail(userEmail, resetLink);

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

    private String generateToken() {
        // Tạo mã token ngẫu nhiên hoặc sử dụng một thư viện để tạo token
        return java.util.UUID.randomUUID().toString();
    }
    
    @GetMapping("/NhapMa")
    public String hienThiNhapMaForm(@RequestParam("token") String token, Model model) {
        UsersEntity user = userRepository.findByToken(token);
        
        if (user == null) {
            model.addAttribute("error", "Mã token không hợp lệ.");
            return "quenMatKhauNhapMa"; // Trang nhập mã
        }

        model.addAttribute("token", token);
        return "quenMatKhauNhapMa"; // Trang nhập mã
    }

    @PostMapping("/validateToken")
    public String validateToken(@RequestParam("token") String token, @RequestParam("code") String code, Model model) {
        UsersEntity user = userRepository.findByToken(token);

        if (user == null || !code.equals(token)) {
            model.addAttribute("error", "Mã xác nhận không hợp lệ.");
            return "quenMatKhauNhapMa";
        }

        return "redirect:/QuenMatKhau/DatLaiMatKhau?token=" + token;
    }

    @GetMapping("/DatLaiMatKhau")
    public String hienThiDatLaiMatKhauForm(@RequestParam("token") String token, Model model) {
        UsersEntity user = userRepository.findByToken(token);
        
        if (user == null) {
            model.addAttribute("error", "Token không hợp lệ.");
            return "quenMatKhauDatLaiMatKhau"; // Trang đặt lại mật khẩu
        }

        model.addAttribute("token", token);
        return "quenMatKhauDatLaiMatKhau";
    }

    @PostMapping("/DatLaiMatKhau")
    public String datLaiMatKhau(@RequestParam("token") String token, @RequestParam("password") String password, Model model) {
        UsersEntity user = userRepository.findByToken(token);
        
        if (user == null) {
            model.addAttribute("error", "Token không hợp lệ.");
            return "quenMatKhauDatLaiMatKhau";
        }

        user.setPassword(password); // Cập nhật mật khẩu
        user.setToken(null); // Xóa token
        userRepository.save(user);

        return "redirect:/Login";
    }
    
 // Tạo mã token đặt lại mật khẩu
    public String createPasswordResetToken(String email) {
        // Logic tạo token và lưu vào cơ sở dữ liệu
        return "generated-token";
    }

    // Xác thực token
    public boolean validatePasswordResetToken(String token, String code) {
        // Kiểm tra mã token và code
        UsersEntity user = userRepository.findByToken(token);
        return user != null && user.getToken().equals(code);
    }

    // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không
    public boolean isEmailExists(String email) {
        return userRepository.findByEmail(email) != null;
    }

    // Đặt lại mật khẩu
    public boolean resetPassword(String token, String newPassword) {
        UsersEntity user = userRepository.findByToken(token);
        
        if (user == null) {
            return false; // Token không hợp lệ
        }
        
        user.setPassword(newPassword);
        user.setToken(null);
        userRepository.save(user);
        
        return true;
    }
}
