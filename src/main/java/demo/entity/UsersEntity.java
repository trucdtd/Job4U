package demo.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Entity
@Table(name = "Users")
public class UsersEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "UserID")
    private Integer userid;

    @NotBlank
    @Size(max = 30)
    @Column(name = "Username", nullable = false)
    private String username;

    @NotBlank
    @Size(max = 50)
    @Column(name = "Password", nullable = false)
    private String password;

    @NotBlank
    @Size(max = 30)
    @Column(name = "FullName", nullable = false)
    private String fullname;

    @NotBlank
    @Email
    @Size(max = 50)
    @Column(name = "Email", nullable = false)
    private String email;

    @NotBlank
    @Size(max = 24)
    @Column(name = "PhoneNumber", nullable = false)
    private String phonenumber;

    @Column(name = "Token")
    private String token;

    @NotNull
    @Column(name = "Role", nullable = false)
    private Integer role;

    @NotNull
    @Column(name = "CreatedAt", nullable = false)
    private LocalDateTime createdAt;

    @NotNull
    @Column(name = "UpdatedAt", nullable = false)
    private LocalDateTime updatedAt;
}
