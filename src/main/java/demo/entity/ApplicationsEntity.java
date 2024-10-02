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
    @Column(name = "applicationid")
    private Integer applicationid;

    @NotNull
    @Column(name = "applicationdate")
    private LocalDateTime applicationdate;

    @Column(name = "status")
    private Integer status;

    @Column(name = "resume")
    private String resume;

    @Column(name = "createdat")
    @NotNull
    private LocalDateTime createdat;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "jobid", nullable = false)
    private JoblistingsEntity job;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "Curriculum_vitae_id", nullable = false)
    private CurriculumVitaeEntity cv;
}

