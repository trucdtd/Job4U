<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sidebar With Bootstrap</title>
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/header_logined.css">

</head>

<body>
	<header class="">
		<nav class=" navbar navbar-expand-lg" style="background: #00688B;">
			<div class="container-fluid">
				<a href="#"
					class="navbar-brand navbar-brand-custom text-light me-auto text-center">
					<img src="/img/logo_2.png" class="mt-2" height="40px" width="40px"
					alt>
					<h5 class="text-light text-light-custom">Job4U</h5> <!-- <p class="text-light text-light-custom" style="font-size: small;">Tìm việc
                        online</p> -->
				</a>
				<div class="offcanvas offcanvas-end" tabindex="-1"
					id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel"
					style="background: #00688B;">
					<div class="offcanvas-header">
						<h5 class="text-light">Job for you</h5>
						<img src="/img/icons8-close-50.png" data-bs-dismiss="offcanvas"
							height="30px" width="30px" alt>
					</div>
					<!-- center nav -->
					<div class="offcanvas-body">
						<ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
							<li class="nav-item"><a class="nav-link" href="#"><img
									src="/img/icons8-home-50.png" style="padding-bottom: 7px;"
									width="25px" height="30px" alt> Trang Chủ</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Hỏi
									Đáp</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Top
									Công Việc</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Nhà
									Tuyển Dụng</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Ứng
									Tuyển</a></li>
							<div class="dropdown dropdown-nav-custom">
								<button class="btn btn-primary dropdown-toggle" type="button"
									id="dropdownMenu2" data-bs-toggle="dropdown"
									aria-expanded="false">
									<img class="img-user img-user-responsive"
										src="/Job4U/img/admin.jpg" alt=""> <span
										class="text-light">Đoàn</span>
								</button>
								<ul class="dropdown-menu dropdown-menu-nav-custom ms-3 me-1"
									aria-labelledby="dropdownMenu2">
									<li><a
										class="dropdown-item dropdown-item-custom d-flex justify-content-start"
										href="/Job4U/thong_tin_ca_nhan.html"><img class="m-1"
											src="/img/icons8-user-50.png" height="25px" width="25px"
											alt="">
											<p class="m-1 text-dropdown-menu">Thông tin cá nhân</p></a></li>
									<li><a
										class="dropdown-item dropdown-item-custom d-flex justify-content-start"
										href="/Job4U/lien_he.html copy.html"><img class="m-1"
											src="/img/icons8-phone-50.png" height="25px" width="25px"
											alt="">
											<p class="m-1 text-dropdown-menu">Thông tin liên hệ</p></a></li>
									<li><a
										class="dropdown-item dropdown-item-custom d-flex justify-content-start"
										href="/Job4U/lien_he.html copy.html"><img class="m-1"
											src="/img/icons8-cv-80.png" height="25px" width="25px" alt="">
											<p class="m-1 text-dropdown-menu">Quản lý CV</p></a></li>

									<li><a
										class="dropdown-item dropdown-item-custom d-flex justify-content-start"
										href="/changePass"><img class="m-1" src="/img/icons8-setting-50.png"
											height="25px" width="25px" alt="">
											<p class="m-1 text-dropdown-menu">Cài Đặt</p></a></li>
									<li><a
										class="dropdown-item dropdown-item-custom d-flex justify-content-start"
										href="#"><img class="m-1" src="/img/icons8-logout-52.png"
											height="25px" width="25px" alt="">
											<p class="m-1 text-dropdown-menu">Đăng xuất</p></a></li>
								</ul>
							</div>
						</ul>
						<!-- end center nav -->
					</div>
				</div>
				<!--start right nav -->
				<!-- <div class="dash justify-content-center"></div> -->
				<!-- THÔNG BÁO -->
				<div class="dropdown d-flex justify-content-end bell">
					<a name="" id="" class="btn btn-light btn-light-custom" href="#"
						role="button"><img class="text-center"
						src="/img/icons8-bell-48.png" height="30px" alt=""></a>
				</div>
				<!-- HẾT THÔNG BÁO -->
				<!-- DROPDOWN MENU -->
				<div class="dropdown dropdown-custom d-flex justify-content-end">
					<button data-mdb-button-init data-mdb-ripple-init
						data-mdb-dropdown-init
						class="btn btn-light btn-light-custom display-none" type="button"
						id="dropdownMenuButton" data-mdb-toggle="dropdown"
						aria-expanded="false">
						<img class="img-user" src="/img/admin.jpg" alt=""> <span
							class="span-name-user">Đoàn</span>
					</button>
					<ul class="dropdown-menu dropdown-menu-custom"
						aria-labelledby="dropdownMenuButton">
						<li><a class="dropdown-item d-flex justify-content-start"
							href="/Job4U/thong_tin_ca_nhan.html"><img class="m-1"
								src="/img/icons8-user-50.png" height="25px" width="25px" alt="">
								<p class="m-1 text-dropdown-menu">Thông tin cá nhân</p></a></li>
						<li><a
							class="dropdown-item dropdown-item-custom d-flex justify-content-start"
							href="/Job4U/lien_he.html copy.html"><img class="m-1"
								src="/img/icons8-phone-50.png" height="25px" width="25px" alt="">
								<p class="m-1 text-dropdown-menu">Thông tin liên hệ</p></a></li>
						<li><a
							class="dropdown-item dropdown-item-custom d-flex justify-content-start"
							href="/Job4U/lien_he.html copy.html"><img class="m-1"
								src="/img/icons8-cv-80.png" height="25px" width="25px" alt="">
								<p class="m-1 text-dropdown-menu">Quản lý CV</p></a></li>

						<li><a class="dropdown-item d-flex justify-content-start"
							href="#"><img class="m-1" src="/img/icons8-setting-50.png"
								height="25px" width="25px" alt="">
								<p class="m-1 text-dropdown-menu">Cài đặt</p></a></li>
						<li><a class="dropdown-item d-flex justify-content-start"
							href="#"><img class="m-1" src="/img/icons8-logout-52.png"
								height="25px" width="25px" alt="">
								<p class="m-1 text-dropdown-menu">Đăng xuất</p></a></li>
					</ul>
				</div>
				<!-- HẾT DROPDOWN MENU -->
				<!-- end right nav -->
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					airia-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<img src="/Job4U/img/icons8-menu-50.png" height="30px" width30px
						alt>
				</button>
			</div>
			</div>
		</nav>
		<!-- end navbar -->
	</header>
	<!-- navbar -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>

</html>