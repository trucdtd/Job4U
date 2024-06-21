package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.FeedbackEntity;

public interface FeedbackDao extends JpaRepository<FeedbackEntity, Integer>{

}
