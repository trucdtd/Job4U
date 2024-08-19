package demo.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate; // Sử dụng java.time.LocalDate cho ngày tháng

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
@Table(name = "Payments")
public class PaymentsEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PaymentID")
    private Integer paymentId;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "UserID", nullable = false)
    private UsersEntity user;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "ServiceID", nullable = false)
    private ServicesEntity service;

    @NotNull
    @Column(name = "Amount", nullable = false)
    private BigDecimal amount;

    @NotNull
    @Column(name = "PaymentDate", nullable = false)
    private LocalDate paymentDate;

    @NotNull
    @Column(name = "Status", nullable = false)
    private String status;
}
