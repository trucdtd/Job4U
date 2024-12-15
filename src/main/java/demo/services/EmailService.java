package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import demo.entity.PaymentsEntity;
import demo.entity.ServicesEntity;
import demo.entity.UsersEntity;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender mailSender;

	public void sendAcceptanceEmail(String toEmail, String applicantName, String companyName, String jobTitle) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setSubject("Thông báo chấp nhận đơn ứng tuyển");

		// Chèn thông tin tên công ty và tiêu đề công việc vào nội dung email
		message.setText("Kính gửi " + applicantName + ",\n\n"
				+ "Chúng tôi rất vui mừng thông báo rằng đơn ứng tuyển của bạn vào vị trí " + jobTitle + " tại công ty "
				+ companyName + " đã được chấp nhận.\n\n "
				+ "Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất để thảo luận về các bước tiếp theo.\n\n"
				+ "Trân trọng,\nĐội ngũ Tuyển dụng");

		mailSender.send(message);
	}

	public void sendRejectionEmail(String toEmail, String applicantName, String companyName, String jobTitle) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setSubject("Thông báo từ chối đơn ứng tuyển");

		// Chèn thông tin tên công ty và tiêu đề công việc vào nội dung email
		message.setText("Kính gửi " + applicantName + ",\n\n"
				+ "Chúng tôi rất tiếc phải thông báo rằng đơn ứng tuyển của bạn vào vị trí " + jobTitle
				+ " tại công ty " + companyName + " đã bị từ chối.\n\n " + "Do không phù hợp với yêu cầu của công ty"
				+ "Cảm ơn bạn đã dành thời gian tham gia quy trình tuyển dụng cùng chúng tôi. Chúng tôi sẽ lưu ý hồ sơ của bạn cho các cơ hội trong tương lai.\n\n"
				+ "Trân trọng,\nĐội ngũ Tuyển dụng");

		mailSender.send(message);
	}

	public void sendDeletionNotificationEmail(String toEmail, String jobTitle, String reason) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setSubject("Thông báo về việc xóa bài viết");

		// Chèn thông tin tiêu đề công việc và lý do xóa bài viết vào nội dung email
		message.setText(
				"Kính gửi Quý công ty,\n\n" + "Chúng tôi rất tiếc phải thông báo rằng bài viết của bạn về công việc \""
						+ jobTitle + "\" đã bị xóa vì lý do: " + reason + ".\n\n"
						+ "Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ với chúng tôi.\n\n"
						+ "Trân trọng,\nĐội ngũ quản trị");

		mailSender.send(message);
	}

	// Gửi email khi tài khoản bị khóa
	public void sendAccountLockedEmail(String toEmail, String username) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setSubject("Thông báo khóa tài khoản");

		message.setText("Kính gửi " + username + ",\n\n" + "Tài khoản mà bạn đã đăng ký trên website JOB4U đã bị khóa bởi quản trị viên.\n\n"
				+ "Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ với chúng tôi.\n\n"
				+ "0834341699 hoặc gmail: job4yousine2024@gmail.com.\n\n"
				+ "Trân trọng,\nĐội ngũ quản trị");

		mailSender.send(message);
	}

	// Gửi email khi tài khoản được mở lại
	public void sendAccountOpenedEmail(String toEmail, String username) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setSubject("Thông báo mở tài khoản");

		message.setText("Kính gửi " + username + ",\n\n" + "Tài khoản mà bạn đã đăng ký trên website JOB4U đã được mở lại bởi quản trị viên.\n\n"
				+ "Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ với chúng tôi.\n\n"
				+ "0834341699 hoặc gmail: job4yousine2024@gmail.com.\n\n"
				+ "Trân trọng,\nĐội ngũ quản trị");

		mailSender.send(message);
	}
	
	public void sendEmail(UsersEntity user, ServicesEntity service, PaymentsEntity payment) {
		String emailContent = "<!DOCTYPE html>"
			    + "<html lang=\"vi\">"
			    + "<head>"
			    + "<meta charset=\"UTF-8\">"
			    + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
			    + "<title>Thanh toán thành công</title>"
			    + "<style>"
			    + "body { font-family: 'Roboto', sans-serif; background-color: #f4f7fc; margin: 0; padding: 0; height: 100vh; display: flex; justify-content: center; align-items: center; }"
			    + ".container { max-width: 600px; background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; }"
			    + ".success-icon { margin: 0 auto 20px; }"
			    + ".success-icon img { width: 50px; height: 50px; }"
			    + "h1 { color: #ff0000; font-size: 24px; margin-bottom: 20px; }"
			    + ".order-info { margin-bottom: 20px; text-align: left; }"
			    + ".order-info p { margin: 5px 0; font-size: 16px; }"
			    + ".order-info strong { color: #333; }"
			    + ".status { color: #40C057; font-weight: bold; }"
			    + ".message { margin-top: 20px; }"
			    + ".message p { font-size: 16px; }"
			    + ".button { margin-top: 20px; }"
			    + ".button a { text-decoration: none; background-color: #4CAF50; color: white; padding: 10px 20px; border-radius: 5px; font-size: 16px; transition: background-color 0.3s; }"
			    + ".button a:hover { background-color: #45a049; }"
			    + "</style>"
			    + "</head>"
			    + "<body>"
			    + "<div class=\"container\">"
			    + "<div class=\"success-icon\">"
			    + "<img width=\"50\" height=\"50\" src=\"https://img.icons8.com/ios-filled/50/40C057/ok--v1.png\" alt=\"ok--v1\"/>"
			    + "</div>"
			    + "<h1>THANH TOÁN THÀNH CÔNG!</h1>"
			    + "<div class=\"order-info\">"
			    + "<p><strong>Người thanh toán:</strong> " + user.getFullname() + "</p>"
			    + "<p><strong>Tên gói dịch vụ:</strong> " + service.getServicename() + "</p>"
			    + "<p><strong>Dịch vụ:</strong> " + service.getDescription() + "</p>"
			    + "<p><strong>Số tiền thanh toán:</strong> " + payment.getAmount() + " VND</p>"
			    + "<p><strong>Thời gian hiệu lực:</strong> " + service.getUpdatedat() + " đến " + service.getCreatedat() + "</p>"
			    + "<p><strong>Thời gian thanh toán:</strong> " + payment.getPaymentdate() + "</p>"
			    + "<p><strong>Trạng thái thanh toán:</strong> <span class=\"status\">" + payment.getStatus() + "</span></p>"
			    + "</div>"
			    + "<div class=\"message\">"
			    + "<p>Cảm ơn bạn đã mua gói dịch vụ của chúng tôi!</p>"
			    + "</div>"
			    + "</div>"
			    + "</body>"
			    + "</html>";
	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	        helper.setTo(user.getEmail());
	        helper.setSubject("Hóa đơn thanh toán thành công");
	        helper.setText(emailContent, true);  // true to send as HTML
	        mailSender.send(message);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
