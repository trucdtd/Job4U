package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/job4u")
public class doimatkhauController {
	@RequestMapping("/DoiMatKhau")
    public String doiMatKhau() {
        return "doiMatKhau";
    }
}
