package demo.dao;

import java.util.List;

import org.apache.catalina.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



import demo.entity.UsersEntity;
import jakarta.transaction.Transactional;

@Repository
public interface UsersDao extends JpaRepository<UsersEntity, Integer> {
    
    @Query("SELECT u FROM UsersEntity u WHERE u.username = ?1")
    List<UsersEntity> findByUsername(String username);
  
    boolean existsByEmail(String email);
    boolean existsByPhonenumber(String phonenumber);
    
    @Modifying
    @Transactional
    @Query(value = "INSERT INTO UsersEntity (username, fullname, password, email, phonenumber) "
    		+ "VALUES (:username, :fullname, :password, :email, :phonenumber)")
    void insertByUsername(@Param("username") String username, 
                          @Param("fullname") String fullname, 
                          @Param("password") String password, 
                          @Param("email") String email, 
                          @Param("phonenumber") String phonenumber);
    
    @Query("SELECT u FROM UsersEntity u WHERE u.email = :email")    
    User findByEmail(@Param("email") String email);
    
    @Modifying
    @Transactional
    @Query(value = "UPDATE UsersEntity u SET u.password = :password WHERE u.email = :email")
    void updatePasswordByEmail(@Param("email") String email, @Param("password") String password);
    
      
}