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
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import demo.dao.ApplicationsDao;
import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;
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
	HttpSession ss;

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

		// Lấy danh sách CV của người dùng
		List<JobSeekersEntity> listCV = dao.findByUsername(userId);

		// Lấy danh sách các công việc mà người dùng đã ứng tuyển
		List<JoblistingsEntity> appliedJobs = appDao.findJobsAppliedByUserId(userId);
		boolean hasApplied = appliedJobs.stream().anyMatch(job -> job.getJobid().equals(jobid));

		// Thêm các thuộc tính vào model để truyền sang view
		model.addAttribute("job", chiTietUngTuyen);
		model.addAttribute("listCV", listCV);
		model.addAttribute("hasApplied", hasApplied); // Thêm thuộc tính kiểm tra vào model

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

}