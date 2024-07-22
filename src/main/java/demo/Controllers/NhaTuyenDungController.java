package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.services.SessionService;

@Controller
@RequestMapping("/job4u")
public class NhaTuyenDungController {
	@Autowired
	SessionService sessionService;
	
	@Autowired
	EmployersDao nhaTuyenDungDao;
	
	@Autowired
	JoblistingsDao danhSachViecLamDao;
	
	@RequestMapping("/employers")
	public String nhaTuyenDung(){
		
		return"nhaTuyenDung";
	}
	
	@RequestMapping("/employers/create")
	public String themTuyenDung(
			@RequestParam("companyname") String companyname,
			@RequestParam("companywebsite") String companywebsite,
			@RequestParam("address") String address,
			@RequestParam("industry") String industry,
			@RequestParam("jobtitle") String jobtitle,
			@RequestParam("salary") Double salary,
			@RequestParam("companydescription") String companydescription,
			@RequestParam("jobrequirements") String jobrequirements,
			@RequestParam("joblocation") String joblocation,
			
			Model model
			) {
		// Tạo một đối tượng JoblistingsEntity và EmployersEntity với các thông tin từ form
		
		return"nhaTuyenDung";
	}
	
}
