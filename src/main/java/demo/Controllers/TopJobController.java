package demo.Controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JoblistingsDao;
import demo.entity.JoblistingsEntity;

@Controller
public class TopJobController {
//	@Autowired
//    JoblistingsDao danhSachViecLamDao;
	@Autowired
	JoblistingsDao dao;
	@RequestMapping("job4u/topjob")
	public String main(Model model) {
		List<JoblistingsEntity> list = dao.findTop5ByOrderByPosteddateDesc();
		model.addAttribute("list", list);
		return "topViecLam";
	}
//	@RequestMapping("/findJob")
//    public String findJob(Model model,
//                          @RequestParam("page") Optional<Integer> page,
//                          @RequestParam("joblocation") Optional<String> joblocation,
//                          @RequestParam("industry") Optional<String> industry,
//                          @RequestParam("jobtitle") Optional<String> jobtitle) {
//        Pageable pageable = PageRequest.of(page.orElse(0), 6);
//        Page<JoblistingsEntity> dsSP;
//
//        // Thực hiện tìm kiếm dựa trên các tham số đầu vào
//        if (jobtitle.isPresent() && !jobtitle.get().isEmpty()) {
//            if (industry.isPresent() && !industry.get().isEmpty()) {
//                if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
//                    dsSP = danhSachViecLamDao.findByJobTitleAndJobLocationAndIndustry(jobtitle.get(), joblocation.get(), industry.get(), pageable);
//                } else {
//                    dsSP = danhSachViecLamDao.findByJobTitleAndIndustry(jobtitle.get(), industry.get(), pageable);
//                }
//            } else if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
//                dsSP = danhSachViecLamDao.findByJobTitleAndJobLocation(jobtitle.get(), joblocation.get(), pageable);
//            } else {
//                dsSP = danhSachViecLamDao.findByJobTitle(jobtitle.get(), pageable);
//            }
//        } else if (industry.isPresent() && !industry.get().isEmpty()) {
//            if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
//                dsSP = danhSachViecLamDao.findByJobLocationAndIndustry(joblocation.get(), industry.get(), pageable);
//            } else {
//                dsSP = danhSachViecLamDao.findByIndustry(industry.get(), pageable);
//            }
//        } else if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
//            dsSP = danhSachViecLamDao.findByJobLocation(joblocation.get(), pageable);
//        } else {
//            dsSP = danhSachViecLamDao.findAll(pageable);
//        }
//
//        // Kiểm tra nếu không có kết quả
//        if (dsSP.isEmpty()) {
//            // Thêm thông báo vào mô hình
//            model.addAttribute("message", "Nội dung tìm kiếm hiện không có.");
//            // Trả về trang chủ với thông báo
//            return "topViecLam";
//        }
//
//        // Nếu có kết quả, thêm vào mô hình và trả về trang kết quả
//        model.addAttribute("dsSP", dsSP);
//        return "topViecLam";
//    }
}