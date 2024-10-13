<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh Sách CV</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<style>
#listCV th {
	background-color: #f8f9fa; /* Màu nền cho tiêu đề */
	text-align: center; /* Căn giữa tiêu đề */
}

#listCV td {
	vertical-align: middle; /* Căn giữa theo chiều dọc */
}

.text-center {
	text-align: center; /* Căn giữa cho cột hành động */
}

#listCV img {
	transition: transform 0.2s; /* Hiệu ứng zoom khi di chuột */
}

#listCV img:hover {
	transform: scale(1.1); /* Phóng to hình ảnh khi di chuột */
}
</style>
</head>
<body>
	<div>
		<div class="container mt-4">
			<!-- Thông báo thành công -->
			<div id="success" class="alert alert-success" style="display: none;"
				role="alert"></div>

			<!-- Thông báo lỗi -->
			<div id="error" class="alert alert-danger" style="display: none;"
				role="alert"></div>
		</div>
		<h3 class="mb-3 mt-3">CV Đã Tạo</h3>
		<table id="listCV" class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Họ & Tên CV</th>
					<th>Hồ sơ</th>
					<th>Tóm tắt hồ sơ</th>
					<th>Giới tính</th>
					<th>Ngày cập nhật</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cv" items="${List}">
					<tr>
						<td>${cv.jobseekerid}</td>
						<td>${cv.fullnamecv}</td>
						<td>${cv.resume}</td>
						<td>${cv.profilesummary}</td>
						<td>${cv.gender}</td>
						<td>${cv.createdat}</td>
						<td class="text-center">
							<form action="/user/cv/viewCV" method="get"
								style="display: inline;">
								<button type="submit" title="Xem thêm"
									style="border: none; background: none;">
									<img src="/img/icons8-eye-48.png" height="30px" width="30px"
										alt="Xem thêm" />
								</button>
							</form>

							<form action="/user/cv/list2/delete" method="post"
								style="display: inline;">
								<input type="hidden" name="jobseekerId" value="${cv.jobseekerid}" />
								<button type="submit"
									onclick="return confirm('Bạn có chắc chắn muốn xóa không?');"
									title="Xóa" style="border: none; background: none;">
									<img src="/img/icons8-delete-50.png" height="30px" width="30px"
										alt="Xóa" />
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- JS scripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</body>
</html>