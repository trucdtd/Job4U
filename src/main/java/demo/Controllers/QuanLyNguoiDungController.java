package demo.Controllers;

import java.util.List;

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
import demo.dao.JoblistingsDao;
import demo.dao.UsersDao;

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
	EmployersDao employersDao;
	
	@Autowired
    private JdbcTemplate jdbcTemplate;

	@RequestMapping("")
	public String quanlyUser() {

		return "quanLyNguoiDung";
	}

	@RequestMapping("/detailUser")
	public String chiTietTaiKhoan() {

		return "chiTietTaiKhoan";
	}
	
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
