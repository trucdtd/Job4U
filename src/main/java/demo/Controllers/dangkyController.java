package demo.Controllers;

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
    
    @GetMapping("")
    public String dangKy(Model model) {
        model.addAttribute("usersEntity", new UsersEntity()); // Khởi tạo UsersEntity để gửi tới view
        return "dangky";
    }

    @PostMapping("/submit")
    public String submitForm(
            @RequestParam("username") String username,
            @RequestParam("fullname") String fullname,
            @RequestParam("password") String password,
            @RequestParam("email") String email,
            @RequestParam("numberphone") String numberphone,
            @RequestParam(value = "companyName", required = false) String companyName,
            @RequestParam(value = "companyWebsite", required = false) String companyWebsite,
            @RequestParam(value = "companyAddress", required = false) String companyAddress,
            @RequestParam(value = "industry", required = false) String industry,
            @RequestParam(value = "contactPerson", required = false) String contactPerson,
            @RequestParam(value = "companyDescription", required = false) String companyDescription,
            @RequestParam(value = "usertype", required = false) String usertype,
            @RequestParam(value = "termsAgreed", required = false) String termsAgreed, // Lấy giá trị từ checkbox
            Model model
    ) {
        boolean hasErrors = false;

     // Kiểm tra người dùng đã đồng ý với điều khoản chưa
        if (termsAgreed == null) {
            model.addAttribute("termsError", "Bạn phải đồng ý với điều khoản để tiếp tục.");
            hasErrors = true;
        }

        // Các kiểm tra khác (username, fullname, password, email, số điện thoại, loại tài khoản)
        if (username.isEmpty()) {
            model.addAttribute("usernameError", "Tên đăng nhập không được để trống");
            hasErrors = true;
        } else if (!isValidUsername(username)) {
            model.addAttribute("usernameError", "Tên đăng nhập không hợp lệ");
            hasErrors = true;
        }

        if (fullname.isEmpty()) {
            model.addAttribute("fullnameError", "Họ và tên không được để trống");
            hasErrors = true;
        }

        if (password.isEmpty()) {
            model.addAttribute("passwordError", "Mật khẩu không được để trống");
            hasErrors = true;
        } else if (!isValidPassword(password)) {
            model.addAttribute("passwordError", "Mật khẩu phải ít nhất 8 ký tự");
            hasErrors = true;
        }

        if (email.isEmpty()) {
            model.addAttribute("emailError", "Email không được để trống");
            hasErrors = true;
        } else if (!isValidEmail(email)) {
            model.addAttribute("emailError", "Email không hợp lệ");
            hasErrors = true;
        } else if (userService.isEmailExists(email)) {
            model.addAttribute("emailError", "Email đã được sử dụng");
            hasErrors = true;
        }

        if (numberphone.isEmpty()) {
            model.addAttribute("numberphoneError", "Số điện thoại không được để trống");
            hasErrors = true;
        } else if (!isValidPhoneNumber(numberphone)) {
            model.addAttribute("numberphoneError", "Số điện thoại không hợp lệ");
            hasErrors = true;
        } else if (userService.isPhoneNumberExists(numberphone)) {
            model.addAttribute("numberphoneError", "Số điện thoại đã được sử dụng");
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

        // Nếu có lỗi, quay lại trang đăng ký với thông báo lỗi
        if (hasErrors) {
            return "dangky";
        }

     // Xử lý đăng ký thành công
        try {
            UsersEntity newUser = new UsersEntity();
            Integer role = "employer".equals(usertype) ? 2 : 1;
            newUser.setUsername(username);
            newUser.setFullname(fullname);
            newUser.setEmail(email);
            newUser.setPhonenumber(numberphone);
            newUser.setRole(role);
            LocalDateTime now = LocalDateTime.now();
            newUser.setCreatedat(now);
            newUser.setUpdatedat(now);

            userDao.save(newUser);

            if ("employer".equals(usertype)) {
                EmployersEntity employerDetails = new EmployersEntity();
                employerDetails.setCompanyname(companyName);
                employerDetails.setCompanywebsite(companyWebsite);
                employerDetails.setAddress(companyAddress);
                employerDetails.setIndustry(industry);
                employerDetails.setContactperson(contactPerson);
                employerDetails.setCompanydescription(companyDescription);
                employerDetails.setLogo(null);

                employerDetails.setUser(newUser);

                employersDao.save(employerDetails);
            }

			/*
			 * // Lưu thông tin chính sách và điều khoản mà người dùng đã đồng ý
			 * UserAgreementsEntity userAgreement = new UserAgreementsEntity();
			 * userAgreement.setUserID(newUser.getUserId()); // Liên kết với người dùng vừa
			 * đăng ký userAgreement.setAgreementDate(LocalDate.now()); // Ngày đồng ý
			 * userAgreement.setAgreementContent("Nội dung chính sách và điều khoản..."); //
			 * Nội dung điều khoản userAgreement.setStatus("Đồng ý"); // Trạng thái đồng ý
			 * 
			 * userAgreementsDao.save(userAgreement); // Lưu vào database
			 */
            // Thêm thông báo thành công
            model.addAttribute("successMessage", "Bạn đã đăng ký thành công!");
            return "dangky";

        } catch (Exception e) {
            model.addAttribute("errorMessage", "Đã xảy ra lỗi trong quá trình đăng ký, vui lòng thử lại.");
            return "dangky";
        }
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

    private boolean isValidUsername(String username) {
        return username != null && username.matches("^[a-zA-Z0-9_]{3,15}$");
    }
}
