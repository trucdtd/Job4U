package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JoblistingsDao;
import demo.dao.UserServicesDao;
import demo.dao.UsersDao;
import demo.entity.JoblistingsEntity;
import demo.entity.UserServicesEntity;
import demo.entity.UsersEntity;
import demo.services.ThongKeService;

@Controller
@RequestMapping("")
public class ThongKeController {

	@Autowired
	UsersDao userDao;

	@Autowired
	JoblistingsDao joblistingsDao;
	
	@Autowired
	UserServicesDao userServicesDao;

	@GetMapping("/thongke")
	public String getStatistics(Model model) {
	    // Lấy dữ liệu từ các DAO
		/*
		 * List<UserServicesEntity> services = userServicesDao.findAll();
		 * List<UsersEntity> users = userDao.findAll(); List<JoblistingsEntity> posts =
		 * postDao.findAll(); // Giả sử bạn có DAO cho Post
		 * 
		 * // Tính toán số liệu thống kê thực tế int totalPosts = posts.size(); int
		 * totalUsers = users.size(); int totalServices = services.size();
		 * 
		 * // Lưu vào model model.addAttribute("postCount", totalPosts);
		 * model.addAttribute("userCount", totalUsers);
		 * model.addAttribute("serviceCount", totalServices);
		 * 
		 * // Lưu thêm phần trăm tăng giảm nếu cần model.addAttribute("postPercentage",
		 * calculatePercentageChange(...)); // Cần tính toán phần trăm thay đổi
		 * model.addAttribute("userPercentage", calculatePercentageChange(...));
		 * model.addAttribute("salesPercentage", calculatePercentageChange(...));
		 */


	    // Lấy danh sách dịch vụ (nếu cần hiển thị trong bảng)
	    List<UserServicesEntity> qlTK = userServicesDao.findAll();
	    model.addAttribute("qlTK", qlTK);
	    
	    return "thongKeMoi"; // Trả về view
	}

}
