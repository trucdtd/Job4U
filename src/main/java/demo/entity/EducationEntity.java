package demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Education")
public class EducationEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Education_id;
	private Integer Start_month;
	private String Start_year;
	private Integer End_month;
	private String End_year;
	private String School_name;
	private String Major;
	private Float Average_score;
	private String Rating;
	private String Image;
}
