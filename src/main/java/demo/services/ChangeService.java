/*
 * package demo.services;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.security.crypto.password.PasswordEncoder; import
 * org.springframework.stereotype.Service; import
 * demo.repositories.UserRepository; import demo.models.User;
 * 
 * @Service public class ChangeService {
 * 
 * @Autowired private UserRepository userRepository;
 * 
 * @Autowired private PasswordEncoder passwordEncoder;
 * 
 * public boolean changePassword(String oldPassword, String newPassword) { User
 * currentUser = getCurrentAuthenticatedUser();
 * 
 * if (currentUser == null) { return false; }
 * 
 * if (passwordEncoder.matches(oldPassword, currentUser.getPassword())) {
 * currentUser.setPassword(passwordEncoder.encode(newPassword));
 * userRepository.save(currentUser); return true; } else { return false; } }
 * 
 * private User getCurrentAuthenticatedUser() { // Implement logic to get the
 * currently authenticated user return null; } }
 */