package demo.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import jakarta.transaction.Transactional;

import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;

public interface JoblistingsDao extends JpaRepository<JoblistingsEntity, Integer> {

	// Tìm kiếm theo job location và industry, chỉ lấy bài viết chưa hết hạn
	@Query("SELECT j FROM JoblistingsEntity j WHERE "
	        + "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))) AND "
	        + "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%'))) AND "
	        + "j.applicationdeadline > CURRENT_DATE")
	Page<JoblistingsEntity> findByJobLocationAndIndustry(@Param("joblocation") String joblocation,
	        @Param("industry") String industry, Pageable pageable);

	// Tìm kiếm theo job location, chỉ lấy bài viết chưa hết hạn
	@Query("SELECT j FROM JoblistingsEntity j WHERE "
	        + "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))) AND "
	        + "j.applicationdeadline > CURRENT_DATE")
	Page<JoblistingsEntity> findByJobLocation(@Param("joblocation") String joblocation, Pageable pageable);

	// Tìm kiếm theo industry, chỉ lấy bài viết chưa hết hạn
	@Query("SELECT j FROM JoblistingsEntity j WHERE "
	        + "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%'))) AND "
	        + "j.applicationdeadline > CURRENT_DATE")
	Page<JoblistingsEntity> findByIndustry(@Param("industry") String industry, Pageable pageable);

	// Tìm kiếm theo job title, chỉ lấy bài viết chưa hết hạn
	@Query("SELECT j FROM JoblistingsEntity j WHERE "
	        + "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND "
	        + "j.applicationdeadline > CURRENT_DATE")
	Page<JoblistingsEntity> findByJobTitle(@Param("jobtitle") String jobtitle, Pageable pageable);

	// Tìm kiếm theo job title, location và industry, chỉ lấy bài viết chưa hết hạn
	@Query("SELECT j FROM JoblistingsEntity j WHERE "
	        + "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND "
	        + "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))) AND "
	        + "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%'))) AND "
	        + "j.applicationdeadline > CURRENT_DATE")
	Page<JoblistingsEntity> findByJobTitleAndJobLocationAndIndustry(@Param("jobtitle") String jobtitle,
	        @Param("joblocation") String joblocation, @Param("industry") String industry, Pageable pageable);

	// Tìm kiếm theo job title và location, chỉ lấy bài viết chưa hết hạn
	@Query("SELECT j FROM JoblistingsEntity j WHERE "
	        + "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND "
	        + "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))) AND "
	        + "j.applicationdeadline > CURRENT_DATE")
	Page<JoblistingsEntity> findByJobTitleAndJobLocation(@Param("jobtitle") String jobtitle,
	        @Param("joblocation") String joblocation, Pageable pageable);

	// Tìm kiếm theo job title và industry, chỉ lấy bài viết chưa hết hạn
	@Query("SELECT j FROM JoblistingsEntity j WHERE "
	        + "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND "
	        + "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%'))) AND "
	        + "j.applicationdeadline > CURRENT_DATE")
	Page<JoblistingsEntity> findByJobTitleAndIndustry(@Param("jobtitle") String jobtitle,
	        @Param("industry") String industry, Pageable pageable);

	// Xoá công việc theo jobid
	void deleteByJobid(Integer jobid);

	// Tìm công việc theo employer userid
	List<JoblistingsEntity> findByEmployerUserUserid(Integer userid);

	// Phương thức tìm kiếm bài đăng theo nhà tuyển dụng
	@Query("SELECT j FROM JoblistingsEntity j WHERE j.employer = :employer")
	List<JoblistingsEntity> findByEmployer(@Param("employer") EmployersEntity employer);

	// Phương thức để lấy danh sách các bài đăng mà không bao gồm những bài đã bị ẩn
	List<JoblistingsEntity> findByEmployerAndActive(EmployersEntity employer, boolean active);

	// Lấy 5 bài viết mới nhất có trạng thái hoạt động
	@Query("SELECT j FROM JoblistingsEntity j WHERE j.active = true ORDER BY j.posteddate DESC")
	List<JoblistingsEntity> findTop5LatestJobListings();

	// Cập nhật trạng thái hoạt động của bài đăng
	@Modifying
	@Transactional
	@Query("UPDATE JoblistingsEntity j SET j.active = :active WHERE j.jobid = :jobid")
	void updatePostActiveStatus(@Param("jobid") Integer jobid, @Param("active") boolean active);

	// Tìm bài đăng theo trạng thái hoạt động
	@Query("SELECT j FROM JoblistingsEntity j WHERE j.active = :active")
	List<JoblistingsEntity> findByActiveStatus(@Param("active") boolean active);

	// Tìm bài đăng theo nhà tuyển dụng và trạng thái hoạt động
	@Query("SELECT j FROM JoblistingsEntity j WHERE j.employer = :employer AND j.active = :active")
	List<JoblistingsEntity> findByEmployerAndActiveStatus(@Param("employer") EmployersEntity employer,
			@Param("active") boolean active);

	// Tìm bài đăng theo khoảng thời gian đăng
	@Query("SELECT j FROM JoblistingsEntity j WHERE j.posteddate BETWEEN :startDate AND :endDate")
	List<JoblistingsEntity> findByPostedDateBetween(@Param("startDate") LocalDate startDate,
			@Param("endDate") LocalDate endDate);

	// Đếm số lượng bài đăng từ một ngày cụ thể
	@Query("SELECT COUNT(j) FROM JoblistingsEntity j WHERE j.posteddate >= :since")
	int countNewPostsSince(@Param("since") LocalDate since);

	// Tìm kiếm bài viết chưa hết hạn
	Page<JoblistingsEntity> findAllByApplicationdeadlineAfter(LocalDate deadline, Pageable pageable);

	@Query("SELECT j FROM JoblistingsEntity j WHERE j.applicationdeadline BETWEEN :startDate AND :endDate")
	List<JoblistingsEntity> findByDateRange(@Param("startDate") LocalDate startDate,
			@Param("endDate") LocalDate endDate);

	// Tìm kiếm các công việc, sắp xếp isTop trước
	@Modifying
	@Transactional
	@Query("UPDATE JoblistingsEntity j SET j.isTop = true WHERE j.userservice IS NOT NULL")
	void updateIsTopForNonNullUserServiceId();

	@Query("SELECT j FROM JoblistingsEntity j WHERE j.isTop = true ORDER BY j.posteddate DESC")
	List<JoblistingsEntity> findTop20JobListingsWithIstop(Pageable pageable);

	List<JoblistingsEntity> findByIsTopTrue(); // Phương thức này sẽ lấy danh sách công việc có isTop = 1

	// giới hạn nhà tuyển dụng chỉ được đăng 3 bài trên tháng
	// List<JoblistingsEntity> findByEmployerIdAndPostedDateBetween(
	@Query("SELECT j FROM JoblistingsEntity j WHERE j.employer.employerid = :employerid AND j.posteddate >= :startOfMonth")
	List<JoblistingsEntity> findJobsByEmployerIdAndMonthStart(@Param("employerid") Integer employerid,
			@Param("startOfMonth") LocalDate startOfMonth);

	@Query("SELECT COUNT(j) FROM JoblistingsEntity j WHERE j.employer.employerid = :employerId AND j.posteddate BETWEEN :startDate AND :endDate")
	int countJobsByEmployerIdAndDateRange(@Param("employerId") Integer employerId,
			@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);
}