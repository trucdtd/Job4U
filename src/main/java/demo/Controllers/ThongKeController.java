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
import demo.dao.ServicesDao;
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

	@Autowired
	ServicesDao svDao;

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
	public String thongKe(Model model, @RequestParam("startdate") LocalDate startDate,
			@RequestParam("enddate") LocalDate endDate) {
		// TODO: process POST request
		// lay du lieu
		Long demBaiViet = joblistingsDao.countJobStartDateEndDate(startDate, endDate);
		LocalDateTime startDateLocalDateTime = LocalDateTime.of(startDate.getYear(), startDate.getMonth(),
				startDate.getDayOfMonth(), 23, 59);
		LocalDateTime endDateLocalDateTime = LocalDateTime.of(endDate.getYear(), endDate.getMonth(),
				endDate.getDayOfMonth(), 23, 59);

		Long demNguoiDung = userDao.countUserStartDateEndDate(startDateLocalDateTime, endDateLocalDateTime);
		// ép kiểu

		// dem dich vu
		System.out.println(startDateLocalDateTime);
		Long demDichVu = userServicesDao.countUSStartDateEndDate(startDateLocalDateTime, endDateLocalDateTime);
		List<UserServicesEntity> list = userServicesDao.selectUSStartDateEndDateList(startDateLocalDateTime,
				endDateLocalDateTime);
		model.addAttribute("countService", demDichVu);
		model.addAttribute("countJoblisting", demBaiViet);
		model.addAttribute("countUser", demNguoiDung);
		model.addAttribute("qlTK", list);
		return "thongKeMoi";
	}

}
