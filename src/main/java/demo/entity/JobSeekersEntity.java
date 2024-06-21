package demo.entity;

import java.io.Serializable;
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
import java.sql.Date;

@Entity
@Table(name = "Jobseekers")
public class JobSeekersEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "JobSeekerID")
    private Integer jobSeekerid;

    @Lob
    @Column(name = "Resume")
    private String resume;

    @Column(name = "ProfileSummary", length = 1000)
    private String profilesummary;

    @Lob
    @Column(name = "Experience")
    private String experience;

    @Lob
    @Column(name = "Education")
    private String education;

    @Lob
    @Column(name = "Skills")
    private String skills;

    @Lob
    @Column(name = "Certifications")
    private String certifications;

    @Lob
    @Column(name = "Languages")
    private String languages;

    @Lob
    @Column(name = "Image")
    private byte[] image;

    @Column(name = "DateOfBirth")
    private Date dateOfbirth;

    @Column(name = "Gender", length = 10)
    private String gender;

    @Lob
    @Column(name = "Interests")
    private String interests;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID", referencedColumnName = "UserID", nullable = false, foreignKey = @ForeignKey(name = "FK_Jobseekers_Users"))
    private UsersEntity user;

    @NotNull
    @Column(name = "CreatedAt", nullable = false)
    private LocalDateTime createdAt;

    @NotNull
    @Column(name = "UpdatedAt", nullable = false)
    private LocalDateTime updatedAt;

}
