package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import demo.entity.ApplicationsEntity;
import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;
import java.util.List;

public interface ApplicationsDao extends JpaRepository<ApplicationsEntity, Integer> {
    
    // Tìm tất cả các ứng dụng cho một bài đăng tuyển dụng cụ thể
    List<ApplicationsEntity> findByJob(JoblistingsEntity job);
    
    // Tìm danh sách CV ứng tuyển dựa trên nhà tuyển dụng
    List<ApplicationsEntity> findByJob_Employer(EmployersEntity employer);

}
