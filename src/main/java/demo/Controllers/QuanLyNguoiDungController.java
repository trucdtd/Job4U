package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.dao.UsersDao;

@Controller
@RequestMapping("/job4u")
public class QuanLyNguoiDungController {
	@Autowired
	UsersDao userDao;
	
	@RequestMapping("/userManager")
	public String quanlyUser() {

		return "quanLyNguoiDung";
	}

	@RequestMapping("/userManager/detailUser")
	public String chiTietTaiKhoan() {

		return "chiTietTaiKhoan";
	}

	@RequestMapping("/userManager/detailPost")
	public String chiTietBaiViet() {

		return "chiTietBaiViet";
	}
}
