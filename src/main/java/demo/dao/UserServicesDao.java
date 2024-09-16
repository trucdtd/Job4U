package demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.UserServicesEntity;



public interface UserServicesDao extends JpaRepository<UserServicesEntity, Integer>{
	
	List<UserServicesEntity> findByUserId(Long userId);
}
