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
</head>
<body>
	<div>
		<h3>CV đã tạo</h3>
		<table id="listCV" class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Họ Tên</th>
					<th>Hồ sơ</th>
					<th>Tóm tắt hồ sơ</th>
					<th>Giới tính</th>
					<th>Ngày cập nhật</th>
					<th><img src="/img/icons8-open-50.png" height="30px" width="30px" alt="Icon" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cv" items="${List}">
					<tr>
						<td>${cv.jobseekerid}</td>
						<td>${cv.user.fullname}</td>
						<td>${cv.resume}</td>
						<td>${cv.profilesummary}</td>
						<td>${cv.gender}</td>
						<td>${cv.createdat}</td>
						<td><a class="text-cent" href="link-to-view/${cv.jobseekerid}"> <img
								src="/img/icons8-eye-48.png" height="30px" width="30px"
								alt="Xem thêm" />
						</a></td>
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