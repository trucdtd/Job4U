package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.PrizeEntity;

public interface PrizeDAO extends JpaRepository<PrizeEntity, Integer> {

}
