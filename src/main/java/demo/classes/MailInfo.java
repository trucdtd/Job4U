package demo.classes;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfo {
	String from;
	String to;
	String[] cc;
	String[] bcc;
	String subject;
	String body;
	String[] attachments;
	public MailInfo(String to, String subject, String body) {
		this.from = "FPT Polytechnic <poly@fpt.edu.vn>";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
	
	public boolean haveCc() {
		return this.cc != null && this.cc.length > 0;
	}
	public boolean haveBcc() {
		return this.bcc != null && this.bcc.length > 0;
	}
	public boolean haveAttachments() {
		return this.attachments != null && this.attachments.length > 0;
	}
}
