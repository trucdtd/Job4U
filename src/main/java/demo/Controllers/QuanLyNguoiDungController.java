package demo.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.dao.UsersDao;

import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;
import demo.entity.EmployersEntity;

@Controller
@RequestMapping("/job4u")
public class QuanLyNguoiDungController {
	@Autowired
	UsersDao userDao;

	@Autowired
	JoblistingsDao joblistingsDao;
	
	@Autowired
	EmployersDao employersDao;

	@RequestMapping("/userManager")
	public String quanlyUser() {

		return "quanLyNguoiDung";
	}

	@RequestMapping("/detailUser")
	public String chiTietTaiKhoan() {

		return "chiTietTaiKhoan";
	}
//
//	@RequestMapping("/detailPost")
//	public String chiTietBaiViet() {
//
//		return "chiTietBaiViet";
//	}
	
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

//    @GetMapping("/job4u/delete")
//    public String deleteJob(@RequestParam Long id) {
//        jobRepository.deleteById(id);
//        return "redirect:/job4u";
//    }


}
