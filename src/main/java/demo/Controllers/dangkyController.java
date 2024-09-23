package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mailjet.client.resource.User;

import demo.dao.EmployersDao;
import demo.dao.UserAgreementsDao;
import demo.dao.UsersDao;
import demo.entity.EmployersEntity;
import demo.entity.UserAgreementsEntity;
import demo.entity.UsersEntity;
import demo.services.SessionService;
import demo.services.UserService;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/DangKy")
public class dangkyController {

	@Autowired
	private UsersDao userDao;

	@Autowired
	private UserService userService;

	@Autowired
	private EmployersDao employersDao;

	@Autowired
	private UserAgreementsDao userAgreementsDao;

	@GetMapping("")
	public String dangKy(Model model) {
		model.addAttribute("usersEntity", new UsersEntity()); // Khởi tạo UsersEntity để gửi tới view
		return "dangky";
	}

	@PostMapping("/submit")
	public String submitForm(@RequestParam("username") String username, @RequestParam("fullname") String fullname,
	        @RequestParam("password") String password, @RequestParam("email") String email,
	        @RequestParam("numberphone") String numberphone,
	        @RequestParam(value = "companyName", required = false) String companyName,
	        @RequestParam(value = "companyWebsite", required = false) String companyWebsite,
	        @RequestParam(value = "companyAddress", required = false) String companyAddress,
	        @RequestParam(value = "industry", required = false) String industry,
	        @RequestParam(value = "contactPerson", required = false) String contactPerson,
	        @RequestParam(value = "companyDescription", required = false) String companyDescription,
	        @RequestParam(value = "usertype", required = false) String usertype,
	        @RequestParam(value = "termsAgreed", required = false) String termsAgreed, Model model) {

	    boolean hasErrors = false;

		// Kiểm tra điều khoản
		if (termsAgreed == null) {
			model.addAttribute("termsError", "Bạn phải đồng ý với điều khoản để tiếp tục.");
			hasErrors = true;
		}

		// Kiểm tra các thông tin bắt buộc
		if (username.isEmpty()) {
		    model.addAttribute("usernameError", "Tên đăng nhập không được để trống");
		    hasErrors = true;
		} else if (!isValidUsername(username)) {
		    model.addAttribute("usernameError", "Tên đăng nhập phải có ít nhất một số và độ dài từ 3 đến 15 ký tự");
		    hasErrors = true;
		} else if (userService.isUsernameExists(username)) {
		    model.addAttribute("usernameError", "Tên đăng nhập đã được sử dụng");
		    hasErrors = true;
		}

		if (fullname.isEmpty()) {
			model.addAttribute("fullnameError", "Họ và tên không được để trống");
			hasErrors = true;
		}

		if (password.isEmpty() || !isValidPassword(password)) {
			model.addAttribute("passwordError",
					password.isEmpty() ? "Mật khẩu không được để trống" : "Mật khẩu phải ít nhất 8 ký tự");
			hasErrors = true;
		}

		if (email.isEmpty() || !isValidEmail(email) || userService.isEmailExists(email)) {
			model.addAttribute("emailError", email.isEmpty() ? "Email không được để trống"
					: !isValidEmail(email) ? "Email không hợp lệ" : "Email đã được sử dụng");
			hasErrors = true;
		}

		if (numberphone.isEmpty() || !isValidPhoneNumber(numberphone) || userService.isPhoneNumberExists(numberphone)) {
			model.addAttribute("numberphoneError",
					numberphone.isEmpty() ? "Số điện thoại không được để trống"
							: !isValidPhoneNumber(numberphone) ? "Số điện thoại không hợp lệ"
									: "Số điện thoại đã được sử dụng");
			hasErrors = true;
		}

		if (usertype == null || usertype.isEmpty()) {
			model.addAttribute("usertypeError", "Vui lòng chọn loại tài khoản");
			hasErrors = true;
		}

		// Kiểm tra thông tin nhà tuyển dụng nếu loại tài khoản là "employer"
		if ("employer".equals(usertype)) {
			if (companyName == null || companyName.isEmpty()) {
				model.addAttribute("companyNameError", "Tên công ty không được để trống");
				hasErrors = true;
			}
			if (companyWebsite == null || companyWebsite.isEmpty()) {
				model.addAttribute("companyWebsiteError", "Website công ty không được để trống");
				hasErrors = true;
			}
			if (companyAddress == null || companyAddress.isEmpty()) {
				model.addAttribute("companyAddressError", "Địa chỉ công ty không được để trống");
				hasErrors = true;
			}
			if (industry == null || industry.isEmpty()) {
				model.addAttribute("industryError", "Ngành công nghiệp không được để trống");
				hasErrors = true;
			}
			if (contactPerson == null || contactPerson.isEmpty()) {
				model.addAttribute("contactPersonError", "Người liên hệ không được để trống");
				hasErrors = true;
			}
		}

		try {
			// Tạo đối tượng người dùng mới
			UsersEntity newUser = new UsersEntity();
			Integer role = "employer".equals(usertype) ? 2 : 1;
			newUser.setUsername(username);
			newUser.setFullname(fullname);
			newUser.setPassword(password); // Mã hóa mật khẩu
			newUser.setEmail(email);
			newUser.setPhonenumber(numberphone);
			newUser.setRole(role);
			LocalDateTime now = LocalDateTime.now();
			newUser.setCreatedat(now);
			newUser.setUpdatedat(now);
			newUser.setStatus("hoạt động"); // Thiết lập status

			userDao.save(newUser);

			// Nếu người dùng là nhà tuyển dụng, lưu thêm thông tin công ty
			if ("employer".equals(usertype)) {
				EmployersEntity employerDetails = new EmployersEntity();
				employerDetails.setCompanyname(companyName);
				employerDetails.setCompanywebsite(companyWebsite);
				employerDetails.setAddress(companyAddress);
				employerDetails.setIndustry(industry);
				employerDetails.setContactperson(contactPerson);
				employerDetails.setCompanydescription(companyDescription);
				employerDetails.setLogo(null); // Có thể bổ sung logic để upload logo

				employerDetails.setUser(newUser);
				employersDao.save(employerDetails);
			}

			// Lưu thông tin điều khoản và chính sách
			UserAgreementsEntity Useragreements = new UserAgreementsEntity();
			Useragreements.setUserid(newUser);
			Useragreements.setAgreementdate(LocalDate.now());
			Useragreements.setAgreementcontent(
					"Chính Sách: Để đảm bảo chất lượng dịch vụ, Job4U không cho phép một người dùng tạo nhiều tài khoản khác nhau..."); // Nội
																																		// dung
																																		// chính
																																		// sách
			Useragreements.setStatus(true); // Thiết lập giá trị cho cột status

			userAgreementsDao.save(Useragreements); // Lưu vào cơ sở dữ liệu

			model.addAttribute("successMessage", "Đăng ký thành công!");
			return "dangky";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "Đã xảy ra lỗi trong quá trình đăng ký, vui lòng thử lại.");
			return "dangky";
		}
	}

	private boolean isValidUsername(String username) {
        // Kiểm tra tên đăng nhập không null, có độ dài từ 3 đến 15 ký tự và chứa ít nhất một số
        return username != null && username.matches("^(?=.*\\d)[a-zA-Z0-9_]{3,15}$");
    }

    private boolean isValidPassword(String password) {
        return password != null && password.length() >= 8 && password.matches(".*\\d.*");
    }

    private boolean isValidEmail(String email) {
        return email != null && email.matches("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
    }

    private boolean isValidPhoneNumber(String numberphone) {
        return numberphone != null && numberphone.matches("^\\d{10}$");
    }
}
