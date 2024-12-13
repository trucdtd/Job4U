package demo.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;

public interface EmployersDao extends JpaRepository<EmployersEntity, Integer> {

	@Query(value = "WITH Top3JobListings AS (" + "    SELECT TOP 3 EmployerID " + "    FROM Joblistings "
			+ "    ORDER BY PostedDate DESC" + ") "
			+ "SELECT e.EmployerID, e.CompanyName, e.CompanyWebsite, e.CompanyDescription, e.Address, e.Industry, e.ContactPerson, e.Logo "
			+ "FROM Employers e " + "JOIN Top3JobListings j ON e.EmployerID = j.EmployerID", nativeQuery = true)
	List<EmployersEntity> findTop3Employers();

	// Phương thức tìm kiếm nhà tuyển dụng theo userId
	@Query("SELECT e FROM EmployersEntity e WHERE e.user.userid = :userId")
	Optional<EmployersEntity> findByUserId(@Param("userId") Integer userId);
	
	@Query("SELECT e FROM EmployersEntity e WHERE e.employerid = :id")
	EmployersEntity findByID(@Param("id") Optional<Integer> id);


}
