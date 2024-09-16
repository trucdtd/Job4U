package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import demo.entity.ApplicationsEntity;
import demo.entity.JoblistingsEntity;
import java.util.List;

public interface ApplicationsDao extends JpaRepository<ApplicationsEntity, Integer> {
    
    // Tìm tất cả các ứng dụng cho một bài đăng tuyển dụng cụ thể
    List<ApplicationsEntity> findByJob(JoblistingsEntity job);
}
