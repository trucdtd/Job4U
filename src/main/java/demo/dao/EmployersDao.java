package demo.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;

public interface EmployersDao extends JpaRepository<EmployersEntity, Integer>{
	
	
}
