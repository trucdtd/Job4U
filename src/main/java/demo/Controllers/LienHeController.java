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

import demo.dao.ContactDao;
import demo.dao.JoblistingsDao;
import demo.entity.ContactEntity;
import demo.entity.MessagesEntity;

@Controller
@RequestMapping("/lienhe")
public class LienHeController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private ContactDao contactdao;

	@GetMapping("")
	public String hotline() {
		return "lienHe";
	}

	@PostMapping("/sendEmail")
	public String sendEmail(@RequestParam("fullname") String fullname, 
	                        @RequestParam("phonenumber") String phonenumber,
	                        @RequestParam("email") String email, 
	                        @RequestParam("content") String content,
	                        RedirectAttributes redirectAttributes) {

	    System.out.println("Request received for sending email with details:");
	    System.out.println("Name: " + fullname + ", Phone: " + phonenumber + ", Email: " + email + ", Content: " + content);

	    try {
	        // Tạo email với thông tin liên hệ
	        SimpleMailMessage mailMessage = new SimpleMailMessage();
	        mailMessage.setFrom("your-email@gmail.com"); // Email của bạn
	        mailMessage.setTo("lanhbvpc07752@fpt.edu.vn"); // Email nhận thông tin liên hệ
	        mailMessage.setSubject("Liên hệ từ: " + fullname);
	        mailMessage.setText("Họ và tên: " + fullname + "\n" + "Điện thoại: " + phonenumber + "\n" + "Email: " + email + "\n"
	                + "Nội dung: " + content);

	        // Gửi email
	        mailSender.send(mailMessage);

	        // Lưu thông tin vào bảng Contact
	        ContactEntity contact = new ContactEntity();
	        contact.setFullname(fullname);
	        contact.setPhonenumber(phonenumber);
	        contact.setEmail(email);
	        contact.setContent(content);

	        contactdao.save(contact);

	        // Thêm Flash Attribute thông báo thành công
	        redirectAttributes.addFlashAttribute("success", "Thông tin đã được gửi thành công!");
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Thêm Flash Attribute thông báo lỗi
	        redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi gửi email. Vui lòng thử lại!");
	    }
	    return "redirect:/lienhe"; // Redirect về trang liên hệ hoặc trang chủ sau khi gửi
	}

}
