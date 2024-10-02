package demo.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.EducationEntity;
public interface EducationDAO  extends JpaRepository<EducationEntity, Integer> {

}
