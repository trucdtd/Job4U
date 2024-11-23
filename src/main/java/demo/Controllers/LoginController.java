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
import demo.util.MaHoa;
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
	private UsersDao userDao;

	@GetMapping("")
	public String showLoginPage() {
		return "dangnhap"; // Trả về view đăng nhập
	}

	@PostMapping("/submit")
	public String submitForm(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession session) {
		password = MaHoa.toSHA1(password);
		List<UsersEntity> users = userDao.findByUsername(username);

		if (!users.isEmpty()) {
			UsersEntity user = users.get(0);
			logger.info("Đăng nhập với tài khoản: " + username + ", Vai trò: " + user.getRole());

			// Kiểm tra trạng thái tài khoản
			if (!user.isStatus()) { // Nếu status là false (khóa)
				model.addAttribute("message", "Tài khoản đã bị khóa do vi phạm điều khoản");
				return "dangnhap";
			}

			if (user.getPassword().equals(password)) {
				session.setAttribute("userIsLoggedIn", true);
				session.setAttribute("userName", user.getFullname());
				session.setAttribute("userid", user.getUserid());
				session.setAttribute("userEmail", user.getEmail());
				session.setAttribute("userFullname", user.getFullname());
				session.setAttribute("userPhonenumbeer", user.getPhonenumber());
				session.setAttribute("userCreatedat", user.getCreatedat());
				session.setAttribute("userUpdatedat", user.getUpdatedat());
				session.setAttribute("role", user.getRole()); // Thiết lập vai trò người dùng

				// Lưu ID nhà tuyển dụng vào session nếu vai trò là 2
				if (user.getRole() == 2) {
					sessionService.setCurrentUserId(user.getUserid());
				}

				// Log vai trò người dùng từ session
				logger.info("Vai trò người dùng từ session: " + session.getAttribute("role"));

				// Chuyển hướng dựa trên vai trò của người dùng
				switch (user.getRole()) {
				case 0:
					return "redirect:/admin"; // Vai trò admin
				case 1:
					return "redirect:/user"; // Vai trò người tìm việc
				case 2:
					return "redirect:/employers"; // Vai trò nhà tuyển dụng
				default:
					model.addAttribute("message", "Vai trò không hợp lệ");
					return "dangnhap";
				}
			} else {
				model.addAttribute("message", "Mật khẩu không đúng");
			}
		} else {
			model.addAttribute("message", "Tài khoản không tồn tại");
		}
		return "dangnhap";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // Xóa tất cả dữ liệu khỏi session
		return "redirect:/job4u"; // Chuyển hướng về trang chính hoặc trang đăng nhập
	}

	// show thông tin chi tiết điều khoản
	@GetMapping("/terms")
	public String showTerms() {
		return "dieuKhoanDichVu"; // Tên của JSP (không có phần mở rộng .jsp)
	}
}
