package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.services.SessionService;
import jakarta.servlet.http.HttpSession;
import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/job4u")
public class NhaTuyenDungController {

	private static final Logger logger = LoggerFactory.getLogger(NhaTuyenDungController.class);

	@Autowired
	private SessionService sessionService;

	@Autowired
	private EmployersDao nhaTuyenDungDao;

	@Autowired
	private JoblistingsDao danhSachViecLamDao;

	@RequestMapping("/employers")
	public String nhaTuyenDung(Model model) {
		Integer employerId = sessionService.getCurrentEmployerId();

		if (employerId != null) {
			EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(new EmployersEntity());
			model.addAttribute("employer", employer);
		} else {
			model.addAttribute("message", "Bạn cần đăng nhập để truy cập trang này.");
			return "dangnhap"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
		}
		return "nhaTuyenDung";
	}

	@PostMapping("/employers/submit")
	public String themTuyenDung(@RequestParam("companyname") String companyname,
			@RequestParam("companywebsite") String companywebsite, @RequestParam("address") String address,
			@RequestParam("industry") String industry, @RequestParam("contactperson") String contactperson,
			@RequestParam("logo") MultipartFile logo, @RequestParam("jobtitle") String jobtitle,
			@RequestParam("joblocation") String joblocation, @RequestParam("jobtype") String jobtype,
			@RequestParam("salary") BigDecimal salary, @RequestParam("companydescription") String companydescription,
			@RequestParam("jobrequirements") String jobrequirements, @RequestParam("posteddate") String posteddate,
			@RequestParam("applicationdeadline") String applicationdeadline, RedirectAttributes redirectAttributes) {

		Integer employerId = sessionService.getCurrentEmployerId();
		if (employerId == null) {
			redirectAttributes.addFlashAttribute("message", "Bạn chưa đăng nhập");
			return "redirect:/job4u/employers";
		}

		EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(null);
		if (employer == null) {
			redirectAttributes.addFlashAttribute("message", "Nhà tuyển dụng không tồn tại");
			return "redirect:/job4u/employers";
		}

		// Xử lý logo
		String uploadDir = "D:" + File.separator + "DAX" + File.separator + "Job4U" + File.separator + "src"
				+ File.separator + "main" + File.separator + "webapp" + File.separator + "img" + File.separator;
		Path uploadPath = Paths.get(uploadDir);

		String logoFilename = null;
		try {
			if (!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}

			if (!logo.isEmpty()) {
				logoFilename = logo.getOriginalFilename();
				Path filePath = uploadPath.resolve(logoFilename);
				logo.transferTo(filePath.toFile());
			}
		} catch (IOException e) {
			logger.error("Lỗi khi lưu logo: ", e);
			redirectAttributes.addFlashAttribute("message", "Lỗi khi lưu logo");
			return "redirect:/job4u/employers";
		}

		// Cập nhật thông tin nhà tuyển dụng
		employer.setCompanyname(companyname);
		employer.setCompanywebsite(companywebsite);
		employer.setAddress(address);
		employer.setIndustry(industry);
		employer.setContactperson(contactperson);
		employer.setLogo(logoFilename);
		employer.setCompanydescription(companydescription);

		nhaTuyenDungDao.save(employer);

		// Tạo đối tượng JoblistingsEntity và thiết lập các thuộc tính
		JoblistingsEntity jobListing = new JoblistingsEntity();
		jobListing.setJobtitle(jobtitle);
		jobListing.setJoblocation(joblocation);
		jobListing.setJobtype(jobtype);
		jobListing.setSalary(salary);
		jobListing.setJobrequirements(jobrequirements);
		jobListing.setJobdescription(jobrequirements); // Thiết lập mô tả công việc
		jobListing.setEmployer(employer); // Thiết lập nhà tuyển dụng

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		try {
			LocalDateTime postedDate = LocalDateTime.parse(posteddate, formatter);
			LocalDateTime applicationDeadline = LocalDateTime.parse(applicationdeadline, formatter);

			jobListing.setPosteddate(postedDate);
			jobListing.setApplicationdeadline(applicationDeadline);
		} catch (Exception e) {
			logger.error("Lỗi khi phân tích ngày: ", e);
			redirectAttributes.addFlashAttribute("message", "Lỗi khi phân tích ngày");
			return "redirect:/job4u/employers";
		}

		// Lưu thông tin việc làm
		try {
			danhSachViecLamDao.save(jobListing);
		} catch (Exception e) {
			logger.error("Lỗi khi lưu việc làm: ", e);
			redirectAttributes.addFlashAttribute("message", "Lỗi khi lưu việc làm");
			return "redirect:/job4u/employers";
		}

		redirectAttributes.addFlashAttribute("message", "Đã đăng bài thành công");
		return "redirect:/job4u/employers";
	}

}