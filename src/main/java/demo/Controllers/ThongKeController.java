package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/thongke")
public class ThongKeController {
	@RequestMapping("")
	public String thongKe() {
		return "thongKeMoi";
	}
}