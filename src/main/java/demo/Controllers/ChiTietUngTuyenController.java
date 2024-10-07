package demo.Controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import demo.services.JoblistingsService;
import jakarta.servlet.http.HttpSession;
import demo.dao.ApplicationsDao;
import demo.dao.JobSeekersDao;
import demo.dao.UsersDao;
import demo.entity.ApplicationsEntity;
import demo.entity.JobSeekersEntity;
import demo.entity.JoblistingsEntity;
import demo.entity.UsersEntity;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequestMapping("/chiTiet")
public class ChiTietUngTuyenController {

    @Autowired
    private JoblistingsService joblistingsService;

    @Autowired
    JobSeekersDao dao;

    @Autowired
    UsersDao userDao;

    @Autowired
    HttpSession ss;

    @Autowired
    ApplicationsDao appDao;

    @RequestMapping("/{jobid}")
    public String chiTietUngTuyen(@PathVariable("jobid") Integer jobid, Model model) {
        // Lấy thông tin chi tiết công việc
        JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);

        // Định dạng ngày với định dạng dd/MM/yyyy
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate postedDate = chiTietUngTuyen.getPosteddate();
        LocalDate applicationDeadlineDate = chiTietUngTuyen.getApplicationdeadline();

        // Định dạng ngày
        String formattedPostedDate = (postedDate != null) ? postedDate.format(formatter) : "N/A";
        String formattedApplicationDeadline = (applicationDeadlineDate != null)
                ? applicationDeadlineDate.format(formatter)
                : "N/A";

        // Lấy ID người dùng đã đăng nhập
        Integer userId = (Integer) ss.getAttribute("userid");
        if (userId == null) {
            return "redirect:/Login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Lấy danh sách CV của người dùng
        List<JobSeekersEntity> listCV = dao.findByUsername(userId);

        // Thêm các thuộc tính vào model để truyền sang view
        model.addAttribute("formattedPostedDate", formattedPostedDate);
        model.addAttribute("formattedApplicationDeadline", formattedApplicationDeadline);
        model.addAttribute("job", chiTietUngTuyen);
        model.addAttribute("listCV", listCV); // Thêm danh sách CV vào model

        return "chiTietUngTuyen";
    }

    @PostMapping("/{jobid}")
    public String postSubmitCV(@PathVariable("jobid") Integer jobid, Model model,
                                @RequestParam("id") Integer jSKID,
                                @RequestParam("cvFile") MultipartFile cvFile,
                                @RequestParam("cvOptions") String cvOption) {
        Integer id = (Integer) ss.getAttribute("userid");
        if (id == null) {
            return "redirect:/login"; // Chuyển hướng nếu người dùng chưa đăng nhập
        }

        // Lấy thông tin chi tiết công việc
        JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);
        LocalDate postedDate = chiTietUngTuyen.getPosteddate();
        LocalDate applicationDeadlineDate = chiTietUngTuyen.getApplicationdeadline();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedPostedDate = (postedDate != null) ? postedDate.format(formatter) : "N/A";
        String formattedApplicationDeadline = (applicationDeadlineDate != null) ? applicationDeadlineDate.format(formatter) : "N/A";

        ApplicationsEntity app = new ApplicationsEntity();
        try {
            JobSeekersEntity jSK = dao.findByJobseekerid(jSKID);

            // Kiểm tra tùy chọn CV
            if ("upload".equals(cvOption)) {
                // Nếu người dùng chọn tải lên CV mới
                byte[] resumeBytes = cvFile.getBytes(); // Lấy bytes từ file tải lên
                jSK.setResume(new String(resumeBytes)); // Lưu CV vào đối tượng JobSeekers
                dao.save(jSK); // Lưu lại CV mới vào cơ sở dữ liệu
            } else if ("choose".equals(cvOption)) {
                // Nếu người dùng chọn CV có sẵn
                // Không cần làm gì, đã có jSK
            }

            app.setJob(chiTietUngTuyen);
            app.setJobseeker(jSK);
            app.setApplicationdate(LocalDateTime.now());
            app.setStatus(1);
            app.setResume(jSK.getResume());
            app.setCreatedat(LocalDateTime.now());
            appDao.save(app);
            model.addAttribute("script", "<script>alert('Ứng tuyển thành công')</script>");
        } catch (Exception e) {
            System.out.println(e);
        }

        // Thêm các thuộc tính vào model để truyền sang view
        model.addAttribute("formattedPostedDate", formattedPostedDate);
        model.addAttribute("formattedApplicationDeadline", formattedApplicationDeadline);
        model.addAttribute("job", chiTietUngTuyen);
        model.addAttribute("listCV", dao.findByUsername(id));

        return "chiTietUngTuyen";
    }

}