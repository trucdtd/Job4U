package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JoblistingsDao;
import demo.dao.UserServicesDao;
import demo.dao.UsersDao;
import demo.entity.UserServicesEntity;
import demo.entity.UsersEntity;
import demo.services.ThongKeService;

@Controller
@RequestMapping("")
public class ThongKeController {

	@Autowired
	UsersDao userDao;

	@Autowired
	JoblistingsDao joblistingsDao;
	
	@Autowired
	UserServicesDao userServicesDao;

	@GetMapping("/thongke")
	public String getStatistics(Model model) {
	    List<UserServicesEntity> qlTK = userServicesDao.findAll();
	    System.out.println("Data fetched: " + qlTK); // Check if this list is empty or null
	    model.addAttribute("qlTK", qlTK);
	    return "thongKeMoi";
	}
}
