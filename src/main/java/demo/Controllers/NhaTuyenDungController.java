package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.net.MediaType;

import demo.services.SessionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import demo.dao.ApplicationsDao;
import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.entity.ApplicationsEntity;
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

	@Autowired
	HttpServletRequest req;

	@Autowired
	HttpServletResponse resp;

	@RequestMapping("/employers")
	public String nhaTuyenDung(Model model) {
		Integer userId = sessionService.getCurrentUserId();

//	    System.out.println("Current User ID: " + userId);
		List<ServicesEntity> service = servicesDao.findAll();
		model.addAttribute("service", service);

		if (userId != null) {
			EmployersEntity employer = nhaTuyenDungDao.findByUserId(userId).orElse(null);

			if (employer != null) {
				// Chỉ lấy những bài đăng có active = true
				List<JoblistingsEntity> jobPostings = danhSachViecLamDao.findByEmployerAndActive(employer, true);
				model.addAttribute("jobPostings", jobPostings);

				// Lấy danh sách CV ứng tuyển
				List<ApplicationsEntity> cv = applicationsDao.findByJob_Employer(employer);
				model.addAttribute("dsCV", cv); // Thêm danh sách CV vào model

				for (JoblistingsEntity jobPosting : jobPostings) {
					List<ApplicationsEntity> applications = applicationsDao.findByJob(jobPosting);
					model.addAttribute("applications" + jobPosting.getJobid(), applications);
				}

				model.addAttribute("employer", employer);
			} else {
				model.addAttribute("error", "Không tìm thấy nhà tuyển dụng.");
			}
		} else {
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
			@RequestParam("companywebsite") String companywebsite, @RequestParam("address") String address,
			@RequestParam("industry") String industry, @RequestParam("contactperson") String contactperson,
			@RequestParam(value = "logo", required = false) MultipartFile logo,
			@RequestParam("jobtitle") String jobtitle, @RequestParam("joblocation") String joblocation,
			@RequestParam("jobtype") String jobtype, @RequestParam("salary") BigDecimal salary,
			@RequestParam("companydescription") String companydescription,
			@RequestParam("jobrequirements") String jobrequirements,
			@RequestParam("jobdescription") String jobdescription, @RequestParam("posteddate") String posteddate,
			@RequestParam("applicationdeadline") String applicationdeadline) {

		// Kiểm tra dữ liệu đầu vào
		if (companyname == null || companyname.isEmpty()) {
			return "error"; // Trả về thông báo lỗi
		}

		// Lấy ID nhà tuyển dụng từ phiên đăng nhập của người dùng
		Integer userId = sessionService.getCurrentUserId();
		EmployersEntity employer = nhaTuyenDungDao.findByUserId(userId).orElse(null);

		if (employer == null) {
			return "error"; // Nhà tuyển dụng không tồn tại
		}

		// Kiểm tra và lưu logo
		String logoFilename = null;
		if (logo != null && !logo.isEmpty()) {
		    logoFilename = StringUtils.cleanPath(logo.getOriginalFilename());
		    try {
		        File uploadsDir = new File(req.getServletContext().getRealPath("/uploads/"));
		        if (!uploadsDir.exists()) {
		            uploadsDir.mkdirs(); // Tạo thư mục nếu không tồn tại
		        }
		        Path path = Paths.get(uploadsDir.getAbsolutePath(), logoFilename);
		        Files.write(path, logo.getBytes());
		    } catch (IOException e) {
		        e.printStackTrace();
		        return "error"; // Xử lý lỗi tải lên
		    }
		}

		// Cập nhật thông tin nhà tuyển dụng
		employer.setCompanyname(companyname);
		employer.setCompanywebsite(companywebsite);
		employer.setAddress(address);
		employer.setIndustry(industry);
		employer.setContactperson(contactperson);
		if (logoFilename != null) {
			employer.setLogo(logoFilename); // Chỉ cập nhật logo nếu nó không null
		}
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
		return "redirect:/job4u/employers";
	}

	@PostMapping("/employers/edit")
	public String editJobPosting(@RequestParam("jobId") Integer jobId, @RequestParam("jobTitle") String jobTitle,
			@RequestParam("jobLocation") String jobLocation, @RequestParam("jobDescription") String jobDescription,
			@RequestParam("jobRequirements") String jobRequirements, @RequestParam("salaryEdit") BigDecimal salary,
			@RequestParam("jobType") String jobType, @RequestParam("postedDate") String postedDate,
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

	@PostMapping("/employers/delete")
	public String deleteJob(@RequestParam("jobId") Integer jobId, Model model) {
		// Kiểm tra xem bài đăng có tồn tại không
		JoblistingsEntity jobListing = danhSachViecLamDao.findById(jobId).orElse(null);

		if (jobListing == null) {

			model.addAttribute("error", "Bài đăng không tồn tại.");
			return "redirect:/job4u/employers"; // Hoặc trang thông báo lỗi
		}

		// Kiểm tra xem bài đăng có sử dụng dịch vụ nào không
		if (jobListing.getUserService() != null) {
			model.addAttribute("error", "Không thể xóa bài đăng đã sử dụng dịch vụ.");
			return "redirect:/job4u/employers"; // Hoặc trang thông báo lỗi
		}

		// Xóa bài đăng
		danhSachViecLamDao.delete(jobListing);
		model.addAttribute("success", "Xóa bài đăng thành công.");
		return "redirect:/job4u/employers";
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
