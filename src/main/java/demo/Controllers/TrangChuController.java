package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;
import demo.services.SessionService;
import jakarta.servlet.http.HttpSession;

import java.util.Optional;

@Controller
@RequestMapping("/job4u")
public class TrangChuController {
    @Autowired
    JoblistingsDao danhSachViecLamDao;

    @Autowired
	SessionService ss;
    
    @RequestMapping("")
    public String trangChu(Model model, @RequestParam("page") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        Page<JoblistingsEntity> dsSP = danhSachViecLamDao.findAll(pageable);
        model.addAttribute("dsSP", dsSP);
        return "trangChu";
    }
    
    @RequestMapping("/findJob")
    public String findJob(Model model,
                          @RequestParam("page") Optional<Integer> page,
                          @RequestParam("joblocation") Optional<String> joblocation,
                          @RequestParam("industry") Optional<String> industry) {
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        Page<JoblistingsEntity> dsSP;

        if (industry.isPresent() && !industry.get().isEmpty()) {
            if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
                dsSP = danhSachViecLamDao.findByJobLocationAndIndustry(joblocation.get(), industry.get(), pageable);
            } else {
                dsSP = danhSachViecLamDao.findByIndustry(industry.get(), pageable);
            }
        } else if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
            dsSP = danhSachViecLamDao.findByJobLocation(joblocation.get(), pageable);
        } else {
            dsSP = danhSachViecLamDao.findAll(pageable);
        }

        model.addAttribute("dsSP", dsSP);
        return "trangChu";
    }
    @GetMapping("/dangxuat")
	public String dangxuat(HttpSession ss) {
		ss.invalidate();
		return "redirect:/job4u";
	}
}
