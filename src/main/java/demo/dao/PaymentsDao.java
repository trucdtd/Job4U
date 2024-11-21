package demo.dao;

import java.time.LocalDateTime;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.PaymentsEntity;
import demo.entity.UserServicesEntity;

public interface PaymentsDao extends JpaRepository<PaymentsEntity, Integer> {

	@Query("SELECT j FROM PaymentsEntity j WHERE j.paymentdate >= :startDate AND j.paymentdate <= :endDate")
	List<PaymentsEntity> selectUSStartDateEndDateList(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);


}
