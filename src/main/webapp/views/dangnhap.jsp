<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>Đăng nhập</title>
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
<script src="https://kit.fontawesome.com/c5fd529f32.js"
	crossorigin="anonymous"></script>
<!-- Google Sign-In -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="YOUR_CLIENT_ID.apps.googleusercontent.com">
</head>

<body>
	<%@ include file="/views/headerNoPanner.jsp"%>
	
	<%@ include file="/views/chat.jsp"%>
	<header>
		<!-- Thông báo -->
		<div class="d-flex justify-content-center align-items-center mt-4">
			<div class="alert text-truncate" style="max-width: 400px;">${message}</div>
		</div>
	</header>
	<main>
		<c:choose>
			<c:when test="${not empty error}">
				<script>
					document.addEventListener('DOMContentLoaded', function() {
						const errorModal = new bootstrap.Modal(document
								.getElementById('errorModal'));
						errorModal.show();
					});
				</script>
				<div class="modal fade" id="errorModal" tabindex="-1"
					aria-labelledby="errorModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="errorModalLabel">Thông báo lỗi</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">${error}</div>
							<!-- <div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="window.location.href='/changePass'">OK</button>
							</div> -->
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${not empty message}">
				<script>
					document.addEventListener('DOMContentLoaded', function() {
						const successModal = new bootstrap.Modal(document
								.getElementById('successModal'));
						successModal.show();
					});
				</script>
				<div class="modal fade" id="successModal" tabindex="-1"
					aria-labelledby="successModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="successModalLabel">Thông báo</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">${message}</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success"
									onclick="window.location.href='/Login'">OK</button>
							</div>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>

		<section class="vh-90">
			<div class="container h-custom mt-4 mb-4">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-md-9 col-lg-6 col-xl-5">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
							class="img-fluid" alt="Sample image">
					</div>
					<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
						<form action="/Login/submit" method="post">
<!-- 							<div
								class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
								<p class="lead fw-normal mb-0 me-3">Đăng nhập bằng</p>
								<div class="g-signin2" data-onsuccess="onSignIn"></div>
							</div> -->

							<!-- <div class="divider d-flex align-items-center my-4">
								<p class="text-center fw-bold mx-3 mb-0">hoặc</p>
							</div> -->

							<!-- Username input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<label class="form-label" for="form3Example3">Tài khoản</label>
								<input type="text" id="form3Example3"
									class="form-control form-control-lg" placeholder="Tài khoản"
									name="username" />
							</div>

							<!-- Password input -->
							<div data-mdb-input-init class="form-outline mb-3">
								<label class="form-label" for="form3Example4">Mật khẩu</label>
								<div class="input-group">
									<input type="password" id="form3Example4"
										class="form-control form-control-lg" placeholder="Mật khẩu"
										name="password" />
									<button class="btn btn-outline-secondary" type="button"
										id="passwordToggle">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>

							<div
								class="text-center text-lg-start mt-4 pt-2 d-flex justify-content-between align-items-center">
								<button type="submit" class="btn btn-success btn-lg"
									style="padding: 0.5rem 2.5rem;">Đăng nhập</button>

								<div class="ms-3">
									<a href="/QuenMatKhau" class="link-danger fw-bold"
										style="font-size: 0.9rem;"> <i class="fas fa-lock"></i>
										Quên mật khẩu?
									</a>
								</div>
							</div>

							<p class="small fw-bold mt-2 text-center">
								Bạn chưa có tài khoản? <a href="/DangKy" class="link-danger">Đăng
									ký</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</section>

	</main>
	<%@ include file="/views/footer.jsp"%>
	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script>
		document.getElementById('passwordToggle').addEventListener(
				'click',
				function() {
					const passwordField = document
							.getElementById('form3Example4');
					const toggleIcon = this.querySelector('i');
					if (passwordField.type === 'password') {
						passwordField.type = 'text';
						toggleIcon.classList.remove('fa-eye');
						toggleIcon.classList.add('fa-eye-slash');
					} else {
						passwordField.type = 'password';
						toggleIcon.classList.remove('fa-eye-slash');
						toggleIcon.classList.add('fa-eye');
					}
				});
	</script>
	<link rel="stylesheet" href="styles.css">
</body>
</html>
