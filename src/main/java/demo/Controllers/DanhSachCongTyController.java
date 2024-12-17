package demo.Controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.services.SessionService;
import org.springframework.web.bind.annotation.RequestParam;
import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;

import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/ListEmployers")
public class DanhSachCongTyController {
	@Autowired
	EmployersDao employersDao;

	@Autowired
	SessionService ss;
	@Autowired
	JoblistingsDao dao;

	@RequestMapping("")
	public String ListEmployerd(Model model, @RequestParam("page") Optional<Integer> page) {
		int pageNumber = page.orElse(0);
//		Pageable pageable = PageRequest.of(pageNumber, 8);
		Pageable pageable = PageRequest.of(pageNumber, 8);
		Page<EmployersEntity> dsCTy = employersDao.findAll(pageable);
		model.addAttribute("dsCTy", dsCTy);
		return "danhSachCongTy";
	}

	@RequestMapping("/{employerid}")
	public String chiTietCongTy(@PathVariable("employerid") Integer empid, Model model) {
	    EmployersEntity emp = employersDao.findById(empid).orElse(null);
	    if (emp == null) {
	        model.addAttribute("error", "Nhà tuyển dụng không tồn tại.");
	        return "errorPage"; // Trang lỗi
	    }
	    
	    List<JoblistingsEntity> validJobs = dao.findValidJobListingsByEmployer(emp);
	    model.addAttribute("list", validJobs);
	    model.addAttribute("emp", emp);
	    return "chiTietCongTy";
	}

}
