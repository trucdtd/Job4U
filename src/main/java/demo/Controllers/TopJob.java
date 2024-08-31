package demo.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;

@Controller
public class TopJob {
	@Autowired
	JoblistingsDao dao;
	@RequestMapping("job4u/topjob")
	public String main(Model model) {
		List<JoblistingsEntity> list = dao.findTop5ByOrderByPosteddateDesc();
		model.addAttribute("list", list);
		return "topViecLam";
	}

}
