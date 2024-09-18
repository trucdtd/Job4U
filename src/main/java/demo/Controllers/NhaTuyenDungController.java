package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import demo.services.SessionService;
import demo.dao.ApplicationsDao;
import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.entity.ApplicationsEntity;
import demo.dao.ServicesDao;
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

	@Autowired
	private ApplicationsDao applicationsDao;
	
	@RequestMapping("/employers")
	public String nhaTuyenDung(Model model) {
	    Integer employerId = sessionService.getCurrentEmployerId();

	    if (employerId != null) {
	        EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(null);
	        if (employer != null) {
	            // Xem xét giá trị của employer
//	            System.out.println("Employer: " + employer);

	            List<JoblistingsEntity> jobPostings = danhSachViecLamDao.findByEmployer(employer);
	            model.addAttribute("jobPostings", jobPostings);

	            for (JoblistingsEntity jobPosting : jobPostings) {
	                List<ApplicationsEntity> applications = applicationsDao.findByJob(jobPosting);
	                model.addAttribute("applications" + jobPosting.getJobid(), applications);
	            }

	            // Thêm employer vào model
	            model.addAttribute("employer", employer);
	        }
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
		EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(null);

		if (employer == null) {
			return "error"; // Xử lý trường hợp không tìm thấy nhà tuyển dụng
		}

		// Xử lý lưu trữ logo
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
			return "nhaTuyenDung"; // Hoặc trang thông báo lỗi
		}

		// Cập nhật thông tin của nhà tuyển dụng
		employer.setCompanyname(companyname);
		employer.setCompanywebsite(companywebsite);
		employer.setAddress(address);
		employer.setIndustry(industry);
		employer.setContactperson(contactperson);
		employer.setLogo(logoFilename);
		employer.setCompanydescription(companydescription);

		nhaTuyenDungDao.save(employer);

		// Tạo đối tượng JoblistingsEntity và lưu trữ
		JoblistingsEntity jobListing = new JoblistingsEntity();
		jobListing.setJobtitle(jobtitle);
		jobListing.setJoblocation(joblocation);
		jobListing.setJobtype(jobtype);
		jobListing.setSalary(salary);
		jobListing.setJobrequirements(jobrequirements);
		jobListing.setJobdescription(jobdescription);
		jobListing.setEmployer(employer);

		// Xử lý ngày
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		try {
			LocalDate postedDate = LocalDate.parse(posteddate, formatter);
			LocalDate applicationDeadline = LocalDate.parse(applicationdeadline, formatter);
			jobListing.setPosteddate(postedDate);
			jobListing.setApplicationdeadline(applicationDeadline);
		} catch (Exception e) {
			// Xử lý lỗi phân tích ngày
			e.printStackTrace();
			return "error"; // Hoặc trang thông báo lỗi
		}

		danhSachViecLamDao.save(jobListing);

		return "nhaTuyenDung";
	}
	
	@PostMapping("/employers/updateJob")
	@ResponseBody
	public ResponseEntity<?> updateJob(@RequestBody Map<String, String> jobData) {
	    try {
	        Integer jobId = Integer.parseInt(jobData.get("jobId"));
	        JoblistingsEntity jobListing = danhSachViecLamDao.findById(jobId).orElse(null);

	        if (jobListing == null) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Bài đăng không tồn tại");
	        }

	        jobListing.setJobtitle(jobData.get("jobTitle"));
	        jobListing.setJoblocation(jobData.get("jobLocation"));
	        jobListing.setJobdescription(jobData.get("jobDescription"));
	        jobListing.setJobrequirements(jobData.get("jobRequirements"));
	        jobListing.setSalary(new BigDecimal(jobData.get("salary")));
	        jobListing.setJobtype(jobData.get("jobType"));

	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        try {
	            LocalDate postedDate = LocalDate.parse(jobData.get("postedDate"), formatter);
	            LocalDate applicationDeadline = LocalDate.parse(jobData.get("applicationDeadline"), formatter);
	            jobListing.setPosteddate(postedDate);
	            jobListing.setApplicationdeadline(applicationDeadline);
	            jobListing.setTopStartDate(LocalDate.parse(jobData.get("topStartDate"), formatter));
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Lỗi phân tích ngày");
	        }

	        danhSachViecLamDao.save(jobListing);
	        return ResponseEntity.ok(Map.of("success", true));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi hệ thống");
	    }
	}


//	@PostMapping("/employers/service")
//	public String showService(@RequestParam("serviceId") Integer serviceId, Model model) {
//	    // Retrieve the service from the database using the serviceId
//	    ServicesEntity service = servicesDao.findById(serviceId).orElse(null);
//
//	    // Check if the service exists
//	    if (service != null) {
//	        // Add service details to the model
//	        model.addAttribute("serviceName", service.getServicename());
//	        model.addAttribute("servicePrice", service.getPrice() + " VNĐ");
//	        model.addAttribute("serviceDescription", service.getDescription());
//
//	        // Return the view displaying the service details
//	        return "nhaTuyenDung";
//	    } else {
//	        // Add an error message to the model if service does not exist
//	        model.addAttribute("errorMessage", "Gói dịch vụ không tồn tại");
//	        
//	        // Return the same view, but with the error message
//	        return "nhaTuyenDung";
//	    }
//	}

}
