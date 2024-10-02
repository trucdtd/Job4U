package demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name ="Skills")
public class SkillsEntity {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Skills_id;
	private String Skills_name;
	private String Skills_descript;
}
