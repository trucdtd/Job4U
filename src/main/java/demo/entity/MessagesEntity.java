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
@Table(name = "Messages")
public class MessagesEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "messageid")
	private Integer messageid;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "senderid", referencedColumnName = "UserID", nullable = false)
	private UsersEntity senderid;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "receiverid", referencedColumnName = "UserID", nullable = false)
	private UsersEntity receiverid;

	@NotNull
	@Column(name = "content", length = 2000, nullable = false)
	private String content;

	@NotNull
	@Column(name = "sentdate", nullable = false)
	private LocalDateTime sentdate;

	@Column(name = "readdate")
	private LocalDateTime readdate;
}
