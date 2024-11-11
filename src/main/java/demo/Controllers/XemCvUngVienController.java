package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import demo.dao.ApplicationsDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;
import demo.services.ApplicationService;
import demo.services.EmailService;
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
	 private EmailService emailService;  // Inject EmailService để gửi email
	
	@Autowired
	private ApplicationService applicationService;

	@RequestMapping("/{applicationId}")
	public String cvDetails(@PathVariable("applicationId") Integer applicationId, HttpSession ss, Model model) {
		ApplicationsEntity applicationDetails = applicationsDao.findById(applicationId).orElse(null);

		List<ApplicationsEntity> cvList = applicationsDao.findApplicationsByApplicationId(applicationId);
		System.out.println("Số lượng CV tìm thấy: " + cvList.size());

		model.addAttribute("cvList", cvList);

		// Thêm danh sách CV vào mô hình model.addAttribute("cvList", cvList);

		if (applicationDetails == null) {
			model.addAttribute("errorMessage", "Không tìm thấy thông tin ứng tuyển.");
			return "nhaTuyenDung"; // Trả về view với thông báo lỗi
		}

		if (applicationDetails != null && applicationDetails.getFilename() != null) {
			model.addAttribute("filename", applicationDetails.getFilename());
			return "cvNopFile"; // Hiển thị giao diện khi ứng viên đã nộp CV
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
	        // Cập nhật trạng thái đơn ứng tuyển thành "chấp nhận"
	        applicationService.updateApplicationStatus(applicationId, 1);

	        // Lấy thông tin ứng viên
	        JobSeekersEntity jobSeeker = applicationService.getJobSeekerById(applicationId);
	        String applicantEmail = jobSeeker.getEmailcv();
	        String applicantName = jobSeeker.getFullnamecv();

	        // Lấy thông tin công việc (JoblistingsEntity)
	        JoblistingsEntity jobListing = applicationService.getJobListingByApplicationId(applicationId);
	        String companyName = jobListing.getEmployer().getCompanyname();
	        String jobTitle = jobListing.getJobtitle();

	        // Gửi email thông báo chấp nhận
	        emailService.sendAcceptanceEmail(applicantEmail, applicantName, companyName, jobTitle);

	        return "success";
	    } catch (Exception e) {
	        logger.error("Error updating application status for applicationId: " + applicationId, e);
	        return "error: " + e.getMessage();  // Trả về thông điệp lỗi chi tiết
	    }
	}


    @PostMapping("/{applicationId}/reject")
    @ResponseBody
    public String rejectApplication(@PathVariable Integer applicationId) {
        try {
            // Cập nhật trạng thái đơn ứng tuyển thành "từ chối"
            applicationService.updateApplicationStatus(applicationId, 2);

            // Lấy thông tin ứng viên
            JobSeekersEntity jobSeeker = applicationService.getJobSeekerById(applicationId);
            String applicantEmail = jobSeeker.getEmailcv();
            String applicantName = jobSeeker.getFullnamecv();

            // Lấy thông tin công việc (JoblistingsEntity)
	        JoblistingsEntity jobListing = applicationService.getJobListingByApplicationId(applicationId);
	        String companyName = jobListing.getEmployer().getCompanyname();
	        String jobTitle = jobListing.getJobtitle();
	        
            // Gửi email thông báo từ chối
            emailService.sendRejectionEmail(applicantEmail, applicantName, companyName, jobTitle);

            return "success";
        } catch (Exception e) {
            logger.error("Error updating application status to rejected: ", e);
            return "error";
        }
    }

}
