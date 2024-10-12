<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thông tin tài khoản</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa;
}

.inf-content {
	border: 1px solid #DDDDDD;
	border-radius: 10px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	background: #ffffff;
	padding: 20px;
	margin-top: 20px;
}

.profile-image {
	max-width: 150px;
	border-radius: 50%;
}

.table th {
	background-color: #f1f1f1;
}
</style>
</head>
<body>
	<%@ include file="/views/header.jsp"%>
	<div class="container mb-5">
		<h2 class="text-center my-4">Thông tin cá nhân</h2>
		<div class="inf-content">
			<div class="row">
				<div class="col-md-4 text-center">
					<img alt="logo" src="/img/logo.png"
						style="object-fit: cover; width: 100%; height: 350px; max-width: 400px;">
				</div>

				<div class="col-md-8">
					<form action="/ThongTinCaNhan/updateUser" method="post"
						id="updateUserForm">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<th><span
										class="glyphicon glyphicon-asterisk text-primary"></span> Họ
										và Tên</th>
									<td><input type="text" class="form-control"
										name="fullname" value="${user.fullname}" required></td>
								</tr>
								<tr>
									<th><span class="glyphicon glyphicon-user text-primary"></span>
										Tên đăng nhập</th>
									<td><input type="text" class="form-control"
										name="username" value="${user.username}" readonly></td>
								</tr>
								<tr>
									<th><span
										class="glyphicon glyphicon-envelope text-primary"></span>
										Email</th>
									<td><input type="email" class="form-control" name="email"
										value="${user.email}" required></td>
								</tr>
								<tr>
									<th><span
										class="glyphicon glyphicon-eye-open text-primary"></span> Vai
										trò</th>
									<td><input type="text" class="form-control"
										value="${user.role == 0 ? 'Admin' : user.role == 1 ? 'Ứng viên' : 'Nhà tuyển dụng'}"
										readonly></td>
								</tr>
								<tr>
									<th><span
										class="glyphicon glyphicon-calendar text-primary"></span> Ngày
										tạo</th>
									<td class="text-primary">${formattedCreatedAt}</td>
								</tr>
								<tr>
									<th><span
										class="glyphicon glyphicon-calendar text-primary"></span> Ngày
										cập nhật</th>
									<td class="text-primary">${formattedUpdatedAt}</td>
								</tr>
							</tbody>
						</table>
						<button type="submit" class="btn btn-success">Cập nhật</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
