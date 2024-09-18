package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.net.MediaType;

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
		Integer userId = sessionService.getCurrentUserId();
		System.out.println("Current User ID: " + userId);

	    if (userId != null) {
	        // Tìm nhà tuyển dụng theo userId
	        EmployersEntity employer = nhaTuyenDungDao.findByUserId(userId).orElse(null);
	        
	        if (employer != null) {
	            // Lấy danh sách bài đăng
	            List<JoblistingsEntity> jobPostings = danhSachViecLamDao.findByEmployer(employer);
	            model.addAttribute("jobPostings", jobPostings);

	            for (JoblistingsEntity jobPosting : jobPostings) {
	                List<ApplicationsEntity> applications = applicationsDao.findByJob(jobPosting);
	                model.addAttribute("applications" + jobPosting.getJobid(), applications);
	            }

	            // Thêm employer vào model
	            model.addAttribute("employer", employer);
	        } else {
	            // Xử lý trường hợp không tìm thấy nhà tuyển dụng
	            model.addAttribute("error", "Không tìm thấy nhà tuyển dụng.");
	        }
	    } else {
	        // Xử lý trường hợp không có userId trong session
	        model.addAttribute("error", "Vui lòng đăng nhập để tiếp tục.");
	    }

	    return "nhaTuyenDung";
	}


	@RequestMapping("/chitietCV")
	public String cvUngTuyen() {
		return "cvUngTuyen";
	}

	@PostMapping("/employers/submit")
	public String themTuyenDung(@RequestParam("companyname") String companyname,
	        @RequestParam("companywebsite") String companywebsite, 
	        @RequestParam("address") String address,
	        @RequestParam("industry") String industry, 
	        @RequestParam("contactperson") String contactperson,
	        @RequestParam("logo") MultipartFile logo, 
	        @RequestParam("jobtitle") String jobtitle,
	        @RequestParam("joblocation") String joblocation, 
	        @RequestParam("jobtype") String jobtype,
	        @RequestParam("salary") BigDecimal salary, 
	        @RequestParam("companydescription") String companydescription,
	        @RequestParam("jobrequirements") String jobrequirements,
	        @RequestParam("jobdescription") String jobdescription, 
	        @RequestParam("posteddate") String posteddate,
	        @RequestParam("applicationdeadline") String applicationdeadline) {

	    // Kiểm tra dữ liệu đầu vào
	    if (companyname == null || companyname.isEmpty()) {
	        return "error"; // Trả về thông báo lỗi
	    }

	    Integer employerId = sessionService.getCurrentEmployerId();
	    EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(null);

	    if (employer == null) {
	        return "error"; // Nhà tuyển dụng không tồn tại
	    }

	    // Lưu tệp logo vào thư mục và lấy tên tệp
	    String logoFilename = null;
	    try {
	        if (!logo.isEmpty()) {
	            logoFilename = logo.getOriginalFilename(); // Lấy tên tệp
	            // Lưu tệp vào thư mục (thêm mã lưu tệp ở đây)
	            File destinationFile = new File("/path/to/save/directory/" + logoFilename);
	            logo.transferTo(destinationFile); // Lưu tệp vào thư mục
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "error"; // Xử lý lỗi tải lên
	    }

	    // Cập nhật thông tin nhà tuyển dụng
	    employer.setCompanyname(companyname);
	    employer.setCompanywebsite(companywebsite);
	    employer.setAddress(address);
	    employer.setIndustry(industry);
	    employer.setContactperson(contactperson);
	    employer.setLogo(logoFilename); // Lưu tên tệp của logo
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
	        e.printStackTrace();
	        return "error"; // Xử lý lỗi phân tích ngày
	    }

	    danhSachViecLamDao.save(jobListing);
	    return "redirect:/nhaTuyenDung"; // Redirect đến trang nhà tuyển dụng
	}

	
	@PostMapping("/employers/edit")
	public String editJobPosting(@RequestParam("jobId") Integer jobId,
	                              @RequestParam("jobTitle") String jobTitle,
	                              @RequestParam("jobLocation") String jobLocation,
	                              @RequestParam("jobDescription") String jobDescription,
	                              @RequestParam("jobRequirements") String jobRequirements,
	                              @RequestParam("salaryEdit") BigDecimal salary,
	                              @RequestParam("jobType") String jobType,
	                              @RequestParam("postedDate") String postedDate,
	                              @RequestParam("applicationDeadline") String applicationDeadline) {
	    // Tìm kiếm công việc theo jobId
	    JoblistingsEntity jobListing = danhSachViecLamDao.findById(jobId).orElse(null);

	    if (jobListing == null) {
	        return "error"; // Xử lý trường hợp không tìm thấy công việc
	    }

	    // Cập nhật thông tin công việc
	    jobListing.setJobtitle(jobTitle);
	    jobListing.setJoblocation(jobLocation);
	    jobListing.setJobdescription(jobDescription);
	    jobListing.setJobrequirements(jobRequirements);
	    jobListing.setSalary(salary);
	    jobListing.setJobtype(jobType);

	    // Xử lý ngày
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    try {
	        LocalDate postedDateParsed = LocalDate.parse(postedDate, formatter);
	        LocalDate applicationDeadlineParsed = LocalDate.parse(applicationDeadline, formatter);
	        jobListing.setPosteddate(postedDateParsed);
	        jobListing.setApplicationdeadline(applicationDeadlineParsed);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error"; // Hoặc trang thông báo lỗi
	    }

	    // Lưu lại thông tin đã chỉnh sửa
	    danhSachViecLamDao.save(jobListing);

	    return "redirect:/job4u/employers"; // Chuyển hướng về trang nhà tuyển dụng
	}
	

//	@PostMapping("/employers/hide/{jobId}")
//	public ResponseEntity<?> hideJobPosting(@PathVariable Integer jobId) {
//	    JoblistingsEntity jobListing = danhSachViecLamDao.findById(jobId).orElse(null);
//	    if (jobListing == null) {
//	        return ResponseEntity.notFound().build(); // Nếu không tìm thấy công việc
//	    }
//	    jobListing.setActive(false); // Đánh dấu bài viết là không hoạt động
//	    danhSachViecLamDao.save(jobListing); // Lưu lại thay đổi
//	    return ResponseEntity.ok().build(); // Trả về phản hồi thành công
//	}

	
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
