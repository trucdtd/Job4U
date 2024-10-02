package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.ProjectEntity;

public interface ProjectDao extends JpaRepository<ProjectEntity, Integer> {

}
