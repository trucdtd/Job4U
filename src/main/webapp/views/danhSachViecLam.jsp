<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Việc Làm</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<section style="background-color: #eee;">
		<div class="container py-5">
			<div class="row justify-content-center mb-3">
				<div class="col-md-12 col-xl-10">
					<div class="card shadow-0 border rounded-3">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
									<div class="bg-image hover-zoom ripple rounded ripple-surface">
										<img
											src="/img/it.jpg"
											class="w-100" /> <a href="#!">
											<div class="hover-overlay">
												<div class="mask"
													style="background-color: rgba(253, 253, 253, 0.15);"></div>
											</div>
										</a>
									</div>
								</div>
								<div class="col-md-6 col-lg-6 col-xl-6">
									<h5>Công ty D</h5>
									<div class="d-flex flex-row">
										<div class="text-danger mb-1 me-2">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i>
										</div>
									</div>
									<div class="mt-1 mb-0 text-muted small">
										<span>Tuyển IT</span> <span class="text-primary"> • </span> <span>Lập
											trình viên</span> <span class="text-primary"> • </span> <span>Ngôn
											ngữ lập trinh C#<br />
										</span>
									</div>
									<p class="text-truncate mb-4 mb-md-0">There are many
										variations of passages of Lorem Ipsum available, but the
										majority have suffered alteration in some form, by injected
										humour, or randomised words which don't look even slightly
										believable.</p>
								</div>
								<div
									class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
									<div class="d-flex flex-row align-items-center mb-1">
										<h4 class="mb-1 me-1">Lương: $50</h4>
									</div>
									<div class="d-flex flex-column mt-4">
										<button data-mdb-button-init data-mdb-ripple-init
											class="btn btn-primary btn-sm" type="button">Ứng
											tuyển</button>
										<button data-mdb-button-init data-mdb-ripple-init
											class="btn btn-outline-primary btn-sm mt-2" type="button">
											Thông tin chi tiết</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>