package demo.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Entity
@Table(name = "Joblistings")
public class JoblistingsEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "jobid")
    private Integer jobid;

    @NotNull
    @Column(name = "jobtitle", length = 100, nullable = false)
    private String jobtitle;

    @NotNull
    @Column(name = "jobdescription", nullable = false)
    private String jobdescription;

    @NotNull
    @Column(name = "jobrequirements", nullable = false)
    private String jobrequirements;

    @NotNull
    @Column(name = "joblocation",nullable = false)
    private String joblocation;

    @Column(name = "salary", precision = 18, scale = 3)
    private BigDecimal salary;

    @NotNull
    @Column(name = "jobtype", nullable = false)
    private String jobtype;

    @NotNull
    @Column(name = "posteddate", nullable = false)
    private LocalDateTime posteddate;

    @NotNull
    @Column(name = "applicationdeadline", nullable = false)
    private LocalDateTime applicationdeadline;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "EmployerID", referencedColumnName = "EmployerID", nullable = false)
    private EmployersEntity employer;
}
