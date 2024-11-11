<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Trang cá nhân</title>

<!-- Custom fonts -->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900"
	rel="stylesheet" />
<link href="/css/sb-admin-2.min.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/yourcode.js"
	crossorigin="anonymous"></script>
<!-- CSS for DataTables -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
	<style>
	
/* Modal background */
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

/* Modal content */
.modal-content {
	background-color: #fff;
	border-radius: 8px;
	width: 90%;
	max-width: 400px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
	overflow: hidden;
}

/* Modal header */
.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 20px;
	border-bottom: 1px solid #ddd;
}

.modal-header h2 {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin: 0;
}

/* Close button */
.close {
	font-size: 20px;
	font-weight: bold;
	color: #999;
	cursor: pointer;
}

.close:hover {
	color: #555;
}

/* Modal body */
.modal-body {
	padding: 20px;
	font-size: 16px;
	color: #333;
	text-align: center;
}

/* Modal footer */
.modal-footer {
	padding: 15px 20px;
	border-top: 1px solid #ddd;
	display: flex;
	justify-content: center;
}

/* OK Button */
.modal-button {
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.modal-button:hover {
	background-color: #45a049;
}
	</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<br>
	
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
		<!-- Page Wrapper -->
		<div id="page-top">
			<div id="wrapper">
				<!-- Sidebar -->
				<ul class="navbar-nav sidebar sidebar-dark accordion"
					id="accordionSidebar" style="background: #198754">
					<a
						class="sidebar-brand d-flex align-items-center justify-content-center"
						href="#">
						<div class="sidebar-brand-text mx-3">Trang cá nhân</div>
					</a>
					<hr class="sidebar-divider my-0" />

					<hr class="sidebar-divider d-none d-md-block" />

					<li class="nav-item"><a class="nav-link collapsed" href="#"
						data-toggle="collapse" data-target="#collapsePages"
						aria-expanded="true" aria-controls="collapsePages"> <i
							class="fas fa-fw fa-table"></i> <span>Quản lý CV</span>
					</a>
						<div id="collapsePages" class="collapse"
							aria-labelledby="headingPages" data-parent="#accordionSidebar">
							<div class="bg-white py-2 collapse-inner rounded">
								<a class="collapse-item" href="/user/cv">Tạo CV</a> <a
									class="collapse-item" href="/user/cv/list">Danh sách CV đã
									nộp</a> <a class="collapse-item" href="/user/cv/list2">Quản lý
									CV</a>
							</div>
						</div></li>

					<li class="nav-item"><a class="nav-link"
						href="/ThongTinCaNhan"> <i class="fas fa-fw fa-info"></i> <span>Thông
								tin cá nhân</span>
					</a></li>

					<hr class="sidebar-divider" />

					<!-- <li class="nav-item"><a class="nav-link" href="#"> <i
							class="fa fa-cog fa-spin fa-fw"></i> <span>Cài đặt</span>
					</a></li> -->

					<div class="text-center d-none d-md-inline">
						<button class="rounded-circle border-0" id="sidebarToggle"></button>
					</div>
				</ul>
				<!-- End of Sidebar -->

				<!-- Content Wrapper -->
				<div id="content-wrapper" class="d-flex flex-column">
					<div id="content">
						<!-- Page Content -->
						<div class="container-fluid">
							<jsp:include page="/views/profile/${page}"></jsp:include>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<!-- Footer -->
	<%@ include file="/views/footer.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="/js/sb-admin-2.min.js"></script>
	<script src="/vendor/chart.js/Chart.min.js"></script>
	<script src="/js/demo/chart-area-demo.js"></script>
	<script src="/js/demo/chart-pie-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('#listCV')
									.DataTable(
											{
												"paging" : true,
												"searching" : true,
												"ordering" : true,
												"info" : true,
												"language" : {
													"paginate" : {
														"next" : "Tiếp theo",
														"previous" : "Trước đó"
													},
													"lengthMenu" : "Hiển thị _MENU_ mục",
													"info" : "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
													"zeroRecords" : "Không tìm thấy kết quả nào",
													"infoEmpty" : "Không có dữ liệu",
													"infoFiltered" : "(lọc từ _MAX_ mục)",
													"search" : "Tìm kiếm:"
												}
											});
						});
	</script>
	<script>
    // Close modal function
    function closeModal() {
        document.getElementById("paymentSuccessModal").style.display = "none";
    }
    </script>
</body>
</html>
