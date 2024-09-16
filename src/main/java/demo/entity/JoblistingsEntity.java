package demo.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Joblistings")
public class JoblistingsEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "jobid")
    private Integer jobid;

    @Column(name = "jobtitle", length = 100, nullable = false)
    private String jobtitle;

    @Column(name = "jobdescription", nullable = false)
    private String jobdescription;

    @Column(name = "jobrequirements", nullable = false)
    private String jobrequirements;

    @Column(name = "joblocation", nullable = false)
    private String joblocation;

    @Column(name = "salary")
    private BigDecimal salary;

    @Column(name = "jobtype", nullable = false)
    private String jobtype;

    @Column(name = "posteddate", nullable = false)
    private LocalDate posteddate;

    @Column(name = "applicationdeadline", nullable = false)
    private LocalDate applicationdeadline;

    @Column(name = "istop")
    private Boolean isTop;

    @Column(name = "topstartdate")
    private LocalDate topStartDate;

    @ManyToOne
    @JoinColumn(name = "employerid", nullable = false)
    private EmployersEntity employer;

    @ManyToOne
    @JoinColumn(name = "userserviceid")
    private UserServicesEntity userService;
    
    @Column(name = "active", nullable = false)
    private boolean active = true; // Trạng thái bài đăng
}
