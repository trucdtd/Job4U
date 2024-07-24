package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;
import demo.services.SessionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/job4u")
public class TrangChuController {
	@Autowired
	JoblistingsDao danhSachViecLamDao;
	@Autowired
	EmployersDao nhatuyendungDao;

	@Autowired
	SessionService ss;

	@RequestMapping("")
	public String trangChu(Model model, @RequestParam("page") Optional<Integer> page) {
		// Phân trang
		Pageable pageable = PageRequest.of(page.orElse(0), 6);
		Page<JoblistingsEntity> dsSP = danhSachViecLamDao.findAll(pageable);
		model.addAttribute("dsSP", dsSP);
		return "trangChu";
	}

}
