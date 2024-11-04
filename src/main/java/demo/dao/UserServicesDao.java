package demo.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.UserServicesEntity;



public interface UserServicesDao extends JpaRepository<UserServicesEntity, Integer>{
	
	//thongke
//	@Query("SELECT COUNT(s) FROM UserServicesEntity s WHERE s.purchasedate >= :startDate")
//	Integer countServicesSince(@Param("startDate") LocalDateTime startDate);
	
	@Query("SELECT u FROM UserServicesEntity u WHERE u.purchasedate BETWEEN :startDate AND :endDate")
	List<UserServicesEntity> findByDateRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

}
