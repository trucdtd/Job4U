package demo.entity;

import java.time.LocalDate;

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
@Table(name = "Report")
public class ReportEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reportid")
	private Integer reportid;
	
	@ManyToOne
	@JoinColumn(name = "userid", nullable = false)
	private UsersEntity user;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "jobid", nullable = false)
	private JoblistingsEntity job;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "employerid", nullable = false)
	private EmployersEntity employers;
	
	@Column(name = "reason")
    private String reason; // Lý do báo cáo
	
	@Column(name = "reportedat", nullable = false)
	private LocalDate reportedat;
}
