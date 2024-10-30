package demo.services;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

    // Cập nhật giá trị isTop cho các công việc có userservice khác null
    // và trả về danh sách đã sắp xếp
    public List<JoblistingsEntity> updateAndGetSortedJobListings() {
        List<JoblistingsEntity> jobListings = joblistingsDao.findAll();
        
        for (JoblistingsEntity job : jobListings) {
            job.setIsTop(job.getUserservice() != null); // Cập nhật isTop
        }
        
        joblistingsDao.saveAll(jobListings); // Lưu lại thay đổi
        
        // Sắp xếp danh sách sao cho các công việc có isTop=1 hiển thị trước
        jobListings.sort((job1, job2) -> Boolean.compare(job2.getIsTop(), job1.getIsTop()));
        
        return jobListings;
    }
    public List<JoblistingsEntity> getTopJobListings() {
        return joblistingsDao.findByIsTopTrue(); // Chỉ lấy công việc có isTop = 1
    }
 // Lấy 20 công việc hàng đầu với isTop = true
    public List<JoblistingsEntity> getTop20JobListingsWithIstop() {
        // Lấy danh sách đã sắp xếp
        List<JoblistingsEntity> sortedJobListings = updateAndGetSortedJobListings();
        
        // Lọc ra các công việc có isTop = true
        List<JoblistingsEntity> topJobListings = sortedJobListings.stream()
                .filter(JoblistingsEntity::getIsTop)
                .collect(Collectors.toList());
        
        // Giới hạn số lượng công việc hiển thị là 20
        return topJobListings.stream().limit(20).collect(Collectors.toList());
    }
    
    //giới hạn nhà tuyển dụng chỉ được đăng 3 bài trên tháng
    public List<JoblistingsEntity> getPostsThisMonth(Integer employerid) {
        LocalDate now = LocalDate.now();
        LocalDate startOfMonth = now.withDayOfMonth(1);
        return joblistingsDao.findJobsByEmployerIdAndMonthStart(employerid, startOfMonth);
    }
}