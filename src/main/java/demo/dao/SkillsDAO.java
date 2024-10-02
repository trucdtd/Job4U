package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.SkillsEntity;

public interface SkillsDAO extends JpaRepository<SkillsEntity, Integer> {

}
