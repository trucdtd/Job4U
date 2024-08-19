package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.ServicesEntity;

public interface ServicesDao extends JpaRepository<ServicesEntity, Integer>{

}
