package demo.entity;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

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
@Table(name = "Employers")
public class EmployersEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "employerid")
	private Integer employerid;

	@NotNull
	@Column(name = "companyname", nullable = false)
	private String companyname;

	@Column(name = "companywebsite")
	private String companywebsite;

	@Column(name = "companydescription")
	private String companydescription;

	@Column(name = "address")
	private String address;

	@Column(name = "industry")
	private String industry;

	@Column(name = "contactperson")
	private String contactperson;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "UserID", referencedColumnName = "UserID", nullable = false)
	private UsersEntity user;

	@Column(name = "logo")
	private String logo;

	@Column(name = "taxid")
	private String taxid;
}
