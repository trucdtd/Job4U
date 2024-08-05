package demo.Controllers;

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

import demo.dao.JoblistingsDao;
import demo.dao.UsersDao;
import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;

@Controller
@RequestMapping("/job4u")
public class QuanLyNguoiDungController {
	@Autowired
	UsersDao userDao;
	
	@Autowired
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
	
	

	@RequestMapping("/userManager/detailUser/{id}")
	public String chiTietTaiKhoan(@PathVariable("id") Integer id, Model model) {
		 UsersEntity nd = userDao.findById(id).orElse(null);
	        model.addAttribute("nd", nd);
	       
		return "chiTietTaiKhoan";
	}
	
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