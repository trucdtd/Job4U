	
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

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mailjet.client.resource.User;

import ch.qos.logback.core.subst.Token;
import demo.dao.UsersDao;
import demo.entity.UsersEntity;
import jakarta.transaction.Transactional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UsersDao usersDao;

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

    public UsersEntity findByToken(String token) {
        return userRepository.findByToken(token);
    }
    
    // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không
    public boolean isEmailExists(String email) {
        return userRepository.findByEmail(email) != null;
    }
    
    public boolean isUsernameExists(String username) {
        return userRepository.findByUsername(username) != null; // Giả sử bạn có phương thức này trong repository
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
    public interface userService {
        int countUsersToday();
        int countUsersThisMonth();
    }
}