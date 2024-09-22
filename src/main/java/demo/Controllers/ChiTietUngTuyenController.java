package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.services.JoblistingsService;
import jakarta.servlet.http.HttpSession;
import demo.dao.ApplicationsDao;
import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/job4u")
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

	@GetMapping("/chiTiet/{jobid}")
	public String chiTietUngTuyen(@PathVariable("jobid") Integer jobid, Model model) {
		Integer id = Integer.parseInt(ss.getAttribute("userid").toString());
		UsersEntity user = userDao.findByUserid(id);
		List<JobSeekersEntity> listCV = dao.findByUsername(id);
		// Lấy thông tin chi tiết công việc
		JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);

		// Định dạng ngày với định dạng dd/MM/yyyy
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

		LocalDate postedDate = chiTietUngTuyen.getPosteddate();
		LocalDate applicationDeadlineDate = chiTietUngTuyen.getApplicationdeadline();

		// Định dạng ngày
		String formattedPostedDate = (postedDate != null) ? postedDate.format(formatter) : "N/A";
		String formattedApplicationDeadline = (applicationDeadlineDate != null)
				? applicationDeadlineDate.format(formatter)
				: "N/A";

		// Thêm các thuộc tính vào model để truyền sang view
		model.addAttribute("formattedPostedDate", formattedPostedDate);
		model.addAttribute("formattedApplicationDeadline", formattedApplicationDeadline);
		model.addAttribute("job", chiTietUngTuyen);
		model.addAttribute("listCV", listCV);
		return "chiTietUngTuyen";
	}

	@PostMapping("/chiTiet/{jobid}")
	public String postSubmitCV(@PathVariable("jobid") Integer jobid, Model model, @RequestParam ("id") Integer jSKID) {
		Integer id = Integer.parseInt(ss.getAttribute("userid").toString());
		UsersEntity user = userDao.findByUserid(id);
		List<JobSeekersEntity> listCV = dao.findByUsername(id);
		// Lấy thông tin chi tiết công việc
		JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);

		// Định dạng ngày với định dạng dd/MM/yyyy
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

		LocalDate postedDate = chiTietUngTuyen.getPosteddate();
		LocalDate applicationDeadlineDate = chiTietUngTuyen.getApplicationdeadline();

		// Định dạng ngày
		String formattedPostedDate = (postedDate != null) ? postedDate.format(formatter) : "N/A";
		String formattedApplicationDeadline = (applicationDeadlineDate != null)
				? applicationDeadlineDate.format(formatter)
				: "N/A";
		ApplicationsEntity app = new ApplicationsEntity();
		JobSeekersEntity jSK = dao.findByJobseekerid(jSKID);
		try {
			app.setJob(chiTietUngTuyen);
			app.setJobseeker(jSK);
			app.setApplicationdate(LocalDateTime.now());
			app.setStatus(1);
			app.setResume(jSK.getResume());
			app.setCreatedat(LocalDateTime.now());
			appDao.save(app);
			model.addAttribute("script", "<script>alert('Ứng tuyển thành công')</script>");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		// Thêm các thuộc tính vào model để truyền sang view
		model.addAttribute("formattedPostedDate", formattedPostedDate);
		model.addAttribute("formattedApplicationDeadline", formattedApplicationDeadline);
		model.addAttribute("job", chiTietUngTuyen);
		model.addAttribute("listCV", listCV);
		
		return "chiTietUngTuyen";
		
	}

}
