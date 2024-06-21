package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.ApplicationsEntity;

public interface ApplicationsDao extends JpaRepository<ApplicationsEntity, Integer>{

}
