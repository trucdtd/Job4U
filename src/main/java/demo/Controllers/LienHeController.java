package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lienhe")
public class LienHeController {
	@GetMapping("")
    public String hotline() {
        return "lienHe"; 
    }
}
