package demo.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.UserServicesEntity;
import demo.entity.UsersEntity;
import jakarta.transaction.Transactional;

public interface UserServicesDao extends JpaRepository<UserServicesEntity, Integer> {

	// thongke
//	@Query("SELECT COUNT(s) FROM UserServicesEntity s WHERE s.purchasedate >= :startDate")
//	Integer countServicesSince(@Param("startDate") LocalDateTime startDate);

	@Query("SELECT u FROM UserServicesEntity u WHERE u.purchasedate BETWEEN :startDate AND :endDate")
	List<UserServicesEntity> findByDateRange(@Param("startDate") LocalDateTime startDate,
			@Param("endDate") LocalDateTime endDate);

	// Các dịch vụ đã mua của người dùng dựa trên UsersEntity
	@Query("SELECT u FROM UserServicesEntity u WHERE u.user = :user")
	List<UserServicesEntity> findByUser(@Param("user") UsersEntity user);

	
    
 // Phương thức cập nhật các dịch vụ đã hết hạn
	/*
	 * @Modifying
	 * 
	 * @Transactional
	 * 
	 * @Query("UPDATE UserServicesEntity u SET u.status = 'EXPIRED' WHERE u.expiryDate <= :expiryDate"
	 * ) void updateExpiredServices(@Param("expiryDate") LocalDateTime expiryDate);
	 */
	@Query("SELECT COUNT(j.userserviceid) FROM UserServicesEntity j WHERE j.purchasedate >= :startDate AND j.purchasedate <= :endDate")
	Long countUSStartDateEndDate(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

	@Query("SELECT j FROM UserServicesEntity j WHERE j.purchasedate >= :startDate AND j.purchasedate <= :endDate")
	List<UserServicesEntity> selectUSStartDateEndDateList(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

	@Query("SELECT j FROM UserServicesEntity j WHERE j.purchasedate >= :startOfDay AND j.purchasedate <= :endOfDay")
	List<UserServicesEntity> selectServiceSold(@Param("startOfDay") LocalDateTime startOfDay, @Param("endOfDay") LocalDateTime endOfDay);

	@Query("SELECT COUNT(j.userserviceid) FROM UserServicesEntity j WHERE j.purchasedate >= :startOfDay AND j.purchasedate <= :endOfDay")
	Long countServiceSold(@Param("startOfDay") LocalDateTime startOfDay, @Param("endOfDay") LocalDateTime endOfDay);
	
}
