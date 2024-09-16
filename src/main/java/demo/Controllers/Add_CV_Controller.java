package demo.Controllers;


import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.JobSeekersEntity;
import demo.entity.UsersEntity;
import demo.services.SessionService;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/job4u/profile")
public class Add_CV_Controller {
	@Autowired
	JobSeekersDao dao;
	@Autowired
	HttpSession ss;
	@Autowired
	UsersDao userDao;

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
	public String postUpdateCV(Model model, JobSeekersEntity entity) {
		model.addAttribute("entity", entity);
		Integer id = Integer.parseInt(ss.getAttribute("userid").toString());
		UsersEntity user = userDao.findByUserid(id);
		entity.setUser(user);
		entity.setCreatedat(java.time.LocalDate.now());
		entity.setUpdatedat(java.time.LocalDate.now());
		dao.save(entity);
		String giaoDien = "info-cv.jsp";
		model.addAttribute("page", giaoDien);
		return "trangCaNhanNguoiTimViec";
	}

}
