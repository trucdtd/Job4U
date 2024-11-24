package demo.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Jobcategories")
public class JobCategoriesEntity implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "jobcategoryid")
	private Integer jobcategoryid; // Đánh dấu đây là khóa chính và tự động tăng

	@Column(name="jobcategoryname")
	private String jobcategoryname; // Tên nghề nghiệp

}
