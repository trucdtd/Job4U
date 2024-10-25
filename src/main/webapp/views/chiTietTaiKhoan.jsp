
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0, initial-scale=1.0, user-scalable=no">
<title>Detail User</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/quanlyuser.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<!-- header -->
	<div class="container">
		<div class="container">
			<div class="row mt-3">
				<!-- aside -->

				<!-- article -->
				<div class="col-lg-12 col-md-12 p-2 ">
					<!-- User Management table -->
					<div id="userManagement" class="card"">
						<div class="card-header">
							<div class="card-title">Quản Lý Tài Khoản</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<form class="p-4 border" method="post"
									action="">
									<input type="hidden" name="userid" value="${nd.userid}">
									<!-- Thêm trường ẩn cho userid -->
									<div class="row">
										<div class="col-md-6 p-2">
											<label for="username" class="form-label">Tên tài
												khoản</label> <input type="text" class="form-control" id="username"
												name="username" value="${nd.username}" readonly required>
										</div>
										<div class="col-md-6 p-2">
											<label for="fullname" class="form-label">Họ và tên</label> <input
												type="text" class="form-control" id="fullname"
												name="fullname" value="${nd.fullname}" readonly required>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 p-2">
											<label for="email" class="form-label">Email</label> <input
												type="text" class="form-control" id="email" name="email"
												value="${nd.email}" readonly required>
										</div>
										<div class="col-md-6 p-2">
											<label for="phonenumber" class="form-label">Số điện
												thoại</label> <input type="text" class="form-control"
												id="phonenumber" name="phonenumber"
												value="${nd.phonenumber}" readonly required>
										</div>
									</div>

									<div class="row">

										<div class="col-md-6 p-2">
											<label for="role" class="form-label">Vai trò</label> <select
												name="role" id="role" class="form-select" disabled>
												<option value="0" ${nd.role == '0' ? 'selected' : ''}>Admin</option>
												<option value="1" ${nd.role == '1' ? 'selected' : ''}>Ứng
													viên</option>
												<option value="2" ${nd.role == '2' ? 'selected' : ''}>Nhà
													tuyển dụng</option>
											</select>
										</div>
										<div class="col-md-6 p-2">
											<label for="status" class="form-label">Trạng Thái</label> <select
												name="status" id="status" class="form-select" disabled>
												<option value="0" ${nd.status == false ? 'selected' : ''}>Không
													hoạt động</option>
												<option value="1" ${nd.status == true ? 'selected' : ''}>Hoạt
													động</option>
											</select>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="card-action">
											<a href="/admin/deleteUser" type="submit" class="btn btn-danger text-white">Xóa</a>
											<button type="button" class="btn btn-danger" onclick="lockUserAccount(${nd.userid})">Khóa tài khoản</button>

											<!-- Đổi thành submit -->
											<a href="/admin" class="btn btn-secondary">Quay lại</a>
										</div>
									</div>
								</form>


							</div>
						</div>
					</div>



				<!-- article -->
			</div>

		</div>
	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script>
	function showTable(event, tableId) {
		event.preventDefault(); // Ngăn chặn hành vi mặc định

		// Ẩn tất cả các bảng
		var tables = document.querySelectorAll('.col-md-9 .card');
		tables.forEach(function(table) {
			table.style.display = 'none';
		});

		// Hiển thị bảng được chọn
		document.getElementById(tableId).style.display = 'block';

		// Loại bỏ lớp active khỏi tất cả các liên kết
		var links = document.querySelectorAll('.nav-link');
		links.forEach(function(link) {
			link.classList.remove('active');
		});

		// Thêm lớp active vào liên kết được bấm
		var activeLink = document.querySelector('.nav-link[onclick*="'
				+ tableId + '"]');
		activeLink.classList.add('active');
	}
	
	function lockUserAccount(id) {
	    if (confirm("Bạn có chắc chắn muốn khóa tài khoản này không?")) {
	        fetch(`/admin/lock/${id}`, {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json',
	                'X-Requested-With': 'XMLHttpRequest'
	            }
	        })
	        .then(response => {
	            if (response.ok) {
	                alert('Tài khoản đã được khóa!');
	                window.location.reload(); // Tải lại trang
	            } else {
	                alert('Có lỗi xảy ra khi khóa tài khoản!');
	            }
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert('Có lỗi xảy ra khi khóa tài khoản!');
	        });
	    }
	}

</script>
</body>
</html>
