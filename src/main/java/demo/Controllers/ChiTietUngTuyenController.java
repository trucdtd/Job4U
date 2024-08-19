package demo.Controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
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
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

        // Chuyển đổi LocalDateTime thành Date
        LocalDateTime postedDateTime = chiTietUngTuyen.getPosteddate();
        Date postedDate = postedDateTime != null ? Date.from(postedDateTime.atZone(ZoneId.systemDefault()).toInstant()) : null;

        LocalDateTime applicationDeadlineTime = chiTietUngTuyen.getApplicationdeadline();
        Date applicationDeadlineDate = applicationDeadlineTime != null ? Date.from(applicationDeadlineTime.atZone(ZoneId.systemDefault()).toInstant()) : null;

        // Định dạng ngày
        String formattedPostedDate = (postedDate != null) ? formatter.format(postedDate) : "N/A";
        String formattedApplicationDeadline = (applicationDeadlineDate != null) ? formatter.format(applicationDeadlineDate) : "N/A";

        // Thêm các thuộc tính vào model để truyền sang view
        model.addAttribute("formattedPostedDate", formattedPostedDate);
        model.addAttribute("formattedApplicationDeadline", formattedApplicationDeadline);
        model.addAttribute("job", chiTietUngTuyen);

        return "chiTietUngTuyen";
    }
}
