package demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Prize")
public class PrizeEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Prize_id;
	private String Year;
	private String Prize_name;
	private String Image;
}
