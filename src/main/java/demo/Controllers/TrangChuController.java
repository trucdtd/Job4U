package demo.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import demo.dao.JoblistingsDao;
import demo.entity.EmployersEntity;
import demo.entity.JoblistingsEntity;
import demo.services.JoblistingsService;
import demo.services.SessionService;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/job4u")
public class TrangChuController {
	@Autowired
	JoblistingsDao danhSachViecLamDao;

	@Autowired
	SessionService ss;

	@Autowired
	private JoblistingsService jobListingService;

	@RequestMapping("")
	public String trangChu(Model model, @RequestParam("page") Optional<Integer> page
			 ) {
		int pageNumber = page.orElse(0);
//		Pageable pageable = PageRequest.of(pageNumber, 6);
		// Sắp xếp giảm dần theo ngày và thời gian đăng (bao gồm giờ, phút, giây nếu có)
        Pageable pageable = PageRequest.of(page.orElse(0), 6, Sort.by("posteddate").descending()); 
		Page<JoblistingsEntity> dsSP = danhSachViecLamDao.findAll(pageable);
		model.addAttribute("dsSP", dsSP);
		
		List<JoblistingsEntity> latestJobs = jobListingService.getTop5LatestJobListings();
	    model.addAttribute("latestJobs", latestJobs);
        // Lấy danh sách công việc theo userServiceId nếu nó không null
//        if (userServiceId != null) {
//            // Gọi dịch vụ để lấy danh sách công việc theo userServiceId
//            List<JoblistingsEntity> joblistings = jobListingService.getJobsByUserServiceId(userServiceId);
//            model.addAttribute("joblistings", joblistings); // Thêm danh sách công việc theo userServiceId vào mô hình để hiển thị
//        }
//        
		return "trangChu";
	}

	@RequestMapping("/findJob")
	public String findJob(Model model, @RequestParam("page") Optional<Integer> page,
			@RequestParam("joblocation") Optional<String> joblocation,
			@RequestParam("industry") Optional<String> industry, 
			@RequestParam("jobtitle") Optional<String> jobtitle) {
		Pageable pageable = PageRequest.of(page.orElse(0), 6);
		Page<JoblistingsEntity> dsSP;

		// Thực hiện tìm kiếm dựa trên các tham số đầu vào
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

		// Kiểm tra nếu không có kết quả
		if (dsSP.isEmpty()) {
			// Thêm thông báo vào mô hình
			model.addAttribute("message", "Nội dung tìm kiếm hiện không có.");
			// Trả về trang chủ với thông báo
			return "trangChu";
		}

		// Nếu có kết quả, thêm vào mô hình và trả về trang kết quả
		model.addAttribute("dsSP", dsSP);
		return "trangChu";
	}

	@GetMapping("/dangxuat")
	public String dangxuat(HttpSession ss) {
		ss.invalidate();
		return "redirect:/job4u";
	}

}
