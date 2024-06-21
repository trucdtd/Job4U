package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.NotificationsEntity;

public interface NotificationsDao extends JpaRepository<NotificationsEntity, Integer>{

}
