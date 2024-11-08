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

	@RequestMapping("/mauCV1")
	public String luaChonCV1() {
		return "maucv1";
	}

	@RequestMapping("/mauCV2")
	public String luaChonCV2() {
		return "maucv2";
	}

	@RequestMapping("/mauCV3")
	public String luaChonCV3() {
		return "maucv3";
	}
	
	@RequestMapping("/mauCV4")
	public String luaChonCV4() {
		return "maucv4";
	}

}
