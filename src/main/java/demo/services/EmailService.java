package demo.services;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import demo.classes.MailInfo;
import jakarta.mail.internet.MimeMessage;


@Service
public class EmailService {
	@Autowired
	JavaMailSender sender;
	List<MimeMessage> dsEmail = new ArrayList();
	
	public void send(MailInfo mail){
		MimeMessage message = sender.createMimeMessage();
		try {
			MimeMessageHelper helper =
					new MimeMessageHelper (message, true, "utf-8");
			helper.setFrom(mail.getFrom());//người gửi
			helper.setTo(mail.getTo());//người nhận
			helper.setSubject(mail.getSubject());//tiêu đề
			helper.setText(mail.getBody(), true);//nội dung
			helper.setReplyTo (mail.getFrom());//người gửi
			if(mail.haveCc()) {//nếu có đính kèm CC (carbon copy)
				for(String email: mail.getCc()) {
					helper.addCc(email);
				}
			}
			if(mail.haveBcc()) {//nếu có đính kèm BCC (Blind carbon copy)
				for(String email: mail.getBcc()) { 
					helper.addBcc(email);
				}
			}
			if(mail.haveAttachments()) {//nếu có định kèm tệp
				for(String path: mail.getAttachments()) {
					File file = new File(path);
					helper.addAttachment(file.getName(), file);
				}
			}
			sender.send(message);//thực hiện gửi mail
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Scheduled(fixedDelay = 500)
	public void sendAll() {
		while(!dsEmail.isEmpty()) {
			MimeMessage mail = dsEmail.remove(0);
			try {
				sender.send(mail);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
