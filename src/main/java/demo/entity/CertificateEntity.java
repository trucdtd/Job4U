package demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="Certificate")

//bảng chứng chỉ
public class CertificateEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Certificate_id;
	private Integer Month;
	private String Year;
	private String Certificate_name;
	private String Image;
}
