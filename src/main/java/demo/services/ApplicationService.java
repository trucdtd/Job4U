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

	public void updateApplicationStatus(Integer applicationId, Integer status) {
	    ApplicationsEntity application = applicationsDao.findById(applicationId)
	            .orElseThrow(() -> new RuntimeException("Application not found"));

	    application.setStatus(status);
	    applicationsDao.save(application);
	}


}
