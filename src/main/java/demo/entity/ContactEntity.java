package demo.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Entity
@Table(name = "Contact")
public class ContactEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "contactid")
	private Integer contactid;
	
	@NotBlank
	@Size(max = 50)
	@Column(name = "fullname", nullable = false)
	private String fullname;
	
	@NotBlank
	@Size(max = 24)
	@Column(name = "phonenumber", nullable = false)
	private String phonenumber;
	
	@NotBlank
	@Email
	@Size(max = 50)
	@Column(name = "email", nullable = false)
	private String email;

	@NotBlank
	@Size(max = 1000)
	@Column(name = "Content", nullable = false)
	private String Content;
}
