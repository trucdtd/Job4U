package demo.Controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.el.stream.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.dao.ApplicationsDao;
import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.UsersEntity;
import jakarta.mail.internet.ParseException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/user")
public class UsersController {
	@Autowired
	JobSeekersDao dao;
	@Autowired
	HttpSession ss;
	@Autowired
	UsersDao userDao;

	@Autowired
	ApplicationsDao applicationsDao;

	@Autowired
	JobSeekersDao jobSeekersDao;

	@Autowired
	HttpServletRequest req;

	@GetMapping("")
	public String home(Model model) {

		return "redirect:/user/cv/list";
	}

	@GetMapping("/cv")
	public String getUpdateCV(Model model, JobSeekersEntity entity) {
		String giaoDien = "info-cv.jsp";
		model.addAttribute("entity", entity);
		model.addAttribute("page", giaoDien);
		System.out.println(java.time.LocalDate.now());
		return "trangCaNhanNguoiTimViec";
	}

	@PostMapping("/cv")
	public String postUpdateCV(Model model, @RequestParam("gender") String gender,
			@RequestParam("fullnamecv") String fullnamecv, @RequestParam("emailcv") String emailcv,
			@RequestParam("phonenumbercv") String phonenumbercv,
			@RequestParam(value = "image", required = false) MultipartFile image,
			@RequestParam("dateOfbirth") String dateOfbirthStr, @RequestParam("resume") String resume,
			@RequestParam("profilesummary") String profilesummary, @RequestParam("experience") String experience,
			@RequestParam("education") String education, @RequestParam("skills") String skills,
			@RequestParam("certifications") String certifications, @RequestParam("languages") String languages,
			@RequestParam("interests") String interests) throws ParseException {

		Integer id = Integer.parseInt(ss.getAttribute("userid").toString());
		UsersEntity user = userDao.findByUserid(id);

		JobSeekersEntity entity = new JobSeekersEntity();
		entity.setUser(user);
		entity.setGender(gender);

		// Chuyển đổi từ String sang java.sql.Date
		java.sql.Date sqlDateOfbirth = java.sql.Date.valueOf(dateOfbirthStr);
		entity.setDateOfbirth(sqlDateOfbirth);
		// Kiểm tra và lưu logo
		String logoFilename = null;
		if (image != null && !image.isEmpty()) {
			logoFilename = StringUtils.cleanPath(image.getOriginalFilename());
			try {
				File uploadsDir = new File(req.getServletContext().getRealPath("/uploads/"));
				if (!uploadsDir.exists()) {
					uploadsDir.mkdirs(); // Tạo thư mục nếu không tồn tại
				}
				Path path = Paths.get(uploadsDir.getAbsolutePath(), logoFilename);
				Files.write(path, image.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
				return "error"; // Xử lý lỗi tải lên
			}
		}
		// Các thuộc tính khác
		entity.setFullnamecv(fullnamecv);
		entity.setEmailcv(emailcv);
		if (logoFilename != null) {
			entity.setImage(logoFilename);// Chỉ cập nhật logo nếu nó không null
		}
		entity.setPhonenumbercv(phonenumbercv);
		entity.setResume(resume);
		entity.setProfilesummary(profilesummary);
		entity.setExperience(experience);
		entity.setEducation(education);
		entity.setSkills(skills);
		entity.setCertifications(certifications);
		entity.setLanguages(languages);
		entity.setInterests(interests);
		entity.setCreatedat(java.time.LocalDate.now());
		entity.setUpdatedat(java.time.LocalDate.now());

		dao.save(entity);

		String giaoDien = "info-cv.jsp";
		model.addAttribute("page", giaoDien);
		return "trangCaNhanNguoiTimViec";
	}

	@GetMapping("/cv/list")
	public String viewCvList(Model model) {
	    Integer userId = (Integer) ss.getAttribute("userid");
	    List<ApplicationsEntity> cvList = applicationsDao.findApplicationsByUserId(userId);

	    // In ra để kiểm tra
	    System.out.println("Số lượng CV đã lấy: " + cvList.size());
	    for (ApplicationsEntity cv : cvList) {
	        System.out.println("CV ID: " + cv.getApplicationid() + ", Job Seeker ID: " + cv.getJobseeker().getJobseekerid());
	    }

	    model.addAttribute("cvList", cvList);
	    model.addAttribute("page", "listCVUngTuyen.jsp");
	    return "trangCaNhanNguoiTimViec";
	}


	// Trúc
	@GetMapping("/cv/list2")
	public String cvDaTao(Model model) {
		// Lấy ID người dùng từ phiên làm việc
		Integer userId = (Integer) ss.getAttribute("userid");
		if (userId == null) {
			// Xử lý nếu không có ID người dùng
			return "redirect:/Login"; // Hoặc trang khác
		}

		// Lấy danh sách CV của người dùng từ cơ sở dữ liệu
		List<JobSeekersEntity> List = dao.findByUserId(userId);

		// Thêm danh sách CV vào mô hình
		model.addAttribute("List", List);

		// Trả về trang JSP cho danh sách CV
		model.addAttribute("page", "quanLyCV.jsp");
		return "trangCaNhanNguoiTimViec";
	}

	// xem chi tiết cv
	@GetMapping("/chiTietCV/{jobseekerId}")
	public String cvDetails(@PathVariable("jobseekerId") Integer jobseekerId, Model model) {
		JobSeekersEntity jobseeker = dao.findById(jobseekerId).orElse(null);

		if (jobseeker == null) {
			model.addAttribute("errorMessage", "Không tìm thấy thông tin CV.");
			return "redirect:/user/cv/list2";
		}

		model.addAttribute("cv", jobseeker);
		return "xemCVCaNhan"; // Trả về view chi tiết CV
	}

	@PostMapping("/deleteCV")
	public String deleteCV(@RequestParam("jobseekerId") Integer jobseekerId, Model model) {
		// Kiểm tra xem JobSeeker có ứng dụng nào liên quan không
		if (applicationsDao.existsByJobseeker_Jobseekerid(jobseekerId)) {
			// Nếu có, trả về thông báo lỗi
			model.addAttribute("errorMessage", "Không thể xóa vì JobSeeker này đang có đơn ứng tuyển.");
			return "redirect:/user/cv/list2"; // Điều hướng lại view với thông báo
		}

		// Nếu không có, tiến hành xóa
		try {
			dao.deleteById(jobseekerId);
			model.addAttribute("successMessage", "Xóa thành công!");
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Xóa thất bại.");
		}
		return "redirect:/user/cv/list2";
	}
	


}
