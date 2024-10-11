package demo.Controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.services.ThongKeService;

@Controller
@RequestMapping("/thongke")
public class ThongKeController {

    @Autowired
    private ThongKeService thongKeService;

    @GetMapping("")
    public String thongKe(@RequestParam(value = "timeframe", defaultValue = "1day") String timeframe, Model model) {
        // Lấy dữ liệu thống kê từ ThongKeService
        Map<String, Integer> statistics = thongKeService.getThongKe(timeframe);
        
        // Gửi dữ liệu thống kê và thời gian cho JSP
        model.addAttribute("statistics", statistics);
        model.addAttribute("timeframe", timeframe);
        
        return "thongKeMoi"; // Tên file JSP
    }
}
