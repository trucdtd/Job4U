package demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Experence")
public class ExperenceEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Experence_id;
	private String Company_name;
	private Integer Start_month;
	private String Start_year;
	private Integer End_month;
	private String End_year;
	private String Position;
	private String Role;
}
