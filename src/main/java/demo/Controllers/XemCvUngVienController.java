package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.dao.ApplicationsDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;
import demo.services.ApplicationService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/cvDetails")
public class XemCvUngVienController {

    private static final Logger logger = LoggerFactory.getLogger(XemCvUngVienController.class);

    @Autowired
    private ApplicationsDao applicationsDao;
    
    @Autowired
    private ApplicationService applicationService;

    @RequestMapping("/{applicationId}")
    public String cvDetails(@PathVariable("applicationId") Integer applicationId, Model model) {
        ApplicationsEntity applicationDetails = applicationsDao.findById(applicationId).orElse(null);
        
        if (applicationDetails == null) {
            model.addAttribute("errorMessage", "Không tìm thấy thông tin ứng tuyển.");
            return "nhaTuyenDung"; // Trả về view với thông báo lỗi
        }

        JobSeekersEntity jobSeeker = applicationDetails.getJobseeker();
        model.addAttribute("cv", jobSeeker);
        model.addAttribute("applicationId", applicationDetails.getApplicationid());

        return "cvDetails"; // Trả về view chi tiết CV
    }

    @PostMapping("/updateStatus")
    public String updateApplicationStatus(
            @RequestParam Integer applicationid, 
            @RequestParam Integer status,
            RedirectAttributes redirectAttributes) {
        
        // In ra thông tin nhận được
        System.out.println("Received applicationId: " + applicationid + ", status: " + status);

        // Gọi dịch vụ để cập nhật trạng thái
        boolean isUpdated = applicationService.updateStatus(applicationid, status);
        if (isUpdated) {
            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật trạng thái ứng tuyển thành công.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy ứng tuyển hoặc trạng thái không hợp lệ.");
        }

        // Chuyển hướng về trang chi tiết CV
        return "redirect:/cvDetails/" + applicationid;
    }

}
