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
import demo.entity.UsersEntity;
import demo.services.SessionService;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/DangKy")
public class dangkyController {
	
	@Autowired
    private UsersDao userDao;

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
            Model model
    ) {
        boolean hasErrors = false;

        if (username.isEmpty()) {
            model.addAttribute("usernameError", "Tên đăng nhập không được để trống");
            hasErrors = true;
        }
        if (fullname.isEmpty()) {
            model.addAttribute("fullnameError", "Họ và tên không được để trống");
            hasErrors = true;
        }
        if (password.isEmpty()) {
            model.addAttribute("passwordError", "Mật khẩu không được để trống");
            hasErrors = true;
        }
        if (email.isEmpty()) {
            model.addAttribute("emailError", "Email không được để trống");
            hasErrors = true;
        }
        if (numberphone.isEmpty()) {
            model.addAttribute("numberphoneError", "Số điện thoại không được để trống");
            hasErrors = true;
        }
        if (usertype == null || usertype.isEmpty()) {
            model.addAttribute("usertypeError", "Vui lòng chọn loại tài khoản");
            hasErrors = true;
        }

        // Validate fields based on their types
        if (!isValidUsername(username)) {
            model.addAttribute("usernameError", "Tên đăng nhập không hợp lệ");
            hasErrors = true;
        }
        if (!isValidPhoneNumber(numberphone)) {
            model.addAttribute("numberphoneError", "Số điện thoại không hợp lệ");
            hasErrors = true;
        }
        if (!isValidPassword(password)) {
            model.addAttribute("passwordError", "Mật khẩu không hợp lệ");
            hasErrors = true;
        }
        if (!isValidEmail(email)) {
            model.addAttribute("emailError", "Email không hợp lệ");
            hasErrors = true;
        }
        if (userDao.existsByEmail(email)) {
            model.addAttribute("emailError", "Email đã được sử dụng.");
            hasErrors = true;
        }
        if (userDao.existsByPhonenumber(numberphone)) {
            model.addAttribute("numberphoneError", "Số điện thoại đã được sử dụng.");
            hasErrors = true;
        }

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

        if (hasErrors) {
            return "dangky";
        }

        try {
            UsersEntity newUser = new UsersEntity();
            Integer role = "employer".equals(usertype) ? 2 : 1;
            newUser.setUsername(username);
            newUser.setFullname(fullname);
            newUser.setPassword(password);
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

            model.addAttribute("successMessage", "Đăng ký thành công!");
            return "redirect:/job4u/login";

        } catch (Exception e) {
            model.addAttribute("message", "Đã xảy ra lỗi, vui lòng thử lại");
            e.printStackTrace();
            return "dangky";
        }
    }

    // Các phương thức kiểm tra
    private boolean isValidUsername(String username) {
        return username.matches("^[a-zA-Z0-9_]+$");
    }

    private boolean isValidPhoneNumber(String numberphone) {
        return numberphone.matches("^\\d{10}$");
    }

    private boolean isValidPassword(String password) {
        return password.length() >= 8 && password.matches(".*\\d.*");
    }

    private boolean isValidEmail(String email) {
        return email.matches("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
    }
}
