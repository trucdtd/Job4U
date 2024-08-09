package demo.Controllers;

import java.time.format.DateTimeFormatter;
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
import demo.entity.JobSeekersEntity;
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
	    // Lấy thông tin chi tiết công việc
	    JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);
	    
	    // Định dạng ngày giờ
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
	    String formattedPostedDate = chiTietUngTuyen.getPosteddate().format(formatter);
	    String formattedApplicationDeadline = chiTietUngTuyen.getApplicationdeadline().format(formatter);
	    
	    // Thêm các thuộc tính vào mô hình
	    model.addAttribute("formattedPostedDate", formattedPostedDate);
	    model.addAttribute("formattedApplicationDeadline", formattedApplicationDeadline);
	    model.addAttribute("job", chiTietUngTuyen);
	    
	    return "chiTietUngTuyen";
	}
}
