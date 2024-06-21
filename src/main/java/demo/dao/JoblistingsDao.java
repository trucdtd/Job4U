package demo.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.entity.JoblistingsEntity;

public interface JoblistingsDao extends JpaRepository<JoblistingsEntity, Integer> {

    @Query("SELECT j FROM JoblistingsEntity j WHERE " +
           "(:jobtitle IS NULL OR LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))) AND " +
           "(:joblocation IS NULL OR LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%')))")
    Page<JoblistingsEntity> findByJobTitleAndJobLocation(@Param("jobtitle") String jobtitle, 
                                                         @Param("joblocation") String joblocation,
                                                         Pageable pageable);

    @Query("SELECT j FROM JoblistingsEntity j WHERE LOWER(j.jobtitle) LIKE LOWER(CONCAT('%', :jobtitle, '%'))")
    Page<JoblistingsEntity> findByJobTitle(@Param("jobtitle") String jobtitle, Pageable pageable);

    @Query("SELECT j FROM JoblistingsEntity j WHERE LOWER(j.joblocation) LIKE LOWER(CONCAT('%', :joblocation, '%'))")
    Page<JoblistingsEntity> findByJobLocation(@Param("joblocation") String joblocation, Pageable pageable);
}
