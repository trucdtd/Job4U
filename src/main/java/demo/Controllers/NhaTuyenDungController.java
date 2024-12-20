package demo.Controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
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
import demo.services.ApplicationService;
import demo.services.EmailService;
import demo.services.JoblistingsService;
import demo.services.SessionService;
import demo.services.UserRepository;
import demo.services.VNPayService;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import demo.dao.ApplicationsDao;
import demo.dao.EmployersDao;
import demo.dao.JobCategoriesDao;
import demo.dao.JobSeekersDao;
import demo.dao.JoblistingsDao;
import demo.dao.PaymentsDao;
import demo.entity.ApplicationsEntity;
import demo.dao.ServicesDao;
import demo.dao.UserServicesDao;
import demo.entity.EmployersEntity;
import demo.entity.JobCategoriesEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;
import demo.entity.PaymentsEntity;
import demo.entity.ServicesEntity;
import demo.entity.UserServicesEntity;
import demo.entity.UsersEntity;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.net.URLEncoder;

import java.util.stream.Collectors;

@Controller
@RequestMapping("/employers")
public class NhaTuyenDungController {

	private static final Logger logger = LoggerFactory.getLogger(XemCvUngVienController.class);

	@Autowired
	private EmailService emailService;

	@Autowired
	private SessionService sessionService;

	@Autowired
	private JoblistingsService joblistingsService;

	@Autowired
	private VNPayService vnPayService;

	@Autowired
	private PaymentsDao paymentDao;

	@Autowired
	private JoblistingsDao joblistingsDao;

	@Autowired
	private EmployersDao nhaTuyenDungDao;

	@Autowired
	private ServicesDao servicesDao;

	@Autowired
	private UserServicesDao userServiceDao;

	@Autowired
	private JobSeekersDao jobSeekersDao;

	@Autowired
	private JoblistingsDao danhSachViecLamDao;

	@Autowired
	private ApplicationsDao applicationsDao;

	@Autowired
	private ApplicationService applicationService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserServicesDao userservicesDao;

	@Autowired
	HttpServletRequest req;

	@Autowired
	HttpServletResponse resp;

	@Autowired
	HttpSession ss;

	@Autowired
	JobCategoriesDao jobCareDao;

	@RequestMapping("")
	public String nhaTuyenDung(Model model) {
		Integer userId = sessionService.getCurrentUserId();

		List<ServicesEntity> service = servicesDao.findAll();
		model.addAttribute("service", service);
		// Lấy danh sách nghề nghiệp từ cơ sở dữ liệu
		List<JobCategoriesEntity> dsnghe = jobCareDao.findAll();
		model.addAttribute("dsnghe", dsnghe);
		if (userId != null) {
			EmployersEntity employer = nhaTuyenDungDao.findByUserId(userId).orElse(null);

			if (employer != null) {
				// Chỉ lấy những bài đăng có active = true
				List<JoblistingsEntity> jobPostings = danhSachViecLamDao.findByEmployerAndActive(employer, true);
				model.addAttribute("jobPostings", jobPostings);

				for (JoblistingsEntity jobPosting : jobPostings) {
					// Lấy danh sách ứng tuyển cho bài đăng này
					List<ApplicationsEntity> jobApplicationsList = applicationsDao
							.findApplicationsByJoblistingId(jobPosting.getJobid());

					// Thêm danh sách ứng tuyển vào model để sử dụng trong JSP
					model.addAttribute("applications" + jobPosting.getJobid(), jobApplicationsList);
				}

				// Lấy danh sách CV ứng tuyển
				List<ApplicationsEntity> cv = applicationsDao.findByJob_Employer(employer);
				model.addAttribute("dsCV", cv);

				// Lấy danh sách dịch vụ đã mua của nhà tuyển dụng
				List<UserServicesEntity> dv = userservicesDao.findByUser(employer.getUser());
				model.addAttribute("dsDV", dv);

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
	public String themTuyenDung(@RequestParam("companyname") String companyname,
			@RequestParam("companywebsite") String companywebsite, @RequestParam("address") String address,
			@RequestParam("industry") String industry, @RequestParam("contactperson") String contactperson,
			@RequestParam(value = "logo", required = false) MultipartFile logo,
			@RequestParam("jobtitle") String jobtitle, @RequestParam("joblocation") String joblocation,
			@RequestParam("jobtype") String jobtype, @RequestParam(value = "salary", required = false) String salary,
			@RequestParam("companydescription") String companydescription,
			@RequestParam("jobrequirements") String jobrequirements,
			@RequestParam("jobdescription") String jobdescription, @RequestParam("posteddate") String posteddate,
			@RequestParam("applicationdeadline") String applicationdeadline,
			@RequestParam("jobcategories") Integer jobcategoryid, RedirectAttributes redirectAttributes) {

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
		List<JoblistingsEntity> postsThisMonth = danhSachViecLamDao
				.findJobsByEmployerIdAndMonthStart(employer.getEmployerid(), startOfMonth);

		System.out.println("Ngày hiện tại: " + now);
		System.out.println("Ngày bắt đầu tháng: " + startOfMonth);
		System.out.println("Số bài đăng trong tháng: " + postsThisMonth.size());

		// Số bài đăng miễn phí cho phép mỗi tháng
		int freePostsThisMonth = 3;

		// Thiết lập tổng số bài đăng cho phép ban đầu là 3 (3 bài miễn phí)
		int totalAllowedPosts = freePostsThisMonth;

		// Lấy thông tin dịch vụ của nhà tuyển dụng
		List<UserServicesEntity> userServices = userServiceDao.findByUser(employer.getUser());
		boolean hasValidSupplementalService = false; // Biến kiểm tra nếu có gói dịch vụ bổ sung hợp lệ

		if (userServices != null && !userServices.isEmpty()) {
			for (UserServicesEntity userService : userServices) {
				LocalDateTime serviceStartDate = userService.getPurchasedate();
				LocalDateTime serviceEndDate = userService.getExpirydate();
				int jobsAllowed = userService.getNumberofjobsallowed();

				System.out.println("Dịch vụ: " + userService.getService().getServicename());
				System.out.println("Ngày bắt đầu dịch vụ: " + serviceStartDate);
				System.out.println("Ngày kết thúc dịch vụ: " + serviceEndDate);
				System.out.println("Số bài đăng cho phép từ gói dịch vụ: " + jobsAllowed);

				// Kiểm tra xem gói dịch vụ còn hiệu lực không
				if (now.isBefore(serviceStartDate.toLocalDate()) || now.isAfter(serviceEndDate.toLocalDate())) {
					System.out.println("Gói dịch vụ không còn hiệu lực.");
					continue;
				}

				// Bỏ qua gói dịch vụ có serviceid là 4 (lên Top) khi tính số lượng bài đăng
				if (userService.getService().getServiceid() == 4) {
					System.out.println("Bỏ qua gói dịch vụ 'lên Top'.");
					continue;
				}

				// Cộng dồn số bài đăng từ gói bổ sung nếu nhà tuyển dụng đã đăng hết 3 bài miễn
				// phí
				totalAllowedPosts += jobsAllowed;
				hasValidSupplementalService = true;
			}
		}

		// Nếu nhà tuyển dụng chưa mua gói nào và đã đạt giới hạn 3 bài miễn phí, yêu
		// cầu mua gói bổ sung
		if (postsThisMonth.size() >= freePostsThisMonth && !hasValidSupplementalService) {
			redirectAttributes.addFlashAttribute("message",
					"Bạn đã vượt quá giới hạn bài đăng miễn phí. Vui lòng mua gói dịch vụ để tiếp tục đăng.");
			System.out.println("Nhà tuyển dụng đã đạt giới hạn bài đăng miễn phí và chưa có gói bổ sung.");
			return "redirect:/employers";
		}

		// Kiểm tra xem số lượng bài đăng hiện tại có vượt tổng số bài cho phép hay
		// không
		if (postsThisMonth.size() >= totalAllowedPosts) {
			redirectAttributes.addFlashAttribute("message", "Bạn đã vượt quá số lượng bài viết trong tháng.");
			System.out.println("Nhà tuyển dụng đã vượt quá số lượng bài viết cho phép trong tháng.");
			return "redirect:/employers";
		}

		// Nếu chưa vượt quá số bài đăng, tiếp tục xử lý đăng bài
		System.out.println("Nhà tuyển dụng có thể đăng thêm bài.");

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
		// Tìm và gán JobCategoriesEntity vào JobListing
		JobCategoriesEntity jobCategory = jobCareDao.findById(jobcategoryid).orElse(null);
		if (jobCategory == null) {
			return "error"; // Nếu không tìm thấy nghề nghiệp, trả về lỗi
		}
		jobListing.setJobcategories(jobCategory);

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
	public String deleteJob(@RequestParam("jobId") Integer jobId, RedirectAttributes redirectAttributes) {
		JoblistingsEntity jobListing = danhSachViecLamDao.findById(jobId).orElse(null);

		if (jobListing == null) {
			redirectAttributes.addFlashAttribute("message", "Bài đăng không tồn tại.");
			return "redirect:/employers";
		}

		if (jobListing.getUserservice() != null) {
			redirectAttributes.addFlashAttribute("message", "Không thể xóa bài đăng đã sử dụng dịch vụ.");
			return "redirect:/employers";
		}

		jobListing.setActive(false);
		danhSachViecLamDao.save(jobListing);
		redirectAttributes.addFlashAttribute("message", "Xóa bài đăng thành công.");
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

		// Truyền danh sách CV và số lượng CV vào model để sử dụng trong JSP
		model.addAttribute("dsCV", jobApplicationsList);

		// Kiểm tra xem có ứng tuyển nào không
		if (!jobApplicationsList.isEmpty()) {
			List<JobSeekersEntity> jobSeekersList = new ArrayList<>();

			for (ApplicationsEntity application : jobApplicationsList) {
				JobSeekersEntity jobSeeker = application.getJobseeker();
				jobSeekersList.add(jobSeeker);
			}
//			model.addAttribute("dsCV", jobSeekersList);

		}
		ss.setAttribute("jobid", jobId);
		// Chuyển đến trang xemcv.jsp để hiển thị danh sách CV
		return "xemcv";
	}

	@PostMapping("/pay")
	public String initiatePayment(@RequestParam(value = "servicePrice", required = false) BigDecimal servicePrice,
			@RequestParam(value = "serviceId", required = false) Integer serviceId,
			@RequestParam(value = "userId", required = false) Integer userId,
			@RequestParam(value = "jobId", required = false) Integer jobId, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		System.out.println("userId: " + userId);
		System.out.println("serviceId: " + serviceId);
		System.out.println("jobId: " + jobId);

		// Kiểm tra các tham số cần thiết
		if (servicePrice == null || serviceId == null || userId == null || (serviceId == 4 && jobId == null)) {
			return "redirect:/employers";
		}

		LocalDate applicationDeadline = null;
		if (serviceId != null && serviceId == 4) {
			applicationDeadline = joblistingsDao.findApplicationdeadlineByJobid(jobId);
			if (applicationDeadline == null) {
				return "redirect:/employers"; // Nếu không tìm thấy công việc
			}
		}

		if (applicationDeadline != null) {
			if (applicationDeadline.isBefore(LocalDate.now())) {
				redirectAttributes.addAttribute("errorModal", "Hạn nộp hồ sơ đã qua, không thể mua dịch vụ.");
				return "redirect:/employers";
			}

			if (applicationDeadline.isBefore(LocalDate.now().plusDays(3))) {
				redirectAttributes.addAttribute("errorModal", "Hạn nộp hồ sơ còn dưới 3 ngày, không thể mua dịch vụ.");
				return "redirect:/employers";
			}
		}
		// Nếu không có lỗi, thực hiện thanh toán
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		session.setAttribute("serviceId", serviceId);
		session.setAttribute("jobId", jobId);

		int totalAmount = servicePrice.setScale(0, RoundingMode.HALF_UP).intValue();
		String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI(), "") + "/vnpay-payment";
		String vnpayUrl = vnPayService.createOrder(totalAmount, "Thanh toán cho dịch vụ: " + serviceId, baseUrl);

		return "redirect:" + vnpayUrl;
	}

	@GetMapping("/vnpay-payment")
	public String vnpayPayment(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		Integer serviceId = (Integer) session.getAttribute("serviceId");
		Integer jobId = (Integer) session.getAttribute("jobId");

		// Kiểm tra các tham số cần thiết
		if (userId == null || serviceId == null || (serviceId == 4 && jobId == null)) {
			redirectAttributes.addFlashAttribute("message", "Thiếu thông tin userId, serviceId hoặc jobId.");
			return "redirect:/employers";
		}
		// Gọi JoblistingsService để kiểm tra dịch vụ "Lên Top"
		if (!joblistingsService.canPurchaseTopService(serviceId, jobId)) {
			redirectAttributes.addFlashAttribute("message",
					"Bài viết này đã sử dụng dịch vụ 'Lên Top'. Vui lòng đợi đến khi hết hạn.");
			return "redirect:/employers";
		}

		int paymentStatus = vnPayService.orderReturn(request);

		if (paymentStatus == 1) {
			UsersEntity user = userRepository.findById(userId).orElse(null);
			ServicesEntity service = servicesDao.findById(serviceId).orElse(null);
			JoblistingsEntity job = (serviceId == 4 && jobId != null) ? joblistingsDao.findById(jobId).orElse(null)
					: null;
			System.out.println("lỗi ở đây 4");
			if (user != null && service != null) {
				// Lưu thông tin thanh toán
				PaymentsEntity payment = new PaymentsEntity();
				payment.setUser(user);
				payment.setService(service);
				payment.setAmount(new BigDecimal(request.getParameter("vnp_Amount")).divide(new BigDecimal(100)));
				payment.setPaymentdate(LocalDate.now());
				payment.setStatus("Thanh toán thành công");
				payment.setPaymentmethod("VNPay");
				paymentDao.save(payment);

				// Tạo hoặc cập nhật UserServicesEntity
				UserServicesEntity userService = new UserServicesEntity();
				userService.setUser(user);
				userService.setService(service);
				userService.setPurchasedate(LocalDateTime.now());

				// Thiết lập ngày hết hạn và số bài đăng
				LocalDateTime expiryDate = LocalDateTime.now().plusDays(service.getDurationindays());
				userService.setExpirydate(expiryDate);
				userService.setNumberofjobsallowed(service.getNumberofjobsallowed());

				// Lưu vào bảng UserServices
				userServiceDao.save(userService);

				// Cập nhật bài đăng nếu cần thiết (chỉ cho gói "Lên Top")
				if (serviceId == 4 && job != null) {
					job.setUserservice(userService);
					job.setIsTop(true);
					joblistingsDao.save(job);
				}

				// Gửi email hóa đơn
				emailService.sendEmail(user, service, payment);

				redirectAttributes.addFlashAttribute("message", "Thanh toán thành công!");
			} else {
				redirectAttributes.addFlashAttribute("message", "Người dùng hoặc dịch vụ không hợp lệ.");
				return "redirect:/employers";
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "Thanh toán thất bại!");
		}

		return "redirect:/employers";
	}

	// từ chối và chấp nhận cv
	@PostMapping("/{jobseekerid}/accept")
	@ResponseBody
	public String acceptApplication(@PathVariable("jobseekerid") Integer jobseekerid,
			@PathVariable Integer applicationId) {
		try {
			applicationService.updateApplicationStatus(applicationId, 1);
			return "success";
		} catch (Exception e) {
			logger.error("Error updating application status: ", e);

			return "error";
		}
	}

	@PostMapping("/{jobseekerid}/reject")
	@ResponseBody
	public String rejectApplication(@PathVariable("jobseekerid") Integer jobseekerid,
			@PathVariable Integer applicationId) {
		try {
			applicationService.updateApplicationStatus(applicationId, 2); // Cập nhật status = 2
			return "success";
		} catch (Exception e) {
			logger.error("Error updating application status to rejected: ", e);
			return "error";
		}
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

	@RequestMapping("/thongKeTatCa")
	public String chiTietThongKe(@RequestParam Integer employerid, Model model) {

		Integer userId = sessionService.getCurrentUserId();

		if (userId != null) {
			EmployersEntity employer = nhaTuyenDungDao.findByUserId(userId).orElse(null);

			if (employer != null) {
				// Chỉ lấy những bài đăng có active = true
				List<JoblistingsEntity> jobPostings = danhSachViecLamDao.findByEmployerAndActive(employer, true);
				model.addAttribute("jobPostings", jobPostings);

				// Khởi tạo một Map để lưu trữ số lượng ứng tuyển cho từng job
				Map<Integer, Integer> totalApplicationsMap = new HashMap<>();
				Map<Integer, Integer> acceptedApplicationsMap = new HashMap<>();
				Map<Integer, Integer> rejectedApplicationsMap = new HashMap<>();
				Map<Integer, Integer> pendingApplicationsMap = new HashMap<>();

				for (JoblistingsEntity jobPosting : jobPostings) {
					// Lấy danh sách ứng tuyển cho bài đăng này
					List<ApplicationsEntity> jobApplicationsList = applicationsDao
							.findApplicationsByJoblistingId(jobPosting.getJobid());
					// Lưu số lượng ứng tuyển vào Map với key là jobPosting.jobid
					totalApplicationsMap.put(jobPosting.getJobid(), jobApplicationsList.size());

					// Lọc ứng tuyển đã chấp nhận (status == 1) và từ chối (status == 2)
					long acceptedCount = jobApplicationsList.stream()
							.filter(application -> application.getStatus() == 1).count();
					long rejectedCount = jobApplicationsList.stream()
							.filter(application -> application.getStatus() == 2).count();
					long pendingCount = jobApplicationsList.stream().filter(application -> application.getStatus() == 0)
							.count();

					// Lưu số lượng đã chấp nhận và đã từ chối vào Map
					acceptedApplicationsMap.put(jobPosting.getJobid(), (int) acceptedCount);
					rejectedApplicationsMap.put(jobPosting.getJobid(), (int) rejectedCount);
					pendingApplicationsMap.put(jobPosting.getJobid(), (int) pendingCount);

					// Thêm danh sách ứng tuyển vào model để sử dụng trong JSP
					model.addAttribute("applications" + jobPosting.getJobid(), jobApplicationsList);
				}

				// Truyền Map vào model
				model.addAttribute("totalApplicationsMap", totalApplicationsMap);
				model.addAttribute("acceptedApplicationsMap", acceptedApplicationsMap);
				model.addAttribute("rejectedApplicationsMap", rejectedApplicationsMap);
				model.addAttribute("pendingApplicationsMap", pendingApplicationsMap);

				// Lấy danh sách CV ứng tuyển
				List<ApplicationsEntity> applicationsMap = applicationsDao.findByJob_Employer(employer);
				// Thêm các ứng tuyển vào model
				model.addAttribute("applicationsMap", applicationsMap);

				// Lấy danh sách dịch vụ đã mua của nhà tuyển dụng
				List<UserServicesEntity> userServices = userservicesDao.findByUser(employer.getUser());
				model.addAttribute("userServices", userServices);

				model.addAttribute("employer", employer);
			} else {
				model.addAttribute("error", "Không tìm thấy nhà tuyển dụng.");
			}
		} else {
			model.addAttribute("error", "Vui lòng đăng nhập để tiếp tục.");
		}

		return "thongKeNhaTuyenDung";
	}

	@RequestMapping("/thongKeTheoNgay")
	public String thongKeTheoNgay(Model model) {
	    Integer userId = sessionService.getCurrentUserId();

	    if (userId != null) {
	        EmployersEntity employer = nhaTuyenDungDao.findByUserId(userId).orElse(null);

	        if (employer != null) {
	            // Lấy ngày hiện tại
	            LocalDate currentDate = LocalDate.now();
	            // Lấy thời gian hiện tại dưới dạng LocalDate (chỉ ngày, không có giờ)
	            LocalDate now = LocalDate.now(); // Lấy ngày hiện tại

	            System.out.println("Current date: " + currentDate); // In ra ngày hiện tại
	            
	         // Lọc bài đăng theo ngày hiện tại (Dùng LocalDate để so sánh)
	            List<JoblistingsEntity> jobPostings = danhSachViecLamDao.findByEmployerAndActive(employer, true);
	            jobPostings = jobPostings.stream()
	                    .filter(job -> job.getPosteddate().isEqual(now)) // So sánh ngày đăng với ngày hiện tại
	                    .collect(Collectors.toList());

	            // Lọc ứng tuyển trong ngày hiện tại (So sánh phần ngày của LocalDateTime)
	            Map<Integer, List<ApplicationsEntity>> applicationsMap = new HashMap<>();
	            Map<Integer, Integer> acceptedApplicationsMap = new HashMap<>();
	            Map<Integer, Integer> rejectedApplicationsMap = new HashMap<>();
	            Map<Integer, Integer> pendingApplicationsMap = new HashMap<>();
	            Map<Integer, Integer> totalApplicationsMap = new HashMap<>();

	            for (JoblistingsEntity jobPosting : jobPostings) {
	            	List<ApplicationsEntity> jobApplicationsList = applicationsDao
	            		    .findApplicationsByJoblistingId(jobPosting.getJobid()).stream()
	            		    .filter(application -> application.getApplicationdate() != null && 
	            		            application.getApplicationdate().toLocalDate().isEqual(currentDate)) // So sánh phần ngày
	            		    .collect(Collectors.toList());
	            	
	                // Lưu ứng tuyển vào Map
	                applicationsMap.put(jobPosting.getJobid(), jobApplicationsList);

	                // Tính số lượng ứng tuyển theo trạng thái
	                long acceptedCount = jobApplicationsList.stream().filter(application -> application.getStatus() == 1).count();
	                long rejectedCount = jobApplicationsList.stream().filter(application -> application.getStatus() == 2).count();
	                long pendingCount = jobApplicationsList.stream().filter(application -> application.getStatus() == 0).count();
	                long totalCount = jobApplicationsList.size();

	                // Lưu số lượng vào các Map
	                acceptedApplicationsMap.put(jobPosting.getJobid(), (int) acceptedCount);
	                rejectedApplicationsMap.put(jobPosting.getJobid(), (int) rejectedCount);
	                pendingApplicationsMap.put(jobPosting.getJobid(), (int) pendingCount);
	                totalApplicationsMap.put(jobPosting.getJobid(), (int) totalCount);
	            }

	            // Thêm các thông tin vào model để hiển thị
	            model.addAttribute("applicationsMap", applicationsMap);
	            model.addAttribute("acceptedApplicationsMap", acceptedApplicationsMap);
	            model.addAttribute("rejectedApplicationsMap", rejectedApplicationsMap);
	            model.addAttribute("pendingApplicationsMap", pendingApplicationsMap);
	            model.addAttribute("totalApplicationsMap", totalApplicationsMap);

	            System.out.println("Total applications for today: " + totalApplicationsMap.size());
	           
	            // Lọc dịch vụ đã mua trong ngày hiện tại
	            List<UserServicesEntity> userServices = userservicesDao.findByUser(employer.getUser()).stream()
	                    .filter(serviceEntity -> serviceEntity.getPurchasedate().toLocalDate().isEqual(currentDate)) // So sánh phần ngày
	                    .collect(Collectors.toList());

	            model.addAttribute("userServices", userServices);

	            // Sắp xếp các bài đăng công việc theo ngày đăng
	            jobPostings.sort(Comparator.comparing(JoblistingsEntity::getPosteddate).reversed());

	            // Thêm các bài đăng công việc vào model
	            model.addAttribute("jobPostings", jobPostings);
	            model.addAttribute("employer", employer);

	        } else {
	            model.addAttribute("error", "Không tìm thấy nhà tuyển dụng.");
	        }
	    } else {
	        model.addAttribute("error", "Vui lòng đăng nhập để tiếp tục.");
	    }

	    return "thongKeNhaTuyenDung";
	}


	
	@RequestMapping("/thongKeTheoKhoangThoiGian")
	public String thongKeTheoKhoangThoiGian(@RequestParam(required = false) String startdate,
	                                         @RequestParam(required = false) String enddate,
	                                         Model model) {
	    Integer userId = sessionService.getCurrentUserId();

	    if (userId != null) {
	        EmployersEntity employer = nhaTuyenDungDao.findByUserId(userId).orElse(null);

	        if (employer != null) {
	            // Kiểm tra nếu startdate và enddate không null và hợp lệ
	            LocalDate start = startdate != null ? LocalDate.parse(startdate) : null;
	            LocalDate end = enddate != null ? LocalDate.parse(enddate) : null;

	            // Chuyển startdate và enddate thành LocalDateTime nếu cần
	            LocalDateTime startDateTime = (start != null) ? start.atStartOfDay() : null;
	            LocalDateTime endDateTime = (end != null) ? end.atTime(23, 59, 59, 999999999) : null;

	            // Lọc bài đăng công việc theo ngày đăng
	            List<JoblistingsEntity> jobPostings = danhSachViecLamDao.findByEmployerAndActive(employer, true);
	            jobPostings = jobPostings.stream()
	                    .filter(job -> {
	                        boolean isWithinDateRange = true;
	                        if (start != null) {
	                            isWithinDateRange &= !job.getPosteddate().atStartOfDay().isBefore(startDateTime);
	                        }
	                        if (end != null) {
	                            isWithinDateRange &= !job.getPosteddate().atStartOfDay().isAfter(endDateTime);
	                        }
	                        return isWithinDateRange;
	                    })
	                    .collect(Collectors.toList());

	            // Lọc ứng tuyển trong khoảng thời gian từ startdate đến enddate
	            Map<Integer, List<ApplicationsEntity>> applicationsMap = new HashMap<>();
	            Map<Integer, Integer> acceptedApplicationsMap = new HashMap<>();
	            Map<Integer, Integer> rejectedApplicationsMap = new HashMap<>();
	            Map<Integer, Integer> pendingApplicationsMap = new HashMap<>();
	            Map<Integer, Integer> submittedApplicationsMap = new HashMap<>(); // Đã nộp
	            Map<Integer, Integer> totalApplicationsMap = new HashMap<>(); // Tổng số ứng tuyển

	            for (JoblistingsEntity jobPosting : jobPostings) {
	                List<ApplicationsEntity> jobApplicationsList = applicationsDao
	                        .findApplicationsByJoblistingId(jobPosting.getJobid()).stream()
	                        .filter(application -> {
	                            boolean isWithinDateRange = true;
	                            if (startDateTime != null) {
	                                isWithinDateRange &= !application.getApplicationdate().isBefore(startDateTime);
	                            }
	                            if (endDateTime != null) {
	                                isWithinDateRange &= !application.getApplicationdate().isAfter(endDateTime);
	                            }
	                            return isWithinDateRange;
	                        })
	                        .collect(Collectors.toList());

	                // Lưu các ứng tuyển vào Map
	                applicationsMap.put(jobPosting.getJobid(), jobApplicationsList);

	                // Lọc theo trạng thái
	                long acceptedCount = jobApplicationsList.stream()
	                        .filter(application -> application.getStatus() == 1).count();
	                long rejectedCount = jobApplicationsList.stream()
	                        .filter(application -> application.getStatus() == 2).count();
	                long pendingCount = jobApplicationsList.stream().filter(application -> application.getStatus() == 0)
	                        .count();
	                long submittedCount = jobApplicationsList.stream()
	                        .filter(application -> application.getStatus() != 0).count();  // Đã nộp

	                // Lưu số lượng vào Map
	                acceptedApplicationsMap.put(jobPosting.getJobid(), (int) acceptedCount);
	                rejectedApplicationsMap.put(jobPosting.getJobid(), (int) rejectedCount);
	                pendingApplicationsMap.put(jobPosting.getJobid(), (int) pendingCount);
	                submittedApplicationsMap.put(jobPosting.getJobid(), (int) submittedCount);  // Đã nộp

	                // Tổng số ứng tuyển
	                int totalCount = jobApplicationsList.size();
	                totalApplicationsMap.put(jobPosting.getJobid(), totalCount);
	            }

	            // Thêm các thông tin vào model
	            model.addAttribute("applicationsMap", applicationsMap);
	            model.addAttribute("acceptedApplicationsMap", acceptedApplicationsMap);
	            model.addAttribute("rejectedApplicationsMap", rejectedApplicationsMap);
	            model.addAttribute("pendingApplicationsMap", pendingApplicationsMap);
	            model.addAttribute("submittedApplicationsMap", submittedApplicationsMap);  // Đã nộp
	            model.addAttribute("totalApplicationsMap", totalApplicationsMap);  // Tổng số ứng tuyển

	            // Lọc dịch vụ đã mua trong khoảng thời gian từ startdate đến enddate
	            List<UserServicesEntity> userServices = userservicesDao.findByUser(employer.getUser()).stream()
	                    .filter(serviceEntity -> {
	                        boolean isWithinDateRange = true;
	                        if (startDateTime != null) {
	                            isWithinDateRange &= !serviceEntity.getPurchasedate().isBefore(startDateTime);
	                        }
	                        if (endDateTime != null) {
	                            isWithinDateRange &= !serviceEntity.getPurchasedate().isAfter(endDateTime);
	                        }
	                        return isWithinDateRange;
	                    })
	                    .collect(Collectors.toList());

	            model.addAttribute("userServices", userServices);

	            // Sắp xếp các bài đăng công việc theo ngày đăng
	            jobPostings.sort(Comparator.comparing(JoblistingsEntity::getPosteddate).reversed());

	            // Thêm các bài đăng công việc vào model
	            model.addAttribute("jobPostings", jobPostings);
	            model.addAttribute("employer", employer);
	        } else {
	            model.addAttribute("error", "Không tìm thấy nhà tuyển dụng.");
	        }
	    } else {
	        model.addAttribute("error", "Vui lòng đăng nhập để tiếp tục.");
	    }

	    return "thongKeNhaTuyenDung";
	}

}
