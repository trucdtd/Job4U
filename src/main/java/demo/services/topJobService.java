package demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;

@Service
public class topJobService {

    @Autowired
    private JoblistingsDao joblistingsDao;

    // Truy vấn 5 công việc mới nhất (sắp xếp theo ngày đăng sớm nhất)
    public List<JoblistingsEntity> queryTopJobs() {
        return joblistingsDao.findTop5ByOrderByPosteddateAsc();
    }

    // Lấy danh sách công việc với phân trang
    public Page<JoblistingsEntity> getJobList(Pageable pageable) {
        return joblistingsDao.findAll(pageable);
    }

    // Tìm kiếm công việc dựa trên các tham số: jobtitle, joblocation, industry
    public Page<JoblistingsEntity> searchJobs(Optional<String> jobtitle, Optional<String> joblocation, Optional<String> industry, Pageable pageable) {
        if (jobtitle.isPresent() && !jobtitle.get().isEmpty()) {
            if (industry.isPresent() && !industry.get().isEmpty()) {
                if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
                    return joblistingsDao.findByJobTitleAndJobLocationAndIndustry(jobtitle.get(), joblocation.get(), industry.get(), pageable);
                } else {
                    return joblistingsDao.findByJobTitleAndIndustry(jobtitle.get(), industry.get(), pageable);
                }
            } else if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
                return joblistingsDao.findByJobTitleAndJobLocation(jobtitle.get(), joblocation.get(), pageable);
            } else {
                return joblistingsDao.findByJobTitle(jobtitle.get(), pageable);
            }
        } else if (industry.isPresent() && !industry.get().isEmpty()) {
            if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
                return joblistingsDao.findByJobLocationAndIndustry(joblocation.get(), industry.get(), pageable);
            } else {
                return joblistingsDao.findByIndustry(industry.get(), pageable);
            }
        } else if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
            return joblistingsDao.findByJobLocation(joblocation.get(), pageable);
        } else {
            return joblistingsDao.findAll(pageable);
        }
    }
}
