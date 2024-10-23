package demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "Useragreements")
public class UserAgreementsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "agreementid")
    private Integer agreementid;

    @ManyToOne
    @JoinColumn(name = "userid", nullable = false)
    private UsersEntity userid;

    @Column(name = "agreementdate", nullable = false)
    private LocalDate agreementdate;

    @Column(name = "agreementcontent", nullable = false, columnDefinition = "NVARCHAR(MAX)")
    private String agreementcontent;

    @Column(name = "status")
    private Integer status;
}
