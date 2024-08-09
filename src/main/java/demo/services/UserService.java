package demo.services;

import java.util.UUID;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    public String createPasswordResetToken(String email) {
        // Tạo mã thông báo (token) ngẫu nhiên
        String token = UUID.randomUUID().toString();

        // Lưu token, email, và thời gian hết hạn vào cơ sở dữ liệu
        // (bạn cần phải triển khai phần lưu trữ này)

        return token;
    }
}

