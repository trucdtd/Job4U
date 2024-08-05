package demo.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.JobSeekersEntity;

public interface JobSeekersDao extends JpaRepository<JobSeekersEntity, Integer>{

}
