package demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;

@Service
public class JoblistingsService {
	@Autowired
    private JoblistingsDao joblistingsDao;

	public List<JoblistingsEntity> getAllJoblistings() {
        return joblistingsDao.findAll();
    }

    public JoblistingsEntity getJoblistingById(Integer jobid) {
        return joblistingsDao.findById(jobid).orElse(null);
    }
}
