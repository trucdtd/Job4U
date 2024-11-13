<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.footer {
	background-color: #198754;
	color: #f8f9fa;
	width: 100%; /* Đảm bảo footer chiếm toàn bộ chiều ngang */
	position: relative;
	/* Đảm bảo các phần tử bên trong có thể căn chỉnh chính xác */
	padding: 20px 0; /* Thêm padding nếu cần thiết */
	box-sizing: border-box;
	/* Đảm bảo padding không làm tăng chiều rộng của footer */
	margin-top: 20px; /* Add space above footer */
}

.footer a {
	color: #f8f9fa;
	text-decoration: none;
}

.footer a:hover {
	color: #c0c0c0;
	text-decoration: underline;
}

.footer h6 {
	font-weight: bold;
}

.footer .social-icons a {
	font-size: 1.5rem;
	margin: 0 0.5rem;
	transition: color 0.3s;
}

.footer .social-icons a:hover {
	color: #c0c0c0;
}
nav {
	margin-bottom: 20px; /* Add space below navbar */
}

button, .nav-link {
	margin-top: 5px; /* Ensure they are spaced properly */
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- Footer -->
		<!-- Footer -->
		<footer class="text-center text-lg-start footer">
			<!-- Section: Social media -->
			<section class="d-flex justify-content-center p-4">
				<!-- Social Media Icons -->
				<div class="social-icons">
					<a href="#" class="me-4"><i class="bi bi-facebook"></i></a> <a
						href="#" class="me-4"><i class="bi bi-twitter"></i></a> <a
						href="#" class="me-4"><i class="bi bi-google"></i></a> <a href="#"
						class="me-4"><i class="bi bi-instagram"></i></a> <a href="#"
						class="me-4"><i class="bi bi-linkedin"></i></a> <a href="#"><i
						class="bi bi-github"></i></a>
				</div>
			</section>
			<!-- Section: Social media -->

			<!-- Section: Links -->
			<section class="text-light">
				<div class="container text-center text-md-start mt-5">
					<!-- Grid row -->
					<div class="row mt-3">
						<!-- Grid column -->
						<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
							<h6 class="text-uppercase">Job For You</h6>
							<hr class="mb-4 mt-0 d-inline-block mx-auto"
								style="width: 60px; background-color: #7c4dff; height: 2px" />
							<p>Kết nối việc làm, tìm việc online, đăng bài tuyển dụng, hỗ
								trợ việc làm nhanh, ...</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
							<h6 class="text-uppercase">NGƯỜI TÌM VIỆC</h6>
							<hr class="mb-4 mt-0 d-inline-block mx-auto"
								style="width: 60px; background-color: #7c4dff; height: 2px" />
							<p>
								<a href="#!" class="text-light">Việc làm theo Địa điểm</a>
							</p>
							<p>
								<a href="#!" class="text-light">Việc làm theo ngành</a>
							</p>
							<p>
								<a href="#!" class="text-light">Việc làm theo mức lương</a>
							</p>
							<p>
								<a href="#!" class="text-light">Các việc làm phổ biến khác</a>
							</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
							<h6 class="text-uppercase">NHÀ TUYỂN DỤNG</h6>
							<hr class="mb-4 mt-0 d-inline-block mx-auto"
								style="width: 60px; background-color: #7c4dff; height: 2px" />
							<p>
								<a href="#!" class="text-light">Tuyển dụng theo vị trí</a>
							</p>
							<p>
								<a href="#!" class="text-light">Tuyển dụng theo ngành nghề</a>
							</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
							<h6 class="text-uppercase">LIÊN HỆ</h6>
							<hr class="mb-4 mt-0 d-inline-block mx-auto"
								style="width: 60px; background-color: #7c4dff; height: 2px" />
							<p>
								<i class="bi bi-house-door-fill me-3"></i> Cần Thơ, CT 2024
							</p>
							<p>
								<i class="bi bi-envelope-fill me-3"></i> job4yousine2024@gmail.com
							</p>
							<p>
								<i class="bi bi-telephone-fill me-3"></i> +01 234 567 89
							</p>
						</div>
						<!-- Grid column -->
					</div>
					<!-- Grid row -->
				</div>
			</section>
			<!-- Section: Links -->

			<!-- Copyright -->
			<div class="text-center p-3"
				style="background-color: rgba(0, 0, 0, 0.2)">
				© 2024 Copyright: <a class="text-light" href="/job4u">Job4U</a>
			</div>
			<!-- Copyright -->
		</footer>
		<!-- Footer -->
	</div>
</body>
</html>
