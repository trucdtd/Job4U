package demo.Controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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

        // Định dạng ngày
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

        // Chuyển đổi từ java.util.Date sang String với định dạng
        String formattedPostedDate = (chiTietUngTuyen.getPosteddate() != null) ? formatter.format(chiTietUngTuyen.getPosteddate()) : "N/A";
        String formattedApplicationDeadline = (chiTietUngTuyen.getApplicationdeadline() != null) ? formatter.format(chiTietUngTuyen.getApplicationdeadline()) : "N/A";

        // Thêm các thuộc tính vào mô hình
        model.addAttribute("formattedPostedDate", formattedPostedDate);
        model.addAttribute("formattedApplicationDeadline", formattedApplicationDeadline);
        model.addAttribute("job", chiTietUngTuyen);

        return "chiTietUngTuyen";
    }
}
