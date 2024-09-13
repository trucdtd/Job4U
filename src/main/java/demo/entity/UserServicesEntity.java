package demo.entity;

import java.io.Serializable;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Userservices")
public class UserServicesEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userserviceid")
    private Integer userserviceid;

    @Column(name = "userid")
    private Integer userid;

    @Column(name = "serviceid")
    private Integer serviceid;

    @Column(name = "purchasedate")
    private LocalDate purchasedate;

    @Column(name = "expirydate")
    private LocalDate expirydate;

    @Column(name = "numberofjobsallowed")
    private Integer numberofjobsallowed;

}
