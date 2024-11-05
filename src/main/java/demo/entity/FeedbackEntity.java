package demo.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

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
@Table(name = "FeedbackAndRatings")
public class FeedbackEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "feedbackandratingid")
	private Integer feedbackandratingid;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "UserID", referencedColumnName = "UserID", nullable = false)
	private UsersEntity user;

	@NotNull
	@Column(name = "feedbacktype", length = 50)
	private String feedbacktype;

	@NotNull
	@Column(name = "targetid")
	private Integer targetid;

	@Column(name = "ratingvalue")
	private Integer ratingvalue;

	@NotNull
	@Column(name = "content", length = 1000)
	private String content;

	@NotNull
	@Column(name = "createddate")
	private LocalDateTime createddate;

}
