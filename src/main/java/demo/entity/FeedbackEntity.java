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
    @Column(name = "FeedbackAndRatingID")
    private Integer feedbackAndRatingID;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "UserID", referencedColumnName = "UserID", nullable = false)
    private UsersEntity user;

    @NotNull
    @Column(name = "FeedbackType", length = 50)
    private String feedbackType;

    @NotNull
    @Column(name = "TargetID")
    private Integer targetID;

    @Column(name = "RatingValue")
    private Integer ratingValue;

    @NotNull
    @Column(name = "Content", length = 1000)
    private String content;

    @NotNull
    @Column(name = "CreatedDate")
    private LocalDateTime createdDate;

}
