<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà Tuyển Dụng Hàng Đầu</title>
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- Bootstrap CSS v5.3.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.image-container {
	width: 100%;
	height: 50vh;
	overflow: hidden;
	position: relative;
}

.image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	top: 0;
	left: 0;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2 class="h4 mb-4 mt-2 text-uppercase text-center font-weight-bold blue-hover">
					Nhà Tuyển Dụng Hàng Đầu
				</h2>
			</div>
		</div>
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
			</div>
			<div class="carousel-inner">
				<!-- Slide 1 -->
				<div class="carousel-item active">
					<div class="image-container">
						<img src="/img/jobforyou.jpg" class="d-block w-100" alt="Slide 1">
					</div>
					<div class="carousel-caption d-none d-md-block">
						<div class="card p-2">
							<div class="row">
								<h4 class="m-t-0 m-b-0">
									<strong>CÔNG TY CHO THUÊ TÀI CHÍNH TRÁCH NHIỆM HỮU HẠN MỘT THÀNH VIÊN QUỐC TẾ CHAILEASE</strong>
								</h4>
								<span class="job_post">UI/UX Designer</span>
								<p>795 Folsom Ave, Suite 600 San Francisco, CA 94107</p>
								<div>
									<a href="/job4u/chiTiet/1" class="btn btn-outline-primary btn-sm mt-2">Thông tin chi tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Slide 2 -->
				<div class="carousel-item">
					<div class="image-container">
						<img src="/img/jobforyou.jpg" class="d-block w-100" alt="Slide 2">
					</div>
					<div class="carousel-caption d-none d-md-block">
						<div class="card p-2">
							<div class="row">
								<h4 class="m-t-0 m-b-0">
									<strong>CÔNG TY CHO THUÊ TÀI CHÍNH TRÁCH NHIỆM HỮU HẠN MỘT THÀNH VIÊN QUỐC TẾ CHAILEASE</strong>
								</h4>
								<span class="job_post">Software Engineer</span>
								<p>123 Tech Park, Silicon Valley, CA 94043</p>
								<div>
									<a href="/job4u/chiTiet/2" class="btn btn-outline-primary btn-sm mt-2">Thông tin chi tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Slide 3 -->
				<div class="carousel-item">
					<div class="image-container">
						<img src="/img/jobforyou.jpg" class="d-block w-100" alt="Slide 3">
					</div>
					<div class="carousel-caption d-none d-md-block">
						<div class="card p-2">
							<div class="row">
								<h4 class="m-t-0 m-b-0">
									<strong>THÀNH VIÊN QUỐC TẾ CHAILEASE</strong>
								</h4>
								<span class="job_post">Project Manager</span>
								<p>456 Business Ave, New York, NY 10001</p>
								<div>
									<a href="/job4u/chiTiet/3" class="btn btn-outline-primary btn-sm mt-2">Thông tin chi tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Slide 4 -->
				<div class="carousel-item">
					<div class="image-container">
						<img src="/img/jobforyou.jpg" class="d-block w-100" alt="Slide 4">
					</div>
					<div class="carousel-caption d-none d-md-block">
						<div class="card p-2">
							<div class="row">
								<h4 class="m-t-0 m-b-0">
									<strong>CHUYÊN GIA KINH DOANH</strong>
								</h4>
								<span class="job_post">Business Analyst</span>
								<p>789 Market St, San Francisco, CA 94103</p>
								<div>
									<a href="/job4u/chiTiet/4" class="btn btn-outline-primary btn-sm mt-2">Thông tin chi tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Slide 5 -->
				<div class="carousel-item">
					<div class="image-container">
						<img src="/img/jobforyou.jpg" class="d-block w-100" alt="Slide 5">
					</div>
					<div class="carousel-caption d-none d-md-block">
						<div class="card p-2">
							<div class="row">
								<h4 class="m-t-0 m-b-0">
									<strong>NHÂN VIÊN HÀNH CHÍNH</strong>
								</h4>
								<span class="job_post">Administrative Assistant</span>
								<p>321 Oak St, Seattle, WA 98101</p>
								<div>
									<a href="/job4u/chiTiet/5" class="btn btn-outline-primary btn-sm mt-2">Thông tin chi tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- Bootstrap JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-sTzI3U4kso4ZzRDv0A0qYVkAAB0iOSc11vj8D7wJ9z8OmQW0KvU4y2F2IZ5jIV30" crossorigin="anonymous"></script>
</body>
</html>
