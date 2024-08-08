package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import demo.services.SessionService;
import demo.dao.EmployersDao;
import demo.dao.JoblistingsDao;
import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/job4u")
public class NhaTuyenDungController {

    @Autowired
    private SessionService sessionService;

    @Autowired
    private EmployersDao nhaTuyenDungDao;
    
    @Autowired
    private JoblistingsDao danhSachViecLamDao;

    @RequestMapping("/employers")
    public String nhaTuyenDung() {
        return "nhaTuyenDung";
    }

    @PostMapping("/employers/submit")
    public String themTuyenDung(
            @RequestParam("companyname") String companyname,
            @RequestParam("companywebsite") String companywebsite,
            @RequestParam("address") String address,
            @RequestParam("industry") String industry,
            @RequestParam("contactperson") String contactperson,
            @RequestParam("logo") MultipartFile logo,
            @RequestParam("jobtitle") String jobtitle,
            @RequestParam("salary") BigDecimal salary, // Sử dụng BigDecimal ngay từ đầu
            @RequestParam("companydescription") String companydescription,
            @RequestParam("jobrequirements") String jobrequirements,
            @RequestParam("joblocation") String joblocation,
            @RequestParam("jobtype") String jobtype,
            @RequestParam("posteddate") String posteddate,
            @RequestParam("applicationdeadline") String applicationdeadline,
            Model model
    ) {
        // Lấy ID nhà tuyển dụng từ session
        Integer employerId = sessionService.docDuLieu("employerId");

        if (employerId == null) {
            model.addAttribute("error", "Không tìm thấy nhà tuyển dụng.");
            return "nhaTuyenDung";
        }

        EmployersEntity employer = nhaTuyenDungDao.findById(employerId).orElse(null);

        if (employer == null) {
            model.addAttribute("error", "Không tìm thấy nhà tuyển dụng.");
            return "nhaTuyenDung";
        }

        // Cập nhật thông tin nhà tuyển dụng
        employer.setCompanyname(companyname);
        employer.setCompanywebsite(companywebsite);
        employer.setCompanydescription(companydescription);
        employer.setAddress(address);
        employer.setIndustry(industry);
        employer.setContactperson(contactperson);

        // Xử lý file logo
        if (!logo.isEmpty()) {
            try {
                Path uploadDir = Paths.get("upload-dir");
                if (!Files.exists(uploadDir)) {
                    Files.createDirectories(uploadDir);
                }
                Path filePath = uploadDir.resolve(logo.getOriginalFilename());
                logo.transferTo(filePath.toFile());
                employer.setLogo(filePath.toString());
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("error", "Lỗi khi tải lên logo.");
                return "nhaTuyenDung";
            }
        }

        nhaTuyenDungDao.save(employer);

        // Tạo đối tượng JoblistingsEntity
        JoblistingsEntity joblisting = new JoblistingsEntity();
        joblisting.setJobtitle(jobtitle);
        joblisting.setJobdescription(companydescription);
        joblisting.setJobrequirements(jobrequirements);
        joblisting.setJoblocation(joblocation);

        joblisting.setSalary(salary); // Sử dụng giá trị BigDecimal trực tiếp

        joblisting.setJobtype(jobtype);

        // Định dạng ngày từ chuỗi sang LocalDateTime
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        try {
            joblisting.setPosteddate(LocalDateTime.parse(posteddate, formatter));
            joblisting.setApplicationdeadline(LocalDateTime.parse(applicationdeadline, formatter));
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Ngày không hợp lệ.");
            return "nhaTuyenDung";
        }

        joblisting.setEmployer(employer);

        // Lưu đối tượng JoblistingsEntity vào cơ sở dữ liệu
        danhSachViecLamDao.save(joblisting);

        model.addAttribute("message", "Đăng tuyển dụng thành công.");
        return "nhaTuyenDung";
    }
}
