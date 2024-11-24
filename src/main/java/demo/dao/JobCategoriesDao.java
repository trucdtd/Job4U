package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.JobCategoriesEntity;

public interface JobCategoriesDao extends JpaRepository<JobCategoriesEntity, Integer>{

}
