package demo.entity;

import java.io.Serializable;

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
@Table(name = "Employers")
public class EmployersEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employerid")
    private Integer employerid;

    @NotNull
    @Column(name = "companyname", length = 100, nullable = false)
    private String companyname;

    @Column(name = "companywebsite", length = 100)
    private String companywebsite;

    @Column(name = "companydescription", length = 1000)
    private String companydescription;

    @Column(name = "address", length = 100)
    private String address;

    @Column(name = "industry", length = 100)
    private String industry;

    @Column(name = "contactperson", length = 50)
    private String contactperson;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "UserID", referencedColumnName = "UserID", nullable = false)
    private UsersEntity user;

    @Column(name = "logo")
    private String logo;
}
