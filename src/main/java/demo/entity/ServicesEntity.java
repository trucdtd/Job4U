package demo.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate; // Sử dụng java.time.LocalDate cho ngày tháng

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Entity
@Table(name = "Services")
public class ServicesEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "serviceid")
	private Integer serviceid;

	@NotNull
	@Column(name = "servicename", nullable = false)
	private String servicename;

	@Column(name = "description")
	private String description;

	@NotNull
	@Column(name = "price", nullable = false)
	private BigDecimal price;

	@NotNull
	@Column(name = "numberofjobsallowed", nullable = false)
	private Integer numberofjobsallowed;
	
	@NotNull
	@Column(name = "createdat", nullable = false)
	private LocalDate createdat;

	@NotNull
	@Column(name = "updatedat", nullable = false)
	private LocalDate updatedat;
}
