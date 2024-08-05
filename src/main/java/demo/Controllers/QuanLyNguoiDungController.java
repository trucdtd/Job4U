package demo.Controllers;

import java.util.List;
<<<<<<< HEAD
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

=======

import org.springframework.beans.factory.annotation.Autowired;
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
>>>>>>> dev
import demo.dao.JoblistingsDao;
import demo.dao.UsersDao;
import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;

import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;
import demo.entity.EmployersEntity;

@Controller
@RequestMapping("/user")
public class QuanLyNguoiDungController {
	@Autowired
	UsersDao userDao;

	@Autowired
	JoblistingsDao joblistingsDao;
	
	@Autowired
<<<<<<< HEAD
	JoblistingsDao joblistDao;
	

	
	
	@RequestMapping("/userManager")
	 public String quanLyNguoiDung(Model model, @RequestParam(value = "page", required = false) String page) {
        if (page == null || page.equals("quanLyTaiKhoan")) {
            List<UsersEntity> dsND = userDao.findAll();
            model.addAttribute("dsND", dsND);
        }
        return "quanLyNguoiDung"; 
         // Trả về trang mặc định nếu không có page hoặc page không phải là quanLyUngTuyen
    }
	
	
=======
	EmployersDao employersDao;
	
	@Autowired
    private JdbcTemplate jdbcTemplate;

	@RequestMapping("")
	public String quanlyUser() {

		return "quanLyNguoiDung";
	}

	@RequestMapping("/detailUser")
	public String chiTietTaiKhoan() {
>>>>>>> dev

	@RequestMapping("/userManager/detailUser/{id}")
	public String chiTietTaiKhoan(@PathVariable("id") Integer id, Model model) {
		 UsersEntity nd = userDao.findById(id).orElse(null);
	        model.addAttribute("nd", nd);
	       
		return "chiTietTaiKhoan";
	}
	
<<<<<<< HEAD
//	@Autowired
//    private JdbcTemplate jdbcTemplate;
//	
//	@PostMapping("/userManager/updateUser/{id}")
//	 public String updateUser(
//		        @PathVariable("id") Integer userid,
//		        @RequestParam String username,
//		        @RequestParam String fullname,
//		        @RequestParam String email,
//		        @RequestParam String password,
//		        @RequestParam String phonenumber,
//		        @RequestParam String role,
//		        RedirectAttributes redirectAttributes
//		    ) {
//		        // Kiểm tra các trường không được bỏ trống
//		        if (username.isEmpty() || fullname.isEmpty() || email.isEmpty() || password.isEmpty() || phonenumber.isEmpty() || role.isEmpty()) {
//		            redirectAttributes.addFlashAttribute("error", "Tất cả các trường đều phải được điền!");
//		            return "redirect:/userManager/detailUser/" + userid;
//		        }
//
//		        // Kiểm tra độ dài mật khẩu
//		        if (password.length() < 8) {
//		            redirectAttributes.addFlashAttribute("error", "Mật khẩu phải có độ dài tối thiểu 8 ký tự!");
//		            return "redirect:/userManager/detailUser/" + userid;
//		        }
//
//		        // Kiểm tra định dạng email
//		        String emailRegex = "^[A-Za-z0-9._%+-]+@(gmail\\.com|fpt\\.edu\\.vn)$";
//		        Pattern emailPattern = Pattern.compile(emailRegex);
//		        if (!emailPattern.matcher(email).matches()) {
//		            redirectAttributes.addFlashAttribute("error", "Định dạng email không hợp lệ!");
//		            return "redirect:/userManager/detailUser/" + userid;
//		        }
//
//		        // Kiểm tra số điện thoại phải đủ 10 số
//		        String phoneRegex = "^\\d{10}$";
//		        Pattern phonePattern = Pattern.compile(phoneRegex);
//		        if (!phonePattern.matcher(phonenumber).matches()) {
//		            redirectAttributes.addFlashAttribute("error", "Số điện thoại phải đủ 10 số và không được nhập chữ!");
//		            return "redirect:/userManager/detailUser/" + userid;
//		        }
//
//		        // Cập nhật thông tin người dùng
//		        String sql = "UPDATE Users SET username = ?, fullname = ?, email = ?, password = ?, phonenumber = ?, role = ? WHERE userid = ?";
//		        try {
//		            int rows = jdbcTemplate.update(sql, username, fullname, email, password, phonenumber, role, userid);
//		            if (rows > 0) {
//		                redirectAttributes.addFlashAttribute("message", "Cập nhật thông tin người dùng thành công!");
//		            } else {
//		                redirectAttributes.addFlashAttribute("error", "Không tìm thấy người dùng cần cập nhật!");
//		            }
//		        } catch (Exception e) {
//		            redirectAttributes.addFlashAttribute("error", "Cập nhật thông tin người dùng thất bại! Lỗi: " + e.getMessage());
//		        }
//		        
//		        return "redirect:/job4u/userManager";
//		    }

	
	
	@RequestMapping("/detailPost")
	public String chiTietBaiViet() {

		return "chiTietBaiViet";
	}
	
	
	
    
}
=======
	////////
	
	@RequestMapping("/quanLyBaiViet")
	public String quanLyBaiViet(Model model) {
		List<JoblistingsEntity> qlBV = joblistingsDao.findAll();
		model.addAttribute("qlBV", qlBV);
		return "quanLyNguoiDung";
	}
	
	@GetMapping("/detail/{id}")
    public String showPostDetail(@PathVariable("id") Integer id, Model model) {
        JoblistingsEntity bv = joblistingsDao.findById(id).orElse(null);
        model.addAttribute("bv", bv);
        return "chiTietBaiViet";
    }
	
	/*
	 * @GetMapping("/delete/{id}") public String deleteUser(@PathVariable("id")
	 * Integer id, RedirectAttributes redirectAttributes) { String sql =
	 * "DELETE FROM joblistings WHERE jobid = ?"; try { int rows =
	 * jdbcTemplate.update(sql, id); if (rows > 0) {
	 * redirectAttributes.addFlashAttribute("message",
	 * "Xóa người dùng thành công!"); } else {
	 * redirectAttributes.addFlashAttribute("error",
	 * "Không tìm thấy người dùng cần xóa!"); } } catch (Exception e) {
	 * redirectAttributes.addFlashAttribute("error",
	 * "Xóa người dùng thất bại! Lỗi: " + e.getMessage()); } return
	 * "redirect:/user/quanLyBaiViet"; }
	 */
	
	@DeleteMapping("/delete/{jobid}")
    public ResponseEntity<Void> deleteJob(@PathVariable Integer jobid) {
        joblistingsDao.deleteById(jobid);
        return ResponseEntity.noContent().build();
    }


}
>>>>>>> dev
