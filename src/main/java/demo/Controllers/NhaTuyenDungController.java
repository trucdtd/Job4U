package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import demo.services.SessionService;
import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/job4u")
public class NhaTuyenDungController {

	@Autowired
	private SessionService sessionService;

	@Autowired
	private EmployersDao nhaTuyenDungDao;

	@Autowired
	private JoblistingsDao danhSachViecLamDao;

	@Autowired
	JoblistingsDao joblistingsDao;
	
	@RequestMapping("/employers")
	public String quanLyNguoiDung(Model model, @RequestParam(value = "page", required = false) String page) {
		if (page == null || page.equals("quanLyTuyenDung")) {
			List<JoblistingsEntity> dsTD = joblistingsDao.findAll();
			model.addAttribute("dsTD", dsTD);
		}
		return "nhaTuyenDung";
		// Trả về trang mặc định nếu không có page hoặc page không phải là
		// quanLyUngTuyen
	}

	@PostMapping("/employers/submit")
	public String themTuyenDung(@RequestParam("companyname") String companyname,
			@RequestParam("companywebsite") String companywebsite, @RequestParam("address") String address,
			@RequestParam("industry") String industry, @RequestParam("contactperson") String contactperson,
			@RequestParam("logo") MultipartFile logo, @RequestParam("jobtitle") String jobtitle,
			@RequestParam("joblocation") String joblocation, @RequestParam("jobtype") String jobtype,
			@RequestParam("salary") BigDecimal salary, @RequestParam("companydescription") String companydescription,
			@RequestParam("jobrequirements") String jobrequirements, @RequestParam("posteddate") String posteddate,
			@RequestParam("applicationdeadline") String applicationdeadline) {

		Integer employerId = sessionService.getCurrentEmployerId();

		// Lấy hoặc tạo mới đối tượng EmployersEntity
		EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(new EmployersEntity());

		// Đường dẫn lưu trữ logo
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
			e.printStackTrace();
			return "nhaTuyenDung";
		}

		// Cập nhật thông tin của nhà tuyển dụng
		employer.setCompanyname(companyname);
		employer.setCompanywebsite(companywebsite);
		employer.setAddress(address);
		employer.setIndustry(industry);
		employer.setContactperson(contactperson);
		employer.setLogo(logoFilename); // Lưu tên file thay vì đối tượng MultipartFile
		employer.setCompanydescription(companydescription);

		nhaTuyenDungDao.save(employer);

		// Tạo đối tượng JoblistingsEntity và lưu trữ
		JoblistingsEntity jobListing = new JoblistingsEntity();
		jobListing.setJobtitle(jobtitle);
		jobListing.setJoblocation(joblocation);
		jobListing.setJobtype(jobtype);
		jobListing.setSalary(salary);
		jobListing.setJobrequirements(jobrequirements);

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime postedDate = LocalDateTime.parse(posteddate, formatter);
		LocalDateTime applicationDeadline = LocalDateTime.parse(applicationdeadline, formatter);

		jobListing.setPosteddate(postedDate);
		jobListing.setApplicationdeadline(applicationDeadline);

		danhSachViecLamDao.save(jobListing);

		return "nhaTuyenDung";
	}
}
