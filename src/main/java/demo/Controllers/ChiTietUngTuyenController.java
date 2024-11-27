package demo.Controllers;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.services.JoblistingsService;
import demo.services.SessionService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import demo.dao.ApplicationsDao;
import demo.dao.EmployersDao;
import demo.dao.JobSeekersDao;
import demo.dao.JoblistingsDao;
import demo.dao.ReportDao;
import demo.dao.UsersDao;
import demo.entity.ApplicationsEntity;
import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;
import demo.entity.ReportEntity;
import demo.entity.UsersEntity;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/chiTiet")
public class ChiTietUngTuyenController {

	@Autowired
	private JoblistingsService joblistingsService;

	@Autowired
	JobSeekersDao dao;

	@Autowired
	UsersDao userDao;

	@Autowired
	SessionService sessionService;

	@Autowired
	JoblistingsDao joblistingsDao;

	@Autowired
	EmployersDao employersDao;

	@Autowired
	HttpSession ss;

	@Autowired
	ReportDao reportdao;

	@Autowired
	ApplicationsDao appDao;

	@Autowired
	ServletContext sc;

	@RequestMapping("/{jobid}")
	public String chiTietUngTuyen(@PathVariable("jobid") Integer jobid, Model model) {
		// Lấy thông tin chi tiết công việc
		JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);

		// Lấy ID người dùng đã đăng nhập
		Integer userId = (Integer) ss.getAttribute("userid");

		// Lấy vai trò (role) người dùng từ session (giả sử role là Integer)
		Integer userRole = (Integer) ss.getAttribute("role"); // Đổi kiểu thành Integer

		// Lấy danh sách CV của người dùng
		List<JobSeekersEntity> listCV = dao.findByUsername(userId);

		// Lấy danh sách các công việc mà người dùng đã ứng tuyển
		List<JoblistingsEntity> appliedJobs = appDao.findJobsAppliedByUserId(userId);
		boolean hasApplied = appliedJobs.stream().anyMatch(job -> job.getJobid().equals(jobid));

		// Thêm các thuộc tính vào model để truyền sang view
		model.addAttribute("job", chiTietUngTuyen);
		model.addAttribute("listCV", listCV);
		model.addAttribute("hasApplied", hasApplied); // Thêm thuộc tính kiểm tra vào model
		model.addAttribute("userRole", userRole); // Truyền userRole vào model

		return "chiTietUngTuyen";
	}

	@PostMapping("/{jobid}")
	public String postSubmitCV(@PathVariable("jobid") Integer jobid, Model model,
			@RequestParam("cvFile") MultipartFile cvFile, @RequestParam("cvOptions") String cvOption,
			@RequestParam("id") Optional<Integer> jSKID, RedirectAttributes redirectAttributes) {
		Integer userId = (Integer) ss.getAttribute("userid");

		JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);

		ApplicationsEntity app = new ApplicationsEntity();
		try {
			List<JobSeekersEntity> listCV = dao.findByUsername(userId);
			JobSeekersEntity jSK = null;

			if (!listCV.isEmpty()) {
				jSK = listCV.get(0); // Hoặc thêm logic để chọn CV cụ thể
			}

			if (jSK == null) {
				redirectAttributes.addFlashAttribute("message",
						"Ứng tuyển thất bại: Không tìm thấy thông tin người tìm việc.");
				return "redirect:/chiTiet/" + jobid;
			}

			if ("upload".equals(cvOption)) {
				// Xử lý upload CV
				// Xử lý upload CV
				String originalFilename = cvFile.getOriginalFilename();
				String fileExtension = originalFilename.substring(originalFilename.lastIndexOf(".")); // Lấy đuôi tệp

				// Tạo tên tệp mới duy nhất với UUID
				String newFilename = UUID.randomUUID().toString() + fileExtension;

				// Đảm bảo thư mục uploads tồn tại
				File uploadDir = new File(sc.getRealPath("/uploads/"));
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				// Lưu tệp với tên mới trong thư mục uploads
				File file = new File(uploadDir, newFilename);
				cvFile.transferTo(file);

				// Lưu thông tin vào database
				app.setJob(chiTietUngTuyen);
				app.setJobseeker(jSK);
				app.setApplicationdate(LocalDateTime.now());
				app.setStatus(0);
				app.setCreatedat(LocalDateTime.now());
				app.setFilename(newFilename); // Lưu tên mới vào database
				appDao.save(app);

				redirectAttributes.addFlashAttribute("message", "Upload CV ứng tuyển thành công");

				redirectAttributes.addFlashAttribute("message", "Upload CV ứng tuyển thành công");
			} else if ("choose".equals(cvOption)) {
				JobSeekersEntity existingCV = dao.findByJobseekerid(jSKID);
				if (existingCV != null) {
					app.setJob(chiTietUngTuyen);
					app.setJobseeker(existingCV);
					app.setApplicationdate(LocalDateTime.now());
					app.setStatus(0);
					app.setResume(existingCV.getResume());
					app.setCreatedat(LocalDateTime.now());
					appDao.save(app);
					redirectAttributes.addFlashAttribute("message", "Ứng tuyển thành công");
				} else {
					redirectAttributes.addFlashAttribute("message", "Không tìm thấy CV đã chọn");
				}
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "Ứng tuyển thất bại");
		}
		return "redirect:/chiTiet/" + jobid; // Chuyển hướng đến trang chi tiết
	}

	@PostMapping("/{jobid}/report")
	public String reportPost(@PathVariable(value = "jobid", required = false) Integer jobid, 
	                         Model model,
	                         @RequestParam("reason") String reason, // Lý do báo cáo
	                         HttpSession session, 
	                         RedirectAttributes redirectAttributes // Để thêm thông báo
	) {
	    // Tìm kiếm đối tượng JoblistingsEntity từ cơ sở dữ liệu
	    JoblistingsEntity job = joblistingsDao.findById(jobid).orElse(null);

	    // Kiểm tra nếu job là null
	    if (job == null) {
	        redirectAttributes.addFlashAttribute("error", "Bài viết không tồn tại.");
	        return "redirect:/chiTiet/" + jobid; // Chuyển hướng về trang chi tiết bài viết
	    }

	    // Lấy employer từ đối tượng job và employerid
	    EmployersEntity employer = job.getEmployer();
	    Integer employerid = employer != null ? employer.getEmployerid() : null;

	    System.out.println("jobid: " + jobid);
	    System.out.println("Employerid: " + employerid);
	    System.out.println("Reason: " + reason);

	    // Kiểm tra các tham số không được null
	    if (reason == null || reason.trim().isEmpty()) {
	        redirectAttributes.addFlashAttribute("error", "Lý do báo cáo không hợp lệ.");
	        return "redirect:/chiTiet/" + jobid; // Chuyển hướng về trang chi tiết bài viết
	    }

	    // Lấy userId từ session
	    Integer userId = sessionService.getCurrentUser();
	    System.out.println("userId: " + userId);
	    if (userId == null) {
	        redirectAttributes.addFlashAttribute("error", "Người dùng chưa đăng nhập.");
	        return "redirect:/Login"; // Nếu chưa đăng nhập, chuyển hướng đến trang login
	    }

	    try {
	        // Tìm kiếm các đối tượng liên quan từ cơ sở dữ liệu
	        UsersEntity user = userDao.findById(userId).orElse(null);

	        // Kiểm tra nếu các đối tượng tìm được là null
	        if (user == null || employer == null) {
	            redirectAttributes.addFlashAttribute("error", "Báo cáo thất bại, không tìm thấy dữ liệu.");
	            return "redirect:/chiTiet/" + jobid; // Chuyển hướng về trang chi tiết bài viết
	        }

	        // Tạo đối tượng ReportEntity
	        ReportEntity report = new ReportEntity();
	        report.setUser(user);
	        report.setJob(job);
	        report.setEmployers(employer); // Sử dụng employer từ job
	        report.setReason(reason);
	        report.setReportedat(LocalDate.now());

	        // Lưu vào cơ sở dữ liệu
	        reportdao.save(report);

	        // Thêm thông báo thành công
	        redirectAttributes.addFlashAttribute("message", "Đã báo cáo bài viết thành công!");
	    } catch (Exception e) {
	        // Thêm thông báo lỗi nếu xảy ra ngoại lệ
	        redirectAttributes.addFlashAttribute("error", "Báo cáo thất bại, vui lòng thử lại.");
	    }

	    // Chuyển hướng về trang chi tiết bài viết
	    return "redirect:/chiTiet/" + jobid;
	}

}