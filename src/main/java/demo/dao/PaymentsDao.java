package demo.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.PaymentsEntity;

public interface PaymentsDao extends JpaRepository<PaymentsEntity, Integer> {
	
}
