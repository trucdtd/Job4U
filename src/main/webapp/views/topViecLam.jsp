<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top Việc Làm</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- <link rel="stylesheet" href="/css/topJob.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.top-jobs-container {
	background-color: #f8f9fa;
	padding: 15px;
	border-radius: 5px;
	margin-bottom: 20px;
}

.top-job-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #007bff;
}

.top-job-item {
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}

.top-job-item:last-child {
	border-bottom: none;
}

.top-job-item h5 {
	margin: 0;
}

.top-job-item p {
	margin: 5px 0;
	color: #555;
}

.pagination-container {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 20px;
}

.pagination-btn, .pagination-number {
	background: none;
	border: none;
	color: #1ea264;
	font-size: 16px;
	margin: 0 5px;
	cursor: pointer;
}

.pagination-btn:disabled {
	color: #cccccc;
	cursor: not-allowed;
}

.pagination-number.active {
	background-color: #1ea264;
	color: white;
	border-radius: 50%;
	padding: 5px 10px;
}

.pagination-number:hover:not(.active) {
	text-decoration: underline;
}
.bg-image {
    height: 150px; /* Đảm bảo chiều cao đủ lớn */
    overflow: hidden; /* Ẩn phần ảnh bị cắt */
}

.card img {
    width: 100%;
    height: 100%; /* Đảm bảo ảnh chiếm toàn bộ chiều cao */
    object-fit: contain; /* Giữ nguyên tỷ lệ và không bị cắt */
}
</style>
</head>
<body>
	<!-- Include header -->
	<%@ include file="/views/header.jsp"%>

	<!-- Include top employers -->
	<%-- <%@ include file="/views/nhaTuyenDungHangDau.jsp"%> --%>

	<!-- Thanh tìm kiếm chính -->
	<nav class="col-md-12">
		<div class="container mt-4">
			<form action="/job4u/topjob/findJob" method="GET" class="search-form">
				<div class="d-flex align-items-center gap-3">
					<!-- Tiêu đề công việc -->
					<div class="flex-fill mb-3">
						<label class="form-label" for="jobtitle">Tiêu đề công việc</label>
						<input type="text" class="form-control rounded-3" id="jobtitle"
							name="jobtitle" placeholder="Nhập tiêu đề công việc">
					</div>

					<!-- Ngành nghề -->
					<div class="flex-fill mb-3">
						<label class="form-label" for="industry">Ngành nghề</label> <select
							class="form-select rounded-3" id="industry" name="industry">
							<option value="" selected>Chọn ngành nghề</option>
							<option value="Nông nghiệp">Nông nghiệp</option>
							<option value="Công nghiệp">Công nghiệp</option>
							<option value="Dịch vụ">Dịch vụ</option>
							<option value="Công nghệ thông tin">Công nghệ thông tin</option>
							<option value="Công nghệ ô tô">Công nghệ ô tô</option>
							<option value="Xây dựng">Xây dựng</option>
							<option value="Giao thông vận tải">Giao thông vận tải</option>
							<option value="Ngân hàng và Tài chính">Ngân hàng và Tài
								chính</option>
							<option value="Giáo dục">Giáo dục</option>
							<option value="Y tế">Y tế</option>
							<option value="Truyền thông">Truyền thông</option>
							<option value="Du lịch">Du lịch</option>
							<option value="Hành chính văn phòng">Hành chính văn
								phòng</option>
							<option value="Khác">Khác...</option>
						</select>
					</div>

					<!-- Tỉnh/Thành phố -->
					<div class="flex-fill mb-3">
						<label class="form-label" for="joblocation">Tỉnh/Thành phố</label>
						<select class="form-select rounded-3" id="joblocation"
							name="joblocation">
							<option value="All" selected>Tất cả</option>
							<!-- Các tùy chọn tỉnh/thành phố khác -->
							<option value="An Giang">An Giang</option>
							<option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
							<option value="Bạc Liêu">Bạc Liêu</option>
							<option value="Bắc Giang">Bắc Giang</option>
							<option value="Bắc Kạn">Bắc Kạn</option>
							<option value="Bắc Ninh">Bắc Ninh</option>
							<option value="Bến Tre">Bến Tre</option>
							<option value="Bình Định">Bình Định</option>
							<option value="Bình Dương">Bình Dương</option>
							<option value="Bình Phước">Bình Phước</option>
							<option value="Bình Thuận">Bình Thuận</option>
							<option value="Cà Mau">Cà Mau</option>
							<option value="Cao Bằng">Cao Bằng</option>
							<option value="Cần Thơ">Cần Thơ</option>
							<option value="Đà Nẵng">Đà Nẵng</option>
							<option value="Đắk Lắk">Đắk Lắk</option>
							<option value="Đắk Nông">Đắk Nông</option>
							<option value="Điện Biên">Điện Biên</option>
							<option value="Đồng Nai">Đồng Nai</option>
							<option value="Đồng Tháp">Đồng Tháp</option>
							<option value="Gia Lai">Gia Lai</option>
							<option value="Hà Giang">Hà Giang</option>
							<option value="Hà Nam">Hà Nam</option>
							<option value="Hà Nội">Hà Nội</option>
							<option value="Hà Tĩnh">Hà Tĩnh</option>
							<option value="Hải Dương">Hải Dương</option>
							<option value="Hải Phòng">Hải Phòng</option>
							<option value="Hậu Giang">Hậu Giang</option>
							<option value="Hòa Bình">Hòa Bình</option>
							<option value="Hưng Yên">Hưng Yên</option>
							<option value="Khánh Hòa">Khánh Hòa</option>
							<option value="Kiên Giang">Kiên Giang</option>
							<option value="Kon Tum">Kon Tum</option>
							<option value="Lai Châu">Lai Châu</option>
							<option value="Lâm Đồng">Lâm Đồng</option>
							<option value="Lạng Sơn">Lạng Sơn</option>
							<option value="Lào Cai">Lào Cai</option>
							<option value="Long An">Long An</option>
							<option value="Nam Định">Nam Định</option>
							<option value="Nghệ An">Nghệ An</option>
							<option value="Ninh Bình">Ninh Bình</option>
							<option value="Ninh Thuận">Ninh Thuận</option>
							<option value="Phú Thọ">Phú Thọ</option>
							<option value="Phú Yên">Phú Yên</option>
							<option value="Quảng Bình">Quảng Bình</option>
							<option value="Quảng Nam">Quảng Nam</option>
							<option value="Quảng Ngãi">Quảng Ngãi</option>
							<option value="Quảng Ninh">Quảng Ninh</option>
							<option value="Quảng Trị">Quảng Trị</option>
							<option value="Sóc Trăng">Sóc Trăng</option>
							<option value="Sơn La">Sơn La</option>
							<option value="Tây Ninh">Tây Ninh</option>
							<option value="Thái Bình">Thái Bình</option>
							<option value="Thái Nguyên">Thái Nguyên</option>
							<option value="Thanh Hóa">Thanh Hóa</option>
							<option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
							<option value="Tiền Giang">Tiền Giang</option>
							<option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
							<option value="Trà Vinh">Trà Vinh</option>
							<option value="Tuyên Quang">Tuyên Quang</option>
							<option value="Vĩnh Long">Vĩnh Long</option>
							<option value="Vĩnh Phúc">Vĩnh Phúc</option>
							<option value="Yên Bái">Yên Bái</option>
						</select>
					</div>

					<!-- Nút tìm kiếm -->
					<div class="mt-3">
						<button type="submit" class="btn btn-success rounded-3">
							<i class="bi bi-search"></i> Tìm kiếm
						</button>
					</div>
				</div>
			</form>
		</div>
	</nav>
	<!-- Top Jobs Section -->
	<c:if test="${not empty topJobs}">
		<div class="container">
			<div class="top-jobs-container">
				<div class="top-job-title">Top Công Việc</div>
				<c:forEach var="job" items="${topJobs}">
					<div class="top-job-item">
						<h5>${job.title}</h5>
						<p>Công ty: ${job.employer.companyname}</p>
						<p>Địa điểm: ${job.location}</p>
						<a href="/chiTiet/${job.jobid}"
							class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>

	<!-- Main Job List Section -->
	<section style="background-color: #eee;">
		<div class="container py-4">
			<div class="row justify-content-center">
				<h4 class="mb-4"></h4>
				<c:forEach var="job" items="${dsSP.content}">
					<div class="col-md-12 col-xl-10 mb-4">
						<div class="card shadow-0 border rounded-3">
							<div class="card-body">
								<div class="row">
									<div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
										<div class="bg-image hover-zoom ripple rounded ripple-surface">
											<img src="${pageContext.request.contextPath}/uploads/${job.employer.logo}" class="w-100"
												alt="${job.employer.companyname}" />
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-6">
										<h5>${job.employer.companyname}</h5>
										<p class="text-truncate mb-4 mb-md-0">Mô tả:
											${job.jobdescription}</p>
									</div>
									<div
										class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
										<div class="d-flex flex-column mt-4">
											<a href="/applyCV/${job.jobid}" class="btn btn-success btn-sm">Ứng
												tuyển</a> <a href="/chiTiet/${job.jobid}"
												class="btn btn-outline-success btn-sm mt-2">Thông tin
												chi tiết</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</section>

	<!-- Pagination -->
	<c:if test="${dsSP.totalPages > 1}">
		<div class="pagination-container">
			<button class="pagination-btn"
				onclick="paging(${dsSP.pageable.pageNumber - 1})"
				${dsSP.pageable.pageNumber == 0 ? 'disabled' : ''}>← Trước</button>
			<div class="page-numbers">
				<c:forEach begin="0" end="${dsSP.totalPages - 1}" var="i">
					<button
						class="pagination-number ${i == dsSP.pageable.pageNumber ? 'active' : ''}"
						onclick="paging(${i})">${i + 1}</button>
				</c:forEach>
			</div>
			<button class="pagination-btn"
				onclick="paging(${dsSP.pageable.pageNumber + 1})"
				${dsSP.pageable.pageNumber == dsSP.totalPages - 1 ? 'disabled' : ''}>Sau
				→</button>
		</div>
	</c:if>

	<!-- Include footer -->
	<%@ include file="/views/footer.jsp"%>

	<script>
        function paging(page) {
            var url = new URL(window.location.href);
            url.searchParams.set('page', page);
            window.location.href = url;
        }
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>