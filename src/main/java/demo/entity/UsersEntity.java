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
    @Column(name = "userid")
    private Integer userid;

    @NotBlank
    @Size(max = 30)
    @Column(name = "username", nullable = false)
    private String username;

    @NotBlank
    @Size(max = 50)
    @Column(name = "password", nullable = false)
    private String password;

    @NotBlank
    @Size(max = 30)
    @Column(name = "fullname", nullable = false)
    private String fullname;

    @NotBlank
    @Email
    @Size(max = 50)
    @Column(name = "email", nullable = false)
    private String email;

    @NotBlank
    @Size(max = 24)
    @Column(name = "phonenumber", nullable = false)
    private String phonenumber;

    @Column(name = "token")
    private String token;

    @NotNull
    @Column(name = "role", nullable = false)
    private Integer role;

    @NotNull
    @Column(name = "createdat", nullable = false)
    private LocalDateTime createdat;

    @NotNull
    @Column(name = "updatedat", nullable = false)
    private LocalDateTime updatedat;

    // Getter tùy chỉnh để trả về boolean cho role
    public boolean isAdmin() {
        return this.role != null && this.role == 1;
    }
}
