package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.UserAgreementsEntity;

public interface UserAgreementsDao extends JpaRepository<UserAgreementsEntity, Integer> {
    
}
