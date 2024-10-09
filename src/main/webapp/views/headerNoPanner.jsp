<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.3.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/header.css">
</head>
<body>
	<header class="bg-white">
		<!-- place navbar here -->
		<nav class="navbar navbar-expand-lg navbar-light shadow">
			<div class="container-fluid">
				<div class="text-center text-success fw-bold">
					<a class="navbar-brand text-success" href="#">JOB4U</a>
					<p class="navbar-brand-text-p">Tìm việc làm - Tuyển nhân sự
						online</p>
				</div>
				<button class="navbar-toggler mb-4" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<img src="/icon/icons8-menu-50 (1).png" alt="" />
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<p class="mb-1 text-reponsive">Dành cho ứng viên</p>
					<ul class="navbar-nav ms-auto me-auto mb-2 mb-lg-0 ">
						<li class="nav-item"><a
							class="nav-link fw-bold text-success" aria-current="page"
							href="/job4u">Trang chủ</a></li>

						<li class="nav-item"><a class="nav-link" href="/job4u/topjob">Công
								việc mới</a></li>
						<li class="nav-item"><a class="nav-link" href="/job4u/employers">Nhà
								tuyển dụng</a></li>
						<li class="nav-item"><a class="nav-link" href="/job4u/profile">Ứng
								tuyển</a></li>
						<li class="nav-item"><a class="nav-link" href="/lienhe">Liên hệ</a>
						</li>
					</ul>
					<div class="d-flex-custom no-login" id="no-login">
						<a name="" id="" class="btn btn-outline-success me-2 mb-3"
							href="/Login" role="button">Đăng nhập</a> <a name="" id=""
							class="btn btn-success me-2 mb-3" href="/DangKy" role="button">Đăng
							ký</a>
						<div>
							<p class="mb-1 text-reponsive">Dành cho nhà tuyển dụng</p>
							<a name="" id="" class="btn btn-dark me-2" href="#" role="button">Đăng
								tuyển & tìm hồ sơ</a>
						</div>
					</div>
					<div class="logined" id="logined">
						<div class="btn-group me-3">
							<button class="btn btn-light dropdown-toggle rounded-pill shadow"
								type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
								aria-expanded="false">
								<img src="/img/icons8-bell-48.png" height="25" alt="" />
							</button>
							<ul class="dropdown-menu dropdown-menu-end mt-3 border-0 shadow"
								aria-labelledby="dropdownMenuButton">
								<li><a class="dropdown-item" href="#">Thoong bao 1</a></li>
							</ul>
						</div>
						<a name="" id="" class="btn rounded-circle me-3 shadow" href="#"
							role="button"><img
							src="/img/icons8-chat-60.png" height="25" alt="" /></a>
						<div class="btn-group me-3">
							<button class="btn btn-white dropdown-toggle rounded-pill shadow"
								type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
								aria-expanded="false">
								<img class="rounded-circle" src="/img/icons8-user-50.png"
									height="25" alt="" /> <span id="user-name"
									class="span-name-user"></span>
							</button>
							<ul class="dropdown-menu dropdown-menu-end mt-3 border-0 shadow"
								aria-labelledby="dropdownMenuButton">
								<li><a class="dropdown-item d-flex justify-content-start"
									href="/ThongTinCaNhan"> <img class="m-1"
										src="/img/icons8-user-50.png" height="25px" width="25px"
										alt="User Info">
										<p class="m-1 text-dropdown-menu">Thông tin cá nhân</p>
								</a></li>
								<li><a class="dropdown-item d-flex justify-content-start"
									href="<%= 
                    session.getAttribute("role") != null ? 
                    (session.getAttribute("role").toString().equals("0") ? "/admin" : 
                    (session.getAttribute("role").toString().equals("1") ? "/job4u/profile" : 
                    (session.getAttribute("role").toString().equals("2") ? "/job4u/employers" : "#"))) : "#" %>">
										<img class="m-1" src="/img/icons8-cv-80.png" height="25px"
										width="25px" alt="Contact Info">
										<p class="m-1 text-dropdown-menu">Quản lý trang</p>
								</a></li>
								<li><a class="dropdown-item d-flex justify-content-start"
									href="/changePass"> <img class="m-1"
										src="/img/icons8-setting-50.png" height="25px" width="25px"
										alt="Change Password">
										<p class="m-1 text-dropdown-menu">Đổi mật khẩu</p>
								</a></li>
								<li><a class="dropdown-item d-flex justify-content-start"
									href="/Login/logout"> <img class="m-1"
										src="/img/icons8-logout-32.png" height="25px" width="25px"
										alt="Logout">
										<p class="m-1 text-dropdown-menu">Đăng xuất</p>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- end nav -->
	</header>

	<!-- Include jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    $(document).ready(function() {
        var userIsLoggedIn = "<%=session.getAttribute("userIsLoggedIn") != null ? session.getAttribute("userIsLoggedIn").toString() : "false" %>";
        var userName = "<%=session.getAttribute("userName") != null ? session.getAttribute("userName").toString() : "" %>";

        console.log("User is logged in: " + userIsLoggedIn);
        console.log("User name: " + userName);

        if (userIsLoggedIn === "true") {
            $('#no-login').hide();
            $('#logined').show();
            $('#account-info').removeClass('d-none');
            $('#user-name').text(userName);
        } else {
            $('#no-login').show();
            $('#logined').hide();
            $('#account-info').addClass('d-none');
        }
    });
</script>
</body>
</html>