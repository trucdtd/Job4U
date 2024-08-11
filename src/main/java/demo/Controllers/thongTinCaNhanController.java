package demo.Controllers;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.dao.UsersDao;
import demo.entity.UsersEntity;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/ThongTinCaNhan")
public class thongTinCaNhanController {
	@Autowired
	private UsersDao usersDao;
	
	
	@GetMapping
	public String userAccount(HttpSession session, Model model) {
	    // Lấy ID người dùng từ session
	    Integer userId = (Integer) session.getAttribute("userid");
	    System.out.println("userId: " + userId);

	    if (userId == null) {
	        model.addAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
	        return "dangnhap"; // Chuyển hướng đến trang đăng nhập
	    }

	    try {
	        // Tìm người dùng dựa trên ID
	        UsersEntity user = usersDao.findById(userId)
	                                   .orElseThrow(() -> new RuntimeException("Người dùng không tồn tại."));

	        // Định dạng ngày giờ
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
	        String formattedCreatedAt = user.getCreatedat().format(formatter);
	        String formattedUpdatedAt = user.getCreatedat().format(formatter);

	        // Thêm thông tin người dùng vào model
	        model.addAttribute("user", user);
	        model.addAttribute("formattedCreatedAt", formattedCreatedAt);
	        model.addAttribute("formattedUpdatedAt", formattedUpdatedAt);// Thêm thông tin ngày giờ đã định dạng vào model

	    } catch (Exception e) {
	        model.addAttribute("error", "Đã xảy ra lỗi khi lấy thông tin người dùng.");
	        return "dangnhap"; // Hoặc trang lỗi phù hợp
	    }

	    return "thongTinCaNhan"; // Trả về trang thông tin cá nhân
	}
}
