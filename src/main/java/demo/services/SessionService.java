package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.entity.UsersEntity;
import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	 @Autowired
	    private UserRepository userRepository;
	
    @Autowired
    private HttpSession session; // lưu bộ nhớ tạm

    // Lưu dữ liệu vào session
    public void luuDuLieu(String key, Object value) {
        session.setAttribute(key, value);
    }
    
    // Đọc dữ liệu từ session
    public <T> T docDuLieu(String key) {
        return (T) session.getAttribute(key);
    }
    
    // Xóa dữ liệu khỏi session
    public void xoaDuLieu(String key) {
        session.removeAttribute(key);
    }

    // Lấy ID của nhà tuyển dụng hiện tại từ session
    public Integer getCurrentEmployerId() {
        return (Integer) session.getAttribute("employerId");
    }

    // Lưu ID của nhà tuyển dụng vào session
    public void setCurrentEmployerId(Integer employerId) {
        session.setAttribute("employerId", employerId);
    }
    
 // Lưu ID tài khoản vào session
    public void setCurrentUser(Integer userId) {
        session.setAttribute("userid", userId);
    }
    
    // Lấy ID tài khoản từ session
    public Integer getCurrentUser() {
        return (Integer) session.getAttribute("userid");
    }
    
    // Lấy thông tin người dùng từ cơ sở dữ liệu dựa trên userId
    public UsersEntity getCurrentUserEntity() {
        Integer userId = getCurrentUser();
        if (userId != null) {
            return userRepository.findById(userId).orElse(null);
        }
        return null;
    }

}