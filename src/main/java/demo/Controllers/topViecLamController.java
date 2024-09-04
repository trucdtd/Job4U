package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/topvieclam")
public class topViecLamController {
	@GetMapping("")
    public String vieclam() {
        return "topViecLam"; 
    }
}
