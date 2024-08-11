package demo.services;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.UsersEntity;

public interface UserRepository extends JpaRepository<UsersEntity, Integer> {
	UsersEntity findByUsername(String username);
}
