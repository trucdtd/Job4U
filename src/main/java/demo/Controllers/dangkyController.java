package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import demo.dao.UserAgreementsDao;
import demo.dao.UsersDao;
import demo.entity.UserAgreementsEntity;
import demo.entity.UsersEntity;
import demo.services.EmailService;
import demo.util.MaHoa;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/DangKy")
public class dangkyController {

	@Autowired
	private UsersDao userDao;

	@Autowired
	private EmailService emailService;

	@Autowired
	private UserAgreementsDao userAgreementsDao;

	@GetMapping("")
	public String dangKyUngVien(Model model) {
		model.addAttribute("usersEntity", new UsersEntity()); // Khởi tạo UsersEntity để gửi tới view
		return "dangky";
	}

	@PostMapping("/submit")
	public String submitForm(@RequestParam("username") String username, @RequestParam("fullname") String fullname,
			@RequestParam("password") String password, @RequestParam("email") String email,
			@RequestParam("phonenumber") String phonenumber, Model model, HttpServletRequest req) {

		boolean hasErrors = false;

		// Kiểm tra các thông tin bắt buộc
		if (username.isEmpty()) {
			model.addAttribute("usernameError", "Tên tài khoản không được để trống.");
			hasErrors = true;
		} else if (userDao.existsByUsername(username)) {
			model.addAttribute("usernameError", "Tên tài khoản đã tồn tại. Vui lòng chọn tên khác.");
			hasErrors = true;
		}

		if (fullname.isEmpty()) {
			model.addAttribute("fullnameError", "Họ và tên không được để trống.");
			hasErrors = true;
		}
		if (password.isEmpty()) {
			model.addAttribute("passwordError", "Mật khẩu không được để trống.");
			hasErrors = true;
		}else if (!isValidPassword(password)) {
			model.addAttribute("passwordError", "Mật khẩu phải có ít nhất 8 ký tự.");
			hasErrors = true;
		}
		
		// Kiểm tra lỗi cho email
		if (email.isEmpty()) {
			model.addAttribute("emailError", "Email không được để trống.");
			hasErrors = true;
		} else if (!isValidEmail(email)) {
			model.addAttribute("emailError", "Email không hợp lệ.");
			hasErrors = true;
		} else if (userDao.existsByEmail(email)) {
			model.addAttribute("emailError", "Email đã tồn tại trong hệ thống.");
			hasErrors = true;
		}

		// Kiểm tra lỗi cho số điện thoại
		if (phonenumber == null || phonenumber.isEmpty()) {
			model.addAttribute("phonenumberError", "Số điện thoại không được để trống.");
			hasErrors = true;
		} else if (!isValidPhoneNumber(phonenumber)) {
			model.addAttribute("phonenumberError", "Số điện thoại không hợp lệ.");
			hasErrors = true;
		} else if (userDao.existsByPhonenumber(phonenumber)) {
			model.addAttribute("phonenumberError", "Số điện thoại đã tồn tại.");
			hasErrors = true;
		}

		// Nếu có lỗi, trả về form đăng ký
		if (hasErrors) {
			return "dangky";
		}

		try {
			// Tạo mã token ngẫu nhiên 6 số
			String token = String.format("%06d", new Random().nextInt(999999));

			// Gửi mã token qua email
			emailService.sendVerificationCode(email, token);

			// Lưu token và thông tin người dùng vào session
			req.getSession().setAttribute("email", email);
			req.getSession().setAttribute("token", token);
			req.getSession().setAttribute("username", username);
			req.getSession().setAttribute("fullname", fullname);
			req.getSession().setAttribute("password", password);
			req.getSession().setAttribute("phonenumber", phonenumber);

			// Hiển thị modal xác minh
			model.addAttribute("showVerificationForm", true);
			model.addAttribute("email", email); // Gửi email để hiển thị trong modal

			// Trả về trang đăng ký với form nhập mã xác thực
			return "dangky"; // Trả về form đăng ký
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", false);
			return "dangky";
		}
	}

	@PostMapping("/verifyToken")
	public String verifyToken(@RequestParam("token") String inputToken, HttpServletRequest req,
			RedirectAttributes redirectAttributes, Model model) {

		String email = (String) req.getSession().getAttribute("email");
		String token = (String) req.getSession().getAttribute("token");

		if (token != null && token.equals(inputToken)) {
			try {
				// Lấy thông tin từ session
				String username = (String) req.getSession().getAttribute("username");
				String fullname = (String) req.getSession().getAttribute("fullname");
				String rawPassword = (String) req.getSession().getAttribute("password");
				String phoneNumber = (String) req.getSession().getAttribute("phonenumber");

				// Tạo đối tượng người dùng mới
				UsersEntity newUser = new UsersEntity();
				newUser.setUsername(username);
				newUser.setFullname(fullname);
				newUser.setPassword(MaHoa.toSHA1(rawPassword)); // Mã hóa mật khẩu
				newUser.setEmail(email);
				newUser.setPhonenumber(phoneNumber);
				newUser.setRole(1);
				newUser.setCreatedat(LocalDateTime.now());
				newUser.setUpdatedat(LocalDateTime.now());
				newUser.setStatus(true);

				// Lưu người dùng
				userDao.save(newUser);

				// Lưu điều khoản và chính sách
				UserAgreementsEntity userAgreements = new UserAgreementsEntity();
				userAgreements.setUserid(newUser);
				userAgreements.setAgreementdate(LocalDate.now());
				userAgreements.setAgreementcontent("Nội dung chính sách...");
				userAgreements.setStatus(1);
				userAgreementsDao.save(userAgreements);

				// Đăng ký thành công
				req.getSession().invalidate();
				req.setAttribute("successModal", true); // Đánh dấu thành công
				return "dangky"; // Trả về trang đăng ký
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", false);
			}
		} else {
			// Mã xác minh không đúng
			model.addAttribute("errorMessage", false);
		}
		return "dangky";
	}

	private boolean isValidPassword(String password) {
		// Kiểm tra mật khẩu có ít nhất 8 ký tự
		return password.length() >= 8;
	}

	private boolean isValidEmail(String email) {
		// Sử dụng regex đơn giản để kiểm tra email
		return email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
	}

	private boolean isValidPhoneNumber(String phonenumber) {
		// Kiểm tra số điện thoại chỉ chứa số
		return phonenumber.matches("\\d+");
	}

}
