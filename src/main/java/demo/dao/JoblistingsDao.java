package demo.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;

public interface JoblistingsDao extends JpaRepository<JoblistingsEntity, Integer> {

    // Tìm kiếm theo job location và industry
    @Query("SELECT j FROM JoblistingsEntity j WHERE "
            + "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))) AND "
            + "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%')))")
    Page<JoblistingsEntity> findByJobLocationAndIndustry(@Param("joblocation") String joblocation,
                                                         @Param("industry") String industry, Pageable pageable);

    // Tìm kiếm theo job location
    @Query("SELECT j FROM JoblistingsEntity j WHERE "
            + "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%')))")
    Page<JoblistingsEntity> findByJobLocation(@Param("joblocation") String joblocation, Pageable pageable);

    // Tìm kiếm theo industry
    @Query("SELECT j FROM JoblistingsEntity j WHERE "
            + "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%')))")
    Page<JoblistingsEntity> findByIndustry(@Param("industry") String industry, Pageable pageable);

    // Tìm kiếm theo job title
    @Query("SELECT j FROM JoblistingsEntity j WHERE "
            + "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%')))")
    Page<JoblistingsEntity> findByJobTitle(@Param("jobtitle") String jobtitle, Pageable pageable);

    // Tìm kiếm theo job title, location và industry
    @Query("SELECT j FROM JoblistingsEntity j WHERE "
            + "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND "
            + "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))) AND "
            + "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%')))")
    Page<JoblistingsEntity> findByJobTitleAndJobLocationAndIndustry(@Param("jobtitle") String jobtitle,
                                                                    @Param("joblocation") String joblocation,
                                                                    @Param("industry") String industry,
                                                                    Pageable pageable);

    // Tìm kiếm theo job title và location
    @Query("SELECT j FROM JoblistingsEntity j WHERE "
            + "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND "
            + "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%')))")
    Page<JoblistingsEntity> findByJobTitleAndJobLocation(@Param("jobtitle") String jobtitle,
                                                         @Param("joblocation") String joblocation, Pageable pageable);

    // Tìm kiếm theo job title và industry
    @Query("SELECT j FROM JoblistingsEntity j WHERE "
            + "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND "
            + "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%')))")
    Page<JoblistingsEntity> findByJobTitleAndIndustry(@Param("jobtitle") String jobtitle,
                                                      @Param("industry") String industry, Pageable pageable);


    // Lấy 5 công việc mới nhất
    @Query("SELECT j FROM JoblistingsEntity j ORDER BY j.posteddate DESC")
    List<JoblistingsEntity> findTop5ByOrderByPosteddateDesc();

    // Xoá công việc theo jobid
    void deleteByJobid(Integer jobid);

    // Tìm công việc theo employer userid
    List<JoblistingsEntity> findByEmployerUserUserid(Integer userid);
    
    // Lấy 5 công việc cũ nhất
    List<JoblistingsEntity> findTop5ByOrderByPosteddateAsc();
    
    // Phương thức tìm kiếm bài đăng theo nhà tuyển dụng
    @Query("SELECT j FROM JoblistingsEntity j WHERE j.employer = :employer")
    List<JoblistingsEntity> findByEmployer(@Param("employer") EmployersEntity employer);
    
//    @Query("SELECT j FROM JoblistingsEntity j " +
//    	       "JOIN j.employer e " +
//    	       "JOIN e.user u " +
//    	       "WHERE (:userServiceId IS NULL OR u.userId IN (" +
//    	       "    SELECT us.userid FROM UserServicesEntity us " +
//    	       "    WHERE us.userServiceId = :userServiceId))")
//    List<JoblistingsEntity> findJoblistingsByUserServiceId(@Param("userServiceId") Integer userServiceId);
    
//    @Query("SELECT j FROM JoblistingsEntity j WHERE j.employer IN " +
//    	       "(SELECT e FROM EmployersEntity e WHERE e.user.userid IN " +
//    	       "(SELECT us.user.userid FROM UserServicesEntity us WHERE us.userserviceid = :userServiceId))")
//    List<JoblistingsEntity> findJobsByUserServiceId(@Param("userServiceId") Integer userServiceId);

    //phương thức để lấy danh sách các bài đăng mà không bao gồm những bài đã bị ẩn
    List<JoblistingsEntity> findByEmployerAndActive(EmployersEntity employer, boolean active);
}

