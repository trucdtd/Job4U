
/*
 * package demo.services;
 * 
 * import java.util.UUID; import org.springframework.stereotype.Service;
 * 
 * @Service public class UserService {
 * 
 * public String createPasswordResetToken(String email) { // Tạo mã thông báo
 * (token) ngẫu nhiên String token = UUID.randomUUID().toString();
 * 
 * // Lưu token, email, và thời gian hết hạn vào cơ sở dữ liệu // (bạn cần phải
 * triển khai phần lưu trữ này)
 * 
 * return token; } }
 * 
 */
package demo.services;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.Properties;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mailjet.client.resource.User;

import demo.dao.UsersDao;
import demo.entity.UsersEntity;
import jakarta.annotation.PostConstruct;

@Service
public class UserService {
	
	  @Value("${spring.mail.host}") private String mailHost;
	  
	  @Value("${spring.mail.port}") private int mailPort;
	  
	  @Value("${spring.mail.username}") private String mailUsername;
	  
	  @Value("${spring.mail.password}") private String mailPassword;
	 
	
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UsersDao usersDao;
    
    @Autowired
    private JavaMailSender mailSender;

    /**
     * Tìm người dùng dựa trên tên đăng nhập.
     *
     * @param username tên đăng nhập của người dùng.
     * @return người dùng tương ứng với tên đăng nhập, hoặc null nếu không tìm thấy.
     */
    public UsersEntity findByUsername(String username) {
        return userRepository.findByUsername(username);
    }	
    /**
     * Tìm người dùng dựa trên ID.
     *
     * @param userId ID của người dùng.
     * @return người dùng tương ứng với ID, hoặc null nếu không tìm thấy.
     */
    public UsersEntity findById(Integer userId) {
        return userRepository.findById(userId).orElse(null);
    }

    /**
     * Thay đổi mật khẩu của người dùng.
     *
     * @param username    tên đăng nhập của người dùng.
     * @param oldPassword mật khẩu cũ.
     * @param newPassword mật khẩu mới.
     * @return true nếu mật khẩu được thay đổi thành công, false nếu không thành công.
     */
    public boolean changePassword(String username, String oldPassword, String newPassword) {
        UsersEntity user = findByUsername(username);
        if (user != null && oldPassword.equals(user.getPassword())) { // So sánh mật khẩu không mã hóa
            user.setPassword(newPassword); // Lưu mật khẩu mới mà không mã hóa
            userRepository.save(user);
            return true;
        }
        return false;
    }

    /**
     * Lưu người dùng vào cơ sở dữ liệu.
     *
     * @param user đối tượng người dùng cần lưu.
     */
    public void save(UsersEntity user) {
        userRepository.save(user);
    }
    

    /**
     * Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không.
     *
     * @param email email cần kiểm tra.
     * @return true nếu email tồn tại, false nếu không.
     */
    public boolean isEmailExists(String email) {
        return userRepository.findByEmail(email) != null;
    }

    /**
     * Kiểm tra xem số điện thoại có tồn tại trong cơ sở dữ liệu không.
     *
     * @param numberphone số điện thoại cần kiểm tra.
     * @return true nếu số điện thoại tồn tại, false nếu không.
     */
    public boolean isPhoneNumberExists(String numberphone) {
        return usersDao.existsByPhonenumber(numberphone);
    }

	
    public boolean isTokenValid(String token) {
        UsersEntity user = userRepository.findByToken(token);
        return user != null;
    }
    
 // Tạo token và lưu vào cơ sở dữ liệu
    public String createPasswordResetToken(String email) {
        String token = generateToken();
        UsersEntity user = userRepository.findByEmail(email);
        if (user != null) {
            user.setToken(token);
            userRepository.save(user);
        }
        return token;
    }

    public void updatePassword(String token, String newPassword) {
        UsersEntity user = userRepository.findByToken(token);
        if (user != null) {
            user.setPassword(passwordEncoder.encode(newPassword));
            user.setToken(null); // Xóa token sau khi đặt lại mật khẩu
            userRepository.save(user);
        }
    }

 // Tạo mã token ngẫu nhiên
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int TOKEN_LENGTH = 6;
    private static final SecureRandom RANDOM = new SecureRandom();

    private String generateToken() {
        StringBuilder token = new StringBuilder(TOKEN_LENGTH);
        for (int i = 0; i < TOKEN_LENGTH; i++) {
            int index = RANDOM.nextInt(CHARACTERS.length());
            token.append(CHARACTERS.charAt(index));
        }
        return token.toString();
    }

    public void sendPasswordResetEmail(String userEmail, String token) {
        // Logic gửi email chứa mã token
        // Sử dụng SimpleMailMessage hoặc JavaMailSender
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(userEmail);
        message.setSubject("Yêu cầu đặt lại mật khẩu");
        message.setText("Mã token của bạn để đặt lại mật khẩu là: " + token);
        mailSender.send(message);
    }

    
    
		@PostConstruct
		private void initializeMailSender() {
			JavaMailSenderImpl mailSenderImpl = new JavaMailSenderImpl();
			mailSenderImpl.setHost(mailHost);
			mailSenderImpl.setPort(mailPort);
			mailSenderImpl.setUsername(mailUsername);
			mailSenderImpl.setPassword(mailPassword);

			Properties props = mailSenderImpl.getJavaMailProperties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.debug", "true");

			this.mailSender = mailSenderImpl;
		}
}
