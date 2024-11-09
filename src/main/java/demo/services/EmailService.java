package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	 	
	@Autowired
	    private JavaMailSender mailSender;

	    // Phương thức gửi email thông báo chấp nhận
	    public void sendAcceptanceEmail(String toEmail, String applicantName) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(toEmail);
	        message.setSubject("Thông báo chấp nhận đơn ứng tuyển");
	        message.setText("Kính gửi " + applicantName + ",\n\n" +
	                        "Chúng tôi rất vui mừng thông báo rằng đơn ứng tuyển của bạn đã được chấp nhận. " +
	                        "Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất để thảo luận về các bước tiếp theo.\n\n" +
	                        "Trân trọng,\nĐội ngũ Tuyển dụng");

	        mailSender.send(message);
	    }

	    // Phương thức gửi email thông báo từ chối
	    public void sendRejectionEmail(String toEmail, String applicantName) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(toEmail);
	        message.setSubject("Thông báo từ chối đơn ứng tuyển");
	        message.setText("Kính gửi " + applicantName + ",\n\n" +
	                        "Chúng tôi rất tiếc phải thông báo rằng đơn ứng tuyển của bạn đã bị từ chối. " +
	                        "Cảm ơn bạn đã dành thời gian tham gia quy trình tuyển dụng cùng chúng tôi.\n\n" +
	                        "Trân trọng,\nĐội ngũ Tuyển dụng");

	        mailSender.send(message);
	    }
	}

