package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.services.SessionService;

@Controller
@RequestMapping("/job4u")
public class NhaTuyenDungController {
	@Autowired
	SessionService sessionService;
	
	
	
	@RequestMapping("/employers")
	public String nhaTuyenDung(){
		
		return"nhaTuyenDung";
	}
	
	
}
