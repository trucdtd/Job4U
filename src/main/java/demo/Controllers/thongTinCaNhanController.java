package demo.Controllers;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.EmployersDao;
import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.EmployersEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.UsersEntity;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/ThongTinCaNhan")
public class thongTinCaNhanController {
    @Autowired
    private UsersDao usersDao;

    @Autowired
    private EmployersDao employersDao;
    
    @Autowired
    private JobSeekersDao jobSeekersDao;
    
    @GetMapping
    public String userAccount(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("userid");
        System.out.println("userId: " + userId);

        if (userId == null) {
            model.addAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
            return "dangnhap"; 
        }

        try {
            UsersEntity user = usersDao.findById(userId)
                                       .orElseThrow(() -> new RuntimeException("Người dùng không tồn tại."));

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String formattedCreatedAt = user.getCreatedat().format(formatter);
            String formattedUpdatedAt = user.getUpdatedat().format(formatter);

            model.addAttribute("user", user);
            model.addAttribute("formattedCreatedAt", formattedCreatedAt);
            model.addAttribute("formattedUpdatedAt", formattedUpdatedAt);

            if (user.getRole() == 2) { // Nhà tuyển dụng
                Optional<EmployersEntity> employer = employersDao.findByUserId(userId);
                if (employer.isPresent()) {
                    model.addAttribute("logo", employer.get().getLogo());
                } else {
                    model.addAttribute("error", "Nhà tuyển dụng không tồn tại.");
                }
            } else if (user.getRole() == 1) { // Người tìm việc
                Optional<JobSeekersEntity> jobSeeker = jobSeekersDao.findByUserId(userId).stream().findFirst();
//                if (jobSeeker.isPresent()) {
//                    byte[] imageBytes = jobSeeker.get().getImage();
//                    if (imageBytes != null) {
//                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
//                        model.addAttribute("image", base64Image);
//                    }
//                }
                if (jobSeeker.isPresent()) {
                    model.addAttribute("image", jobSeeker.get().getImage());
                } else {
                    model.addAttribute("error", "Người tìm việc không tồn tại.");
                }
            }

        } catch (Exception e) {
            model.addAttribute("error", "Đã xảy ra lỗi khi lấy thông tin người dùng.");
            return "dangnhap"; 
        }

        return "thongTinCaNhan"; 
    }

    @PostMapping("/updateUser")
    public String updateUser(@RequestParam String fullname, 
                             @RequestParam String email, 
                             HttpSession session, 
                             Model model) {
        // Lấy ID người dùng từ session
        Integer userId = (Integer) session.getAttribute("userid");
        if (userId == null) {
            model.addAttribute("error", "Bạn cần đăng nhập để thực hiện cập nhật.");
            return "dangnhap"; // Chuyển hướng đến trang đăng nhập
        }

        try {
            // Tìm người dùng và cập nhật thông tin
            UsersEntity user = usersDao.findById(userId)
                                       .orElseThrow(() -> new RuntimeException("Người dùng không tồn tại."));
            user.setFullname(fullname);
            user.setEmail(email);

            // Lưu thông tin người dùng đã cập nhật
            usersDao.save(user);

            // Thêm thông tin người dùng vào model để hiển thị
            model.addAttribute("user", user);
            model.addAttribute("success", "Cập nhật thông tin thành công!");

        } catch (Exception e) {
            model.addAttribute("error", "Đã xảy ra lỗi khi cập nhật thông tin.");
            return "thongTinCaNhan"; // Quay lại trang thông tin cá nhân
        }

        return "thongTinCaNhan"; // Trả về trang thông tin cá nhân
    }
}
