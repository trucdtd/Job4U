package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/luaCV")
public class luaCVController {
	
	
	@RequestMapping("")
	public String luaChonCV() {
		return "luaChonCV";
	}

}
