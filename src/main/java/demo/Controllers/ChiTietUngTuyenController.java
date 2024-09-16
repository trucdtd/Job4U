package demo.Controllers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import demo.services.JoblistingsService;
import demo.entity.JoblistingsEntity;

@Controller
@RequestMapping("/job4u")
public class ChiTietUngTuyenController {

    @Autowired
    private JoblistingsService joblistingsService;

    @RequestMapping("/chiTiet/{jobid}")
    public String chiTietUngTuyen(@PathVariable("jobid") Integer jobid, Model model) {
        // Lấy thông tin chi tiết công việc
        JoblistingsEntity chiTietUngTuyen = joblistingsService.getJoblistingById(jobid);

        // Định dạng ngày với định dạng dd/MM/yyyy
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate postedDate = chiTietUngTuyen.getPosteddate();
        LocalDate applicationDeadlineDate = chiTietUngTuyen.getApplicationdeadline();

        // Định dạng ngày
        String formattedPostedDate = (postedDate != null) ? postedDate.format(formatter) : "N/A";
        String formattedApplicationDeadline = (applicationDeadlineDate != null) ? applicationDeadlineDate.format(formatter) : "N/A";

        // Thêm các thuộc tính vào model để truyền sang view
        model.addAttribute("formattedPostedDate", formattedPostedDate);
        model.addAttribute("formattedApplicationDeadline", formattedApplicationDeadline);
        model.addAttribute("job", chiTietUngTuyen);

        return "chiTietUngTuyen";
    }
}
