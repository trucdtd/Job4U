package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.ActivityEntity;

public interface ActivityDAO  extends JpaRepository<ActivityEntity, Integer> {

}
