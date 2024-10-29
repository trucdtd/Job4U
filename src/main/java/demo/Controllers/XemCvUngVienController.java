package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.dao.ApplicationsDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;
import demo.services.ApplicationService;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/cvDetails")
public class XemCvUngVienController {

    private static final Logger logger = LoggerFactory.getLogger(XemCvUngVienController.class);

    @Autowired
    private ApplicationsDao applicationsDao;
    
    @Autowired
	HttpSession ss;
    
    @Autowired
    private ApplicationService applicationService;

    @RequestMapping("/{applicationId}")
    public String cvDetails(@PathVariable("applicationId") Integer applicationId, Model model) {
        ApplicationsEntity applicationDetails = applicationsDao.findById(applicationId).orElse(null);
        
		
		  // Lấy danh sách CV của ứng viên dựa trên jobListingId
//		  List<ApplicationsEntity> cvList = 
//		  applicationsDao.findApplicationsByJoblistingId(applicationId);
		  
		  List<ApplicationsEntity> cvList = applicationsDao.findApplicationsByJoblistingId(applicationId);
	        
	        // Thêm danh sách CV vào mô hình
	        model.addAttribute("cvList", cvList);
		  // Thêm danh sách CV vào mô hình model.addAttribute("cvList", cvList);
		 
        
        if (applicationDetails == null) {
            model.addAttribute("errorMessage", "Không tìm thấy thông tin ứng tuyển.");
            return "nhaTuyenDung"; // Trả về view với thông báo lỗi
        }

        JobSeekersEntity jobSeeker = applicationDetails.getJobseeker();
        model.addAttribute("cv", jobSeeker);
        model.addAttribute("applicationId", applicationDetails.getApplicationid());

        return "cvDetails"; // Trả về view chi tiết CV
    }

    @PostMapping("/{applicationId}/accept")
    @ResponseBody
    public String acceptApplication(@PathVariable Integer applicationId) {
        try {
            applicationService.updateApplicationStatus(applicationId, 1);
            return "success";
        } catch (Exception e) {
            logger.error("Error updating application status: ", e);
            return "error";
        }
    }
    
    @PostMapping("/{applicationId}/reject")
    @ResponseBody
    public String rejectApplication(@PathVariable Integer applicationId) {
        try {
            applicationService.updateApplicationStatus(applicationId, 2); // Cập nhật status = 2
            return "success";
        } catch (Exception e) {
            logger.error("Error updating application status to rejected: ", e);
            return "error";
        }
    }

  

}
