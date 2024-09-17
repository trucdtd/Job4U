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

</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<br>
	<!-- header -->
	<div class="container">
		<div class="container">
			<div class="row">
				<!-- aside -->
				<%@ include file="/views/menuAdmin.jsp"%>
				<!-- aside -->
				<!-- article -->
				<div class="col-lg-9 col-md-9 ">
					<div id="userManagement" class="card">
						<div class="card-header">
							<div class="card-title">Quản Lý Tài Khoản</div>
						</div>

						<div class="card-body p-0">

							<!-- Thông báo thành công -->
							<c:if test="${not empty param.error}">
								<script>
										document
												.addEventListener(
														'DOMContentLoaded',
														function() {
															const successModal = new bootstrap.Modal(
																	document
																			.getElementById('successModal'));
															successModal.show();
														});
									</script>

								<div class="modal fade" id="successModal" tabindex="-1"
									aria-labelledby="successModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="successModalLabel">Thông
													báo</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
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
							<!-- Thông báo thành công -->
							<c:if test="${not empty param.successMessage}">
								<script>
										document
												.addEventListener(
														'DOMContentLoaded',
														function() {
															const successModal = new bootstrap.Modal(
																	document
																			.getElementById('successModal'));
															successModal.show();
														});
									</script>

								<div class="modal fade" id="successModal" tabindex="-1"
									aria-labelledby="successModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="successModalLabel">Thông
													báo</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">${param.successMessage}</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													onclick="window.location.href='/admin'">OK</button>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<form id="deleteFormm" action="/admin/deleteUser" method="POST"
								style="display: none;">
								<input type="hidden" name="userid" id="deleteIdd">
							</form>

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
												<td><c:choose>
														<c:when test="${nd.role == 0}">Admin</c:when>
														<c:when test="${nd.role == 1}">Ứng viên</c:when>
														<c:when test="${nd.role == 2}">Nhà tuyển dụng</c:when>
														<c:otherwise>Không xác định</c:otherwise>
													</c:choose></td>
												<td><a href="/admin/detailUser/${nd.userid}"
													class="btn btn-info text-white p-2 " type="button"
													style="background-color: #198754">Chi tiết</a> <%-- <a href="#"
													class="btn btn-danger"
													onclick="return confirmDeleteAccount(${nd.userid});">Xóa</a> --%>
												</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<c:if test="${not empty message}">
						<div class="alert alert-success">${message}</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
					</c:if>

					<!-- Post Management table -->
					<div id="postManagement" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Bài Viết</div>
						</div>
						<div class="card-body p-0">
							<form id="deleteForm" action="/admin/deletePost" method="POST"
								style="display: none;">
								<input type="hidden" name="id" id="deleteId">
							</form>

							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Tên Công Ty</th>
											<th scope="col">Tiêu Đề</th>
											<th scope="col">Yêu Cầu</th>
											<!-- <th scope="col">Vị Trí Công Việc</th> -->
											<th scope="col">Tên Ngành</th>
											<th scope="col">Lương</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qlBV}" var="bv">
											<tr>
												<th scope="row">${bv.jobid}</th>
												<td>${bv.employer.companyname}</td>
												<td>${bv.jobtitle}</td>
												<td>${bv.jobrequirements}</td>
												<%-- <td>${bv.joblocation}</td> --%>
												<td>${bv.jobdescription}</td>
												<td><span
													style="display: inline-flex; align-items: center;">
														<script>
												            var salary = Number(${bv.salary});
												            if (!isNaN(salary)) {
												                document.write(salary.toLocaleString('vi-VN') + 'VND');
												            } else {
												                document.write('N/A');
												            }
												        </script>
												</span></td>
												<td><a href="/admin/detailPost/${bv.jobid}"
													class="btn btn-info" type="button"
													style="background-color: #00688B; color: white; display: inline-block;">Chi
														tiết</a> <%-- <a href="#" class="btn btn-danger"
													onclick="return confirmDelete(${bv.jobid});">Xóa</a> --%></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!--  -->

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
											<th scope="col">ID</th>
											<th scope="col">Nội Dung HS</th>
											<th scope="col">Tóm Tắt HS</th>
											<th scope="col">Kinh Nghiệm</th>
											<th scope="col">Học Vấn</th>
											<th scope="col">Kỹ Năng</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qlCV}" var="cv">
											<tr>
												<th scope="row">${cv.jobseekerid}</th>
												<td>${cv.resume}</td>
												<td>${cv.profilesummary}</td>
												<td>${cv.experience}</td>
												<td>${cv.education}</td>
												<td>${cv.skills}</td>

											</tr>
										</c:forEach>
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

				<!--  -->
			</div>
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

<script>
function confirmDelete(id) {
    if (confirm("Bạn có chắc chắn muốn xóa bài viết này không?")) {
        // Cập nhật giá trị của input ẩn trong form xóa
        document.getElementById('deleteId').value = id;
        // Gửi form để thực hiện xóa
        document.getElementById('deleteForm').submit();
        return false; // Ngăn việc điều hướng đến URL
    }
    return false; // Ngăn việc thực hiện hành động nếu người dùng chọn hủy
}
</script>

<script>
    function confirmDeleteAccount(userid) {
        if (confirm('Bạn có chắc chắn muốn xóa tài khoản này không?')) {
            // Cập nhật giá trị của trường ẩn trong biểu mẫu
            document.getElementById('deleteIdd').value = userid;
            // Gửi biểu mẫu
            document.getElementById('deleteFormm').submit();
        }
        return false; // Ngăn chặn hành vi mặc định của liên kết
    }
</script>


</body>
</html>
