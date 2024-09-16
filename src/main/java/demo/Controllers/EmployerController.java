package demo.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.dao.EmployersDao;
import demo.entity.EmployersEntity;
import demo.services.JoblistingsService;

@Controller
@RequestMapping("/top-employers")
public class EmployerController {

    @Autowired
    private JoblistingsService jobListingService;

    @GetMapping
    public String getTopEmployers(Model model) {
        List<EmployersEntity> topEmployers = jobListingService.getTop3Employers();  // Sử dụng dịch vụ đúng
        model.addAttribute("employers", topEmployers);
        return "nhaTuyenDungHangDau";  // Đảm bảo tên view chính xác
    }
    
    
}