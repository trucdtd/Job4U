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
    @Column(name = "EmployerID")
    private Integer employerid;

    @NotNull
    @Column(name = "CompanyName", length = 100, nullable = false)
    private String companyName;

    @Column(name = "CompanyWebsite", length = 100)
    private String companyWebsite;

    @Column(name = "CompanyDescription", length = 1000)
    private String companyDescription;

    @Column(name = "Address", length = 100)
    private String address;

    @Column(name = "Industry", length = 100)
    private String industry;

    @Column(name = "ContactPerson", length = 50)
    private String contactPerson;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "UserID", referencedColumnName = "UserID", nullable = false)
    private UsersEntity user;

    @Column(name = "Logo")
    private byte[] logo;
}
