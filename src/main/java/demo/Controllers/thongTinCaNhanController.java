package demo.Controllers;

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
	
	
	@GetMapping("/user")
	public String userAccount(HttpSession ss, Model model) {
	    String username = (String) ss.getAttribute("username");
	    System.out.println("username: " + username);
	    if (username == null) {
	        model.addAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
	        return "dangnhap";
	    }
	    // Tiếp tục xử lý với thông tin người dùng đã đăng nhập
	    List<UsersEntity> user = usersDao.findByUsername(username);
	    model.addAttribute("user", user);
	    return "thongTinCaNhan";
	}
}
