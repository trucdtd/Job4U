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
								<label class="form-label">Vị trí tuyển dụng</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="developer"
										name="jobtitle" value="developer"> <label
										class="form-check-label" for="developer">Developer</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="designer"
										name="jobtitle" value="designer"> <label
										class="form-check-label" for="designer">Designer</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="manager"
										name="jobtitle" value="manager"> <label
										class="form-check-label" for="manager">Manager</label>
								</div>
								<!-- Thêm các vị trí khác nếu cần -->
							</div>
							<div class="col-md-12 mt-3">
								<label class="form-label">Tỉnh/Thành phố</label> <select
									class="form-select" id="joblocation" name="joblocation">
									<option value="All" selected>Tất cả</option>
									<option value="Hà Nội">Hà Nội</option>
									<option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
									<option value="Hải Phòng">Hải Phòng</option>
									<option value="Đà Nẵng">Đà Nẵng</option>
									<option value="An Giang">An Giang</option>
									<option value="Bạc Liêu">Bạc Liêu</option>
									<option value="Bắc Giang">Bắc Giang</option>
									<option value="Bắc Kạn">Bắc Kạn</option>
									<option value="Bắc Ninh">Bắc Ninh</option>
									<option value="Bến Tre">Bến Tre</option>
									<option value="Bình Định">Bình Định</option>
									<option value="Bình Dương">Bình Dương</option>
									<option value="Bình Phước">Bình Phước</option>
									<option value="Bình Thuận">Bình Thuận</option>
									<option value="Cao Bằng">Cao Bằng</option>
									<option value="Cần Thơ">Cần Thơ</option>
									<option value="Cà Mau">Cà Mau</option>
									<option value="Kon Tum">Kon Tum</option>
									<option value="Lào Cai">Lào Cai</option>
									<option value="Lâm Đồng">Lâm Đồng</option>
									<option value="Lạng Sơn">Lạng Sơn</option>
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
									<option value="Trà Vinh">Trà Vinh</option>
									<option value="Tuyên Quang">Tuyên Quang</option>
									<option value="Vĩnh Long">Vĩnh Long</option>
									<option value="Vĩnh Phúc">Vĩnh Phúc</option>
									<option value="Yên Bái">Yên Bái</option>
								</select>
							</div>
							<div class="col-md-auto mt-3">
								<button type="submit" class="btn btn-success">
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