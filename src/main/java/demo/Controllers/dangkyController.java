package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import demo.dao.EmployersDao;
import demo.dao.UserAgreementsDao;
import demo.dao.UsersDao;
import demo.entity.EmployersEntity;
import demo.entity.UserAgreementsEntity;
import demo.entity.UsersEntity;
import demo.services.UserService;

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
			@RequestParam("phonenumber") String phonenumber,
			@RequestParam(value = "companyName", required = false) String companyName,
			@RequestParam(value = "companyWebsite", required = false) String companyWebsite,
			@RequestParam(value = "companyAddress", required = false) String companyAddress,
			@RequestParam(value = "industry", required = false) String industry,
			@RequestParam(value = "contactPerson", required = false) String contactPerson,
			@RequestParam(value = "companyDescription", required = false) String companyDescription,
			@RequestParam(value = "usertype", required = false) String usertype,
			@RequestParam(value = "taxid", required = false) String taxid,
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
			model.addAttribute("usernameError",
					"Tên đăng nhập phải có ít nhất một số, chỉ chứa chữ cái và số, và độ dài từ 3 đến 15 ký tự");
			hasErrors = true;
		} else if (userService.isUsernameExists(username)) {
			model.addAttribute("usernameError", "Tên đăng nhập đã được sử dụng");
			hasErrors = true;
		}

		// Kiểm tra Họ và Tên
		if (fullname.isEmpty()) {
			model.addAttribute("fullnameError", "Họ và tên không được để trống");
			hasErrors = true;
		} else if (!isValidFullname(fullname)) {
			model.addAttribute("fullnameError", "Họ và tên chỉ được chứa chữ cái");
			hasErrors = true;
		}

		// Kiểm tra Mật khẩu
		if (password.isEmpty() || !isValidPassword(password)) {
			model.addAttribute("passwordError",
					password.isEmpty() ? "Mật khẩu không được để trống" : "Mật khẩu phải ít nhất 8 ký tự");
			hasErrors = true;
		}

		// Kiểm tra Email
		if (email.isEmpty() || !isValidEmail(email) || userService.isEmailExists(email)) {
			model.addAttribute("emailError", email.isEmpty() ? "Email không được để trống"
					: !isValidEmail(email) ? "Email không hợp lệ" : "Email đã được sử dụng");
			hasErrors = true;
		}

		// Kiểm tra Số điện thoại
		if (phonenumber.isEmpty() || !isValidPhoneNumber(phonenumber) || userService.isPhoneNumberExists(phonenumber)) {
			model.addAttribute("phonenumberError",
					phonenumber.isEmpty() ? "Số điện thoại không được để trống"
							: !isValidPhoneNumber(phonenumber) ? "Số điện thoại không hợp lệ (chỉ cho phép số)"
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

			if (taxid == null || taxid.isEmpty()) {
				model.addAttribute("taxidError", "Mã số thuế không được để trống");
				hasErrors = true;
			} else if (!isValidTaxCodeFormat(taxid)) {
				model.addAttribute("taxidError", "Định dạng mã số thuế không hợp lệ");
				hasErrors = true;
			} else if (!isTaxCodeValid(taxid)) {
				model.addAttribute("taxidError", "Mã số thuế không tồn tại hoặc không hợp lệ");
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
			newUser.setPhonenumber(phonenumber);
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
				employerDetails.setTaxid(taxid);

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

	private boolean isValidPassword(String password) {
		// Kiểm tra mật khẩu có ít nhất 8 ký tự
		return password.length() >= 8;
	}

	private boolean isValidEmail(String email) {
		// Sử dụng regex đơn giản để kiểm tra email
		return email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
	}

	private boolean isValidUsername(String username) {
		// Kiểm tra tên đăng nhập có ít nhất một số, chỉ chứa chữ cái và số, và độ dài
		// từ 3 đến 15 ký tự
		return username.matches("^(?=.*\\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{3,15}$");
	}

	private boolean isValidFullname(String fullname) {
		// Kiểm tra xem họ và tên chỉ chứa chữ cái và khoảng trắng
		return fullname.matches("[a-zA-Z\\s]+");
	}

	private boolean isValidPhoneNumber(String phonenumber) {
		// Kiểm tra số điện thoại chỉ chứa số
		return phonenumber.matches("\\d+");
	}

	private boolean isValidTaxCodeFormat(String taxCode) {
		// Mã số thuế có thể có 10 hoặc 13 chữ số
		return taxCode != null && taxCode.matches("^\\d{10}(\\d{3})?$");
	}

	private boolean isTaxCodeValid(String taxCode) {
		try {
			// URL của API
			String apiUrl = "https://api.vietqr.io/v2/tax/tax-code/" + taxCode;

			// Tạo đối tượng RestTemplate
			RestTemplate restTemplate = new RestTemplate();

			// Thêm header nếu cần thiết (ví dụ: API key)
			HttpHeaders headers = new HttpHeaders();
			headers.set("x-client-id", "YOUR_CLIENT_ID");
			headers.set("x-api-key", "YOUR_API_KEY");
			HttpEntity<String> entity = new HttpEntity<>(headers);

			// Gửi yêu cầu GET
			ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

			// Kiểm tra mã trạng thái
			if (response.getStatusCode() == HttpStatus.OK) {
				// Phân tích JSON trả về nếu cần
				// Ví dụ: kiểm tra một trường cụ thể trong JSON để xác định mã số thuế hợp lệ
				String responseBody = response.getBody();
				// Giả sử nếu có dữ liệu trả về thì mã số thuế hợp lệ
				return true;
			} else {
				// Mã số thuế không hợp lệ
				return false;
			}
		} catch (HttpClientErrorException.NotFound e) {
			// Mã số thuế không tồn tại
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			// Xử lý ngoại lệ khác
			return false;
		}
	}

}
