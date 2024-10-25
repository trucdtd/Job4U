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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import demo.dao.EmployersDao;
import demo.dao.JobSeekersDao;
import demo.dao.JoblistingsDao;
import demo.dao.UsersDao;
import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;
import demo.services.UserService;
import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;
import jakarta.servlet.http.HttpSession;

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
	
	@Autowired
	UserService userService;

	@RequestMapping("")
	public String adminPage(HttpSession session, @RequestParam(value = "page", required = false) String page,
			Model model) {
		Integer role = (Integer) session.getAttribute("role");

		if (role == null || role != 0) { // Không phải admin
			model.addAttribute("message", "Bạn không có quyền truy cập vào trang này.");
			return "dangnhap";
		}

		// Nếu có trang cụ thể, xử lý theo trang đó
		if (page == null || page.equals("quanLyTaiKhoan")) {
			List<UsersEntity> dsND = userDao.findAll();
			model.addAttribute("dsND", dsND);

			List<JoblistingsEntity> qlBV = joblistingsDao.findAll();
			model.addAttribute("qlBV", qlBV);

			List<JobSeekersEntity> qlCV = jobSeekersDao.findAll();
			model.addAttribute("qlCV", qlCV);
		}

		return "quanLyNguoiDung"; // Trang admin
	}

	@RequestMapping("/detailUser/{id}")
	public String chiTietTaiKhoan(@PathVariable("id") Integer id, Model model) {
		UsersEntity nd = userDao.findById(id).orElse(null);
		model.addAttribute("nd", nd);

		return "chiTietTaiKhoan";
	}

	@PostMapping("/updateUser/{id}")
	public String updateUser(@PathVariable("id") Integer userid, @RequestParam("username") String username,
			@RequestParam("fullname") String fullname, @RequestParam("email") String email,
			@RequestParam("phonenumber") String phonenumber, RedirectAttributes redirectAttributes) {

		// Kiểm tra các trường không được bỏ trống
		if (username.isEmpty() || fullname.isEmpty() || email.isEmpty() || phonenumber.isEmpty()) {
			redirectAttributes.addAttribute("error", "Tất cả các trường đều phải được điền!");
			return "redirect:/admin/detailUser/" + userid;
		}

		// Kiểm tra định dạng email
		String emailRegex = "^[A-Za-z0-9._%+-]+@(gmail\\.com|fpt\\.edu\\.vn)$";
		if (!Pattern.matches(emailRegex, email)) {
			redirectAttributes.addAttribute("error", "Định dạng email không hợp lệ!");
			return "redirect:/admin/detailUser/" + userid;
		}

		// Kiểm tra số điện thoại phải đủ 10 số
		String phoneRegex = "^\\d{10}$";
		if (!Pattern.matches(phoneRegex, phonenumber)) {
			redirectAttributes.addAttribute("error", "Số điện thoại phải đủ 10 số và không được nhập chữ!");
			return "redirect:/admin/detailUser/" + userid;
		}

		// Cập nhật thông tin người dùng
		String sql = "UPDATE Users SET username = ?, fullname = ?, email = ?, phonenumber = ? WHERE userid = ?";
		try {
			int rows = jdbcTemplate.update(sql, username, fullname, email, phonenumber, userid);
			if (rows > 0) {
				redirectAttributes.addAttribute("successMessage", "Cập nhật thông tin người dùng thành công!");
			} else {
				redirectAttributes.addAttribute("error", "Không tìm thấy người dùng cần cập nhật!");
			}
		} catch (Exception e) {
			redirectAttributes.addAttribute("error", "Cập nhật thông tin người dùng thất bại! Lỗi: " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/admin";
	}

	@PostMapping("/deleteUser")
	public String deleteUser(@RequestParam("userid") Integer userid, RedirectAttributes redirectAttributes, HttpSession session) {
	    Integer loggedInUserId = (Integer) session.getAttribute("loggedInUserId");

	    // Kiểm tra người dùng đang cố gắng xóa chính mình
	    if (userid.equals(loggedInUserId)) {
	        redirectAttributes.addAttribute("error", "Bạn không thể xóa tài khoản của chính mình.");
	        return "redirect:/admin";
	    }

	    // Kiểm tra role của người dùng
	    String roleSql = "SELECT role FROM Users WHERE userid = ?";
	    Integer userRole = jdbcTemplate.queryForObject(roleSql, new Object[]{userid}, Integer.class);

	    if (userRole != null && userRole == 0) {
	        redirectAttributes.addAttribute("error", "Không thể xóa người dùng có role = 0.");
	        return "redirect:/admin";
	    }

	    try {
	       
	        // Xóa các bản ghi liên quan trong bảng UserAgreements
	        String deleteUserAgreementsSql = "DELETE FROM UserAgreements WHERE userid = ?";
	        jdbcTemplate.update(deleteUserAgreementsSql, userid);

	        // Xóa các bản ghi trong bảng Employers trước
	        String deleteEmployersSql = "DELETE FROM Employers WHERE UserID = ?";
	        jdbcTemplate.update(deleteEmployersSql, userid);
	        
	        // Xóa các bản ghi trong bảng Applications và Joblistings
	        String deleteApplicationsSql = "DELETE FROM Applications WHERE JobID IN (SELECT JobID FROM Joblistings WHERE EmployerID IN (SELECT EmployerID FROM Employers WHERE UserID = ?))";
	        String deleteJobListingsSql = "DELETE FROM Joblistings WHERE EmployerID IN (SELECT EmployerID FROM Employers WHERE UserID = ?)";

	        // Xóa các bản ghi liên quan
	        jdbcTemplate.update(deleteApplicationsSql, userid);
	        jdbcTemplate.update(deleteJobListingsSql, userid);

	        // Cuối cùng, xóa người dùng
	        String deleteUserSql = "DELETE FROM Users WHERE userid = ?";
	        int rows = jdbcTemplate.update(deleteUserSql, userid);
	        if (rows > 0) {
	            redirectAttributes.addAttribute("successMessage", "Xóa người dùng thành công!");
	        } else {
	            redirectAttributes.addAttribute("error", "Không tìm thấy người dùng cần xóa!");
	        }
	    } catch (DataIntegrityViolationException e) {
	        redirectAttributes.addAttribute("error", "Xóa thất bại do người dùng đang ứng tuyển hoặc đang sử dụng dịch vụ.");
	        e.printStackTrace();
	    } catch (Exception e) {
	        redirectAttributes.addAttribute("error", "Xóa người dùng thất bại. Lỗi: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return "redirect:/admin"; // Chuyển hướng về trang admin
	}
	

	@PostMapping("/lock/{id}")
	public String lockUserAccount(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
	    try {
	    	
	    	UsersEntity user = userDao.findById(id).orElse(null);
	        
	        // Cập nhật trạng thái khóa tài khoản
	        user.setStatus(false); // false để khóa tài khoản
	        userDao.save(user); // Lưu lại thay đổi

	        redirectAttributes.addFlashAttribute("success", "Tài khoản đã được khóa thành công!");
	        
	        return "redirect:/admin"; // Quay về trang admin
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("error", "Lỗi khi khóa tài khoản: " + e.getMessage());
	        return "redirect:/admin"; // Quay về trang admin nếu có lỗi
	    }
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

		try { // Xóa các bản ghi liên quan trong bảng Applications trước
			jdbcTemplate.update(deleteApplicationsSql, id);

			// Xóa các bản ghi liên quan trong bảng Joblistings
			jdbcTemplate.update(deleteJobListingsSql, id);

			// Sau đó xóa bài viết jdbcTemplate.update(deletePostSql, id);

			redirectAttributes.addFlashAttribute("message", "Xóa bài viết thành công.");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Xóa bài viết thất bại. Lỗi: " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/admin";
	}

	/*
	 * @PostMapping("/updatePost/{jobid}") public String
	 * updatePost(@PathVariable("jobid") Integer jobid, @RequestParam("jobtitle")
	 * String jobtitle,
	 * 
	 * @RequestParam("joblocation") String joblocation, @RequestParam("companyname")
	 * String companyname,
	 * 
	 * @RequestParam("companywebsite") String
	 * companywebsite, @RequestParam("address") String address,
	 * 
	 * @RequestParam("industry") String industry, @RequestParam("contactperson")
	 * String contactperson,
	 * 
	 * @RequestParam("salary") String salary, RedirectAttributes redirectAttributes)
	 * {
	 * 
	 * // In ra các giá trị để kiểm tra System.out.println("jobid: " + jobid);
	 * System.out.println("jobtitle: " + jobtitle);
	 * System.out.println("joblocation: " + joblocation);
	 * System.out.println("companyname: " + companyname);
	 * System.out.println("companywebsite: " + companywebsite);
	 * System.out.println("address: " + address); System.out.println("industry: " +
	 * industry); System.out.println("contactperson: " + contactperson);
	 * System.out.println("salary: " + salary); // In các giá trị khác tương tự
	 * 
	 * try { // Cập nhật cơ sở dữ liệu như trước String sql =
	 * "UPDATE Joblistings SET jobtitle = ?, joblocation = ?, salary = ? WHERE jobid = ?"
	 * ; jdbcTemplate.update(sql, jobtitle, joblocation, salary, jobid);
	 * 
	 * String sqlEmployer =
	 * "UPDATE Employers SET companyname = ?, companywebsite = ?, address = ?, industry = ?, contactperson = ? WHERE employerid = (SELECT employerid FROM Joblistings WHERE jobid = ?)"
	 * ; jdbcTemplate.update(sqlEmployer, companyname, companywebsite, address,
	 * industry, contactperson, jobid);
	 * 
	 * redirectAttributes.addFlashAttribute("message",
	 * "Bài viết đã được cập nhật thành công."); } catch (Exception e) { // Thêm log
	 * để hiển thị lỗi System.out.println("Lỗi khi cập nhật: " + e.getMessage());
	 * redirectAttributes.addFlashAttribute("error",
	 * "Có lỗi xảy ra khi cập nhật bài viết."); }
	 * 
	 * return "redirect:/admin"; // Chuyển hướng về trang admin hoặc trang danh sách
	 * 
	 * }
	 */

	@PostMapping("/hidePost/{jobid}")
	public String hidePost(@PathVariable Integer jobid) {
		// Lấy thông tin bài viết từ database
		JoblistingsEntity job = joblistingsDao.findById(jobid).orElseThrow(() -> new RuntimeException("Job not found"));

		// Cập nhật trạng thái ẩn bài viết
		job.setActive(false);
		joblistingsDao.save(job);

		return "redirect:/admin"; // Quay về trang admin sau khi ẩn bài viết
	}
	

	@PostMapping("/showPost/{jobid}")
	public String showPost(@PathVariable Integer jobid) {
		// Lấy thông tin bài viết từ database
		JoblistingsEntity job = joblistingsDao.findById(jobid).orElseThrow(() -> new RuntimeException("Job not found"));

		// Cập nhật trạng thái hiện bài viết
		job.setActive(true);
		joblistingsDao.save(job);

		return "redirect:/admin"; // Quay về trang admin sau khi hiện bài viết
	}
	
	@GetMapping("/detailCV/{id}")
	public String showCVDetail(@PathVariable("id") Integer id, Model model) {
		JobSeekersEntity cv = jobSeekersDao.findById(id).orElse(null);
		model.addAttribute("cv", cv);
		return "chiTietCV";
	}
}
