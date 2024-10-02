package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.ExperenceEntity;

public interface ExperenceDAO extends JpaRepository<ExperenceEntity, Integer> {

}
