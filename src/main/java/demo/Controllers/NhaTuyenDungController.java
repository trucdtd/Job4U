package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import demo.services.SessionService;
import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.dao.ServicesDao;
import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;
import demo.entity.ServicesEntity;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/job4u")
public class NhaTuyenDungController {

	@Autowired
	private SessionService sessionService;

	@Autowired
	private EmployersDao nhaTuyenDungDao;
	
	@Autowired
    private ServicesDao servicesDao;

	@Autowired
	private JoblistingsDao danhSachViecLamDao;

	@RequestMapping("/employers")
	public String nhaTuyenDung(@RequestParam(value = "serviceId", required = false) Integer serviceId, Model model) {
	    // Lấy ID của nhà tuyển dụng hiện tại từ session
	    Integer employerId = sessionService.getCurrentEmployerId();

	    if (employerId != null) {
	        EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(new EmployersEntity());
	        model.addAttribute("employer", employer);
	        if (employer != null) {
	            // Lấy danh sách bài đăng tuyển dụng của nhà tuyển dụng
	            List<JoblistingsEntity> jobPostings = danhSachViecLamDao.findByEmployer(employer);
	            model.addAttribute("jobPostings", jobPostings);
	        }
	    }

	    // Kiểm tra nếu có serviceId
	    if (serviceId != null) {
	        // Lấy dữ liệu theo ID của dịch vụ (serviceId)
	        ServicesEntity service = servicesDao.findById(serviceId).orElse(new ServicesEntity());

	        // Lấy danh sách tất cả các dịch vụ
	        List<ServicesEntity> servicesList = servicesDao.findAll();

	        // Thêm danh sách dịch vụ vào model để đổ ra view
	        model.addAttribute("servicesList", servicesList);

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
			@RequestParam("jobrequirements") String jobrequirements,
			@RequestParam("jobdescription") String jobdescription, @RequestParam("posteddate") String posteddate,
			@RequestParam("applicationdeadline") String applicationdeadline) {

		Integer employerId = sessionService.getCurrentEmployerId();

		// Lấy hoặc tạo mới đối tượng EmployersEntity
		EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(null);

		if (employer == null) {
			return "error"; // Xử lý trường hợp không tìm thấy nhà tuyển dụng
		}

		// Đường dẫn lưu trữ logo
		String uploadDir = "Job4U" + File.separator + "src" + File.separator + "main" + File.separator + "webapp"
				+ File.separator + "img" + File.separator;
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
	
	@PostMapping("/employers/service")
	public String showService(@RequestParam("serviceId") Integer serviceId, Model model) {
	    // Retrieve the service from the database using the serviceId
	    ServicesEntity service = servicesDao.findById(serviceId).orElse(null);

	    // Check if the service exists
	    if (service != null) {
	        // Add service details to the model
	        model.addAttribute("serviceName", service.getServiceName());
	        model.addAttribute("servicePrice", service.getPrice() + " VNĐ");
	        model.addAttribute("serviceDescription", service.getDescription());

	        // Return the view displaying the service details
	        return "nhaTuyenDung";
	    } else {
	        // Add an error message to the model if service does not exist
	        model.addAttribute("errorMessage", "Gói dịch vụ không tồn tại");
	        
	        // Return the same view, but with the error message
	        return "nhaTuyenDung";
	    }
	}
	
}
