package demo.Controllers;

import java.math.BigDecimal;
import java.time.LocalDate;
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
import demo.dao.PaymentsDao;
import demo.dao.ServicesDao;
import demo.dao.UsersDao;
import demo.entity.JoblistingsEntity;
import demo.entity.PaymentsEntity;
import demo.entity.ServicesEntity;
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
	ServicesDao servicesDao;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	UserService userService;
	
	@Autowired
	PaymentsDao paymentsDao;

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

			List<ServicesEntity> qldv = servicesDao.findAll();
			model.addAttribute("qldv", qldv);
			
			List<PaymentsEntity> qlnm = paymentsDao.findAll();
			model.addAttribute("qlnm", qlnm);
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
	public String deleteUser(@RequestParam("userid") Integer userid, RedirectAttributes redirectAttributes,
			HttpSession session) {
		Integer loggedInUserId = (Integer) session.getAttribute("loggedInUserId");

		// Kiểm tra người dùng đang cố gắng xóa chính mình
		if (userid.equals(loggedInUserId)) {
			redirectAttributes.addAttribute("error", "Bạn không thể xóa tài khoản của chính mình.");
			return "redirect:/admin";
		}

		// Kiểm tra role của người dùng
		String roleSql = "SELECT role FROM Users WHERE userid = ?";
		Integer userRole = jdbcTemplate.queryForObject(roleSql, new Object[] { userid }, Integer.class);

		if (userRole != null && userRole == 0) {
			redirectAttributes.addAttribute("error", "Không thể xóa người dùng có quyền Admin");
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
			redirectAttributes.addAttribute("error",
					"Xóa thất bại do người dùng đang ứng tuyển hoặc đang sử dụng dịch vụ.");
			e.printStackTrace();
		} catch (Exception e) {
			redirectAttributes.addAttribute("error", "Xóa người dùng thất bại. Lỗi: " + e.getMessage());
			e.printStackTrace();
			
		}

		return "redirect:/admin"; // Chuyển hướng về trang admin
	}

	@PostMapping("/lock/{id}")
	public String lockUserAccount(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes,
			HttpSession session) {
		try {

			// Kiểm tra vai trò của người dùng
			UsersEntity user = userDao.findById(id).orElse(null);

			// Kiểm tra vai trò
			if (user.getRole() != null && user.getRole() == 0) {
				redirectAttributes.addAttribute("error",
						"Không thể khóa tài khoản Admin.");				
				return "redirect:/admin/detailUser/" + id;
			}

			// Cập nhật trạng thái khóa tài khoản
			user.setStatus(false); // false để khóa tài khoản
			userDao.save(user); // Lưu lại thay đổi

			redirectAttributes.addAttribute("error",
					"Tài khoản đã được khóa thành công!");	
			return "redirect:/admin/detailUser/" + id; // Quay về trang admin
		} catch (Exception e) {
			redirectAttributes.addAttribute("error", "Lỗi khi khóa tài khoản: " + e.getMessage());
			return "redirect:/admin/detailUser/" + id; // Quay về trang admin nếu có lỗi
		}
	}

	@PostMapping("/open/{id}")
	public String openUserAccount(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		try {

			UsersEntity user = userDao.findById(id).orElse(null);

			// Cập nhật trạng thái mở tài khoản
			user.setStatus(true); // true để mở tài khoản
			userDao.save(user); // Lưu lại thay đổi

			redirectAttributes.addAttribute("error", "Tài khoản đã được mở thành công!");

			return "redirect:/admin/detailUser/" + id; // Quay về trang admin
		} catch (Exception e) {
			redirectAttributes.addAttribute("error", "Lỗi khi mở tài khoản: " + e.getMessage());
			System.out.println("Lỗi khi mở tài khoản: " + e.getMessage());
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
	    
	    // Câu truy vấn để kiểm tra xem bài viết có liên quan đến dịch vụ đang hoạt động không
	    String checkServiceSql = "SELECT COUNT(*) FROM UserServices us JOIN Joblistings p ON us.userserviceid = p.userserviceid WHERE p.jobid = ? AND us.isactive = 1";
	    String deleteApplicationsSql = "DELETE FROM Applications WHERE JobID = ?";
	    String deleteJobListingsSql = "DELETE FROM Joblistings WHERE JobID = ?";
	    try {
	        int serviceCount = jdbcTemplate.queryForObject(checkServiceSql, Integer.class, id);
	        if (serviceCount > 0) {
	            // Nếu bài viết đang mua dịch vụ, cập nhật trạng thái bài viết thành ẩn (active = false)
	            joblistingsDao.updatePostActiveStatus(id, false);  // Cập nhật bài viết thành "Đang ẩn"
	            redirectAttributes.addFlashAttribute("message", "Bài viết không thể xóa vì đang mua dịch vụ. Trạng thái đã được cập nhật thành 'Đang ẩn'.");
	            return "redirect:/admin";
	        }

	        // Nếu không có dịch vụ, xóa các bản ghi liên quan trong bảng Applications và Joblistings
	        jdbcTemplate.update(deleteApplicationsSql, id);
	        jdbcTemplate.update(deleteJobListingsSql, id);

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

		return "redirect:/chiTietBaiViet"; // Quay về trang admin sau khi ẩn bài viết
	}

	@PostMapping("/showPost/{jobid}")
	public String showPost(@PathVariable Integer jobid) {
		// Lấy thông tin bài viết từ database
		JoblistingsEntity job = joblistingsDao.findById(jobid).orElseThrow(() -> new RuntimeException("Job not found"));

		// Cập nhật trạng thái hiện bài viết
		job.setActive(true);
		joblistingsDao.save(job);

		return "redirect:/chiTietBaiViet"; // Quay về trang admin sau khi hiện bài viết
	}

	@GetMapping("/detailCV/{id}")
	public String showCVDetail(@PathVariable("id") Integer id, Model model) {
		JobSeekersEntity cv = jobSeekersDao.findById(id).orElse(null);
		model.addAttribute("cv", cv);
		return "chiTietCV";
	}

	@GetMapping("/detailDV/{id}")
	public String showDVDetail(@PathVariable("id") Integer id, Model model) {
		ServicesEntity dv = servicesDao.findById(id).orElse(null);
		model.addAttribute("dv", dv);
		return "chiTietDichVu";
	}
	

	@PostMapping("/updateDV/{id}")
	public String capnhatDv(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes,
	                        @RequestParam("servicename") String servicename,
	                        @RequestParam("price") String price,
	                        @RequestParam("description") String description) {
	    // Tìm dịch vụ theo id
	    ServicesEntity updv = servicesDao.findById(id).orElse(null);
	    
	    if (updv != null) {
	        // Cập nhật tên dịch vụ và mô tả
	        updv.setServicename(servicename);
	        updv.setDescription(description);
	        
	        // Chuyển đổi price từ String sang BigDecimal
	        try {
	            BigDecimal priceValue = new BigDecimal(price); // Chuyển đổi giá trị chuỗi sang BigDecimal
	            updv.setPrice(priceValue); // Lưu giá trị đã chuyển đổi
	        } catch (NumberFormatException e) {
	            // Nếu không thể chuyển đổi, bạn có thể xử lý lỗi hoặc để giá trị mặc định
	        	redirectAttributes.addAttribute("error", "Giá không hợp lệ!");
	            return "quanLyNguoiDung"; // Trả về trang quản lý với thông báo lỗi
	        }
	        
	        // Lưu dịch vụ sau khi cập nhật
	        servicesDao.save(updv);
	        
	        // Trả về trang với thông báo thành công (có thể thêm thông báo vào model nếu cần)
	        redirectAttributes.addAttribute("error", "Cập nhật dịch vụ thành công!");
	        return "redirect:/admin";
	    } else {
	        // Nếu không tìm thấy dịch vụ với id đã cho
	    	redirectAttributes.addAttribute("error", "Dịch vụ không tồn tại!");
	        return "redirect:/admin";
	    }
	}
	
	@PostMapping("/newDv")
	public String themoiDv(RedirectAttributes redirectAttributes,
	                       @RequestParam("servicename") String servicename,
	                       @RequestParam("price") String price,
	                       @RequestParam("description") String description,
	                       @RequestParam("numberofjobsallowed") Integer numberofjobsallowed,
	                       @RequestParam("durationindays") Integer durationindays) {
	    // Tạo mới đối tượng dịch vụ
	    ServicesEntity newDv = new ServicesEntity();
	    
	    // Cập nhật các thuộc tính cho dịch vụ mới
	    newDv.setServicename(servicename);
	    newDv.setDescription(description);
	    
	    // Cập nhật ngày tạo và ngày cập nhật (sử dụng ngày hiện tại)
	    LocalDate currentDate = LocalDate.now();  // Lấy ngày hiện tại
	    newDv.setCreatedat(currentDate);
	    newDv.setUpdatedat(currentDate);  // Ban đầu, ngày cập nhật cũng là ngày tạo
	    
	    // Chuyển đổi price từ String sang BigDecimal
	    try {
	        BigDecimal priceValue = new BigDecimal(price); // Chuyển đổi giá trị chuỗi sang BigDecimal
	        // Kiểm tra nếu giá tiền không hợp lệ (ví dụ: giá nhỏ hơn hoặc bằng 0)
	        if (priceValue.compareTo(BigDecimal.ZERO) <= 0) {
	            throw new NumberFormatException("Giá phải lớn hơn 0");
	        }
	        newDv.setPrice(priceValue); // Lưu giá trị đã chuyển đổi
	    } catch (NumberFormatException e) {
	        // Nếu không thể chuyển đổi hoặc giá không hợp lệ, trả thông báo lỗi
	        redirectAttributes.addAttribute("error", "Giá không hợp lệ! " + e.getMessage());
	        return "redirect:/admin"; // Trả về trang quản lý với thông báo lỗi
	    }
	    
	    // Kiểm tra tính hợp lệ của numberofjobsallowed
	    if (numberofjobsallowed <= 0) {
	        redirectAttributes.addAttribute("error", "Số lượng công việc phải lớn hơn 0");
	        return "redirect:/admin"; // Trả về trang quản lý với thông báo lỗi
	    }

	    // Lưu số lượng công việc vào đối tượng
	    newDv.setNumberofjobsallowed(numberofjobsallowed);

	    // Kiểm tra tính hợp lệ của durationindays
	    if (durationindays <= 0) {
	        redirectAttributes.addAttribute("error", "Số ngày không hợp lệ. Phải lớn hơn 0.");
	        return "redirect:/admin"; // Trả về trang quản lý với thông báo lỗi
	    }

	    // Lưu durationindays vào đối tượng
	    newDv.setDurationindays(durationindays);

	    // Lưu dịch vụ mới vào cơ sở dữ liệu
	    servicesDao.save(newDv);
	    
	    // Trả về trang với thông báo thành công
	    redirectAttributes.addAttribute("error", "Thêm dịch vụ thành công!");
	    return "redirect:/admin";
	}



}
