package demo.Repositories;

import demo.Models.User;
import demo.Models.Post;
import demo.Models.Applicant;
import demo.Models.Employer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    @Query("SELECT COUNT(u) FROM User u WHERE u.registrationDate >= :startDate")
    int countNewUsersSince(LocalDate startDate);
}

public interface PostRepository extends JpaRepository<Post, Long> {
    @Query("SELECT COUNT(p) FROM Post p WHERE p.creationDate >= :startDate")
    int countNewPostsSince(LocalDate startDate);
}

public interface ApplicantRepository extends JpaRepository<Applicant, Long> {
    @Query("SELECT COUNT(a) FROM Applicant a WHERE a.submissionDate >= :startDate")
    int countNewApplicantsSince(LocalDate startDate);
}

public interface EmployerRepository extends JpaRepository<Employer, Long> {
    @Query("SELECT COUNT(e) FROM Employer e WHERE e.registrationDate >= :startDate")
    int countNewEmployersSince(LocalDate startDate);
}
