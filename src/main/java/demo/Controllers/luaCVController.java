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
	
	/* cv1 */
	@RequestMapping("/mauCV1")
	public String luaChonCV1() {
		return "maucv1";
	}
	
	@RequestMapping("/mauCV1ta")
	public String luaChonCV1TA() {
		return "maucv1ta";
	}
	
	@RequestMapping("/truocCV1")
	public String xtruocCV1() {
		return "xemtruoccv1";
	}
	/* cv2 */
	@RequestMapping("/mauCV2")
	public String luaChonCV2() {
		return "maucv4";
	}
	
	@RequestMapping("/mauCV2ta")
	public String luaChonCV2TA() {
		return "maucv2ta";
	}
	
	@RequestMapping("/truocCV2")
	public String xtruocCV2() {
		return "xemtruoccv2";
	}

	/* cv3 */
	@RequestMapping("/mauCV3")
	public String luaChonCV3() {
		return "maucv3";
	}
	
	@RequestMapping("/mauCV3ta")
	public String luaChonCV3TA() {
		return "maucv3ta";
	}
	
	@RequestMapping("/truocCV3")
	public String xtruocCV3() {
		return "xemtruoccv3";
	}
	
	/* cv4 */
	@RequestMapping("/mauCV4")
	public String luaChonCV4() {
		return "maucv2";
	}
	
	@RequestMapping("/mauCV4ta")
	public String luaChonCV4TA() {
		return "maucv4ta";
	}
	
	@RequestMapping("/truocCV4")
	public String xtruocCV4() {
		return "xemtruoccv4";
	}

}
