package demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;

@Service
public class topJobService {

    @Autowired
    private JoblistingsDao joblistingsDao;

    public List<JoblistingsEntity> Query() {
        return joblistingsDao.findTop5ByOrderByPosteddateAsc();
    }

    public Page<JoblistingsEntity> getJobList(PageRequest pageRequest) {
        return joblistingsDao.findAll(pageRequest);
    }
}




