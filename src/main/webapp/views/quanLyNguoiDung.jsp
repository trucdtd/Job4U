<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/quanlyuser.css">
<script>
function confirmDelete(jobid) {
    if (confirm('Bạn có chắc chắn muốn xóa bài viết này?')) {
        window.location.href = `/admin/deletePost/${jobid}`;
    }
}
</script>
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- header -->

		<div class="container">
			<div class="row">
				<!-- aside -->
				<%@ include file="/views/menuAdmin.jsp"%>
				<!-- aside -->
				<!-- article -->
				<div class="col-lg-9 col-md-9 ">
					<!-- Home table -->
					
					<!-- Thông báo cập nhật thất bại -->
					<%-- <div th:if="${error}" class="alert alert-danger" role="alert"
						th:text="${error}"></div>
					<div th:if="${message}" class="alert alert-success" role="alert"
						th:text="${message}"></div> --%>
					<div id="userManagement" class="card">
						<div class="card-header">
							<div class="card-title">Quản Lý Tài Khoản</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead class="thead-light text-center">
										<tr>
											<th>STT</th>
											<th>Tên Tài Khoản</th>
											<th>Họ Và Tên</th>
											<th>Email</th>
											<th>Số điện thoại</th>
											<th>Role</th>
											<th></th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${dsND}" var="nd">
											<tr>
												<th scope="row">${nd.userid}</th>
												<td>${nd.username}</td>
												<td>${nd.fullname}</td>
												<td>${nd.email}</td>
												<td>${nd.phonenumber}</td>
												<td>${nd.role}</td>
												<td><a
													href="/admin/detailUser/${nd.userid}"
													class="btn btn-info text-white p-2 " type="button"
													style="background-color: #00688B">Chi tiết</a> <a href=""
													class="btn btn-danger p-2" type="button">delete</a></td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>

						</div>
					</div>

					<!-- Post Management table -->
					

					<!-- CV Management table -->
					<div id="cvManagement" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý CV</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">CVID</th>
											<th scope="col">Name</th>
											<th scope="col">Position</th>
											<th scope="col">Date Submitted</th>
											<th scope="col">Status</th>
											<th scope="col">Button</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>Alex Smith</td>
											<td>Developer</td>
											<td>2023-01-05</td>
											<td>Reviewed</td>
											<td>
												<button class="btn btn-success">Detail</button>
											</td>
										</tr>
										<!-- Add more rows as needed -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--statisticalManagement table -->
					<div id="statisticalManagement" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Thống Kê</div>
						</div>
						<div class="card-body">
							<h5 class="card-title">
								<ol class="breadcrumb">
									<li class="breadcrumb-item">Biểu Đồ</li>
									<li class="breadcrumb-item"><a href="/Thongke">Thống
											kê chi tiết</a></li>
								</ol>
							</h5>
							<div class="panel panel-default">
								<!-- /.panel-heading -->

								<!-- /.panel-body -->
							</div>
						</div>
					</div>

				</div>
				<!-- article -->
			</div>
		</div>

		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- footer -->
	</div>

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

<!-- <script>
function confirmDelete(jobid) {
    if (confirm('Bạn có chắc chắn muốn xóa bài đăng công việc này?')) {
        fetch(`/jobs/${jobid}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(response => {
            if (response.ok) {
                alert('Đã xóa bài đăng công việc thành công.');
                location.reload();
            } else {
                alert('Không thể xóa bài đăng công việc.');
            }
        }).catch(error => {
            console.error('Error:', error);
            alert('Đã xảy ra lỗi.');
        });
    }
}
</script> -->

</body>
</html>
