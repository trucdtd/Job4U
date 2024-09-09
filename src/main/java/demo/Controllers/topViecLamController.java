package demo.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.entity.JoblistingsEntity;
import demo.services.topJobService;  // Đổi tên lớp dịch vụ tại đây

@Controller
@RequestMapping("/topvieclam")
public class topViecLamController {   
    @GetMapping("")
    public String vieclam(Model model) {
//        List<JoblistingsEntity> topJobs = jobService.Query();
//        model.addAttribute("topJobs", topJobs);
//        Page<JoblistingsEntity> dsSP = jobService.getJobList(PageRequest.of(0, 10));
//        model.addAttribute("dsSP", dsSP);

        return "topViecLam";
    }
}


