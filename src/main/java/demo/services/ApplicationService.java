package demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.ApplicationsDao;
import demo.dao.JobSeekersDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;

@Service
public class ApplicationService {

    @Autowired
    private ApplicationsDao applicationsDao; // Repository để truy cập CSDL

    @Autowired
    private JobSeekersDao jobSeekersDao; // Repository để lấy thông tin ứng viên

    public void updateApplicationStatus(Integer applicationId, Integer status) {
        // Tìm đơn ứng tuyển
        ApplicationsEntity application = applicationsDao.findById(applicationId)
                .orElseThrow(() -> new RuntimeException("Application not found"));

        // Cập nhật trạng thái đơn ứng tuyển
        application.setStatus(status);
        applicationsDao.save(application);
    }

    // Lấy thông tin ứng viên từ applicationId
    public JobSeekersEntity getJobSeekerById(Integer applicationId) {
        // Giả sử bạn có phương thức tìm ứng viên theo ID của đơn ứng tuyển
        ApplicationsEntity application = applicationsDao.findById(applicationId)
                .orElseThrow(() -> new RuntimeException("Application not found"));
        return application.getJobseeker();  // Lấy ứng viên từ đơn ứng tuyển
    }
}
