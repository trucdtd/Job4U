package demo.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import demo.entity.UsersEntity;
import jakarta.transaction.Transactional;

@Repository
public interface UsersDao extends JpaRepository<UsersEntity, Integer> {

	// Tìm user theo username
	@Query("SELECT u FROM UsersEntity u WHERE u.username = ?1")
	List<UsersEntity> findByUsername(String username);

	// Kiểm tra xem email đã tồn tại chưa
	boolean existsByEmail(String email);

	// Kiểm tra xem số điện thoại đã tồn tại chưa
	boolean existsByPhonenumber(String numberphone);

	// Thêm user mới vào cơ sở dữ liệu
	@Modifying
	@Transactional
	@Query(value = "INSERT INTO UsersEntity (username, fullname, password, email, phonenumber) "
			+ "VALUES (:username, :fullname, :password, :email, :phonenumber)", nativeQuery = true)
	void insertByUsername(@Param("username") String username, @Param("fullname") String fullname,
			@Param("password") String password, @Param("email") String email, @Param("phonenumber") String phonenumber);

	// Tìm user theo email
	@Query("SELECT u FROM UsersEntity u WHERE u.email = :email")
	UsersEntity findByEmail(@Param("email") String email);

	// Cập nhật mật khẩu cho user theo email
	@Modifying
	@Transactional
	@Query("UPDATE UsersEntity u SET u.password = :password WHERE u.email = :email")
	void updatePasswordByEmail(@Param("email") String email, @Param("password") String password);

	// Tìm user theo ID
	@Query("SELECT u FROM UsersEntity u WHERE u.id = :id")
	UsersEntity findByUserid(@Param("id") Integer id);

	// Đếm số người dùng mới kể từ ngày startDate
	/*
	 * @Query("SELECT COUNT(u) FROM UsersEntity u WHERE u.createdat >= :since") int
	 * countNewUsersSince(@Param("since") LocalDateTime since);
	 */
	@Query("SELECT MONTH(u.createdat) AS month, COUNT(u) AS user_count " + "FROM UsersEntity u "
			+ "WHERE u.createdat >= :startDate " + "GROUP BY MONTH(u.createdat) " + "ORDER BY MONTH(u.createdat)")
	List<Object[]> countUsersByMonth(@Param("startDate") LocalDateTime startDate);

	// thong ke
//	@Query("SELECT COUNT(u) FROM UsersEntity u WHERE u.createdat >= :startDate AND u.createdat < :endDate")
//	Integer countUsersInRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);
	@Query("SELECT u FROM UsersEntity u WHERE u.createdat BETWEEN :startDate AND :endDate")
	List<UsersEntity> findByDateRange(@Param("startDate") LocalDateTime startDate,
			@Param("endDate") LocalDateTime endDate);
	@Query("SELECT COUNT(j.userid) FROM UsersEntity j WHERE j.createdat >= :startDate AND j.createdat <= :endDate")
	Long countUserStartDateEndDate(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);
	@Query("SELECT u FROM UsersEntity u WHERE u.username = :username")
	UsersEntity findBy1User(String username);
}
