<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết CV</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa; /* Màu nền nhạt */
}

.card-header {
	background-color: #007bff; /* Màu xanh */
	color: white; /* Chữ màu trắng */
}

.label {
	font-weight: bold;
	color: #007bff; /* Màu xanh cho các nhãn */
}

.info {
	background-color: #e9ecef; /* Màu nền nhạt cho thông tin */
	padding: 10px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<div class="container mt-4">
		<h2 class="text-center mb-4">Chi Tiết CV của ${cv.user.fullname}</h2>
		<div class="card">
			<div class="card-header bg-success text-white text-center">
				<h5>Thông Tin Ứng Viên</h5>
			</div>

			<div class="card-body">
				<form>
					<div class="row mb-3">
						<div class="col-md-4">
							<label class="label">Tên:</label>
							<div class="info">${cv.user.fullname}</div>
						</div>
						<div class="col-md-4">
							<label class="label">Giới Tính:</label>
							<div class="info">${cv.gender}</div>
						</div>
						<div class="col-md-4">
							<label class="label">Ngày Sinh:</label>
							<div class="info">${cv.dateOfbirth}</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="label">Tóm Tắt Hồ Sơ:</label>
						<div class="info">${cv.profilesummary}</div>
					</div>
					<div class="mb-3">
						<label class="label">Kinh Nghiệm:</label>
						<div class="info">${cv.experience}</div>
					</div>
					<div class="mb-3">
						<label class="label">Học Vấn:</label>
						<div class="info">${cv.education}</div>
					</div>
					<div class="mb-3">
						<label class="label">Kỹ Năng:</label>
						<div class="info">${cv.skills}</div>
					</div>
					<div class="mb-3">
						<label class="label">Chứng Chỉ:</label>
						<div class="info">${cv.certifications}</div>
					</div>
					<div class="mb-3">
						<label class="label">Ngôn Ngữ:</label>
						<div class="info">${cv.languages}</div>
					</div>
					<div class="mb-3">
						<label class="label">Sở Thích:</label>
						<div class="info">${cv.interests}</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<label class="label">Ngày Tạo Hồ Sơ:</label>
							<div class="info">${cv.createdat}</div>
						</div>
						<div class="col-md-6">
							<label class="label">Ngày Cập Nhật Hồ Sơ:</label>
							<div class="info">${cv.updatedat}</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="text-center mt-4 mb-4">
			<button class="btn btn-primary" disabled>Chấp Nhận CV</button>
			<button class="btn btn-danger" disabled>Từ Chối CV</button>
		</div>

	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
