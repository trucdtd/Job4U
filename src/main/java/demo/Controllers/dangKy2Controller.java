package demo.Controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import demo.dao.EmployersDao;
import demo.dao.UserAgreementsDao;
import demo.dao.UsersDao;
import demo.entity.EmployersEntity;
import demo.entity.UserAgreementsEntity;
import demo.entity.UsersEntity;
import demo.services.EmailService;
import demo.util.MaHoa;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/DangKy2")
public class dangKy2Controller {

	@Autowired
	private UsersDao userDao;

	@Autowired
	private EmailService emailService;

	@Autowired
	private EmployersDao employersdao;

	@Autowired
	private UserAgreementsDao userAgreementsDao;

	@GetMapping("")
	public String dangKyNhaTuyenDung(Model model) {
		model.addAttribute("usersEntity", new UsersEntity()); // Khởi tạo UsersEntity để gửi tới view
		return "dangky2";
	}

	@PostMapping("/submit")
	public String submitForm(@RequestParam("username") String username, @RequestParam("fullname") String fullname,
			@RequestParam("password") String password, @RequestParam("email") String email,
			@RequestParam("phonenumber") String phonenumber, @RequestParam("companyname") String companyname,
			@RequestParam("companywebsite") String companywebsite,
			@RequestParam("companydescription") String companydescription, @RequestParam("address") String address,
			@RequestParam(value = "industry", required = false) String industry,
			@RequestParam("contactperson") String contactperson, @RequestParam("taxid") String taxid,
			@RequestParam("logo") MultipartFile logo, Model model, HttpServletRequest req) {

		boolean hasErrors = false;

		// Kiểm tra lỗi cho username
		if (username.isEmpty()) {
			model.addAttribute("usernameError", "Tên tài khoản không được để trống.");
			hasErrors = true;
		} else if (userDao.existsByUsername(username)) {
			model.addAttribute("usernameError", "Tên tài khoản đã tồn tại.");
			hasErrors = true;
		}

		// Kiểm tra Họ và Tên
		if (fullname.isEmpty()) {
			model.addAttribute("fullnameError", "Họ và tên không được để trống");
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

		// Kiểm tra lỗi cho mật khẩu
		if (password.isEmpty()) {
			model.addAttribute("passwordError", "Mật khẩu không được để trống.");
			hasErrors = true;
		} else if (!isValidPassword(password)) {
			model.addAttribute("passwordError", "Mật khẩu phải có ít nhất 8 ký tự.");
			hasErrors = true;
		}

		// Kiểm tra lỗi cho mã số thuế
		if (taxid == null || taxid.isEmpty()) {
			model.addAttribute("taxidError", "Mã số thuế không được để trống.");
			hasErrors = true;
		} else if (!isValidTaxCodeFormat(taxid)) {
			model.addAttribute("taxidError", "Định dạng mã số thuế không hợp lệ.");
			hasErrors = true;
		}

		// Kiểm tra các thông tin công ty
		if (companyname == null || companyname.isEmpty()) {
			model.addAttribute("companyNameError", "Tên công ty không được để trống");
			hasErrors = true;
		}
		if (companywebsite == null || companywebsite.isEmpty()) {
			model.addAttribute("companyWebsiteError", "Website công ty không được để trống");
			hasErrors = true;
		}
		if (address == null || address.isEmpty()) {
			model.addAttribute("companyAddressError", "Địa chỉ công ty không được để trống");
			hasErrors = true;
		}
		if (industry == null || industry.isEmpty()) {
			model.addAttribute("industryError", "Ngành công nghiệp không được để trống");
			hasErrors = true;
		}
		if (contactperson == null || contactperson.isEmpty()) {
			model.addAttribute("contactPersonError", "Người liên hệ không được để trống");
			hasErrors = true;
		}

		// Nếu có lỗi, trả lại trang đăng ký
		if (hasErrors) {
			return "dangky2";
		}

		// Xử lý tải lên logo
		String logoFilename = null;
		if (logo != null && !logo.isEmpty()) {
			String logoOriginalFilename = StringUtils.cleanPath(logo.getOriginalFilename());
			try {
				File uploadsDir = new File(req.getServletContext().getRealPath("/uploads/"));
				if (!uploadsDir.exists())
					uploadsDir.mkdirs();
				Path path = Paths.get(uploadsDir.getAbsolutePath(), logoOriginalFilename);
				Files.write(path, logo.getBytes());
				logoFilename = logoOriginalFilename;
			} catch (IOException e) {
				model.addAttribute("logoError", "Tải logo không thành công.");
				return "dangky2";
			}
		}

		// Tạo và gửi mã xác nhận
		String token = String.format("%06d", new Random().nextInt(999999));
		emailService.sendVerificationCode(email, token);

		// Lưu thông tin tạm thời vào session
		req.getSession().setAttribute("username", username);
		req.getSession().setAttribute("fullname", fullname);
		req.getSession().setAttribute("password", password);
		req.getSession().setAttribute("email", email);
		req.getSession().setAttribute("phonenumber", phonenumber);
		req.getSession().setAttribute("companyname", companyname);
		req.getSession().setAttribute("companywebsite", companywebsite);
		req.getSession().setAttribute("companydescription", companydescription);
		req.getSession().setAttribute("address", address);
		req.getSession().setAttribute("industry", industry);
		req.getSession().setAttribute("contactperson", contactperson);
		req.getSession().setAttribute("taxid", taxid);
		req.getSession().setAttribute("logoFilename", logoFilename);
		req.getSession().setAttribute("token", token);

		// Hiển thị modal xác nhận
		model.addAttribute("showVerificationForm", true);
		model.addAttribute("email", email);

		return "dangky2";
	}

	@PostMapping("/verifyToken")
	public String verifyToken(@RequestParam("token") String inputToken, HttpServletRequest req,
			RedirectAttributes redirectAttributes, Model model) {

		String sessionToken = (String) req.getSession().getAttribute("token");

		// Kiểm tra mã xác nhận
		if (sessionToken == null || !sessionToken.equals(inputToken)) {
			model.addAttribute("errorMessage", false);
			return "dangky2";
		}
		try {
			// Tạo và lưu user vào CSDL
			UsersEntity newUser = new UsersEntity();
			newUser.setUsername((String) req.getSession().getAttribute("username"));
			newUser.setFullname((String) req.getSession().getAttribute("fullname"));
			newUser.setPassword(MaHoa.toSHA1((String) req.getSession().getAttribute("password")));
			newUser.setEmail((String) req.getSession().getAttribute("email"));
			newUser.setPhonenumber((String) req.getSession().getAttribute("phonenumber"));
			newUser.setRole(2); // 2 là vai trò người dùng thường
			newUser.setCreatedat(LocalDateTime.now());
			newUser.setUpdatedat(LocalDateTime.now()); // Gán giá trị cho updatedat
			newUser.setStatus(true);
			userDao.save(newUser);

			EmployersEntity employer = new EmployersEntity();
			employer.setCompanyname((String) req.getSession().getAttribute("companyname"));
			employer.setCompanywebsite((String) req.getSession().getAttribute("companywebsite"));
			employer.setAddress((String) req.getSession().getAttribute("address"));
			employer.setIndustry((String) req.getSession().getAttribute("industry"));
			employer.setContactperson((String) req.getSession().getAttribute("contactperson"));
			employer.setTaxid((String) req.getSession().getAttribute("taxid"));
			employer.setCompanydescription((String) req.getSession().getAttribute("companydescription"));
			employer.setLogo((String) req.getSession().getAttribute("logo"));
			employer.setUser(newUser); // Liên kết với user mới tạo
			employersdao.save(employer); // Lưu thông tin nhà tuyển dụng vào CSDL

			// Lưu điều khoản và chính sách
			UserAgreementsEntity userAgreements = new UserAgreementsEntity();
			userAgreements.setUserid(newUser);
			userAgreements.setAgreementdate(LocalDate.now());
			userAgreements.setAgreementcontent("Nội dung chính sách...");
			userAgreements.setStatus(1); // Trạng thái đồng ý
			userAgreementsDao.save(userAgreements);

			// Xóa session và thông báo thành công
			req.getSession().invalidate(); // Xóa session để bảo mật thông tin
			req.setAttribute("successModal", true); // Đánh dấu thành công
			return "dangky2"; // Quay lại trang đăng ký và thông báo thành công

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", false);
			return "dangky2";
		}
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

	private boolean isValidTaxCodeFormat(String taxCode) {
		// Mã số thuế có thể có 10 hoặc 13 chữ số
		return taxCode != null && taxCode.matches("^\\d{10}(\\d{3})?$");
	}

//	private boolean isTaxCodeValid(String taxCode) {
//		try {
//			// URL của API
//			String apiUrl = "https://api.vietqr.io/v2/tax/tax-code/" + taxCode;
//
//			// Tạo đối tượng RestTemplate
//			RestTemplate restTemplate = new RestTemplate();
//
//			// Thêm header nếu cần thiết (ví dụ: API key)
//			HttpHeaders headers = new HttpHeaders();
//			headers.set("x-client-id", "YOUR_CLIENT_ID");
//			headers.set("x-api-key", "YOUR_API_KEY");
//			HttpEntity<String> entity = new HttpEntity<>(headers);
//
//			// Gửi yêu cầu GET
//			ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);
//
//			// Kiểm tra mã trạng thái
//			if (response.getStatusCode() == HttpStatus.OK) {
//				// Phân tích JSON trả về nếu cần
//				// Ví dụ: kiểm tra một trường cụ thể trong JSON để xác định mã số thuế hợp lệ
//				String responseBody = response.getBody();
//				// Giả sử nếu có dữ liệu trả về thì mã số thuế hợp lệ
//				return true;
//			} else {
//				// Mã số thuế không hợp lệ
//				return false;
//			}
//		} catch (HttpClientErrorException.NotFound e) {
//			// Mã số thuế không tồn tại
//			return false;
//		} catch (Exception e) {
//			e.printStackTrace();
//			// Xử lý ngoại lệ khác
//			return false;
//		}
//	}

}
