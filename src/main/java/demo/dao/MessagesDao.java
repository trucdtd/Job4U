package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.MessagesEntity;

public interface MessagesDao extends JpaRepository<MessagesEntity, Integer>{

}
