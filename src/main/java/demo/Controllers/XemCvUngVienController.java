package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.dao.ApplicationsDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;

@Controller
@RequestMapping("/cvDetails")
public class XemCvUngVienController {

    @Autowired
    private ApplicationsDao applicationsDao;

    @RequestMapping("/{applicationId}")
    public String cvDetails(@PathVariable("applicationId") Integer applicationId, Model model) {
        // Lấy thông tin ứng tuyển từ database
        ApplicationsEntity applicationDetails = applicationsDao.findById(applicationId).orElse(null);
        
        if (applicationDetails == null) {
        	// Thêm thông báo lỗi vào model
            model.addAttribute("errorMessage", "Không tìm thấy thông tin ứng tuyển.");
            return "nhaTuyenDung"; // Trả về view với thông báo lỗi
        }

        // Lấy thông tin CV của người ứng tuyển
        JobSeekersEntity jobSeeker = applicationDetails.getJobseeker();
        
        // Thêm thông tin vào model để truyền sang view
        model.addAttribute("cv", jobSeeker);
        
        return "cvDetails"; // Trả về view chi tiết CV
    }
}
