package demo.dao;

import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.ServicesEntity;

public interface ServicesDao extends JpaRepository<ServicesEntity, Integer> {

}
