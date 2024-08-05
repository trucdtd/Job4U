package demo.Controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;
import demo.services.JoblistingsService;
import demo.services.SessionService;

@Controller
@RequestMapping("/job4u")
public class ChiTietUngTuyenController {
	@Autowired
    JoblistingsService joblistingsService;
	
	@RequestMapping("/chiTiet/{jobid}")
    public String ChiTietUngTuyen(@PathVariable("jobid") Integer jobid, Model model) {
        JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);
        model.addAttribute("job", chiTietUngTuyen);
        return "chiTietUngTuyen";
    }
}
