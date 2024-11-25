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
<style>
/* Modal - Nền */
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* Màu nền mờ */
	display: none; /* Ban đầu ẩn */
	justify-content: center;
	align-items: center;
}

/* Nội dung modal */
.modal-content {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	width: 300px;
}

/* Nút đóng modal */
.close {
	font-size: 30px;
	cursor: pointer;
}

/* Nút OK */
.modal-button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

.modal-button:hover {
	background-color: #45a049;
}

.card-action {
	display: flex; /* Sử dụng Flexbox để căn chỉnh các nút theo hàng */
	gap: 3px; /* Thêm khoảng cách giữa các nút */
	justify-content: flex-start; /* Căn các nút sang bên trái */
}

.card-action button, .card-action a {
	margin-right: 3px; /* Tạo khoảng cách giữa các nút */
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<%@ include file="/views/chat.jsp"%>
	<!-- header -->
	<div class="container">
		<div class="row mt-3">
			<!-- aside -->
			<!-- Thông báo thành công -->
			<c:if test="${not empty param.error}">
				<script>
					document.addEventListener('DOMContentLoaded', function() {
						const successModal = new bootstrap.Modal(document
								.getElementById('successModal'));
						successModal.show();
					});
				</script>

				<div class="modal fade" id="successModal" tabindex="-1"
					aria-labelledby="successModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="successModalLabel">Thông báo</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">${param.error}</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="window.location.href='/admin'">OK</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!-- article -->
			<div class="col-lg-12 col-md-12 p-2 ">
				<!-- User Management table -->
				<div id="userManagement" class="card">
					<div class="card-header">
						<div class="card-title">Quản Lý Tài Khoản</div>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<form class="p-4 border" action="/admin/deleteUser" method="post">
								<input type="hidden" name="userid" value="${nd.userid}">
								<!-- Thêm trường ẩn cho userid -->
								<div class="row">
									<div class="col-md-6 p-2">
										<label for="username" class="form-label">Tên tài khoản</label>
										<input type="text" class="form-control" id="username"
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
											id="phonenumber" name="phonenumber" value="${nd.phonenumber}"
											readonly required>
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
										<label for="status" class="form-label">Trạng Thái </label> <select
											name="status" id="status" class="form-select" disabled>
											<option value="0" ${nd.status == false ? 'selected' : ''}>Không
												hoạt động</option>
											<option value="1" ${nd.status == true ? 'selected' : ''}>Hoạt
												động</option>
										</select>
									</div>
								</div>

								<hr>
								<div class="row p-2">
									<div class="card-action d-flex justify-content-start">

										<!-- Nút Xóa -->
										<button type="submit" class="btn btn-danger text-white">Xóa</button>
							</form>

							<!-- Nút Khóa -->
							<form action="/admin/lock/${nd.userid}" method="post">
								<button type="submit" class="btn btn-warning">Khóa tài
									khoản</button>
							</form>

							<!-- Nút Mở tài khoản -->
							<form action="/admin/open/${nd.userid}" method="post">
								<button type="submit" class="btn btn-success">Mở tài
									khoản</button>
							</form>

							<!-- Nút Quay lại -->
							<a href="/admin" class="btn btn-secondary">Quay lại</a>

						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- article -->
	</div>

	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>

	<!-- footer -->
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
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- JS for DataTables -->
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</body>
</html>
