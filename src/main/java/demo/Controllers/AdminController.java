package demo.Controllers;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.dao.EmployersDao;
import demo.dao.JobSeekersDao;
import demo.dao.JoblistingsDao;
import demo.dao.UsersDao;
import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;

import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;
import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UsersDao userDao;

	@Autowired
	JoblistingsDao joblistingsDao;

	@Autowired
	JobSeekersDao jobSeekersDao;

	@Autowired
	EmployersDao employersDao;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@RequestMapping("")
	public String quanLyNguoiDung(Model model, @RequestParam(value = "page", required = false) String page) {
		if (page == null || page.equals("quanLyTaiKhoan")) {
			List<UsersEntity> dsND = userDao.findAll();
			model.addAttribute("dsND", dsND);
		}
		if (page == null || page.equals("quanLyTaiKhoan")) {
			List<JoblistingsEntity> qlBV = joblistingsDao.findAll();
			model.addAttribute("qlBV", qlBV);
		}
		if (page == null || page.equals("quanLyTaiKhoan")) {
			List<JobSeekersEntity> qlCV = jobSeekersDao.findAll();
			model.addAttribute("qlCV", qlCV);
		}
		return "quanLyNguoiDung";
		// Trả về trang mặc định nếu không có page hoặc page không phải là
		// quanLyUngTuyen
	}

	@RequestMapping("/detailUser/{id}")
	public String chiTietTaiKhoan(@PathVariable("id") Integer id, Model model) {
		UsersEntity nd = userDao.findById(id).orElse(null);
		model.addAttribute("nd", nd);

		return "chiTietTaiKhoan";
	}

	@PostMapping("/updateUser/{id}")
	public String updateUser(@PathVariable("id") Integer userid, 
			@RequestParam("username") String username,
			@RequestParam("fullname") String fullname, 
			@RequestParam("email") String email, 
			
			@RequestParam("phonenumber") String phonenumber, 
			@RequestParam("role") String role, 
			RedirectAttributes redirectAttributes) {
		// Kiểm tra các trường không được bỏ trống
		if (username.isEmpty() || fullname.isEmpty() || email.isEmpty() || phonenumber.isEmpty()
				|| role.isEmpty()) {
			redirectAttributes.addAttribute("error", "Tất cả các trường đều phải được điền!");
			return "redirect:/admin/detailUser/" + userid;
		}

		

		// Kiểm tra định dạng email
		String emailRegex = "^[A-Za-z0-9._%+-]+@(gmail\\.com|fpt\\.edu\\.vn)$";
		Pattern emailPattern = Pattern.compile(emailRegex);
		if (!emailPattern.matcher(email).matches()) {
			redirectAttributes.addAttribute("error", "Định dạng email không hợp lệ!");
			return "redirect:/admin/detailUser/" + userid;
		}

		// Kiểm tra số điện thoại phải đủ 10 số
		String phoneRegex = "^\\d{10}$";
		Pattern phonePattern = Pattern.compile(phoneRegex);
		if (!phonePattern.matcher(phonenumber).matches()) {
			redirectAttributes.addAttribute("error", "Số điện thoại phải đủ 10 số và không được nhập chữ!");
			return "redirect:/admin/detailUser/" + userid;
		}

		// Cập nhật thông tin người dùng
		String sql = "UPDATE Users SET username = ?, fullname = ?, email = ?, phonenumber = ?, role = ? WHERE userid = ?";
		try {
			int rows = jdbcTemplate.update(sql, username, fullname, email,  phonenumber, role, userid);
			if (rows > 0) {
				redirectAttributes.addAttribute("successMessage", "Cập nhật thông tin người dùng thành công!");
			} else {
				redirectAttributes.addAttribute("error", "Không tìm thấy người dùng cần cập nhật!");
			}
		} catch (Exception e) {
				redirectAttributes.addAttribute("error",
					"Cập nhật thông tin người dùng thất bại! Lỗi: " + e.getMessage());
				e.printStackTrace();
		}

		return "redirect:/admin";
	}
	
	
	
	@GetMapping("/detailPost/{id}")
	public String showPostDetail(@PathVariable("id") Integer id, Model model) {
		JoblistingsEntity bv = joblistingsDao.findById(id).orElse(null);
		model.addAttribute("bv", bv);
		return "chiTietBaiViet";
	}

	@PostMapping("/deletePost")
	public String deletePost(@RequestParam("id") Integer id) {
	    String deleteApplicationsSql = "DELETE FROM Applications WHERE JobID = ?";
	    String deleteJobListingsSql = "DELETE FROM Joblistings WHERE JobID = ?";
	    String deletePostSql = "DELETE FROM Post WHERE JobID = ?";

	    try {
	        // Xóa các bản ghi liên quan trong bảng Applications trước
	        jdbcTemplate.update(deleteApplicationsSql, id);

	        // Xóa các bản ghi liên quan trong bảng Joblistings
	        jdbcTemplate.update(deleteJobListingsSql, id);

	        // Sau đó xóa bài viết
	        jdbcTemplate.update(deletePostSql, id);
	    } catch (Exception e) {
	        // Có thể thêm log để theo dõi lỗi nếu cần
	    }
	    
	    return "redirect:/admin";
	}
	
	@PostMapping("/updatePost/{jobid}")
	public String updatePost(@PathVariable("jobid") Integer jobid,
	                         @RequestParam("jobtitle") String jobtitle,
	                         @RequestParam("joblocation") String joblocation,
	                         @RequestParam("companyname") String companyname,
	                         @RequestParam("companywebsite") String companywebsite,
	                         @RequestParam("address") String address,
	                         @RequestParam("industry") String industry,
	                         @RequestParam("contactperson") String contactperson,
	                         @RequestParam("salary") String salary,
	                         RedirectAttributes redirectAttributes) {

	    // In ra các giá trị để kiểm tra
	    System.out.println("jobid: " + jobid);
	    System.out.println("jobtitle: " + jobtitle);
	    System.out.println("joblocation: " + joblocation);
	    System.out.println("companyname: " + companyname);
	    System.out.println("companywebsite: " + companywebsite);
	    System.out.println("address: " + address);
	    System.out.println("industry: " + industry);
	    System.out.println("contactperson: " + contactperson);
	    System.out.println("salary: " + salary);
	    // In các giá trị khác tương tự

	    try {
	        // Cập nhật cơ sở dữ liệu như trước
	        String sql = "UPDATE Joblistings SET jobtitle = ?, joblocation = ?, salary = ? WHERE jobid = ?";
	        jdbcTemplate.update(sql, jobtitle, joblocation, salary, jobid);

	        String sqlEmployer = "UPDATE Employers SET companyname = ?, companywebsite = ?, address = ?, industry = ?, contactperson = ? WHERE employerid = (SELECT employerid FROM Joblistings WHERE jobid = ?)";
	        jdbcTemplate.update(sqlEmployer, companyname, companywebsite, address, industry, contactperson, jobid);

	        redirectAttributes.addFlashAttribute("message", "Bài viết đã được cập nhật thành công.");
	    } catch (Exception e) {
	        // Thêm log để hiển thị lỗi
	        System.out.println("Lỗi khi cập nhật: " + e.getMessage());
	        redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi cập nhật bài viết.");
	    }

	    return "redirect:/admin";  // Chuyển hướng về trang admin hoặc trang danh sách bài viết
	}



	@RequestMapping("/quanLyCV")
	public String quanLyCV(Model model) {
		List<JobSeekersEntity> qlCV = jobSeekersDao.findAll();
		model.addAttribute("qlCV", qlCV);
		return "quanLyNguoiDung";

	}

}
