package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import demo.dao.JoblistingsDao;
import demo.dao.UserServicesDao;
import demo.dao.UsersDao;
import demo.entity.JoblistingsEntity;
import demo.entity.UserServicesEntity;
import demo.entity.UsersEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/thongke")
public class ThongKeController {

	@Autowired
	UsersDao userDao;

	@Autowired
	JoblistingsDao joblistingsDao;

	@Autowired
	UserServicesDao userServicesDao;

	@GetMapping("")
	public String getSoldServices(Model model) {
		// Lấy danh sách dịch vụ đã bán từ userServicesDao
		List<UserServicesEntity> qlTK = userServicesDao.findAll();
		Long countJoblisting = joblistingsDao.count();
		Long countUser = userDao.count();
		Long countService = userServicesDao.count();
		// Đưa danh sách vào model để sử dụng trong view
		model.addAttribute("qlTK", qlTK);
		model.addAttribute("countJoblisting", countJoblisting);
		model.addAttribute("countUser", countUser);
		model.addAttribute("countService", countService);
		// Trả về tên view (ví dụ "thongke" là tên của file HTML)
		return "thongKeMoi";
	}
	
	@PostMapping("")
	public String thongKe(@RequestParam("startdate") String startDate,@RequestParam("startdate") String endDate) {
		//TODO: process POST request
		//lay du lieu
		
		return "thongKeMoi";
	}
	

//	@GetMapping("/thongke")
//    public String getStatistics(Model model) {
//        LocalDate today = LocalDate.now();
//        LocalDate sixMonthsAgo = today.minusMonths(6);
//        LocalDate oneYearAgo = today.minusYears(1);
//        
//        LocalDateTime todayStart = LocalDate.now().atStartOfDay();
//        LocalDateTime sixMonthsAgoStart = todayStart.minusMonths(6);
//        LocalDateTime oneYearAgoStart = todayStart.minusYears(1);
//
//        // Bài viết
//        Integer postToday = joblistingsDao.countPostsSince(today);
//        Integer post6Months = joblistingsDao.countPostsSince(sixMonthsAgo);
//        Integer post1Year = joblistingsDao.countPostsSince(oneYearAgo);
//
//        // Người dùng
//        Integer usersToday = userDao.countUsersInRange(todayStart, todayStart.plusDays(1));
//        Integer usersSixMonths = userDao.countUsersInRange(sixMonthsAgoStart, todayStart);
//        Integer usersOneYear = userDao.countUsersInRange(oneYearAgoStart, todayStart);
//
//        // Dịch vụ
//        Integer serviceToday = userServicesDao.countServicesSince(todayStart);
//        Integer service6Months = userServicesDao.countServicesSince(sixMonthsAgoStart);
//        Integer service1Year = userServicesDao.countServicesSince(oneYearAgoStart);
//
//        // Đưa dữ liệu vào model
//        model.addAttribute("postToday", postToday);
//        model.addAttribute("post6Months", post6Months);
//        model.addAttribute("post1Year", post1Year);
//
//        model.addAttribute("usersToday", usersToday);
//        model.addAttribute("usersSixMonths", usersSixMonths);
//        model.addAttribute("usersOneYear", usersOneYear);
//
//        model.addAttribute("serviceToday", serviceToday);
//        model.addAttribute("service6Months", service6Months);
//        model.addAttribute("service1Year", service1Year);
//        
//        List<UserServicesEntity> qlTK = userServicesDao.findAll();
//        model.addAttribute("qlTK", qlTK);
//        
//        return "thongKeMoi";
//	}

}
