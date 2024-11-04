package demo.Controllers;

import java.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.dao.EmployersDao;
import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.UsersEntity;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/ThongTinCaNhan")
public class thongTinCaNhanController {
	@Autowired
	private UsersDao usersDao;

	@Autowired
	HttpServletRequest req;

	@Autowired
	HttpServletResponse resp;

	@GetMapping
	public String userAccount(HttpSession session, Model model) {
		Integer userId = (Integer) session.getAttribute("userid");
		if (userId == null) {
			model.addAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
			return "dangnhap";
		}

		try {
			UsersEntity user = usersDao.findById(userId)
					.orElseThrow(() -> new RuntimeException("Người dùng không tồn tại."));

			String logo = null;
			String image = null;

			// Kiểm tra vai trò để lấy thông tin logo hoặc hình ảnh
//	        if (user.getRole() == 2) { // Nhà tuyển dụng
//	            Optional<EmployersEntity> employerOpt = employersDao.findByUserId(userId);
//	            if (employerOpt.isPresent()) {
//	                logo = employerOpt.get().getLogo(); // Lấy logo
//	            }
//	        } else if (user.getRole() == 1) { // Ứng viên
//	            Optional<JobSeekersEntity> jobSeekerOpt = jobSeekersDao.findByUserId(userId);
//	            if (jobSeekerOpt.isPresent()) {
//	                JobSeekersEntity jobSeeker = jobSeekerOpt.get();
//	                image = encodeImageToBase64(jobSeeker.getImage()); // Lấy hình ảnh
//	            }
//	        }

			// Định dạng ngày giờ
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String formattedCreatedAt = user.getCreatedat().format(formatter);
			String formattedUpdatedAt = user.getUpdatedat().format(formatter);

			// Thêm thông tin vào model
			model.addAttribute("user", user);
			model.addAttribute("logo", logo);
			model.addAttribute("image", image);
			model.addAttribute("formattedCreatedAt", formattedCreatedAt);
			model.addAttribute("formattedUpdatedAt", formattedUpdatedAt);

		} catch (Exception e) {
			model.addAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
			return "dangnhap";
		}

		return "thongTinCaNhan";
	}

	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute UsersEntity user, HttpSession session, Model model) {
		Integer userId = (Integer) session.getAttribute("userid");

		if (userId == null) {
			model.addAttribute("error", "Bạn cần đăng nhập để truy cập trang này.");
			return "dangnhap"; // Chuyển hướng đến trang đăng nhập
		}

		try {
			UsersEntity existingUser = usersDao.findById(userId)
					.orElseThrow(() -> new RuntimeException("Người dùng không tồn tại."));

			// Cập nhật thông tin người dùng
			existingUser.setFullname(user.getFullname());
			existingUser.setEmail(user.getEmail());

			// Lưu người dùng đã cập nhật vào cơ sở dữ liệu
			usersDao.save(existingUser);

			// Cập nhật thông tin trong session
			session.setAttribute("userName", existingUser.getFullname());

			model.addAttribute("success", "Cập nhật thành công!");
		} catch (Exception e) {
			model.addAttribute("error", "Đã xảy ra lỗi khi cập nhật thông tin: " + e.getMessage());
			return "thongTinCaNhan"; // Quay lại trang thông tin cá nhân
		}

		return "redirect:/ThongTinCaNhan"; // Chuyển hướng về trang thông tin cá nhân
	}

}
