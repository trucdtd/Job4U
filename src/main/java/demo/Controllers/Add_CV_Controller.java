package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/job4u/profile")
public class Add_CV_Controller {
	@GetMapping("")
	public String home() {
		return "trangCaNhanNguoiTimViec";
	}
	
	@GetMapping("/addCV")
	public String main() {
		return "trangCaNhanNguoiTimViec";
	}
}
