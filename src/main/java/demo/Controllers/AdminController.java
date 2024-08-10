package demo.Controllers;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
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

	@GetMapping("/updateUser/{id}")
	public String updateUser(@PathVariable("id") Integer userid, @RequestParam String username,
			@RequestParam String fullname, @RequestParam String email, @RequestParam String password,
			@RequestParam String phonenumber, @RequestParam String role, RedirectAttributes redirectAttributes) {
		// Kiểm tra các trường không được bỏ trống
		if (username.isEmpty() || fullname.isEmpty() || email.isEmpty() || password.isEmpty() || phonenumber.isEmpty()
				|| role.isEmpty()) {
			redirectAttributes.addFlashAttribute("error", "Tất cả các trường đều phải được điền!");
			return "redirect:/userManager/detailUser/" + userid;
		}

		// Kiểm tra độ dài mật khẩu
		if (password.length() < 8) {
			redirectAttributes.addFlashAttribute("error", "Mật khẩu phải có độ dài tối thiểu 8 ký tự!");
			return "redirect:/userManager/detailUser/" + userid;
		}

		// Kiểm tra định dạng email
		String emailRegex = "^[A-Za-z0-9._%+-]+@(gmail\\.com|fpt\\.edu\\.vn)$";
		Pattern emailPattern = Pattern.compile(emailRegex);
		if (!emailPattern.matcher(email).matches()) {
			redirectAttributes.addFlashAttribute("error", "Định dạng email không hợp lệ!");
			return "redirect:/userManager/detailUser/" + userid;
		}

		// Kiểm tra số điện thoại phải đủ 10 số
		String phoneRegex = "^\\d{10}$";
		Pattern phonePattern = Pattern.compile(phoneRegex);
		if (!phonePattern.matcher(phonenumber).matches()) {
			redirectAttributes.addFlashAttribute("error", "Số điện thoại phải đủ 10 số và không được nhập chữ!");
			return "redirect:/userManager/detailUser/" + userid;
		}

		// Cập nhật thông tin người dùng
		String sql = "UPDATE Users SET username = ?, fullname = ?, email = ?, password = ?, phonenumber = ?, role = ? WHERE userid = ?";
		try {
			int rows = jdbcTemplate.update(sql, username, fullname, email, password, phonenumber, role, userid);
			if (rows > 0) {
				redirectAttributes.addFlashAttribute("message", "Cập nhật thông tin người dùng thành công!");
			} else {
				redirectAttributes.addFlashAttribute("error", "Không tìm thấy người dùng cần cập nhật!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error",
					"Cập nhật thông tin người dùng thất bại! Lỗi: " + e.getMessage());
		}

		return "redirect:/job4u/userManager";
	}

	@GetMapping("/detailPost/{id}")
	public String showPostDetail(@PathVariable("id") Integer id, Model model) {
		JoblistingsEntity bv = joblistingsDao.findById(id).orElse(null);
		model.addAttribute("bv", bv);
		return "chiTietBaiViet";
	}

	@PostMapping("/deletePost")
	public String deletePost(@RequestParam("id") Integer id, RedirectAttributes redirectAttributes) {
		String deleteApplicationsSql = "DELETE FROM Applications WHERE JobID = ?";
		String deleteJobListingsSql = "DELETE FROM Joblistings WHERE JobID = ?";
		String deletePostSql = "DELETE FROM Post WHERE JobID = ?";

		try {
			// Xóa các bản ghi liên quan trong bảng Applications trước
			jdbcTemplate.update(deleteApplicationsSql, id);

			// Xóa các bản ghi liên quan trong bảng Joblistings
			jdbcTemplate.update(deleteJobListingsSql, id);

			// Sau đó xóa bài viết
			int rows = jdbcTemplate.update(deletePostSql, id);
			if (rows > 0) {
				redirectAttributes.addFlashAttribute("message", "Xóa bài viết thành công!");
			} else {
				redirectAttributes.addFlashAttribute("error", "Không tìm thấy bài viết cần xóa!");
			}
		} catch (Exception e) {

			redirectAttributes.addFlashAttribute("error", "Xóa bài viết thất bại do có lỗi xảy ra");

		}
		return "redirect:/admin";
	}

<<<<<<< HEAD

=======
	
	@PostMapping("/deleteUser")
	public String deleteUser(@RequestParam("userid") Integer userid, RedirectAttributes redirectAttributes) {
	    String deleteFeedbackSql = "DELETE FROM FeedbackAndRatings WHERE UserID = ?";
	    String deleteJobSeekersSql = "DELETE FROM Jobseekers WHERE UserID = ?";
	    String deleteApplicationsSql = "DELETE FROM Applications WHERE JobID IN (SELECT JobID FROM Joblistings WHERE EmployerID IN (SELECT EmployerID FROM Employers WHERE UserID = ?))";
	    String deleteJobListingsSql = "DELETE FROM Joblistings WHERE EmployerID IN (SELECT EmployerID FROM Employers WHERE UserID = ?)";
	    String deleteEmployersSql = "DELETE FROM Employers WHERE UserID = ?";
	    String deleteMessagesSql = "DELETE FROM Messages WHERE SenderID = ?";
	    String deleteUserSql = "DELETE FROM users WHERE userid = ?";

	    try {
	        // Xóa các bản ghi liên quan trong bảng FeedbackAndRatings
	        jdbcTemplate.update(deleteFeedbackSql, userid);

	        // Xóa các bản ghi liên quan trong các bảng khác
	        jdbcTemplate.update(deleteJobSeekersSql, userid);
	        jdbcTemplate.update(deleteApplicationsSql, userid);
	        jdbcTemplate.update(deleteJobListingsSql, userid);
	        jdbcTemplate.update(deleteEmployersSql, userid);
	        jdbcTemplate.update(deleteMessagesSql, userid);

	        // Xóa người dùng
	        int rows = jdbcTemplate.update(deleteUserSql, userid);
	        if (rows > 0) {
	            redirectAttributes.addFlashAttribute("message", "Xóa người dùng thành công!");
	        } else {
	            redirectAttributes.addFlashAttribute("error", "Không tìm thấy người dùng cần xóa!");
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // Hoặc ghi log chi tiết lỗi
	        redirectAttributes.addFlashAttribute("error", "Xóa người dùng thất bại. Lỗi: " + e.getMessage());
	    }
	    return "redirect:/admin";
	}
	/*
	 * @PostMapping("/updatePost") public String updatePost(@RequestParam("jobid")
	 * Integer jobid, @RequestParam("jobtitle") String jobtitle,
	 * 
	 * @RequestParam("jobdescription") String jobdescription,
	 * 
	 * @RequestParam("joblocation") String joblocation,
	 * 
	 * @RequestParam("salary") String salary,
	 * 
	 * @RequestParam("posteddate") LocalDateTime posteddate,
	 * 
	 * @RequestParam("applicationdeadline") LocalDateTime applicationdeadline,
	 * 
	 * @RequestParam("employerId") Integer employerId) {
	 * 
	 * // Tìm bài viết hiện tại JoblistingsEntity post =
	 * joblistingsDao.findById(jobid) .orElseThrow(() -> new
	 * RuntimeException("Bài viết không tồn tại"));
	 * 
	 * // Tìm nhà tuyển dụng EmployersEntity employer =
	 * employersDao.findById(employerId) .orElseThrow(() -> new
	 * RuntimeException("Nhà tuyển dụng không tồn tại"));
	 * 
	 * // Cập nhật các trường post.setJobtitle(jobtitle);
	 * post.setJobdescription(jobdescription); post.setJoblocation(joblocation);
	 * post.setSalary(salary); post.setPosteddate(posteddate);
	 * post.setApplicationdeadline(applicationdeadline); post.setEmployer(employer);
	 * 
	 * // Lưu bài viết đã cập nhật joblistingsDao.save(post);
	 * 
	 * // Chuyển hướng hoặc trả về một view return "redirect:/admin"; }
	 */
	
>>>>>>> trinhtt
	@PostMapping("/updatePost")
	public String updatePost(@PathVariable Integer jobid, @RequestParam String jobtitle,
			@RequestParam String joblocation, @RequestParam String companyname, @RequestParam String companywebsite,
			@RequestParam String address, @RequestParam String industry, @RequestParam String contactperson,
			@RequestParam String salary, RedirectAttributes redirectAttributes) {

		// Kiểm tra các trường không được bỏ trống
		if (jobtitle.isEmpty() || joblocation.isEmpty() || companyname.isEmpty() || companywebsite.isEmpty()
				|| address.isEmpty() || industry.isEmpty() || contactperson.isEmpty() || salary.isEmpty()) {
			redirectAttributes.addFlashAttribute("error", "Tất cả các trường đều phải được điền!");
			return "redirect:/admin/post/detail/" + jobid;
		}

		// Kiểm tra định dạng email (nếu có)
		// String emailRegex = "^[A-Za-z0-9._%+-]+@(gmail\\.com|fpt\\.edu\\.vn)$";
		// Pattern emailPattern = Pattern.compile(emailRegex);
		// if (!emailPattern.matcher(email).matches()) {
		// redirectAttributes.addFlashAttribute("error", "Định dạng email không hợp
		// lệ!");
		// return "redirect:/admin/post/detail/" + jobid;
		// }

		// Kiểm tra số điện thoại (nếu có)
		// String phoneRegex = "^\\d{10}$";
		// Pattern phonePattern = Pattern.compile(phoneRegex);
		// if (!phonePattern.matcher(phonenumber).matches()) {
		// redirectAttributes.addFlashAttribute("error", "Số điện thoại phải đủ 10 số và
		// không được nhập chữ!");
		// return "redirect:/admin/post/detail/" + jobid;
		// }

		// Cập nhật thông tin bài viết
		String sql = "UPDATE posts SET jobtitle = ?, joblocation = ?, companyname = ?, companywebsite = ?, address = ?, industry = ?, contactperson = ?, salary = ? WHERE jobid = ?";
		try {
			int rows = jdbcTemplate.update(sql, jobtitle, joblocation, companyname, companywebsite, address, industry,
					contactperson, salary, jobid);
			if (rows > 0) {
				redirectAttributes.addFlashAttribute("message", "Cập nhật bài viết thành công!");
			} else {
				redirectAttributes.addFlashAttribute("error", "Không tìm thấy bài viết cần cập nhật!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Cập nhật bài viết thất bại! Lỗi: " + e.getMessage());
		}
		return "redirect:/admin";

	}

	@RequestMapping("/quanLyCV")
	public String quanLyCV(Model model) {
		List<JobSeekersEntity> qlCV = jobSeekersDao.findAll();
		model.addAttribute("qlCV", qlCV);
		return "quanLyNguoiDung";

	}

}
