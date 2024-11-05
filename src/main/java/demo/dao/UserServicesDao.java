package demo.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.UserServicesEntity;
import demo.entity.UsersEntity;



public interface UserServicesDao extends JpaRepository<UserServicesEntity, Integer>{
	
	//thongke
//	@Query("SELECT COUNT(s) FROM UserServicesEntity s WHERE s.purchasedate >= :startDate")
//	Integer countServicesSince(@Param("startDate") LocalDateTime startDate);
	
	@Query("SELECT u FROM UserServicesEntity u WHERE u.purchasedate BETWEEN :startDate AND :endDate")
	List<UserServicesEntity> findByDateRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);
	
	// Các dịch vụ đã mua của người dùng dựa trên UsersEntity
    @Query("SELECT u FROM UserServicesEntity u WHERE u.user = :user")
    List<UserServicesEntity> findByUser(@Param("user") UsersEntity user);
}
