<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Forgot Password</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.2.1 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<style>
.form-container {
	max-width: 500px;
	margin: auto;
	padding: 2rem;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-container .form-label {
	margin-top: 0.5rem;
	margin-bottom: 0.25rem;
}

.form-container .form-outline {
	margin-bottom: 1rem;
}

.form-container .btn {
	width: 100%;
}
</style>
</head>

<body>
	<%@ include file="/views/headerNoPanner.jsp"%>
	<footer>
		<section class="vh-100" style="background-color: #f8f9fa;">
			<div class="container-fluid h-custom">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-md-9 col-lg-6 col-xl-5">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
							class="img-fluid" alt="Sample image">
					</div>
					<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
						<div class="form-container">
							<form method="POST" action="/QuenMatKhau/submit">
								<div class="form-outline mb-4">
									<label class="form-label" for="email">Nhập email của
										bạn</label> <input type="text" id="email" name="email"
										class="form-control" placeholder="Nhập email của bạn" />
								</div>
								<div class="alert alert-danger"
									style="display: ${error != null ? 'block' : 'none'};">
									${error}</div>
								<button type="submit" class="btn btn-success">Gửi mã</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/views/footer.jsp"%>
		</section>
	</footer>
	<script>
		document.querySelector('form').addEventListener('submit', function(e) {
			var emailInput = document.getElementById('email').value;
			if (!emailInput) {
				alert('Vui lòng nhập địa chỉ email.');
				e.preventDefault(); // Ngăn form không gửi nếu email trống
			}
		});
	</script>
	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
