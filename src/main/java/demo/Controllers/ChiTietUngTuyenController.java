package demo.Controllers;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
//         // Lấy thông tin chi tiết công việc
		JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);

// Lấy ID người dùng đã đăng nhập
		Integer userId = (Integer) ss.getAttribute("userid");

		// Lấy danh sách CV của người dùng
		List<JobSeekersEntity> listCV = dao.findByUsername(userId);

		// Thêm các thuộc tính vào model để truyền sang view
		model.addAttribute("job", chiTietUngTuyen);
		model.addAttribute("listCV", listCV); // Thêm danh sách CV vào model
		// Thêm các thuộc tính vào model để truyền sang view

		model.addAttribute("job", chiTietUngTuyen);
		model.addAttribute("listCV", listCV); // Thêm danh sách CV vào model

		return "chiTietUngTuyen";
	}

	@PostMapping("/{jobid}")
	public String postSubmitCV(@PathVariable("jobid") Integer jobid, Model model,
	        @RequestParam("cvFile") MultipartFile cvFile,
	        @RequestParam("cvOptions") String cvOption,
	        @RequestParam("id") Integer jSKID) { // Thêm dòng này để lấy ID CV
	    Integer userId = (Integer) ss.getAttribute("userid"); // Lấy ID người dùng từ session

	    // Lấy thông tin chi tiết công việc
	    JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);
	    
	    ApplicationsEntity app = new ApplicationsEntity();
	    try {
	        // Lấy danh sách CV của người dùng
	        List<JobSeekersEntity> listCV = dao.findByUsername(userId);
	        JobSeekersEntity jSK = null;

	        // Nếu danh sách CV không rỗng, lấy CV đầu tiên
	        if (!listCV.isEmpty()) {
	            jSK = listCV.get(0); // Hoặc bạn có thể thêm logic để chọn CV cụ thể
	        }

	        if (jSK == null) {
	            model.addAttribute("message", "Ứng tuyển thất bại: Không tìm thấy thông tin người tìm việc.");
	            return "chiTietUngTuyen"; 
	        }

	        if ("upload".equals(cvOption)) {
	            // Xử lý upload CV
	            String filename = cvFile.getOriginalFilename();
	            File file = new File(sc.getRealPath("/uploads/" + filename));
	            cvFile.transferTo(file);
	            app.setJob(chiTietUngTuyen);
	            app.setJobseeker(jSK);
	            app.setApplicationdate(LocalDateTime.now());
	            app.setStatus(0);
	            app.setCreatedat(LocalDateTime.now());
	            app.setFilename(filename);
	            appDao.save(app);
	            model.addAttribute("script", "<script>alert('Upload CV ứng tuyển thành công')</script>");
	        } else if ("choose".equals(cvOption)) {
	            // Lấy CV có sẵn bằng ID
	            JobSeekersEntity existingCV = dao.findByJobseekerid(jSKID);
	            if (existingCV != null) {
	                app.setJob(chiTietUngTuyen);
	                app.setJobseeker(existingCV); // Gán CV đã chọn
	                app.setApplicationdate(LocalDateTime.now());
	                app.setStatus(0);
	                app.setResume(existingCV.getResume()); // Lưu resume từ CV đã chọn
	                app.setCreatedat(LocalDateTime.now());
	                appDao.save(app);
	                model.addAttribute("script", "<script>alert('Ứng tuyển thành công')</script>");
	            } else {
	                model.addAttribute("script", "<script>alert('Không tìm thấy CV đã chọn')</script>");
	            }
	        }
	    } catch (Exception e) {
	        model.addAttribute("script", "<script>alert('Ứng tuyển thất bại')</script>");
	    }
	    return "chiTietUngTuyen";
	}

}