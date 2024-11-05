package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.ApplicationsEntity;
import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;
import java.util.List;

public interface ApplicationsDao extends JpaRepository<ApplicationsEntity, Integer> {

	// Tìm tất cả các ứng dụng cho một bài đăng tuyển dụng cụ thể
	List<ApplicationsEntity> findByJob(JoblistingsEntity job);

	// Tìm danh sách CV ứng tuyển dựa trên nhà tuyển dụng
	List<ApplicationsEntity> findByJob_Employer(EmployersEntity employer);

	@Query("SELECT a FROM ApplicationsEntity a WHERE a.jobseeker.user.userid = :userid")
	List<ApplicationsEntity> findApplicationsByUserId(@Param("userid") Integer userid);

	// Tìm danh sách ứng viên đã ứng tuyển vào một Joblisting dựa trên Joblisting ID
	@Query("SELECT a FROM ApplicationsEntity a JOIN a.job j WHERE j.jobid = :joblistingId")
	List<ApplicationsEntity> findApplicationsByJoblistingId(@Param("joblistingId") Integer joblistingId);
	
	//trinh - tim đơn xin việc theo mã đơn - hiện thị trạng thái đơn xin việc
	@Query("SELECT a FROM ApplicationsEntity a JOIN a.job j WHERE a.applicationid = :applicationId")
	List<ApplicationsEntity> findApplicationsByApplicationId(@Param("applicationId") Integer applicationId);

	
	//đoàn
	@Query("SELECT a FROM ApplicationsEntity a " + "JOIN a.job j "
			+ "WHERE j.jobid = :joblistingId and a.jobseeker.jobseekerid = :jskid")
	ApplicationsEntity find1ApplicationsByJoblistingId(@Param("joblistingId") Integer joblistingId,
			@Param("jskid") Integer jskid);

	List<ApplicationsEntity> findByJobseeker_User_Userid(Integer userId);

	boolean existsByJobseeker_Jobseekerid(Integer jobseekerId);

	// kiểm tra xem người dùng đã ứng tuyển
	@Query("SELECT a.job FROM ApplicationsEntity a WHERE a.jobseeker.user.userid = :userid")
	List<JoblistingsEntity> findJobsAppliedByUserId(@Param("userid") Integer userid);

}
