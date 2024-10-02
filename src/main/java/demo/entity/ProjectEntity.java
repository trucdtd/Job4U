package demo.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name ="Project")
public class ProjectEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Project_id;
	private String Project_name;
	private LocalDate Start_date;
	private LocalDate End_date;
	private String Client;
	private String Project_description;
	private Integer Number_of_members;
	private String Position;
	private String Role;
	private String Technology_used;
	private String Link;
}
