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
import demo.services.UserRepository;
import demo.services.UserService;
import demo.services.VNPayService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import demo.dao.ApplicationsDao;
import demo.dao.EmployersDao;
import demo.dao.JobSeekersDao;
import demo.dao.JoblistingsDao;
import demo.dao.PaymentsDao;
import demo.entity.ApplicationsEntity;
import demo.dao.ServicesDao;
import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;
import demo.entity.PaymentsEntity;
import demo.entity.ServicesEntity;
import demo.entity.UsersEntity;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/employers")
public class NhaTuyenDungController {

	@Autowired
	private SessionService sessionService;

	@Autowired
	private VNPayService vnPayService;

	@Autowired
	private PaymentsDao paymentDao;

	@Autowired
	private EmployersDao nhaTuyenDungDao;

	@Autowired
	private ServicesDao servicesDao;

	@Autowired
	private JobSeekersDao jobSeekersDao;

	@Autowired
	private JoblistingsDao danhSachViecLamDao;

	@Autowired
	private ApplicationsDao applicationsDao;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	HttpServletRequest req;

	@Autowired
	HttpServletResponse resp;

	@Autowired
	HttpSession ss;

	@RequestMapping("")
	public String nhaTuyenDung(Model model) {
		Integer userId = sessionService.getCurrentUserId();

//	    System.out.println("Current User ID: " + userId);

		List<ServicesEntity> service = servicesDao.findAll();
		model.addAttribute("service", service);

		/*
		 * ServicesEntity service = servicesDao.findByServiceid(4);
		 * model.addAttribute("service", service);
		 */

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

	@PostMapping("/submit")

	public String themTuyenDung(
	        @RequestParam("companyname") String companyname,
	        @RequestParam("companywebsite") String companywebsite,
	        @RequestParam("address") String address,
	        @RequestParam("industry") String industry,
	        @RequestParam("contactperson") String contactperson,
	        @RequestParam(value = "logo", required = false) MultipartFile logo,
	        @RequestParam("jobtitle") String jobtitle,
	        @RequestParam("joblocation") String joblocation,
	        @RequestParam("jobtype") String jobtype,
	        @RequestParam(value = "salary", required = false) String salary,
	        @RequestParam("companydescription") String companydescription,
	        @RequestParam("jobrequirements") String jobrequirements,
	        @RequestParam("jobdescription") String jobdescription,
	        @RequestParam("posteddate") String posteddate,
	        @RequestParam("applicationdeadline") String applicationdeadline,
	        Model model) {

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

	    // Kiểm tra số lượng bài viết đã đăng trong tháng
	    LocalDate now = LocalDate.now();
	    LocalDate startOfMonth = now.withDayOfMonth(1);
	    List<JoblistingsEntity> postsThisMonth = danhSachViecLamDao.findJobsByEmployerIdAndMonthStart(employer.getEmployerid(), startOfMonth);
	    
	    if (postsThisMonth.size() >= 3) {
	        // Nếu vượt quá 3 bài, chuyển hướng đến trang dịch vụ với thông báo
	        // Bạn có thể sử dụng redirectAttributes để thêm thông báo
	    	model.addAttribute("successMessage", "Nhà tuyển dụng đã vượt quá số lượng bài viết trong tháng.");
	    	System.out.println("Nhà tuyển dụng đã vượt quá số lượng bài viết trong tháng.");
	        return "redirect:/employers";
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

		// Gán giá trị cho salary, nếu null hoặc rỗng thì gán là "Thỏa Thuận"
		jobListing.setSalary((salary != null && !salary.isEmpty()) ? salary : "Thỏa Thuận");

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
		return "redirect:/employers";
	}

	@PostMapping("/edit")
	public String editJobPosting(@RequestParam("jobIdedit") Integer jobId, @RequestParam("jobTitle") String jobTitle,
			@RequestParam("jobLocation") String jobLocation, @RequestParam("jobDescription") String jobDescription,
			@RequestParam("jobRequirements") String jobRequirements,
			@RequestParam(value = "salaryEdit", required = false) String salary,
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

		return "redirect:/employers"; // Chuyển hướng về trang nhà tuyển dụng
	}

	@PostMapping("/delete")
	public String deleteJob(@RequestParam("jobId") Integer jobId, Model model) {
		// Kiểm tra xem bài đăng có tồn tại không
		JoblistingsEntity jobListing = danhSachViecLamDao.findById(jobId).orElse(null);

		if (jobListing == null) {

			model.addAttribute("error", "Bài đăng không tồn tại.");
			return "redirect:/job4u/employers"; // Hoặc trang thông báo lỗi
		}

		// Kiểm tra xem bài đăng có sử dụng dịch vụ nào không
		if (jobListing.getUserservice() != null) {
			model.addAttribute("error", "Không thể xóa bài đăng đã sử dụng dịch vụ.");
			return "redirect:/job4u/employers"; // Hoặc trang thông báo lỗi
		}

		// Xóa bài đăng
//		danhSachViecLamDao.delete(jobListing);
		// Cập nhật trạng thái hoạt động thành false
	    jobListing.setActive(false); // Giả sử có thuộc tính active trong entity
	    danhSachViecLamDao.save(jobListing); // Lưu lại thay đổi trong cơ sở dữ liệu
		model.addAttribute("success", "Xóa bài đăng thành công.");
		return "redirect:/employers";
	}

	@GetMapping("/xemcv")
	public String xemCv(@RequestParam("jobId") Integer jobId, HttpSession session, Model model) {
		// In ra jobId để kiểm tra giá trị nhận được
		System.out.println("JobId: " + jobId);

		// Kiểm tra giá trị jobId
		if (jobId == null) {
			model.addAttribute("message", "ID công việc không hợp lệ.");
			return "xemcv"; // Trả về trang xem CV
		}

		// Lấy userId từ session
		Integer userId = (Integer) session.getAttribute("userid");
		System.out.println("UserId: " + userId);

		// Kiểm tra giá trị userId
		if (userId == null) {
			return "redirect:/employers"; // Nếu không có userId, điều hướng về trang employers
		}

		// Lấy danh sách các ứng tuyển dựa trên jobId
		List<ApplicationsEntity> jobApplicationsList = applicationsDao.findApplicationsByJoblistingId(jobId);

		// In ra số lượng ứng tuyển tìm thấy
		System.out.println("Số lượng CV được tìm thấy: " + jobApplicationsList.size());
		// Kiểm tra xem có ứng tuyển nào không
		if (!jobApplicationsList.isEmpty()) {
			List<JobSeekersEntity> jobSeekersList = new ArrayList<>();

			for (ApplicationsEntity application : jobApplicationsList) {
				JobSeekersEntity jobSeeker = application.getJobseeker();
				jobSeekersList.add(jobSeeker);
			}

			model.addAttribute("dsCV", jobSeekersList);
		}
		ss.setAttribute("jobid", jobId);
		// Chuyển đến trang xemcv.jsp để hiển thị danh sách CV
		return "xemcv";
	}

	@GetMapping("/jobseekerDetails/{jobseekerid}")
	public String viewJobseekerDetails(@PathVariable("jobseekerid") Integer jobseekerid, Model model) {
		String giaoDien = "cvnop";
		// Tìm thông tin của ứng viên theo jobseekerid
		ApplicationsEntity jobApplications = applicationsDao
				.find1ApplicationsByJoblistingId(Integer.parseInt(ss.getAttribute("jobid") + ""), jobseekerid);
		if (jobApplications.getFilename() != null) {
			giaoDien = "cvNopFile";
			String filename = jobApplications.getFilename();
			model.addAttribute("filename", filename);
		} else {
			JobSeekersEntity jobseeker = jobSeekersDao.findById(jobseekerid).orElse(null);
			model.addAttribute("jobSeeker", jobseeker);
		}
		// Đưa thông tin ứng viên vào model để truyền sang view

		// Điều hướng đến trang chi tiết ứng viên
		return giaoDien; // Trả về trang JSP
	}

	@PostMapping("/pay")
	public String initiatePayment(@RequestParam(value = "servicePrice", required = false) BigDecimal servicePrice,
			@RequestParam(value = "serviceId", required = false) String serviceId,
			@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "jobId", required = false) String jobId, HttpServletRequest request) {
		if (servicePrice == null || serviceId == null || userId == null || jobId == null) {
			System.out.println("Thiếu tham số bắt buộc: servicePrice, serviceId, userId hoặc jobId.");
			return "redirect:/employers?error=missingParameters";
		}

		int totalAmount = servicePrice.setScale(0, RoundingMode.HALF_UP).intValue();
		String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI(), "");

		String vnpayUrl = vnPayService.createOrder(totalAmount, "Thanh toán cho jobId: " + jobId, baseUrl);
		return "redirect:" + vnpayUrl;
	}

	@GetMapping("/vnpay-payment")
	public String vnpayPayment(HttpServletRequest request, RedirectAttributes redirectAttributes,
			@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "serviceId", required = false) String serviceId) {
		if (userId == null || serviceId == null) {
			redirectAttributes.addFlashAttribute("message", "Thiếu thông tin userId hoặc serviceId.");
			return "redirect:/employers?error=missingParameters";
		}

		int paymentStatus = vnPayService.orderReturn(request);

		if (paymentStatus == 1) {
			UsersEntity user = userRepository.findByUsername(userId);
			ServicesEntity service = servicesDao.findByServiceid(Integer.parseInt(serviceId));

			if (user != null && service != null) {
				PaymentsEntity payment = new PaymentsEntity();
				payment.setUser(user);
				payment.setService(service);
				payment.setAmount(new BigDecimal(request.getParameter("vnp_Amount")).divide(new BigDecimal(100)));
				payment.setPaymentdate(LocalDate.now());
				payment.setStatus("HOANTAT");
				payment.setPaymentmethod("VNPay");

				paymentDao.save(payment);
			} else {
				redirectAttributes.addFlashAttribute("message", "Người dùng hoặc dịch vụ không hợp lệ.");
				return "redirect:/employers?error=invalidData";
			}

			redirectAttributes.addFlashAttribute("message", "Thanh toán thành công!");
		} else {
			redirectAttributes.addFlashAttribute("message", "Thanh toán thất bại!");
		}

		return "redirect:/employers";
	}

}
