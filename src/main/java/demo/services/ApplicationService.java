package demo.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.ApplicationsDao;
import demo.entity.ApplicationsEntity;

@Service
public class ApplicationService {
	@Autowired
    private ApplicationsDao applicationsDao; // Repository để truy cập CSDL


	public boolean updateStatus(Integer applicationId, Integer newStatus) {
	    Optional<ApplicationsEntity> applicationOpt = applicationsDao.findById(applicationId);
	    if (applicationOpt.isPresent()) {
	        ApplicationsEntity application = applicationOpt.get();
	        // Kiểm tra trạng thái hiện tại (giả sử bạn chỉ cập nhật nếu trạng thái hiện tại là 0)
	        if (application.getStatus() == 0) {
	            application.setStatus(newStatus); // Cập nhật trạng thái mới
	            applicationsDao.save(application); // Lưu vào cơ sở dữ liệu
	            return true;
	        }
	    }
	    return false; // Trả về false nếu không tìm thấy hoặc trạng thái không hợp lệ
	}

	
}
