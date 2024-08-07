package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.UsersDao;
import demo.entity.UsersEntity;
import demo.services.SessionService;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/Login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	SessionService sessionService;

	@Autowired
	UsersDao userDao;

	@GetMapping("")
	public String showLoginPage() {
		return "dangnhap"; // Trả về view đăng nhập
	}

	@PostMapping("/submit")
	public String submitForm(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession ss) {
		// Tìm kiếm người dùng trong cơ sở dữ liệu dựa trên tên người dùng
		List<UsersEntity> users = userDao.findByUsername(username);

		// Kiểm tra xem danh sách người dùng có rỗng không
		if (!users.isEmpty()) {
			UsersEntity user = users.get(0); // Lấy người dùng đầu tiên từ danh sách
			// Kiểm tra mật khẩu
			if (user.getPassword().equals(password)) {
				// Nếu đăng nhập thành công, lưu thông tin người dùng vào session
				ss.setAttribute("userid", user.getUserid()); // Lưu userid vào session
				ss.setAttribute("fullname", user.getFullname());

				logger.info("User '{}' logged in with role: {}", username, user.getRole());

				if (user.isAdmin()) { // Sử dụng phương thức isAdmin()
					// Nếu là admin, chuyển hướng đến trang quản lý admin
					return "redirect:/user";
				} else {
					return "redirect:/job4u";
				}
			} else {
				// Nếu mật khẩu không đúng, hiển thị thông báo lỗi
				model.addAttribute("message", "Mật khẩu không đúng");
				return "dangNhap";
			}
		} else {
			model.addAttribute("message", "Tài khoản không tồn tại");
		}
		return "dangNhap";
	}
}
