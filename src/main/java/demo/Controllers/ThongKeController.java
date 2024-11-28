package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
import demo.dao.PaymentsDao;
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

	@Autowired
	PaymentsDao paymentDao;

	@GetMapping("")
	public String getSoldServices(Model model) {
		// Lấy danh sách dịch vụ đã bán từ userServicesDao
		List<UserServicesEntity> qlTK = userServicesDao.selectServiceSold(LocalDate.now());
		//thống kê trong ngày
		Long countJoblisting = joblistingsDao.countJobToDay(LocalDate.now());
		Long countUser = userDao.count();
		Long countService = userServicesDao.countServiceSold(LocalDate.now());
		// Đưa danh sách vào model để sử dụng trong view
		model.addAttribute("qlTK", qlTK);
		model.addAttribute("countJoblisting", countJoblisting);
		model.addAttribute("countUser", countUser);
		model.addAttribute("countService", countService);
		model.addAttribute("status", "d-none");
		System.out.println("job" +countJoblisting);
		return "thongKeMoi";
	}

	@PostMapping("")
	public String thongKe(Model model, @RequestParam("startdate") Optional<LocalDate> startDate,
			@RequestParam("enddate") Optional<LocalDate> endDate) {
		// TODO: process POST request
		// lay du lieu
		LocalDate starDateLocalDate = null;
		LocalDate endDateLocalDate = null;
		if (!startDate.isEmpty() && !endDate.isEmpty()) {
			Integer yearOfStartDate = Integer.parseInt(startDate.toString().substring(9, 13));
			Integer monthOfStartDate = Integer.parseInt(startDate.toString().substring(14, 16));
			if (Integer.parseInt(startDate.toString().substring(14, 15)) == 0) {
				monthOfStartDate = Integer.parseInt(startDate.toString().substring(15, 16));
			}
			Integer dayOfStartDate = Integer.parseInt(startDate.toString().substring(17, 19));
			if (Integer.parseInt(startDate.toString().substring(17, 18)) == 0) {
				dayOfStartDate = Integer.parseInt(startDate.toString().substring(18, 19));
			}

			starDateLocalDate = LocalDate.of(yearOfStartDate, monthOfStartDate, dayOfStartDate);

			Integer yearOfEndDate = Integer.parseInt(endDate.toString().substring(9, 13));
			Integer monthOfEndDate = Integer.parseInt(endDate.toString().substring(14, 16));
			if (Integer.parseInt(endDate.toString().substring(14, 15)) == 0) {
				monthOfEndDate = Integer.parseInt(endDate.toString().substring(15, 16));
			}
			Integer dayOfEndDate = Integer.parseInt(endDate.toString().substring(17, 19));
			if (Integer.parseInt(endDate.toString().substring(17, 18)) == 0) {
				dayOfEndDate = Integer.parseInt(endDate.toString().substring(18, 19));
			}
			LocalDateTime startDateLocalDateTime = LocalDateTime.of(yearOfStartDate, monthOfStartDate, dayOfStartDate,
					23, 59);
			LocalDateTime endDateLocalDateTime = LocalDateTime.of(yearOfEndDate, monthOfEndDate, dayOfEndDate, 23, 59);
			endDateLocalDate = LocalDate.of(yearOfEndDate, monthOfEndDate, dayOfEndDate);
			if(!starDateLocalDate.isBefore(endDateLocalDate)) {
				model.addAttribute("status", "d-block");
				model.addAttribute("text", "Lỗi! ngày kết thúc phải lớn hơn ngày bắt đầu.");
			}else {
				Long demBaiViet = joblistingsDao.countJobStartDateEndDate(startDate, endDate);
				Long demNguoiDung = userDao.countUserStartDateEndDate(startDateLocalDateTime, endDateLocalDateTime);

				Long demDichVu = userServicesDao.countUSStartDateEndDate(startDateLocalDateTime, endDateLocalDateTime);
				List<UserServicesEntity> list = userServicesDao.selectUSStartDateEndDateList(startDateLocalDateTime,
						endDateLocalDateTime);
				model.addAttribute("countService", demDichVu);
				model.addAttribute("countJoblisting", demBaiViet);
				model.addAttribute("countUser", demNguoiDung);
				model.addAttribute("qlTK", list);
				model.addAttribute("status", "d-none");
				model.addAttribute("text", "Vui lòng chọn ngày bắt đầu và ngày kết thúc để thống kê!");
			}		
		} else if (starDateLocalDate == null || endDateLocalDate == null) {
			model.addAttribute("status", "d-block");
			model.addAttribute("text", "Vui lòng chọn đầy đủ ngày bắt đầu và ngày kết thúc để thống kê!");
		}

		return "thongKeMoi";
	}

}
