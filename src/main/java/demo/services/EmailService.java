package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	 	
	@Autowired
	    private JavaMailSender mailSender;

	public void sendAcceptanceEmail(String toEmail, String applicantName, String companyName, String jobTitle) {
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setTo(toEmail);
	    message.setSubject("Thông báo chấp nhận đơn ứng tuyển");
	    
	    // Chèn thông tin tên công ty và tiêu đề công việc vào nội dung email
	    message.setText("Kính gửi " + applicantName + ",\n\n" +
	                    "Chúng tôi rất vui mừng thông báo rằng đơn ứng tuyển của bạn vào vị trí " + jobTitle + 
	                    " tại công ty " + companyName + " đã được chấp nhận.\n\n " +
	                    "Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất để thảo luận về các bước tiếp theo.\n\n" +
	                    "Trân trọng,\nĐội ngũ Tuyển dụng");

	    mailSender.send(message);
	}


	public void sendRejectionEmail(String toEmail, String applicantName, String companyName, String jobTitle) {
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setTo(toEmail);
	    message.setSubject("Thông báo từ chối đơn ứng tuyển");
	    
	    // Chèn thông tin tên công ty và tiêu đề công việc vào nội dung email
	    message.setText("Kính gửi " + applicantName + ",\n\n" +
	                    "Chúng tôi rất tiếc phải thông báo rằng đơn ứng tuyển của bạn vào vị trí " + jobTitle + 
	                    " tại công ty " + companyName + " đã bị từ chối.\n\n " +
	                    "Cảm ơn bạn đã dành thời gian tham gia quy trình tuyển dụng cùng chúng tôi. Chúng tôi sẽ lưu ý hồ sơ của bạn cho các cơ hội trong tương lai.\n\n" +
	                    "Trân trọng,\nĐội ngũ Tuyển dụng");

	    mailSender.send(message);
	}
	
	public void sendDeletionNotificationEmail(String toEmail, String jobTitle, String reason) {
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setTo(toEmail);
	    message.setSubject("Thông báo về việc xóa bài viết");

	    // Chèn thông tin tiêu đề công việc và lý do xóa bài viết vào nội dung email
	    message.setText("Kính gửi Quý công ty,\n\n" +
	                    "Chúng tôi rất tiếc phải thông báo rằng bài viết của bạn về công việc \"" + jobTitle + 
	                    "\" đã bị xóa vì lý do: " + reason + ".\n\n" +
	                    "Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ với chúng tôi.\n\n" +
	                    "Trân trọng,\nĐội ngũ quản trị");

	    mailSender.send(message);
	}

}

