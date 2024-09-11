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

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/job4u")
public class NhaTuyenDungController {

	@Autowired
	private SessionService sessionService;

	@Autowired
	private EmployersDao nhaTuyenDungDao;

	@Autowired
	private JoblistingsDao danhSachViecLamDao;

	@RequestMapping("/employers")
	public String nhaTuyenDung(Model model) {
		// Lấy ID của nhà tuyển dụng hiện tại từ session
		Integer employerId = sessionService.getCurrentEmployerId();

		if (employerId != null) {
			EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(new EmployersEntity());
			model.addAttribute("employer", employer);
		}

		return "nhaTuyenDung";
	}

	@RequestMapping("/chitietCV")
	public String cvUngTuyen() {
		return "cvUngTuyen";
	}

	@PostMapping("/employers/submit")
	public String themTuyenDung(@RequestParam("companyname") String companyname,
	        @RequestParam("companywebsite") String companywebsite, @RequestParam("address") String address,
	        @RequestParam("industry") String industry, @RequestParam("contactperson") String contactperson,
	        @RequestParam("logo") MultipartFile logo, @RequestParam("jobtitle") String jobtitle,
	        @RequestParam("joblocation") String joblocation, @RequestParam("jobtype") String jobtype,
	        @RequestParam("salary") BigDecimal salary, @RequestParam("companydescription") String companydescription,
	        @RequestParam("jobrequirements") String jobrequirements, @RequestParam("jobdescription") String jobdescription,
	        @RequestParam("posteddate") String posteddate, @RequestParam("applicationdeadline") String applicationdeadline) {

	    Integer employerId = sessionService.getCurrentEmployerId();

	    // Lấy hoặc tạo mới đối tượng EmployersEntity
	    EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(null);

	    if (employer == null) {
	        return "error"; // Xử lý trường hợp không tìm thấy nhà tuyển dụng
	    }

	    // Đường dẫn lưu trữ logo
	    String uploadDir = "Job4U" + File.separator + "src" + File.separator + "main" 
	            + File.separator + "webapp" + File.separator + "img" + File.separator;
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
	        return "nhaTuyenDung"; // Bạn có thể xử lý lỗi tại đây
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
	    jobListing.setJobdescription(jobdescription); // Gán giá trị cho jobdescription
	    jobListing.setEmployer(employer); // Gán đối tượng employer

	    // Cập nhật định dạng ngày để chỉ lấy ngày mà không cần giờ
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    LocalDate postedDate = LocalDate.parse(posteddate, formatter);
	    LocalDate applicationDeadline = LocalDate.parse(applicationdeadline, formatter);

	    // Chuyển đổi LocalDate thành LocalDateTime với thời gian mặc định là 00:00
	    jobListing.setPosteddate(postedDate.atStartOfDay());
	    jobListing.setApplicationdeadline(applicationDeadline.atStartOfDay());
	    danhSachViecLamDao.save(jobListing);

	    return "nhaTuyenDung";
	}
}
