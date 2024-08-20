<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Title</title>

<!-- Bootstrap CSS v5.3.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/header.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark"
			style="background-color: #00688B;">
			<div class="container-fluid">
				<a href="#"
					class="navbar-brand d-flex align-items-center text-light"> <img
					src="/img/logo_2.png" alt="Logo">
					<div class="ms-2">
						<h5 class="mb-0">Job4U</h5>
						<p class="mb-0" style="font-size: small;">Tìm việc online</p>
					</div>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<img src="/img/icons8-menu-50.png" height="30" width="30"
						alt="Menu">
				</button>
				<div class="offcanvas offcanvas-end" tabindex="-1"
					id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel"
					style="background-color: #00688B;">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title text-light" id="offcanvasNavbarLabel">Job
							for you</h5>
						<button type="button" class="btn-close btn-close-white"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div
						class="offcanvas-body d-flex flex-column align-items-center justify-content-center">
						<ul class="navbar-nav text-center">
							<li class="nav-item"><a class="nav-link" href="/job4u"><img
									src="/img/icons8-home-50.png" alt="Home"> Trang Chủ</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Hỏi
									Đáp</a></li>
							<li class="nav-item"><a class="nav-link" href="/job4u">Top
									Công Việc</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/job4u/employers">Nhà Tuyển Dụng</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Ứng
									Tuyển</a></li>
						</ul>
						<!-- DROPDOWN MENU -->
						<div id="account-info"
							class="dropdown d-flex justify-content-end d-none">
							<button class="btn btn-light" type="button"
								id="dropdownMenuButton" data-bs-toggle="dropdown"
								aria-expanded="false">
								<img src="/img/icons8-bell-48.png" height="30"
									alt="Notifications"> <span id="user-name"
									class="span-name-user"></span>
							</button>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="dropdownMenuButton">
								<li><a class="dropdown-item" href="/ThongTinCaNhan"><img
										src="/img/icons8-user-50.png" height="25" width="25"
										alt="Profile"> Thông tin cá nhân</a></li>
								<li><a class="dropdown-item" href="/ThongTinCaNhan/user"><img
										src="/img/icons8-phone-50.png" height="25" width="25"
										alt="Contact"> Thông tin liên hệ</a></li>
								<li><a class="dropdown-item"
									href="/Job4U/lien_he.html copy.html"><img
										src="/img/icons8-cv-80.png" height="25" width="25" alt="CV">
										Quản lý CV</a></li>
								<li><a class="dropdown-item" href="/changePass"><img
										src="/img/icons8-setting-50.png" height="25" width="25"
										alt="Settings"> Đổi mật khẩu</a></li>
								<li><a class="dropdown-item" href="/Login/logout"><img
										src="/img/icons8-logout-52.png" height="25" width="25"
										alt="Logout"> Đăng xuất</a></li>
							</ul>
						</div>
						<!-- END DROPDOWN MENU -->
					</div>
				</div>
				<!-- Login/Register buttons in the navbar -->
				<div id="login-register-buttons" class="d-flex ms-auto">
					<a id="login-btn" href="/Login" class="btn btn-outline-light me-2"><img
						src="/img/login-icon.png" height="25" width="25" alt="Login">
						Đăng nhập</a> <a id="register-btn" href="/DangKy"
						class="btn btn-outline-light"><img
						src="/img/icons8-register-30.png" height="25" width="25"
						alt="Register"> Đăng ký</a>
				</div>
			</div>
		</nav>
		<section class="banner mb-4">
			<img src="/img/poster2.png" class="img-fluid" alt="Banner">
		</section>
	</header>

	<!-- Include jQuery and Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6XWw6iy8ozvQu6Xj+6xRt2H1O1O1p56e5n9J4w5P0MXmQ76vA8DQ1j"
		crossorigin="anonymous"></script>
	<script>
    $(document).ready(function() {
        var userIsLoggedIn = "<%=session.getAttribute("userIsLoggedIn") != null ? session.getAttribute("userIsLoggedIn").toString() : "false"%>";
        var userName = "<%=session.getAttribute("userName") != null ? session.getAttribute("userName").toString() : ""%>
		";

							console.log("User is logged in: " + userIsLoggedIn);
							console.log("User name: " + userName);

							if (userIsLoggedIn === "true") {
								$('#login-btn').hide();
								$('#register-btn').hide();
								$('#account-info').removeClass('d-none');
								$('#user-name').text(userName);
							} else {
								$('#login-btn').show();
								$('#register-btn').show();
								$('#account-info').addClass('d-none');
							}
						});
	</script>
</body>
</html>
