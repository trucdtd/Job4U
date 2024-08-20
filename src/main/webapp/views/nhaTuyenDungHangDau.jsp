<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà Tuyển Dụng Hàng Đầu</title>
</head>
<link rel="stylesheet">
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<!-- Bootstrap CSS v5.3.2 -->
<style>
.image-container {
	width: 100%;
	height: 50vh;
	/* Chiếm một nửa chiều cao của viewport hoặc điều chỉnh theo yêu cầu */
	overflow: hidden;
	position: relative;
}

.image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* Đảm bảo hình ảnh bao phủ toàn bộ không gian mà không bị méo */
	position: absolute;
	top: 0;
	left: 0;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2
					class="h4 mb-4 mt-2 text-uppercase text-center font-weight-bold blue-hover">
					Nhà Tuyển Dụng Hàng Đầu</h2>
			</div>
		</div>
		<div class="position-relative swiper swiper-banner overflow-hidden"
			data-carousel="swiperSlider" data-items="1"
			data-direction="horizontal" data-autoplay="3000" data-speed="250"
			data-loop="true" data-effect="slide" data-spacebetween="0"
			data-disableoninteraction="true" data-center="true" data-initlal="1"
			data-hoverpause="true">
			<div
				class="swiper-container swiper-container-initialized swiper-container-horizontal"
				id="swiperBanner" data-swiper="container">

				<div id="carouselExampleCaptions" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="image-container">
								<img src="/img/poster2.png" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-caption d-none d-md-block">
								<div class="card p-2">
									<div class="row">

										<h4 class="m-t-0 m-b-0">
											<strong>CÔNG TY CHO THUÊ TÀI CHÍNH TRÁCH NHIỆM HỮU
												HẠN MỘT THÀNH VIÊN QUỐC TẾ CHAILEASE</strong>
										</h4>
										<span class="job_post">Ui UX Designer</span>
										<p>795 Folsom Ave, Suite 600 San Francisco, CADGE 94107</p>
										<div>

											<a href="/job4u/chiTiet/${job.jobid}"
												class="btn btn-outline-primary btn-sm mt-2">Thông tin
												chi tiết</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="image-container">
								<img src="/img/poster2.png" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-caption d-none d-md-block">
								<div class="card p-2">
									<div class="row">

										<h4 class="m-t-0 m-b-0">
											<strong>CÔNG TY CHO THUÊ TÀI CHÍNH TRÁCH NHIỆM HỮU
												HẠN MỘT THÀNH VIÊN QUỐC TẾ CHAILEASE</strong>
										</h4>
										<span class="job_post">Ui UX Designer</span>
										<p>795 Folsom Ave, Suite 600 San Francisco, CADGE 94107</p>
										<div>

											<a href="/job4u/chiTiet/${job.jobid}"
												class="btn btn-outline-primary btn-sm mt-2">Thông tin
												chi tiết</a>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="image-container">
								<img src="/img/poster2.png" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-caption d-none d-md-block">
								<div class="card p-2">
									<div class="row">
										<h4 class="m-t-0 m-b-0">
											<strong>CÔNG TY CHO THUÊ TÀI CHÍNH TRÁCH NHIỆM HỮU
												HẠN MỘT THÀNH VIÊN QUỐC TẾ CHAILEASE</strong>
										</h4>
										<span class="job_post">Ui UX Designer</span>
										<p>795 Folsom Ave, Suite 600 San Francisco, CADGE 94107</p>
										<div>

											<a href="/job4u/chiTiet/${job.jobid}"
												class="btn btn-outline-primary btn-sm mt-2">Thông tin
												chi tiết</a>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>