package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/CvUngVien")
public class CvUngVienController {
	@RequestMapping("")
	public String CvUngVien() {
		return "cvUngVien";
	}
}
