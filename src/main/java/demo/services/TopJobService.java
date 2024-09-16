package demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;  // Đổi import này
import org.springframework.stereotype.Service;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;

@Service
public class TopJobService {

    @Autowired
    private JoblistingsDao joblistingsDao;

    // Truy vấn 5 công việc mới nhất (sắp xếp theo ngày đăng sớm nhất)
    public List<JoblistingsEntity> queryTopJobs() {
        return joblistingsDao.findTop5ByOrderByPosteddateDesc();
    }

    // Lấy danh sách công việc với phân trang
    public Page<JoblistingsEntity> getJobList(Pageable pageable) {
        Pageable sortedByDateDesc = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), Sort.by("posteddate").descending());
        return joblistingsDao.findAll(sortedByDateDesc);
    }

    // Tìm kiếm công việc dựa trên các tham số: jobtitle, joblocation, industry
    public Page<JoblistingsEntity> searchJobs(Optional<String> jobtitle, Optional<String> joblocation, Optional<String> industry, Pageable pageable) {
        Pageable sortedByDateDesc = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), Sort.by("posteddate").descending());

        if (jobtitle.isPresent() && !jobtitle.get().isEmpty()) {
            if (industry.isPresent() && !industry.get().isEmpty()) {
                if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
                    return joblistingsDao.findByJobTitleAndJobLocationAndIndustry(jobtitle.get(), joblocation.get(), industry.get(), sortedByDateDesc);
                } else {
                    return joblistingsDao.findByJobTitleAndIndustry(jobtitle.get(), industry.get(), sortedByDateDesc);
                }
            } else if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
                return joblistingsDao.findByJobTitleAndJobLocation(jobtitle.get(), joblocation.get(), sortedByDateDesc);
            } else {
                return joblistingsDao.findByJobTitle(jobtitle.get(), sortedByDateDesc);
            }
        } else if (industry.isPresent() && !industry.get().isEmpty()) {
            if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
                return joblistingsDao.findByJobLocationAndIndustry(joblocation.get(), industry.get(), sortedByDateDesc);
            } else {
                return joblistingsDao.findByIndustry(industry.get(), sortedByDateDesc);
            }
        } else if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
            return joblistingsDao.findByJobLocation(joblocation.get(), sortedByDateDesc);
        } else {
            return joblistingsDao.findAll(sortedByDateDesc);
        }
    }

}
