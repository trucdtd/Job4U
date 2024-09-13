package demo.entity;

import java.io.Serializable;
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
@Table(name = "Applications")
public class ApplicationsEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer applicationid;

    @NotNull
    @Column(name = "applicationdate")
    private LocalDateTime applicationdate;

    @Column(name = "status")
    private Integer status;

    @Column(name = "resume", length = 2000)
    private String resume;

    @Column(name = "coverletter", length = 2000)
    private String coverletter;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "jobid", nullable = false)  // Chỉ định tên cột trong bảng Applications và không cho phép null
    private JoblistingsEntity job;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "jobSeekerid", nullable = false)  // Chỉ định tên cột trong bảng Applications và không cho phép null
    private JobSeekersEntity jobseeker;
}
