package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import demo.entity.PaymentsEntity;
import demo.entity.ServicesEntity;
import demo.entity.UsersEntity;
import jakarta.mail.MessagingException;
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
	
	//Gửi email thông báo về việc xóa bài viết
	public void sendEmailToEmployer(String employerFulltName, String toEmail, String jobTitle, Integer postId) {
	    try {
	        MimeMessage mimeMessage = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

	        helper.setTo(toEmail);
	        helper.setSubject("Thông báo về việc xóa bài viết");

	        // Nội dung HTML
	        String htmlContent = """
	            <!DOCTYPE html>
	            <html lang="vi">
	            <head>
	                <meta charset="UTF-8">
	                <meta name="viewport" content="width=device-width, initial-scale=1.0">
	                <style>
	                    body {
	                        font-family: Arial, sans-serif;
	                        line-height: 1.6;
	                        color: #333333;
	                        background-color: #f9f9f9;
	                        margin: 0;
	                        padding: 0;
	                    }
	                    .container {
	                        max-width: 600px;
	                        margin: 20px auto;
	                        background: #ffffff;
	                        padding: 20px;
	                        border-radius: 10px;
	                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	                    }
	                    .footer {
	                        text-align: center;
	                        font-size: 12px;
	                        color: #888888;
	                        margin-top: 20px;
	                    }
	                    .footer a {
	                        color: #6666ff;
	                        text-decoration: none;
	                    }
	                </style>
	            </head>
	            <body>
	                <div class="container">
	                    <h2>Kính gửi <strong>%s</strong></h2>
	                    <p>Chúng tôi rất tiếc phải thông báo rằng bài viết <strong>"%s"</strong> của bạn đã bị xóa.</p>
	                    <p>Lý do có thể là do bài viết vi phạm quy định hoặc đã hết hạn sử dụng dịch vụ. Nếu có bất kỳ thắc mắc nào, xin vui lòng liên hệ với chúng tôi.</p>
	                    <p>Chúng tôi khuyến khích bạn đọc lại các nguyên tắc cộng đồng để hiểu rõ hơn và tránh vi phạm trong tương lai.</p>
	                    <p>Nếu bạn cần thêm thông tin hoặc có bất kỳ thắc mắc nào, đừng ngần ngại liên hệ với đội ngũ hỗ trợ.</p>
	                    <p>Cảm ơn bạn đã thông cảm và đồng hành cùng chúng tôi</p>
	                    <p>Chúng tôi luôn sẵn sàng hỗ trợ bạn.</p>
	                    <p>Trân trọng,</p>
	                    <p>Đội ngũ hỗ trợ Job4U</p>
	                    <div class="footer">
	                        © 2024 Job4U - <a href="https://job4u.com">job4u.com</a>
	                    </div>
	                </div>
	            </body>
	            </html>
	            """.formatted(employerFulltName, jobTitle, postId);

	        helper.setText(htmlContent, true); // true để kích hoạt HTML
	        mailSender.send(mimeMessage);
	    } catch (MessagingException e) {
	        e.printStackTrace();
	        System.out.println("Gửi email thất bại: " + e.getMessage());
	    }
	}
	
	// Gửi email xác nhận đăng ký tài khoản
	public void sendVerificationCode(String toEmail, String token) {
	    try {
	        // Tạo đối tượng MimeMessage
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	        // Cấu hình thông tin người nhận và tiêu đề
	        helper.setTo(toEmail);
	        helper.setSubject("Mã xác thực đăng ký");

	        // Nội dung HTML của email
	        String htmlContent = "<!DOCTYPE html>\n" +
	                "<html lang=\"en\">\n" +
	                "<head>\n" +
	                "    <meta charset=\"UTF-8\">\n" +
	                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
	                "    <title>Reset Password</title>\n" +
	                "</head>\n" +
	                "<body style=\"font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;\">\n" +
	                "    <table align=\"center\" width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #ffffff; margin: 40px auto; border-radius: 10px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); border: 1px solid #e0e0e0;\">\n" +
	                "        <!-- Header -->\n" +
	                "        <tr>\n" +
	                "            <td style=\"padding: 30px 20px; text-align: left;\">\n" +
	                "                <h2 style=\"margin: 0; font-size: 20px; color: #333;\">Xác thực tài khoản</h2>\n" +
	                "            </td>\n" +
	                "        </tr>\n" +
	                "        <!-- Body -->\n" +
	                "        <tr>\n" +
	                "            <td style=\"padding: 40px 20px; text-align: left; color: #333;\">\n" +
	                "                <p style=\"margin: 10px 0; font-size: 16px; color: #333;\">Mã xác thực của bạn là:</p>\n" +
	                "                <div style=\"text-align: center; margin: 30px 0;\">\n" +
	                "                    <span style=\"display: inline-block; background-color: #e8f0fe; padding: 20px 40px; border-radius: 10px; font-size: 24px; font-weight: bold; color: #333; border: 1px solid #c3d4e9;\">" + token + "</span>\n" +
	                "                </div>\n" +
	                "                <p style=\"margin: 10px 0; font-size: 16px; color: #333;\">Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.</p>\n" +
	                "            </td>\n" +
	                "        </tr>\n" +
	                "        <!-- Footer -->\n" +
	                "        <tr>\n" +
	                "            <td style=\"padding: 30px 20px; text-align: center; font-size: 12px; color: #888;\">\n" +
	                "                <p style=\"margin: 0;\">&copy; 2024 Job4U. All rights reserved.</p>\n" +
	                "            </td>\n" +
	                "        </tr>\n" +
	                "    </table>\n" +
	                "</body>\n" +
	                "</html>";

	        // Gán nội dung HTML vào email
	        helper.setText(htmlContent, true);

	        // Gửi email
	        mailSender.send(message);
	    } catch (MessagingException e) {
	        e.printStackTrace();
	        throw new RuntimeException("Lỗi khi gửi email xác thực");
	    }
	}
	
	//Gửi email khi ẩn bài viết
	public void sendDeletionNotificationEmail(String toEmail, String jobTitle, String reason) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

            helper.setTo(toEmail);
            helper.setSubject("Thông báo về việc ẩn bài viết");

            // Nội dung HTML của email
            String htmlContent = """
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                line-height: 1.6;
                                color: #333333;
                                margin: 0;
                                padding: 0;
                                background-color: #f9f9f9;
                            }
                            .container {
                                max-width: 600px;
                                margin: 20px auto;
                                background: #ffffff;
                                padding: 20px;
                                border-radius: 10px;
                                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                            }
                            .footer {
                                text-align: center;
                                font-size: 12px;
                                color: #888888;
                                margin-top: 20px;
                            }
                            .footer a {
                                color: #6666ff;
                                text-decoration: none;
                            }
                        </style>
                    </head>
                    <body>
                        <div class="container">
                            <h2>Kính gửi Quý công ty</h2>
                            <p>Chúng tôi rất tiếc phải thông báo rằng bài viết của bạn về công việc 
                            <strong>“%s”</strong> đã bị ẩn vì lý do:</p>
                            <blockquote style="background: #f5f5f5; color: #df0b0b; padding: 10px; border-left: 4px solid #cccccc;">
                                %s
                            </blockquote>
                            <p>Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ với chúng tôi qua email hoặc điện thoại.</p>
                            <p>Trân trọng,</p>
                            <p>Đội ngũ quản trị Job4U</p>
                            <div class="footer">
                                © 2024 Copyright: <a href="https://job4u.com">Job4U</a>
                            </div>
                        </div>
                    </body>
                    </html>
                    """.formatted(jobTitle, reason);

            helper.setText(htmlContent, true); // true để kích hoạt HTML

            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
            // Thêm xử lý lỗi nếu cần
        }
    }
	
	//Gửi email khi hiện bài viết
	public void sendOpenEmail(String toEmail, String jobTitle, String reason) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

            helper.setTo(toEmail);
            helper.setSubject("Thông báo về việc bài viết được mở lại");

            // Nội dung HTML của email
            String htmlContent = """
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                line-height: 1.6;
                                color: #333333;
                                margin: 0;
                                padding: 0;
                                background-color: #f9f9f9;
                            }
                            .container {
                                max-width: 600px;
                                margin: 20px auto;
                                background: #ffffff;
                                padding: 20px;
                                border-radius: 10px;
                                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                            }
                            .footer {
                                text-align: center;
                                font-size: 12px;
                                color: #888888;
                                margin-top: 20px;
                            }
                            .footer a {
                                color: #6666ff;
                                text-decoration: none;
                            }
                        </style>
                    </head>
                    <body>
                        <div class="container">
                            <h2>Kính gửi Quý công ty</h2>
                            <p>Bài viết của bạn về công việc
                            <strong>“%s”</strong> đã được mở lại</p>
                            <p>Hãy chú ý tuân thủ các quy định của nền tảng để bài viết được duy trì. Cảm ơn bạn</p>
                            <p>Trân trọng,</p>
                            <p>Đội ngũ quản trị Job4U</p>
                            <div class="footer">
                                © 2024 Copyright: <a href="https://job4u.com">Job4U</a>
                            </div>
                        </div>
                    </body>
                    </html>
                    """.formatted(jobTitle, reason);

            helper.setText(htmlContent, true); // true để kích hoạt HTML

            mailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
            // Thêm xử lý lỗi nếu cần
        }
    }

	// Gửi email khi tài khoản bị khóa
	public void sendAccountLockedEmail(String toEmail, String fullname) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setSubject("Thông báo khóa tài khoản");

		message.setText("Kính gửi " + fullname + ",\n\n" + "Tài khoản mà bạn đã đăng ký trên website JOB4U đã bị khóa bởi quản trị viên.\n\n"
				+ "Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ với chúng tôi.\n\n"
				+ "0834341699 hoặc gmail: job4yousine2024@gmail.com.\n\n"
				+ "Trân trọng,\nĐội ngũ quản trị");

		mailSender.send(message);
	}

	// Gửi email khi tài khoản được mở lại
	public void sendAccountOpenedEmail(String toEmail, String fullname) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setSubject("Thông báo mở tài khoản");

		message.setText("Kính gửi " + fullname + ",\n\n" + "Tài khoản mà bạn đã đăng ký trên website JOB4U đã được mở lại bởi quản trị viên.\n\n"
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
