package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.PaymentsEntity;

public interface PaymentsDao extends JpaRepository<PaymentsEntity, Integer> {
	
}
