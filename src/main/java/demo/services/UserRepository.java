package demo.services;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import demo.entity.UsersEntity;

@Repository
public interface UserRepository extends JpaRepository<UsersEntity, Integer> {

	UsersEntity findByUsername(String username);

	// Tìm người dùng dựa trên email
	UsersEntity findByEmail(String email);

	// Tìm người dùng dựa trên token
	UsersEntity findByToken(String token);

	UsersEntity findByPhonenumber(String numberphone);
}