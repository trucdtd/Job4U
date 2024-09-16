package demo.Controllers;

/*import java.lang.foreign.Linker.Option;*/
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.JobSeekersEntity;
import demo.entity.UsersEntity;
import demo.services.SessionService;
import demo.services.UserService;
import jakarta.persistence.Entity;

@Controller
@RequestMapping("/applyCV")
public class NopCV {
	@Autowired
	SessionService sessionService;

	@Autowired
	UserService userService;

	@Autowired
	UsersDao userDao;

	
	@Autowired
    private JobSeekersDao jobSeekersDao; // Thêm JobSeekersDao

    @RequestMapping("") // Điều chỉnh đường dẫn theo nhu cầu của bạn
    public String nopCV(Model model, RedirectAttributes redirectAttributes) {
    	 try {
             // Lấy userId từ session
             Integer userId = sessionService.getCurrentUser();
             if (userId == null) {
                 redirectAttributes.addFlashAttribute("error", "Người dùng chưa đăng nhập");
                 return "redirect:/Login";
             }

             // Lấy thông tin người dùng từ cơ sở dữ liệu
             UsersEntity nd = userDao.findById(userId).orElse(null);
             if (nd == null) {
                 redirectAttributes.addFlashAttribute("error", "Người dùng không tồn tại");
                 return "redirect:/Login";
             }
             
 
             // Thêm dữ liệu vào mô hình
             model.addAttribute("nd", nd); // Dữ liệu người dùng
            

         } catch (Exception e) {
             // Xử lý lỗi
             redirectAttributes.addFlashAttribute("error", "Đã xảy ra lỗi trong quá trình xử lý yêu cầu. Vui lòng thử lại sau.");
             return "redirect:/error"; // Điều hướng đến trang lỗi nếu có
         }

         // Trả về tên của view
         return "nopCV";
     }

	

	@PostMapping("/submit")
	public String requestMethodName(@RequestParam("fullname") String fullname, @RequestParam("major") String major,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("languages") String languages, @RequestParam("skills") String skills,
			@RequestParam("education") String education, @RequestParam("experience") String experience,
			@RequestParam("certifications") String certifications) {

		try {

			JobSeekersEntity entity = new JobSeekersEntity();
			entity.setExperience(experience);
			entity.setEducation(education);
			entity.setSkills(skills);
			entity.setCertifications(certifications);
			entity.setLanguages(languages);
//			entity.setUser()
		//	entity.setCreatedat(LocalDateTime.now());
			jobSeekersDao.save(entity);
			System.out.println("Insert thanh cong");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return "nopCV";
	}

	

}
