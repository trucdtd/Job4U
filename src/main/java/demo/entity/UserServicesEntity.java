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
@Table(name = "Userservices")
public class UserServicesEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userserviceid")
    private Integer userserviceid;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "UserID", referencedColumnName = "UserID", nullable = false)
    private UsersEntity user;
    
    @NotNull
    @ManyToOne
    @JoinColumn(name = "ServiceID", referencedColumnName = "ServiceID", nullable = false)
    private ServicesEntity service;

    @Column(name = "purchasedate")
    private LocalDateTime  purchasedate;

    @Column(name = "expirydate")
    private LocalDateTime  expirydate;

    @Column(name = "numberofjobsallowed")
    private Integer numberofjobsallowed;
    
    @Column(name = "Isactive")
    private Boolean isactive = true;
}
