package demo.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Date;
@Data
@Entity
@Table(name = "Jobseekers")
public class JobSeekersEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "jobseekerid")
    private Integer jobseekerid;
    
    @Column(name = "fullnamecv")
    private String fullnamecv;
    
    @Column(name = "emailcv")
    private String emailcv;
    
    @Lob
    @Column(name = "resume")
    private String resume;

    @Column(name = "profilesummary")
    private String profilesummary;

    @Lob
    @Column(name = "experience")
    private String experience;

    @Lob
    @Column(name = "education")
    private String education;

    @Lob
    @Column(name = "skills")
    private String skills;

    @Lob
    @Column(name = "certifications")
    private String certifications;

    @Lob
    @Column(name = "languages")
    private String languages;

    @Lob
    @Column(name = "image")
    private byte[] image;

    @Column(name = "dateofbirth")
    private Date dateOfbirth;

    @Column(name = "gender", length = 10)
    private String gender;

    @Lob
    @Column(name = "interests")
    private String interests;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID", referencedColumnName = "UserID", nullable = false, foreignKey = @ForeignKey(name = "FK_Jobseekers_Users"))
    private UsersEntity user;

    @NotNull
    @Column(name = "createdat", nullable = false)
    private LocalDate createdat;

    @NotNull
    @Column(name = "updatedat", nullable = false)
    private LocalDate updatedat;

    
}
