package demo.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.PaymentsEntity;

public interface PaymentsDao extends JpaRepository<PaymentsEntity, Integer> {

	@Query("SELECT jl.jobid " +
	           "FROM JoblistingsEntity jl " +
	           "INNER JOIN UserServicesEntity us ON jl.employer.user.userid = us.user.userid " +
	           "WHERE us.service.serviceid = :serviceID")
	    List<Integer> findJobIDsByServiceID(@Param("serviceID") int serviceID);
	
}
