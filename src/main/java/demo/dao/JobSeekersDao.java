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
	 
}
