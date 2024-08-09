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
    private SessionService sessionService;

    @Autowired
    private UsersDao userDao;

    @GetMapping("")
    public String showLoginPage() {
        return "dangnhap"; // Trả về view đăng nhập
    }

    @PostMapping("/submit")
    public String submitForm(@RequestParam("username") String username, @RequestParam("password") String password,
                             Model model, HttpSession session) {
        // Tìm kiếm người dùng trong cơ sở dữ liệu dựa trên tên người dùng
        List<UsersEntity> users = userDao.findByUsername(username);

        // Kiểm tra xem danh sách người dùng có rỗng không
        if (!users.isEmpty()) {
            UsersEntity user = users.get(0); // Lấy người dùng đầu tiên từ danh sách

            // Kiểm tra mật khẩu
            if (user.getPassword().equals(password)) {
                // Nếu đăng nhập thành công, lưu thông tin người dùng vào session
                session.setAttribute("userid", user.getUserid()); // Lưu userid vào session
                session.setAttribute("fullname", user.getFullname());

                logger.info("User '{}' logged in with role: {}", username, user.getRole());

                // Chuyển hướng dựa trên vai trò của người dùng
                switch (user.getRole()) {
                    case 0:
                        return "redirect:/admin"; // Quản lý admin
                    case 1:
                        return "redirect:/job4u"; // Người dùng thường
                    case 2:
                        return "redirect:/job4u/employers"; // Nhà tuyển dụng
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
        return "redirect:/Login"; // Chuyển hướng về trang đăng nhập
    }
}
