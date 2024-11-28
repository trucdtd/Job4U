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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="/css/thongke.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/quanlyuser.css">

</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>

	<%@ include file="/views/chat.jsp"%>
	<br>
	<!-- header -->
	<c:if test="${not empty message}">
		<div id="paymentSuccessModal" class="modal" style="display: flex;">
			<div class="modal-content">
				<div class="modal-header">
					<h2>Thông báo</h2>
					<span class="close" onclick="closeModal()">&times;</span>
				</div>
				<div class="modal-body">
					<p>${message}</p>
				</div>
				<div class="modal-footer">
					<button onclick="closeModal()" class="modal-button">OK</button>
				</div>
			</div>
		</div>
	</c:if>
	<div class="container">
		<div class="container">
			<div class="row">
				<!-- aside -->
				<%@ include file="/views/menuAdmin.jsp"%>
				<!-- aside -->
				<!-- article -->
				<div class="col-lg-9 col-md-9 ">
					<div id="userManagement" class="card p-2">
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
								<table id="userTable" class="table align-items-center mb-0">
									<thead class="thead-light text-center">
										<tr>
											<th>ID</th>
											<th>Tên Tài Khoản</th>
											<th>Email</th>
											<th>Số điện thoại</th>
											<th>Role</th>
											<th>Trạng Thái</th>
											<th>Hành Động</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${dsND}" var="nd">
											<tr>
												<th scope="row">${nd.userid}</th>
												<td>${nd.username}</td>
												<td>${nd.email}</td>
												<td>${nd.phonenumber}</td>
												<td><c:choose>
														<c:when test="${nd.role == 0}">Admin</c:when>
														<c:when test="${nd.role == 1}">Ứng viên</c:when>
														<c:when test="${nd.role == 2}">Nhà tuyển dụng</c:when>
														<c:otherwise>Không xác định</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${nd.status == false}">Không hoạt động</c:when>
														<c:when test="${nd.status == true}">Hoạt động</c:when>
														<c:otherwise>Không xác định</c:otherwise>
													</c:choose></td>
												<td><a href="/admin/detailUser/${nd.userid}"
													class="btn" type="button" title="Xem Chi Tiết"><img
														src="/img/detail-icon.png" style="padding-bottom: 7px;"
														width="25px" height="30px" alt="Detail"></a> <%-- <a href="#"
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

					<%-- <c:if test="${not empty message}">
						<div class="alert alert-success">${message}</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
					</c:if> --%>

					<!-- Post Management table -->
					<div id="postManagement" class="card p-2" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Bài Viết</div>
						</div>
						<div class="card-body p-0">
							<form id="deleteForm" action="/admin/deletePost" method="POST"
								style="display: none;">
								<input type="hidden" name="id" id="deleteId">
							</form>

							<div class="table-responsive">
								<table id="postTable" class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Tên Công Ty</th>
											<th scope="col">Tiêu Đề</th>
											<th scope="col">Tên Ngành</th>
											<th scope="col">Lương</th>
											<th scope="col">Trạng Thái</th>
											<th scope="col">Hành Động</th>


										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qlBV}" var="bv">
											<tr>
												<th scope="row">${bv.jobid}</th>
												<td>${bv.employer.companyname}</td>
												<td>${bv.jobtitle}</td>
												<%-- <td>${bv.joblocation}</td> --%>
												<td>${bv.jobdescription}</td>
												<td><c:choose>
														<c:when test="${bv.salary != null}">
															<span style="display: inline-flex; align-items: center;">
																${bv.salary.toString().replaceAll("(\\d)(?=(\\d{3})+(?!\\d))", "$1,")}
																VND </span>
														</c:when>
													</c:choose></td>

												<td>${bv.active ? 'Đang hoạt động' : 'Đang ẩn'}</td>

												<td>
													<div style="display: flex; align-items: center; gap: 10px;">
														<a href="/admin/detailPost/${bv.jobid}" class="btn"
															type="button" title="Xem Chi Tiết"> <img
															src="/img/detail-icon.png" style="padding-bottom: 7px;"
															width="25px" height="30px" alt="Detail">
														</a> <a href="#" onclick="return confirmDelete(${bv.jobid});"
															title="Xóa"> <img src="/img/delete-icon.png"
															style="padding-bottom: 7px;" width="25px" height="30px"
															alt="Delete">
														</a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!--  -->

					<!-- CV Management table -->

					<div id="cvManagement" class="card p-2" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý CV</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table id="cvTable" class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Nội Dung HS</th>
											<th scope="col">Tóm Tắt HS</th>
											<th scope="col">Kinh Nghiệm</th>
											<th scope="col">Học Vấn</th>
											<th scope="col">Kỹ Năng</th>
											<th scope="col">Hành Động</th>
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
												<td>
													<div style="display: flex; align-items: center; gap: 10px;">
														<a href="/admin/detailCV/${cv.jobseekerid}" class="btn"
															type="button" title="Xem CV"> <img
															src="/img/detail-icon.png" style="padding-bottom: 7px;"
															width="25px" height="30px" alt="Detail">
														</a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div id="serviceManagement" class="card p-2" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Dịch Vụ</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table id="dvTable" class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Tên Dịch Vụ</th>
											<th scope="col">Giá</th>
											<th scope="col">Ngày chạy dịch vụ</th>
											<th scope="col">Ngày Tạo</th>
											<th scope="col">Hành Động</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qldv}" var="dv">
											<tr>
												<th scope="row">${dv.serviceid}</th>
												<td>${dv.servicename}</td>
												<td class="price">${dv.price}</td>
												<td>${dv.durationindays}</td>
												<td>${dv.createdat}</td>
												<td>
													<div style="display: flex; align-items: center; gap: 10px;">
														<a href="/admin/detailDV/${dv.serviceid}" class="btn"
															type="button" title="Xem Chi Tiết"> <img
															src="/img/detail-icon.png" style="padding-bottom: 7px;"
															width="25px" height="30px" alt="Detail">
														</a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- thêm mới dịch vụ -->
					<div id="serviceNew" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Thêm mới dịch vụ</div>
						</div>
						<div class="card-body p-3">
							<form action="/admin/newDv" method="post">
								<!-- Job ID and Deadline -->
								<div class="row mb-3">
									<div class="col-md-6">
										<label for="">Tên Dịch Vụ:</label> <input class="form-control"
											type="text" id="servicename" name="servicename"
											placeholder="Nhập tên goi dịch vụ">
									</div>
									<div class="col-md-6">
										<label for="salary">Giá:</label> <input class="form-control"
											type="text" id="price" name="price" placeholder="Giá dịch vụ">
									</div>
								</div>

								<!-- Job Type and Description -->
								<div class="row mb-3">
									<div class="col-md-6">
										<label for="">Số lượng bài viết</label> <input
											class="form-control" type="text" id="numberofjobsallowed"
											name="numberofjobsallowed"
											placeholder="Tổng số lượng bài viết">
									</div>
									<div class="col-md-6">
										<label for="contactperson">Thời gian chạy dịch vụ: </label> <input
											class="form-control" type="text" id="durationindays"
											name="durationindays" placeholder="Theo ngày">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-12">
										<label for="contactperson">Mô Tả:</label> <input
											class="form-control" type="text" id="description"
											name="description" placeholder="Mô tả dịch vụ">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 d-flex justify-content-start">
										<button type="submit" class="btn btn-success">Thêm
											mới</button>
									</div>

								</div>
							</form>
						</div>
					</div>
					<!--end thêm mới dịch vụ  -->

					<div id="servicesSold" class="card p-2" style="display: none;">
						<div class="card-header">
							<div class="card-title">Dịch Vụ Đã Bán</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table id="nmTable" class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Tên Dịch Vụ</th>
											<th scope="col">Tên Người Mua</th>
											<th scope="col">Giá</th>
											<th scope="col">Ngày Mua</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qlnm}" var="nm">
											<tr>
												<th scope="row">${nm.paymentid}</th>
												<td>${nm.service.servicename}</td>
												<td>${nm.user.fullname}</td>
												<td class="price">${nm.amount}</td>
												</td>

												<td>${nm.paymentdate}</td>
												<%-- <td>
													<div style="display: flex; align-items: center; gap: 10px;">
														<a href="/admin/detailDV/${dv.serviceid}" class="btn"
															type="button" title="Xem Chi Tiết"> <img src="/img/detail-icon.png"
															style="padding-bottom: 7px;" width="25px" height="30px"
															alt="Detail">
														</a> 
													</div>
												</td> --%>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!--statisticalManagement table -->
					<%-- <div id="statisticalManagement"
						class="card shadow-sm rounded-4 border-0"
						style="display: none; background-color: #eafaf1;">
						<div
							class="card-header bg-success text-white d-flex align-items-center rounded-top">
							<h5 class="card-title mb-0">
								Thống Kê <i class="bi bi-graph-up ms-2"></i>
							</h5>
						</div>
						<div class="card-body">
							<div class="alert alert-danger ${status}" role="alert">${text}</div>
							<div class="d-flex align-items-center">
								<form action="/thongke" method="post" class="d-flex rounded-3">
									<div class="mb-3 me-2">
										<input type="date" class="form-control border-0 shadow"
											name="startdate" id="" aria-describedby="helpId"
											placeholder="" />
									</div>
									<div class="mb-3 me-3">
										<input type="date" class="form-control border-0 shadow"
											name="enddate" id="" aria-describedby="helpId" placeholder="" />
									</div>
									<div class="mb-3 me-2">
										<button type="submit" class="btn btn-success mt-0 shadow">Thống
											kê</button>
									</div>
									<div class="mb-3 me-2">
										<a type="button" href="/thongke"
											class="btn btn-warning shadow">Thống kê tất cả</a>
									</div>
								</form>
								<div class="mb-3 me-2">
									<button id="exportExcel" class="btn btn-primary shadow mt-0">Xuất
										Excel</button>
								</div>
							</div>
							<hr>
							<div class="container-fluid row d-flex justify-content-around">
								<div class="col-12 col-sm-3 bg-white shadow rounded-2">
									<h5 class="text-center">
										Người dùng
									</h5>
									<div class="d-flex align-items-center justify-content-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6 id="user-count">${countUser}</h6>
										</div>
									</div>
								</div>
								<div class="col-12 col-sm-3 bg-white shadow rounded-2">
									<h5 class="text-center">
										Bài viết
									</h5>
									<div class="d-flex align-items-center justify-content-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-file-text"></i>
										</div>
										<div class="ps-3">
											<h6 id="user-count">${countJoblisting}</h6>
										</div>
									</div>
								</div>
								<div class="col-12 col-sm-3 bg-white shadow rounded-2">
									<h5 class="text-center">
										Dịch vụ đã bán
									</h5>
									<div class="d-flex align-items-center justify-content-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<p>${countService }</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> --%>

					<div id="violationManagement" class="card p-2"
						style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Vi Phạm</div>
						</div>
						<div class="card-body p-0">
						
							<div class="table-responsive">
								<table id="vpTable" class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">TK Báo Cáo</th>
											<th scope="col">TK Bị Báo Cáo</th>
											<th scope="col">Bài Viết Bị Báo Cáo</th>
											<th scope="col">Nội Dung Báo Cáo</th>
											<th scope="col">Trạng Thái</th>
											<th scope="col">Hành Động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qlvp}" var="vp">
											<tr>
												<th scope="row">${vp.user.username}</th>
												<td>Tài khoản: ${vp.employers.employerid} <br> Tên
													TK: ${vp.employers.companyname}
												</td>
												<td>${vp.job.jobtitle}</td>
												<td>${vp.reason}</td>
												<td>${vp.job.active ? 'Đang hoạt động' : 'Đã Xóa'}</td>
												<td><div
														style="display: flex; align-items: center; gap: 10px;">
														<a href="/admin/detailPost/${vp.job.jobid}" class="btn"
															type="button" title="Xem Chi Tiết"> <img
															src="/img/detail-icon.png" style="padding-bottom: 7px;"
															width="25px" height="30px" alt="Detail">														
													</div></td>
													
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
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
<script>
$(document).ready(function() {
    $('#userTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });
    
    $('#postTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });

    $('#cvTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });
    
    $('#dvTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });
    
    $('#nmTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });
    
    $('#vpTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });
});
</script>

<script>
    window.onload = function() {
        // Lấy tất cả các thẻ <td> có class là 'price'
        let priceElements = document.querySelectorAll('.price');
        
        // Lặp qua từng phần tử và định dạng giá trị
        priceElements.forEach(function(priceElement) {
            let price = priceElement.innerText;

            // Định dạng giá trị với dấu phân cách hàng nghìn
            price = parseFloat(price).toLocaleString();

            // Thêm chữ "VND" vào cuối số tiền
            priceElement.innerText = price + " VND";
        });
    };
</script>

<script>
    // Close modal function
    function closeModal() {
        document.getElementById("paymentSuccessModal").style.display = "none";
    }
    </script>
</body>
</html>
