package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employers")
public class NhaTuyenDungController {
	@RequestMapping("")
	public String nhaTuyenDung() {
		return "nhaTuyenDung";
	}
}
