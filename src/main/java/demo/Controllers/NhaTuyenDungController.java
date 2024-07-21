package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/job4u")
public class NhaTuyenDungController {
	
	@RequestMapping("/employers")
	public String nhaTuyenDung(){
		
		return"nhaTuyenDung";
	}
}
