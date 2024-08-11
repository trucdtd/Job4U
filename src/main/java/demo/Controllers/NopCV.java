package demo.Controllers;

/*import java.lang.foreign.Linker.Option;*/
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.JobSeekersEntity;
import demo.entity.UsersEntity;
import demo.services.SessionService;
import jakarta.persistence.Entity;

@Controller
@RequestMapping("/job4u")
public class NopCV {
	@Autowired
	SessionService ss;
	
	@Autowired
	UsersDao userDAO;
	
	@Autowired
	JobSeekersDao dao;
	
	@RequestMapping("/newCV")
	public String nopCV() {
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
			entity.setCreatedat(LocalDateTime.now());			
			dao.save(entity);
			System.out.println("Insert thanh cong");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return "nopCV";
	}

	private Integer Optional(int i) {
		// TODO Auto-generated method stub
		return null;
	}

}
