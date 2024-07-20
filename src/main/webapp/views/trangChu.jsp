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
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->
		<div class="row">
			<aside class="col-md-3">
				<h3>Bộ lộc</h3>
				<div class="container mt-4">
					<form action="/findJob" method="GET">
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="form-label">Ngành nghề</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="agriculture" name="jobtitle" value="agriculture">
									<label class="form-check-label" for="agriculture">Nông
										nghiệp</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="industry"
										name="jobtitle" value="industry"> <label
										class="form-check-label" for="industry">Công nghiệp</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="services"
										name="jobtitle" value="services"> <label
										class="form-check-label" for="services">Dịch vụ</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="IT"
										name="jobtitle" value="IT"> <label
										class="form-check-label" for="manager">Công Nghệ Thông
										Tin</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="automotive-technology" name="jobtitle"
										value="automotive-technology"> <label
										class="form-check-label" for="automotive-technology">Công
										Nghệ Ô Tô</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="construction" name="jobtitle" value="construction">
									<label class="form-check-label" for="construction">Xây
										dựng</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="transportation" name="jobtitle" value="transportation">
									<label class="form-check-label" for="transportation">Giao
										thông vận tải</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="finance"
										name="jobtitle" value="finance"> <label
										class="form-check-label" for="finance">Ngân hàng & Tài
										chính</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="education"
										name="jobtitle" value="education"> <label
										class="form-check-label" for="education">Giáo dục</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="healthcare"
										name="jobtitle" value="healthcare"> <label
										class="form-check-label" for="healthcare">Y tế</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="media"
										name="jobtitle" value="media"> <label
										class="form-check-label" for="media">Truyền thông</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="tourism"
										name="jobtitle" value="tourism"> <label
										class="form-check-label" for="tourism">Du lịch</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="office"
										name="jobtitle" value="office"> <label
										class="form-check-label" for="office">Hành chính văn
										phòng</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="other"
										name="jobtitle" value="other"> <label
										class="form-check-label" for="other">Khác....</label>
								</div>
								<!-- Thêm các vị trí khác nếu cần -->
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

		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- /footer -->
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>