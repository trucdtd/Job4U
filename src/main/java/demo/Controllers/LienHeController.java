package demo.Controllers;

import javax.management.Notification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.dao.JoblistingsDao;
import demo.dao.NotificationsDao;
import demo.entity.MessagesEntity;

@Controller
@RequestMapping("/lienhe")
public class LienHeController {
	
	@Autowired
    private JavaMailSender mailSender;
	
	@GetMapping("")
    public String hotline() {
        return "lienHe"; 
    }
	
	@PostMapping("/sendEmail")
    public String sendEmail(
            @RequestParam("name") String name,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email,
            @RequestParam("message") String message,
            RedirectAttributes redirectAttributes) {
        
        try {
            // Tạo email
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setFrom("your-email@gmail.com"); // Email của bạn
            mailMessage.setTo("job4yousine2024@gmail.com"); // Email nhận thông tin liên hệ
            mailMessage.setSubject("Liên hệ từ: " + name);
            mailMessage.setText("Họ và tên: " + name + "\n"
                    + "Điện thoại: " + phone + "\n"
                    + "Email: " + email + "\n"
                    + "Nội dung: " + message);

            // Gửi email
            mailSender.send(mailMessage);

            // Thông báo thành công
            redirectAttributes.addFlashAttribute("success", "Thông tin đã được gửi thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi gửi email. Vui lòng thử lại!");
        }

        return "redirect:/"; // Redirect về trang chủ hoặc trang liên hệ
    }
}
