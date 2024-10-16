package demo.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.JobSeekersEntity;
import demo.entity.UsersEntity;

public interface JobSeekersDao extends JpaRepository<JobSeekersEntity, Integer>{
	JobSeekersEntity findByJobseekerid(Integer jobseekerid);
	
	 @Query("SELECT u FROM JobSeekersEntity u WHERE u.user.userid = ?1")
	    List<JobSeekersEntity> findByUsername(Integer id);
	 
	//tìm kiếm cv theo user đã đăng nhập
		
		 @Query("SELECT js FROM JobSeekersEntity js WHERE js.user.userid = :userid")
		    List<JobSeekersEntity> findByUserId(@Param("userid") Integer userid);
		 
		 @Query("SELECT js, a.status FROM JobSeekersEntity js " +
			       "LEFT JOIN ApplicationsEntity a ON js.jobseekerid = a.jobseeker.jobseekerid " +
			       "WHERE js.user.userid = :userid")
			List<JobSeekersEntity> findByUserIdWithStatus(@Param("userid") Integer userid);
		 
}
