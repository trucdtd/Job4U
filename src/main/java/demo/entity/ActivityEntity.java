package demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Activity")
public class ActivityEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Activity_id;
	private String Year;
	private String Activity_name;
	private String Role;
	private String Activity_description;
}
