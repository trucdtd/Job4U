package demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.EmployersDao;
import demo.dao.JobSeekersDao;
import demo.dao.JoblistingsDao;
import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;

@Service
public class JoblistingsService {
	@Autowired
    private JoblistingsDao joblistingsDao;
	
	@Autowired
	private JobSeekersDao jobSeekersDao;
	
	@Autowired
	private EmployersDao employersDao;
	

	public List<JoblistingsEntity> getAllJoblistings() {
        return joblistingsDao.findAll();
    }

	public JoblistingsEntity getJoblistingById(Integer jobid) {
        return joblistingsDao.findById(jobid).orElse(null);
    } 
	
	 public List<JoblistingsEntity> getTop5LatestJobListings() {
	        return joblistingsDao.findTop5LatestJobListings();
	    }
	 public interface jobListingsService {
		    int countPostsToday();
		    int countPostsThisMonth();
		}
//	 public List<EmployersEntity> getTop3Employers() {
//	        // Lấy các EmployerID từ bài viết mới nhất
//	        List<Integer> topEmployerIds = joblistingsDao.findTop3EmployerIds();
//
//	        // Tìm các nhà tuyển dụng bằng EmployerID
//	        return employersDao.findAllById(topEmployerIds);
//	    }
	
	
	//job have services
//	 public List<JoblistingsEntity> getJobsByUserServiceId(Integer userServiceId) {
//	        return joblistingsDao.findJobsByUserServiceId(userServiceId);
//	    }
}
