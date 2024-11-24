package demo.Controllers;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.eclipse.tags.shaded.org.apache.regexp.recompile;
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

import demo.dao.JobCategoriesDao;
import demo.dao.JoblistingsDao;
import demo.dao.UserServicesDao;
import demo.entity.JobCategoriesEntity;
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

	@Autowired
	JobCategoriesDao jobCareDao;

	// Phương thức trangChu
	@RequestMapping("")
	public String trangChu(Model model, @RequestParam("page") Optional<Integer> page) {
		int pageNumber = page.orElse(0);
		// Đếm tổng số bài viết chưa hết hạn nộp hồ sơ
		long totalItems = danhSachViecLamDao.countByApplicationdeadlineAfterAndActiveTrue(LocalDate.now());

		// Tính tổng số trang
		int totalPages = (int) Math.ceil((double) totalItems / 8); // Mỗi trang 8 bài
		// System.out.println("Total pages: " + totalPages);

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
		Page<JoblistingsEntity> dsSP = danhSachViecLamDao
				.findAllByApplicationdeadlineAfterAndActiveTrueOrderByIsTopAndApplicationDeadline(LocalDate.now(),
						pageable);

		// Lấy danh sách nghề nghiệp từ cơ sở dữ liệu
		List<JobCategoriesEntity> dsnghe = jobCareDao.findAll();
		model.addAttribute("dsnghe", dsnghe);

		model.addAttribute("dsSP", dsSP);
		return "trangChu";
	}

	@RequestMapping("/findJob")
	public String findJob(Model model, @RequestParam("page") Optional<Integer> page,
			@RequestParam("joblocation") Optional<String> joblocation,
			@RequestParam("industry") Optional<String> industry, @RequestParam("jobtitle") Optional<String> jobtitle) {
		Pageable pageable = PageRequest.of(page.orElse(0), 8, Sort.by("posteddate").descending());
		Page<JoblistingsEntity> dsSP;
		// Lấy danh sách nghề nghiệp từ cơ sở dữ liệu
		List<JobCategoriesEntity> dsnghe = jobCareDao.findAll();

		// Thực hiện tìm kiếm dựa trên các tham số đầu vào
		if (jobtitle.isPresent() && !jobtitle.get().isEmpty()) {
			if (industry.isPresent() && !industry.get().isEmpty()) {
				if (joblocation.isPresent() && !joblocation.get().isEmpty()
						&& !"All".equalsIgnoreCase(joblocation.get())) {
					dsSP = danhSachViecLamDao.findByJobTitleAndJobLocationAndIndustry(jobtitle.get(), joblocation.get(),
							industry.get(), pageable);
					// lay ngau nhien bai viet da mua dich vu len top
					List<JoblistingsEntity> top20 = jlsDAO.findTop20();
					Collections.shuffle(top20);
					model.addAttribute("latestJobs", top20);
				} else {
					dsSP = danhSachViecLamDao.findByJobTitleAndIndustry(jobtitle.get(), industry.get(), pageable);
					// lay ngau nhien bai viet da mua dich vu len top
					List<JoblistingsEntity> top20 = jlsDAO.findTop20();
					Collections.shuffle(top20);
					model.addAttribute("latestJobs", top20);
				}
			} else if (joblocation.isPresent() && !joblocation.get().isEmpty()
					&& !"All".equalsIgnoreCase(joblocation.get())) {
				dsSP = danhSachViecLamDao.findByJobTitleAndJobLocation(jobtitle.get(), joblocation.get(), pageable);
			} else {
				dsSP = danhSachViecLamDao.findByJobTitle(jobtitle.get(), pageable);
				// lay ngau nhien bai viet da mua dich vu len top
				List<JoblistingsEntity> top20 = jlsDAO.findTop20();
				Collections.shuffle(top20);
				model.addAttribute("latestJobs", top20);
			}
		} else if (industry.isPresent() && !industry.get().isEmpty()) {
			if (joblocation.isPresent() && !joblocation.get().isEmpty() && !"All".equalsIgnoreCase(joblocation.get())) {
				dsSP = danhSachViecLamDao.findByJobLocationAndIndustry(joblocation.get(), industry.get(), pageable);
				// lay ngau nhien bai viet da mua dich vu len top
				List<JoblistingsEntity> top20 = jlsDAO.findTop20();
				Collections.shuffle(top20);
				model.addAttribute("latestJobs", top20);
			} else {
				dsSP = danhSachViecLamDao.findByIndustry(industry.get(), pageable);
				// lay ngau nhien bai viet da mua dich vu len top
				List<JoblistingsEntity> top20 = jlsDAO.findTop20();
				Collections.shuffle(top20);
				model.addAttribute("latestJobs", top20);
			}
		} else if (joblocation.isPresent() && !joblocation.get().isEmpty()
				&& !"All".equalsIgnoreCase(joblocation.get())) {
			dsSP = danhSachViecLamDao.findByJobLocation(joblocation.get(), pageable);
			// lay ngau nhien bai viet da mua dich vu len top
			List<JoblistingsEntity> top20 = jlsDAO.findTop20();
			Collections.shuffle(top20);
			model.addAttribute("latestJobs", top20);
		} else {
			dsSP = danhSachViecLamDao.findAllByApplicationdeadlineAfterAndActiveTrueOrderByIsTopAndApplicationDeadline(
					LocalDate.now(), pageable);
			// lay ngau nhien bai viet da mua dich vu len top
			List<JoblistingsEntity> top20 = jlsDAO.findTop20();
			Collections.shuffle(top20);
			model.addAttribute("latestJobs", top20);
		}

		// Kiểm tra nếu không có kết quả
		if (dsSP.isEmpty()) {
			// Thêm thông báo vào mô hình
			model.addAttribute("message",
					"Nội dung tìm kiếm hiện không có. Vui lòng tham khảo thêm công việc bên dưới.");
			dsSP = danhSachViecLamDao.findAllByApplicationdeadlineAfterAndActiveTrueOrderByIsTopAndApplicationDeadline(
					LocalDate.now(), pageable);
			model.addAttribute("dsSP", dsSP);
			model.addAttribute("dsnghe", dsnghe);
			// Trả về trang chủ với thông báo
			return "trangChu";
		}

		// Nếu có kết quả, thêm vào mô hình và trả về trang kết quả
		model.addAttribute("dsSP", dsSP);
		// lay ngau nhien bai viet da mua dich vu len top
		List<JoblistingsEntity> top20 = jlsDAO.findTop20();
		Collections.shuffle(top20);
		model.addAttribute("latestJobs", top20);
		model.addAttribute("dsnghe", dsnghe);
		return "trangChu";
	}

	@RequestMapping("/search")
	public String search(Model model, 
	                     @RequestParam("page") Optional<Integer> page,
	                     @RequestParam("jobCategories") Optional<String> jobcategoryname,
	                     @RequestParam("joblocation") Optional<String> joblocation) {

	    // Sử dụng page.orElse(1) - 1 để bắt đầu từ trang 1 thay vì 0 nếu không có tham số trang
	    int currentPage = page.orElse(1) - 1; 
	    Pageable pageable = PageRequest.of(currentPage, 8, Sort.by("posteddate").descending());

	    // Lấy danh sách nghề nghiệp từ cơ sở dữ liệu
	    List<JobCategoriesEntity> dsnghe = jobCareDao.findAll();

	    // Tạo đối tượng Page để lưu kết quả tìm kiếm
	    Page<JoblistingsEntity> dsSP;

	    // Kiểm tra các tham số đầu vào và tạo điều kiện tìm kiếm
	    if (jobcategoryname.isPresent() && joblocation.isPresent() && !joblocation.get().equals("All")) {
	        // Tìm kiếm theo cả nghề nghiệp và tỉnh/thành phố
	        dsSP = danhSachViecLamDao.findByJobCategoryAndLocation(jobcategoryname.get(), joblocation.get(), LocalDate.now(), pageable);
	    } else if (jobcategoryname.isPresent()) {
	        // Tìm kiếm chỉ theo nghề nghiệp
	        dsSP = danhSachViecLamDao.findByJobCategory(jobcategoryname.get(), LocalDate.now(), pageable);
	    } else if (joblocation.isPresent() && !joblocation.get().equals("All")) {
	        // Tìm kiếm chỉ theo tỉnh/thành phố
	        dsSP = danhSachViecLamDao.findByJobLocation(joblocation.get(), pageable);
	    } else {
	        // Nếu không có tham số lọc, lấy tất cả công việc mới nhất
	        dsSP = danhSachViecLamDao.findAllByApplicationdeadlineAfterAndActiveTrueOrderByIsTopAndApplicationDeadline(
	                LocalDate.now(), pageable);
	    }

	    // Kiểm tra nếu không có kết quả tìm kiếm
	    if (dsSP.isEmpty()) {
	        model.addAttribute("message", "Nội dung tìm kiếm hiện không có. Vui lòng tham khảo thêm công việc bên dưới.");
	        dsSP = danhSachViecLamDao.findAllByApplicationdeadlineAfterAndActiveTrueOrderByIsTopAndApplicationDeadline(
					LocalDate.now(), pageable);
			model.addAttribute("dsSP", dsSP);
	    }

	    // Thêm kết quả tìm kiếm vào model
	    model.addAttribute("dsSP", dsSP);

	    // Lấy ngẫu nhiên 20 công việc đã đăng lên top
	    List<JoblistingsEntity> top20 = jlsDAO.findTop20();
	    Collections.shuffle(top20);
	    model.addAttribute("latestJobs", top20);

	    // Thêm danh sách nghề nghiệp vào model
	    model.addAttribute("dsnghe", dsnghe);

	    return "trangChu"; // Trả về trang chủ với các kết quả tìm kiếm
	}

	@GetMapping("/dangxuat")
	public String dangxuat(HttpSession ss) {
		ss.invalidate();
		return "redirect:/job4u";
	}

}
