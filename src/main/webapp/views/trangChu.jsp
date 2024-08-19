<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<!--link icon gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</head>
<style>
</style>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->
		<!-- Thanh tìm kiếm chính -->
		<nav class="col-md-12">
			<div class="container mt-4">
				<form action="/job4u/findJob" method="GET" class="search-form">
					<div class="d-flex align-items-center gap-3">
						<!-- Tiêu đề công việc -->
						<div class="flex-fill mb-3">
							<label class="form-label" for="jobtitle">Tiêu đề công
								việc</label> <input type="text" class="form-control rounded-3"
								id="jobtitle" name="jobtitle"
								placeholder="Nhập tiêu đề công việc">
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
							<label class="form-label" for="joblocation">Tỉnh/Thành
								phố</label> <select class="form-select rounded-3" id="joblocation"
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
							<button type="submit" class="btn btn-primary rounded-3">
								<i class="bi bi-search"></i> Tìm kiếm
							</button>
						</div>
					</div>
				</form>
			</div>
		</nav>

		<div class="row">
			<aside class="col-md-3">
				<h3>Bộ lộc</h3>
				<div class="container mt-4">
					<form action="/job4u/findJob" method="GET">
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="form-label" id="industry" name="industry">Ngành
									nghề</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Nông nghiệp"> <label class="form-check-label">Nông
										nghiệp</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Công nghiệp"> <label class="form-check-label">Công
										nghiệp</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Dịch vụ"> <label class="form-check-label">Dịch
										vụ</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Công nghệ thông tin"> <label
										class="form-check-label">Công nghệ thông tin</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Công nghệ ô tô"> <label
										class="form-check-label">Công nghệ ô tô</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Xây dựng"> <label class="form-check-label">Xây
										dựng</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Giao thông vận tải"> <label
										class="form-check-label">Giao thông vận tải</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Ngân hàng và Tài chính"> <label
										class="form-check-label" for="finance">Ngân hàng và
										Tài chính</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Giáo dục"> <label class="form-check-label">Giáo
										dục</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Y tế"> <label class="form-check-label"
										for="healthcare">Y tế</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Truyền thông"> <label class="form-check-label"
										for="media">Truyền thông</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Du lịch"> <label class="form-check-label">Du
										lịch</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Hành chính văn phòng"> <label
										class="form-check-label">Hành chính văn phòng</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Khác"> <label class="form-check-label"
										for="other">Khác....</label>
								</div>
							</div>
							<div class="col-md-12 mt-3">
								<label class="form-label">Tỉnh/Thành phố</label> <select
									class="form-select" id="joblocation" name="joblocation">
									<option value="All" selected>Tất cả</option>
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
							<div class="col-md-auto mt-3">
								<button type="submit" class="btn text-light"
									style="background: #00688B">
									<i class="bi bi-search"></i> Tìm kiếm
								</button>
							</div>
						</div>
					</form>
				</div>
			</aside>

			<article class="col-md-9">
				<!-- danh sách việc làm -->
				<%@ include file="/views/danhSachViecLam.jsp"%>
				<!-- /danh sách việc làm -->
			</article>
		</div>

		<%@ include file="/views/chat.jsp"%>

		<div class="mt-4">
			<!-- footer -->
			<%@ include file="/views/footer.jsp"%>
			<!-- /footer -->
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>