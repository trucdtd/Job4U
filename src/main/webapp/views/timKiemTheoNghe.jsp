<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <h3>Bộ lộc</h3> -->
	<div class="container mt-4">
		<form action="/job4u/search" method="GET">
			<div class="row mt-3">
				<!-- Nghề nghiệp -->
				<div class="form-check">
					<label class="form-label" style="color: #198754; font-weight: bold">Lọc
						theo nghề nghiệp</label> <br>
					<c:forEach var="jobCategory" items="${dsnghe}">
						<input class="form-check-input" type="radio"
							id="job${jobCategory.jobcategoryid}" name="jobCategories"
							value="${jobCategory.jobcategoryname}" />
						<label class="form-check-label"
							for="job${jobCategory.jobcategoryid}">
							${jobCategory.jobcategoryname} </label>
						<br>
					</c:forEach>
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
					<button type="submit" class="btn btn-success text-light">
						<i class="bi bi-search"></i> Tìm kiếm
					</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>