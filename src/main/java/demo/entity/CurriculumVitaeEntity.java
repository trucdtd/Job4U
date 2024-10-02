package demo.entity;

import java.time.LocalDate;

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
@Table(name = "Curriculum_vitae")
public class CurriculumVitaeEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Curriculum_vitae_id;
	private String Cv_name;
	private String Image;
	private String Fullname;
	private String Profession;
	private LocalDate Date_of_birth;
	private Boolean Gender;
	private String Address;
	@ManyToOne
	@JoinColumn(name = "Education_id")
	private EducationEntity education;
	@ManyToOne
	@JoinColumn(name = "Skills_id")
	private SkillsEntity skills;
	@ManyToOne
	@JoinColumn(name = "Project_id")
	private ProjectEntity project;
	@ManyToOne
	@JoinColumn(name = "Experence_id")
	private ExperenceEntity experence;
	@ManyToOne
	@JoinColumn(name = "Activity_id")
	private ActivityEntity activity;
	@ManyToOne
	@JoinColumn(name = "Certificate_id")
	private CertificateEntity certificate;
	@ManyToOne
	@JoinColumn(name = "Prize_id")
	private PrizeEntity prize;
	@ManyToOne
	@JoinColumn(name = "userid")
	private UsersEntity user;
}
