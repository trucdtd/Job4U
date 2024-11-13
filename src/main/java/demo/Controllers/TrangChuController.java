package demo.Controllers;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
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
import demo.dao.UserServicesDao;
import demo.entity.JoblistingsEntity;
import demo.entity.UserServicesEntity;
import demo.services.JoblistingsService;
import demo.services.SessionService;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
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

	@Autowired
	UserServicesDao usDao;

	@Autowired
	JoblistingsDao jlsDAO;

	// Phương thức trangChu
	@RequestMapping("")
	public String trangChu(Model model, @RequestParam("page") Optional<Integer> page) {
		int pageNumber = page.orElse(0);
		// Đếm tổng số bài viết chưa hết hạn nộp hồ sơ
	    long totalItems = danhSachViecLamDao.countByApplicationdeadlineAfterAndActiveTrue(LocalDate.now()); // Đếm bài viết còn hạn
	    // Tính tổng số trang
	    int totalPages = (int) Math.ceil((double) totalItems / 8); // Mỗi trang 8 bài
	    //System.out.println("Total pages: " + totalPages);

	    // Nếu số trang yêu cầu vượt quá tổng số trang, chuyển về trang cuối cùng
	    if (pageNumber >= totalPages) {
	        pageNumber = totalPages - 1;
	    }

	    // Sắp xếp theo posteddate giảm dần
	    Pageable pageable = PageRequest.of(pageNumber, 8, Sort.by("posteddate").descending());

		// xu ly bai viet het han top
		List<JoblistingsEntity> list = jlsDAO.findByIsTopTrue();
		String dateTimeStr2 = LocalDateTime.now().toString();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.n");
		LocalDateTime dateTime2 = LocalDateTime.parse(dateTimeStr2, formatter);
		for (JoblistingsEntity entity : list) {
			String dateTimeStr1 = entity.getUserservice().getExpirydate().toString();
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
			LocalDateTime dateTime1 = LocalDateTime.parse(dateTimeStr1, formatter1);
			if (dateTime1.isBefore(dateTime2)) {
//				// cập nhật lại isActive trong bảng userservice là false
				entity.setIsTop(false);
				entity.getUserservice().setIsactive(false);
				jlsDAO.save(entity);

			}
		}
		// lay ngau nhien bai viet da mua dich vu len top
		List<JoblistingsEntity> top20 = jlsDAO.findTop20();
		Collections.shuffle(top20);
		model.addAttribute("latestJobs", top20);

 		// Lấy danh sách các bài viết chưa hết hạn nộp hồ sơ
		Page<JoblistingsEntity> dsSP = danhSachViecLamDao.findAllByApplicationdeadlineAfterAndActiveTrueOrderByIsTopAndApplicationDeadline(LocalDate.now(), pageable);

		model.addAttribute("dsSP", dsSP);
		return "trangChu";
	}

	@RequestMapping("/findJob")
	public String findJob(Model model, @RequestParam("page") Optional<Integer> page,
			@RequestParam("joblocation") Optional<String> joblocation,
			@RequestParam("industry") Optional<String> industry, @RequestParam("jobtitle") Optional<String> jobtitle) {
		Pageable pageable = PageRequest.of(page.orElse(0), 8, Sort.by("posteddate").descending());
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
			dsSP = danhSachViecLamDao.findAllByApplicationdeadlineAfterAndActiveTrueOrderByIsTopAndApplicationDeadline(LocalDate.now(), pageable);
		}

		// Kiểm tra nếu không có kết quả
		if (dsSP.isEmpty()) {
			// Thêm thông báo vào mô hình
			model.addAttribute("message",
					"Nội dung tìm kiếm hiện không có. Vui lòng tham khảo thêm công việc bên dưới.");
			dsSP = danhSachViecLamDao.findAllByApplicationdeadlineAfterAndActiveTrueOrderByIsTopAndApplicationDeadline(LocalDate.now(), pageable);
			model.addAttribute("dsSP", dsSP);
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
