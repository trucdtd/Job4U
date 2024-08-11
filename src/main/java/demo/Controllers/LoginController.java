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

    @GetMapping("/admin")
    public String adminPage(HttpSession session, Model model) {
        Integer role = (Integer) session.getAttribute("role");

        if (role != null && role == 0) { // Kiểm tra nếu là admin
            return "/admin"; // Trả về trang admin nếu người dùng là admin
        } else {
            model.addAttribute("message", "Bạn không có quyền truy cập vào trang này.");
            return "dangnhap"; // Trả về trang đăng nhập nếu không phải admin
        }
    }

    @PostMapping("/submit")
    public String submitForm(@RequestParam("username") String username, @RequestParam("password") String password,
                             Model model, HttpSession session) {
        List<UsersEntity> users = userDao.findByUsername(username);

        if (!users.isEmpty()) {
            UsersEntity user = users.get(0);
            if (user.getPassword().equals(password)) {
                session.setAttribute("userIsLoggedIn", true);
                session.setAttribute("userName", user.getFullname());
                session.setAttribute("userid", user.getUserid());

                // Thiết lập employerId vào session nếu người dùng là nhà tuyển dụng
                if (user.getRole() == 2) {
                    session.setAttribute("employerId", user.getUserid());
                }

                logger.info("Người dùng '{}' đã đăng nhập với vai trò: {}", username, user.getRole());

                // Chuyển hướng dựa trên vai trò của người dùng
                switch (user.getRole()) {
                    case 0:
                        return "redirect:/admin";
                    case 1:
                        return "redirect:/job4u";
                    case 2:
                        return "redirect:/job4u/employers";
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
}
