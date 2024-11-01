package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.dao.UsersDao;
import demo.entity.UsersEntity;
import demo.services.SessionService;
import demo.services.UserService;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/changePass")
public class doimatkhauController {
	@Autowired
	UserService userService;
	
	@Autowired
	UsersDao userDao;
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("")
	public String changepass() {
		
		return "doiMatKhau";
	}
	
	@PostMapping("/submit")
	public String doiMatKhau(RedirectAttributes redirectAttributes,
	        @RequestParam("oldPassword") String oldPassword,
	        @RequestParam("newPassword") String newPassword,
	        @RequestParam("confirmNewPassword") String confirmNewPassword,
	        HttpSession session) {

	    try {
	        // Kiểm tra xem các trường mật khẩu có được nhập đầy đủ không
	        if (oldPassword == null || oldPassword.trim().isEmpty() ||
	            newPassword == null || newPassword.trim().isEmpty() ||
	            confirmNewPassword == null || confirmNewPassword.trim().isEmpty()) {
	            redirectAttributes.addFlashAttribute("error", "Các trường mật khẩu không được bỏ trống");
	            return "redirect:/changePass";
	        }

	        // Lấy userId từ session
	        Integer userId = sessionService.getCurrentUser();
	        if (userId == null) {
	            redirectAttributes.addFlashAttribute("error", "Người dùng chưa đăng nhập");
	            return "redirect:/Login";
	        }

	        // Lấy thông tin người dùng từ cơ sở dữ liệu dựa trên userId
	        UsersEntity user = userService.findById(userId);
	        if (user == null) {
	            redirectAttributes.addFlashAttribute("error", "Người dùng không tồn tại");
	            return "redirect:/changePass";
	        }

	        // Kiểm tra mật khẩu cũ
	        if (!oldPassword.equals(user.getPassword())) {
	            redirectAttributes.addFlashAttribute("error", "Mật khẩu cũ không chính xác");
	            return "redirect:/changePass";
	        }

	     // Kiểm tra mật khẩu mới có ít nhất 8 ký tự và chứa ký tự số
	        if (newPassword.length() < 8 || !newPassword.matches(".*\\d.*")) {
	            redirectAttributes.addFlashAttribute("error", "Mật khẩu mới phải có ít nhất 8 ký tự và chứa ít nhất 1 ký tự số");
	            return "redirect:/changePass";
	        }

	        // Kiểm tra mật khẩu mới và xác nhận mật khẩu mới
	        if (!newPassword.equals(confirmNewPassword)) {
	            redirectAttributes.addFlashAttribute("error", "Mật khẩu mới và xác nhận mật khẩu không khớp");
	            return "redirect:/changePass";
	        }

	        // Cập nhật mật khẩu mới
	        user.setPassword(newPassword);
	        userService.save(user);
	        userDao.save(user);
	        
	        // Thêm thông báo thành công
	        redirectAttributes.addFlashAttribute("message", "Mật khẩu đã được thay đổi thành công");

	    } catch (Exception e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("error", "Đã xảy ra lỗi khi thay đổi mật khẩu: " + e.getMessage());
	    }

	    return "redirect:/Login";
	}
}