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
        // Kiểm tra thông tin cơ bản
        if (username.isEmpty() || fullname.isEmpty() || password.isEmpty()
                || email.isEmpty() || numberphone.isEmpty()) {
            model.addAttribute("message", "Vui lòng nhập đầy đủ thông tin");
            return "dangky";
        } else if (usertype == null || usertype.isEmpty()) {
            model.addAttribute("message", "Vui lòng chọn loại tài khoản");
            return "dangky";
        } else if (!isValidUsername(username)) {
            model.addAttribute("message", "Tên đăng nhập không được chỉ chứa số và kí tự đặc biệt");
            return "dangky";
        } else if (!isValidPhoneNumber(numberphone)) {
            model.addAttribute("message", "Số điện thoại không hợp lệ");
            return "dangky";
        } else if (!isValidPassword(password)) {
            model.addAttribute("message", "Mật khẩu phải có ít nhất 8 ký tự và chứa ít nhất một chữ số");
            return "dangky";
        } else if (!isValidEmail(email)) {
            model.addAttribute("message", "Email không đúng định dạng");
            return "dangky";
        } else if (userDao.existsByEmail(email)) {
            model.addAttribute("message", "Email đã được sử dụng. Vui lòng chọn email khác.");
            return "dangky";
        } else if (userDao.existsByPhonenumber(numberphone)) {
            model.addAttribute("message", "Số điện thoại đã được sử dụng. Vui lòng chọn số điện thoại khác.");
            return "dangky";
        } else {
            // Kiểm tra thông tin nhà tuyển dụng nếu là nhà tuyển dụng
            if ("employer".equals(usertype)) {
                if (companyName == null || companyName.isEmpty() ||
                    companyWebsite == null || companyWebsite.isEmpty() ||
                    companyAddress == null || companyAddress.isEmpty() ||
                    industry == null || industry.isEmpty() ||
                    contactPerson == null || contactPerson.isEmpty()) {
                    model.addAttribute("message", "Vui lòng điền đầy đủ thông tin nhà tuyển dụng");
                    return "dangky";
                }
            }

            try {
                // Tạo đối tượng UsersEntity với thông tin từ form
                UsersEntity newUser = new UsersEntity();
                Integer role = "employer".equals(usertype) ? 2 : 1;
                newUser.setUsername(username);
                newUser.setFullname(fullname);
                newUser.setPassword(password); // Mã hóa mật khẩu trước khi lưu
                newUser.setEmail(email);
                newUser.setPhonenumber(numberphone);
                newUser.setRole(role);
                LocalDateTime now = LocalDateTime.now();
                newUser.setCreatedat(now);
                newUser.setUpdatedat(now);

                // Lưu đối tượng vào cơ sở dữ liệu
                userDao.save(newUser);

                // Xử lý thông tin nhà tuyển dụng nếu là nhà tuyển dụng
                if ("employer".equals(usertype)) {
                    EmployersEntity employerDetails = new EmployersEntity();
                    employerDetails.setCompanyname(companyName);
                    employerDetails.setCompanywebsite(companyWebsite);
                    employerDetails.setAddress(companyAddress);
                    employerDetails.setIndustry(industry);
                    employerDetails.setContactperson(contactPerson);
                    employerDetails.setCompanydescription(companyDescription);
                    employerDetails.setLogo(null); // Không lưu logo nếu không có

                    employerDetails.setUser(newUser); // Liên kết với đối tượng UsersEntity

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
