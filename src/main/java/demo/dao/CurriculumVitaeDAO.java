package demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import demo.entity.CurriculumVitaeEntity;
import demo.entity.UsersEntity;

public interface CurriculumVitaeDAO extends JpaRepository<CurriculumVitaeEntity, Integer> {
	 @Query("SELECT u FROM CurriculumVitaeEntity u WHERE u.user.userid = ?1")
	    List<CurriculumVitaeEntity> findByUsername(Integer UserID);
}
