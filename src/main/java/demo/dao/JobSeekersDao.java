package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.JobSeekersEntity;

public interface JobSeekersDao extends JpaRepository<JobSeekersEntity, Integer>{

}
