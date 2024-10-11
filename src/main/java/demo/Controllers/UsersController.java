package demo.Controllers;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import demo.dao.ApplicationsDao;
import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.UsersEntity;
import demo.services.SessionService;
import jakarta.mail.internet.ParseException;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
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

	@GetMapping("")
	public String home(Model model) {
		String giaoDien = "index.jsp";
		model.addAttribute("page", giaoDien);
		return "trangCaNhanNguoiTimViec";
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
	public String postUpdateCV(Model model, 
	                            @RequestParam("gender") String gender,
	                            @RequestParam("dateOfbirth") String dateOfbirthStr,
	                            @RequestParam("resume") String resume,
	                            @RequestParam("profilesummary") String profilesummary,
	                            @RequestParam("experience") String experience,
	                            @RequestParam("education") String education,
	                            @RequestParam("skills") String skills,
	                            @RequestParam("certifications") String certifications,
	                            @RequestParam("languages") String languages,
	                            @RequestParam("interests") String interests) throws ParseException {
	    
	    Integer id = Integer.parseInt(ss.getAttribute("userid").toString());
	    UsersEntity user = userDao.findByUserid(id);
	    
	    JobSeekersEntity entity = new JobSeekersEntity();
	    entity.setUser(user);
	    entity.setGender(gender);

	    // Chuyển đổi từ String sang java.sql.Date
	    java.sql.Date sqlDateOfbirth = java.sql.Date.valueOf(dateOfbirthStr);
	    entity.setDateOfbirth(sqlDateOfbirth);
	    
	    // Các thuộc tính khác
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
        // Lấy ID người dùng từ phiên làm việc
        Integer userId = (Integer) ss.getAttribute("userid");
        
        // Lấy danh sách CV của người dùng từ cơ sở dữ liệu
        List<ApplicationsEntity> cvList = applicationsDao.findApplicationsByUserId(userId);
        
        // Thêm danh sách CV vào mô hình
        model.addAttribute("cvList", cvList);
        
        // Trả về trang JSP cho danh sách CV
        model.addAttribute("page", "listCVUngTuyen.jsp");  // Đường dẫn đến trang JSP cụ thể
        return "trangCaNhanNguoiTimViec";  // Tên view mà bạn đã sử dụng
    }

	//Trúc
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

}
