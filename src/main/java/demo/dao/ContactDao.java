package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.ContactEntity;

public interface ContactDao  extends JpaRepository<ContactEntity, Integer> {
	
}
