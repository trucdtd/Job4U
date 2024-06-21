package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	@Autowired
	HttpSession session; //lưu bộ nhớ tạm
	
	public void luuDuLieu(String username, Object matkhau) {
		session.setAttribute(username, matkhau);
	}
	
	public <T> T docDuLieu(String name) {
		return (T)session.getAttribute(name); //T kiểu dữ liệu tạm
	}
	
	public void xoaDuLieu(String name) {
		session.removeAttribute(name);
	}
	
	

}
