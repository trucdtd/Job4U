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
import demo.dao.UsersDao;
import demo.services.ThongKeService;

@Controller
@RequestMapping("")
public class ThongKeController {

	@Autowired
	UsersDao userDao;

	@Autowired
	JoblistingsDao joblistingsDao;

	@GetMapping("/thongke")
	public String getStatistics(Model model) {
	    // Đối với UserRepository - dùng LocalDateTime
	    LocalDateTime startDateForUsers = LocalDateTime.now().minusMonths(12);
	    List<Object[]> userStatistics = userDao.countUsersByMonth(startDateForUsers);

	    // Đối với JobRepository - dùng LocalDate
	    LocalDate startDateForJobs = LocalDate.now().minusMonths(12);
	    List<Object[]> jobStatistics = joblistingsDao.countPostsByMonth(startDateForJobs);

	    // Thêm dữ liệu vào model để truyền sang giao diện
	    model.addAttribute("userStatistics", userStatistics);
	    model.addAttribute("jobStatistics", jobStatistics);

	    return "thongKeMoi"; // Tên template HTML/JSP cho trang thống kê
	}
}
