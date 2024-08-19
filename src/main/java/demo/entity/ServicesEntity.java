package demo.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate; // Sử dụng java.time.LocalDate cho ngày tháng

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Entity
@Table(name = "Services")
public class ServicesEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ServiceID")
    private Integer serviceId;

    @NotNull
    @Column(name = "ServiceName", nullable = false)
    private String serviceName;

    @Column(name = "Description")
    private String description;

    @NotNull
    @Column(name = "Price", nullable = false)
    private BigDecimal price;

    @NotNull
    @Column(name = "CreatedAt", nullable = false)
    private LocalDate createdAt;

    @NotNull
    @Column(name = "UpdatedAt", nullable = false)
    private LocalDate updatedAt;
}
