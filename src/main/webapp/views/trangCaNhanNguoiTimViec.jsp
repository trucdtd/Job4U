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

<!-- Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/yourcode.js"
	crossorigin="anonymous"></script>
</head>

<body>

	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<br>
	<div class="container">
	<!-- Page Wrapper -->
	<div id="page-top">
		<div id="wrapper">
			<!-- Sidebar -->
			<ul
				class="navbar-nav sidebar sidebar-dark accordion"
				id="accordionSidebar" style="background: #198754">
				<!-- Sidebar - Brand -->
				<a
					class="sidebar-brand d-flex align-items-center justify-content-center"
					href="index.html">
					<div class="sidebar-brand-text mx-3">Trang cá nhân</div>
				</a>

				<!-- Divider -->
				<hr class="sidebar-divider my-0" />
					<!-- Nav Item - Dashboard -->
					<li class="nav-item active"><a class="nav-link" href="#">
							<i class="fas fa-fw fa-chart-area"></i> <span>Thống kê</span>
					</a></li>
					<!-- Divider -->
					<hr class="sidebar-divider d-none d-md-block" />
					<li class="nav-item"><a class="nav-link collapsed" href="#"
						data-toggle="collapse" data-target="#collapsePages"
						aria-expanded="true" aria-controls="collapsePages"> <i
							class="fas fa-fw fa-table"></i> <span>Quản lý CV</span>
					</a>
						<div id="collapsePages" class="collapse"
							aria-labelledby="headingPages" data-parent="#accordionSidebar">
							<div class="bg-white py-2 collapse-inner rounded">
								<a class="collapse-item" href="/user/cv">Thông tin
									CV</a> 
									<a class="collapse-item" href="#">Danh
									sách CV</a> <a class="collapse-item" href="#">Mẫu CV</a>
							</div>
						</div></li>

					<!-- Nav Item - Charts -->
					<li class="nav-item"><a class="nav-link"
						href="/ThongTinCaNhan"> <i class="fas fa-fw fa-info"></i> <span>Thông
								tin cá nhân</span>
					</a></li>
					<!-- Nav Item - Tables -->
					<!-- Divider -->
					<hr class="sidebar-divider" />
					<!-- Nav Item - Pages Collapse Menu -->
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fa fa-cog fa-spin fa-fw"></i> <span>Cài đặt</span>
					</a></li>
					<!-- Divider -->
					<hr class="sidebar-divider" />
					<!-- Heading -->

					<!-- Sidebar Toggler (Sidebar) -->
					<div class="text-center d-none d-md-inline">
						<button class="rounded-circle border-0" id="sidebarToggle"></button>
					</div>
				</ul>
				<!-- End of Sidebar -->

				<!-- Content Wrapper -->
				<div id="content-wrapper" class="d-flex flex-column">
					<!-- Main Content -->
					<div id="content">
						<!-- include Page Content -->
						<div class="container-fluid">
							<jsp:include page="/views/profile/${page}"></jsp:include>

				<!-- Nav Item - Dashboard -->
				<li class="nav-item active"><a class="nav-link"
					href="index.html"> <i class="fas fa-fw fa-chart-area"></i> <span>Thống
							kê</span></a></li>
				<!-- Divider -->
				<hr class="sidebar-divider d-none d-md-block" />
				<li class="nav-item"><a class="nav-link collapsed" href="#"
					data-toggle="collapse" data-target="#collapsePages"
					aria-expanded="true" aria-controls="collapsePages"> <!-- <i class="fas fa-fw fa-folder"></i> -->
						<i class="fas fa-fw fa-table"></i> <span>Quản lý CV</span>
				</a>
					<div id="collapsePages" class="collapse"
						aria-labelledby="headingPages" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="/user/cv">Thông tin
								CV</a> <a class="collapse-item" href="#">Danh sách
								CV</a> <a class="collapse-item" href="#">Mẫu
								CV</a>
						</div>
					</div></li>

				<!-- Nav Item - Charts -->
				<li class="nav-item"><a class="nav-link" href="user-info.html">
						<i class="fas fa-fw fa-info"></i> <span>Thông tin cá nhân</span>
				</a></li>
				<!-- Nav Item - Tables -->
				<!-- Divider -->
				<hr class="sidebar-divider" />
				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item"><a class="nav-link" href="user-info.html">
						<i class="fa fa-cog fa-spin fa-fw"></i> <span>Cài đặt</span>
				</a></li>
				<!-- Divider -->
				<hr class="sidebar-divider" />
				<li class="nav-item"><a class="nav-link" href="user-info.html">
						<i class="fas fa-fw fa-user"></i> <span>Mua gói pro</span>
				</a></li>
				<!-- Divider -->
				<hr class="sidebar-divider" />
				<!-- Heading -->

				<!-- Sidebar Toggler (Sidebar) -->
				<div class="text-center d-none d-md-inline">
					<button class="rounded-circle border-0" id="sidebarToggle"></button>
				</div>
			</ul>
			<!-- End of Sidebar -->

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				<!-- Main Content -->
				<div id="content">
					<!-- include Page Content -->
					<div class="container-fluid">
						<jsp:include page="/views/profile/${page}"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->

	<!-- Bootstrap core JavaScript-->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/js/demo/chart-area-demo.js"></script>
	<script src="/js/demo/chart-pie-demo.js"></script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>
