package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.ResponseEntity;

import demo.entity.ReportEntity;

public interface ReportDao extends JpaRepository<ReportEntity, Integer>{

}
