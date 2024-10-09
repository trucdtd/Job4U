<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/header.css">
</head>

<body>
<<<<<<< HEAD
	<header>
		<nav class="navbar navbar-expand-lg navbar-light m-0 p-1 shadow">
			<div class="container-fluid">
				<div class="text-center me-5">
					<a class="navbar-brand fw-bold text-success" href="#">JOB4U</a>
					<p>Việc làm online nhanh chóng</p>
				</div>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a
							class="nav-link active fw-bold text-success" aria-current="page"
							href="#">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Công
								việc mới</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Nhà
								tuyển dụng</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Ứng
								tuyển</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Liên hệ</a>
						</li>
					</ul>
					<div class=""></div>
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
								height="25" alt="" />   <span id="user-name" class="span-name-user"></span>
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
								href="/Job4U/lien_he.html copy.html"> <img class="m-1"
									src="/img/icons8-bell-50.png" height="25px" width="25px"
									alt="CV Management">
									<p class="m-1 text-dropdown-menu">Thông báo</p>
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
		</nav>
	</header>
	<!-- Bootstrap JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
        $(document).ready(function() {
            var userIsLoggedIn = "<%=session.getAttribute("userIsLoggedIn") != null ? session.getAttribute("userIsLoggedIn").toString() : "false" %>";
            var userName = "<%=session.getAttribute("userName") != null ? session.getAttribute("userName").toString() : "" %>";
    
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
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
=======
<header>
    <nav class="navbar navbar-expand-lg" style="background: #198754">
        <div class="container-fluid">
            <a href="#" class="navbar-brand text-light me-auto text-center">
                <img src="/img/logo_2.png" height="40px" width="40px" alt="Logo">
                <h5 class="text-light">Job4U</h5>
                <p class="text-light" style="font-size: small;">Tìm việc online</p>
            </a>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel"
                 style="background: #009933;">
                <div class="offcanvas-header">
                    <h5 class="text-light">Job for you</h5>
                    <img src="/img/icons8-close-50.png" data-bs-dismiss="offcanvas" height="30px" width="30px" alt="Close">
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
                        <li class="nav-item"><a class="nav-link" href="/job4u"><img
                                src="/img/icons8-home-50.png" style="padding-bottom: 7px;" width="25px" height="30px" alt="Home"> Trang Chủ</a></li>                      
                        <li class="nav-item"><a class="nav-link" href="/job4u/topjob">Công Việc mới nhất</a></li>
                        <li class="nav-item"><a class="nav-link" href="/employers">Nhà Tuyển Dụng</a></li>
                        <li class="nav-item"><a class="nav-link" href="/user">Ứng Tuyển</a></li>
                        <li class="nav-item"><a class="nav-link" href="/lienhe">Liên Hệ</a></li>
                    </ul>
                    <div id="login-register-buttons">
                        <a id="login-btn" href="/Login" class="btn login-button text-center"><img
                                src="/img/login-icon.png" height="25px" width="25px" alt="Login"> Đăng nhập</a>
                        <a id="register-btn" href="/DangKy" class="btn login-button text-center"><img
                                src="/img/icons8-register-48.png" height="25px" width="25px" alt="Register"> Đăng ký</a>
                    </div>
                    <!-- DROPDOWN MENU -->
                    <div id="account-info" class="dropdown d-flex justify-content-end d-none">
                        <button class="btn btn-light btn-light-custom" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                aria-expanded="false">
                            <img class="text-center" src="/img/icons8-bell-50.png" height="30px" alt="Notifications"> 
                            <span id="user-name" class="span-name-user"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-custom dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                            <li>
                                <a class="dropdown-item d-flex justify-content-start" href="/ThongTinCaNhan">
                                    <img class="m-1" src="/img/icons8-user-50.png" height="25px" width="25px" alt="User Info">
                                    <p class="m-1 text-dropdown-menu">Thông tin cá nhân</p>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item d-flex justify-content-start" href="<%= 
                                    session.getAttribute("role") != null ? 
                                    (session.getAttribute("role").toString().equals("0") ? "/admin" : 
                                    (session.getAttribute("role").toString().equals("1") ? "/user" : 
                                    (session.getAttribute("role").toString().equals("2") ? "/employers" : "#"))) : "#" %>">
                                    <img class="m-1" src="/img/icons8-cv-80.png" height="25px" width="25px" alt="Contact Info">
                                    <p class="m-1 text-dropdown-menu">Quản lý trang</p>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item d-flex justify-content-start" href="#">
                                    <img class="m-1" src="/img/icons8-bell-50.png" height="25px" width="25px" alt="CV Management">
                                    <p class="m-1 text-dropdown-menu">Thông báo</p>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item d-flex justify-content-start" href="/changePass">
                                    <img class="m-1" src="/img/icons8-setting-50.png" height="25px" width="25px" alt="Change Password">
                                    <p class="m-1 text-dropdown-menu">Đổi mật khẩu</p>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item d-flex justify-content-start" href="/Login/logout">
                                    <img class="m-1" src="/img/icons8-logout-32.png" height="25px" width="25px" alt="Logout">
                                    <p class="m-1 text-dropdown-menu">Đăng xuất</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- HẾT DROPDOWN MENU -->
                </div>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                    aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <img src="/img/icons8-menu-50.png" height="30px" width="30px" alt="Menu">
            </button>
        </div>
    </nav>
>>>>>>> dev

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
		<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
	</script>

</body>
</html>
