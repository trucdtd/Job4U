package demo.entity;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

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

    @Column(name = "phonenumbercv")
    private String phonenumbercv;

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
    @Column(name = "interests")
    private String interests;

    @Column(name = "image")
    private String image;

    @Column(name = "dateofbirth")
    private Date dateOfbirth;

    @Column(name = "gender", length = 10)
    private String gender;

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

    public JobSeekersEntity() {
        // Constructor mặc định
    }
}
