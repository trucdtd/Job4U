package demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.UsersDao;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Service
public class ThongKeService {

    @Autowired
    private UsersDao usersDao;

    public Map<String, Integer> getThongKe(String timeframe) {
        Map<String, Integer> statistics = new HashMap<>();
        LocalDateTime since = getTimeframe(timeframe);
        
        // Đếm số người dùng mới từ một thời gian nhất định
        int newUsersCount = usersDao.countNewUsersSince(since);
        
        // Thêm thống kê vào map
        statistics.put("newUsers", newUsersCount);
        
        // Có thể thêm các thống kê khác tương tự
        return statistics;
    }

    // Hàm chuyển đổi timeframe thành LocalDateTime
    private LocalDateTime getTimeframe(String timeframe) {
        LocalDateTime now = LocalDateTime.now();
        switch (timeframe) {
            case "1day":
                return now.minusDays(1);
            case "1month":
                return now.minusMonths(1);
            case "6months":
                return now.minusMonths(6);
            case "12months":
                return now.minusMonths(12);
            default:
                return now.minusDays(1); // Giá trị mặc định là 1 ngày
        }
    }
}
