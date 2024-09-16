package demo.Controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;  // Import thêm Sort để sắp xếp
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;

@Controller
public class TopJobController {
    @Autowired
    JoblistingsDao danhSachViecLamDao;

    @RequestMapping("job4u/topjob")
    public String main(Model model, @RequestParam("page") Optional<Integer> page) {
        // Sắp xếp giảm dần theo ngày và thời gian đăng (bao gồm giờ, phút, giây nếu có)
        Pageable pageable = PageRequest.of(page.orElse(0), 6, Sort.by("posteddate").descending());  
        Page<JoblistingsEntity> dsSP = danhSachViecLamDao.findAll(pageable);
        model.addAttribute("dsSP", dsSP);
        return "topViecLam";
    }

    @RequestMapping("/job4u/topjob/findJob")
    public String findJob(Model model, @RequestParam("page") Optional<Integer> page,
                          @RequestParam("joblocation") Optional<String> joblocation,
                          @RequestParam("industry") Optional<String> industry,
                          @RequestParam("jobtitle") Optional<String> jobtitle) {

        Pageable pageable = PageRequest.of(page.orElse(0), 6, Sort.by("posteddate").descending());  // Sắp xếp giảm dần theo ngày đăng và thời gian
        Page<JoblistingsEntity> dsSP;

        // Thực hiện tìm kiếm dựa trên các tham số đầu vào và sắp xếp theo ngày và thời gian đăng mới nhất
        if (jobtitle.isPresent() && !jobtitle.get().isEmpty()) {
            if (industry.isPresent() && !industry.get().isEmpty()) {
                if (joblocation.isPresent() && !joblocation.get().isEmpty()
                        && !"All".equalsIgnoreCase(joblocation.get())) {
                    dsSP = danhSachViecLamDao.findByJobTitleAndJobLocationAndIndustry(jobtitle.get(), joblocation.get(),
                            industry.get(), pageable);
                } else {
                    dsSP = danhSachViecLamDao.findByJobTitleAndIndustry(jobtitle.get(), industry.get(), pageable);
                }
            } else if (joblocation.isPresent() && !joblocation.get().isEmpty()
                    && !"All".equalsIgnoreCase(joblocation.get())) {
                dsSP = danhSachViecLamDao.findByJobTitleAndJobLocation(jobtitle.get(), joblocation.get(), pageable);
            } else {
                dsSP = danhSachViecLamDao.findByJobTitle(jobtitle.get(), pageable);
            }
        } else if (industry.isPresent() && !industry.get().isEmpty()) {
            if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
                dsSP = danhSachViecLamDao.findByJobLocationAndIndustry(joblocation.get(), industry.get(), pageable);
            } else {
                dsSP = danhSachViecLamDao.findByIndustry(industry.get(), pageable);
            }
        } else if (joblocation.isPresent() && !joblocation.get().isEmpty()
                && !"All".equalsIgnoreCase(joblocation.get())) {
            dsSP = danhSachViecLamDao.findByJobLocation(joblocation.get(), pageable);
        } else {
            dsSP = danhSachViecLamDao.findAll(pageable);
        }

        if (dsSP.isEmpty()) {
            model.addAttribute("message", "Không tìm thấy công việc phù hợp.");
            return "topViecLam";
        }

        model.addAttribute("dsSP", dsSP);
        return "topViecLam";
    }

}
