package demo.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;

public interface JoblistingsDao extends JpaRepository<JoblistingsEntity, Integer> {

	@Query("SELECT j FROM JoblistingsEntity j WHERE "
			+ "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))) AND "
			+ "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%')))")
	Page<JoblistingsEntity> findByJobLocationAndIndustry(@Param("joblocation") String joblocation,
			@Param("industry") String industry, Pageable pageable);

	@Query("SELECT j FROM JoblistingsEntity j WHERE "
			+ "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%')))")
	Page<JoblistingsEntity> findByJobLocation(@Param("joblocation") String joblocation, Pageable pageable);

	@Query("SELECT j FROM JoblistingsEntity j WHERE "
			+ "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%')))")
	Page<JoblistingsEntity> findByIndustry(@Param("industry") String industry, Pageable pageable);

	@Query("SELECT j FROM JoblistingsEntity j WHERE "
			+ "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%')))")
	Page<JoblistingsEntity> findByJobTitle(@Param("jobtitle") String jobtitle, Pageable pageable);
	
	@Query("SELECT j FROM JoblistingsEntity j WHERE " +
		       "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND " +
		       "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))) AND " +
		       "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%')))")
		Page<JoblistingsEntity> findByJobTitleAndJobLocationAndIndustry(@Param("jobtitle") String jobtitle,
		                                                                 @Param("joblocation") String joblocation,
		                                                                 @Param("industry") String industry,
		                                                                 Pageable pageable);
	
	@Query("SELECT j FROM JoblistingsEntity j WHERE " +
		       "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND " +
		       "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%')))")
		Page<JoblistingsEntity> findByJobTitleAndJobLocation(@Param("jobtitle") String jobtitle,
		                                                     @Param("joblocation") String joblocation,
		                                                     Pageable pageable);

	@Query("SELECT j FROM JoblistingsEntity j WHERE " +
		       "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND " +
		       "(:industry IS NULL OR LOWER(j.employer.industry) LIKE LOWER(CONCAT('%', :industry, '%')))")
		Page<JoblistingsEntity> findByJobTitleAndIndustry(@Param("jobtitle") String jobtitle,
		                                                   @Param("industry") String industry,
		                                                   Pageable pageable);

	@Query("SELECT j FROM JoblistingsEntity j ORDER BY j.posteddate DESC")
	List<JoblistingsEntity> findTop5ByOrderByPosteddateDesc();

	void deleteByJobid(Integer jobid);

	List<JoblistingsEntity> findByEmployerUserUserid(Integer userid);
	
	List<JoblistingsEntity> findTop5ByOrderByPosteddateAsc();

}