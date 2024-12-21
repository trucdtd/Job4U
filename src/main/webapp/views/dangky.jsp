<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Đăng Ký</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.3.2 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.form-control {
	padding: 0.5rem;
	width: calc(100% - 1.5rem); /* Adjust width to make room for padding */
}

.row .col {
	flex: 1; /* Equal width for all columns */
}

.text-danger {
	color: #ffcccc; /* Màu đỏ nhạt */
	font-style: italic; /* Chữ nghiêng */
	display: block; /* Ensure spans take full width */
	margin-top: 0.25rem; /* Space above the error messages */
}

.form-container {
	max-width: 600px;
	margin: auto;
	padding: 1.5rem;
	background-color: #fff;
	border-radius: 50px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-container h1 {
	font-size: 2rem; /* Tăng kích thước tiêu đề */
	margin-bottom: 1.5rem; /* Tạo khoảng cách giữa tiêu đề và form */
}

.form-container .form-label {
	margin-top: 0.5rem;
	margin-bottom: 0.25rem;
}

.form-container .form-control {
	padding: 1rem; /* Tăng kích thước input */
}

.form-container .btn {
	width: 100%;
}

.form-container .row {
	margin-bottom: 1rem;
}

.col-sm-8, .col-sm-4 {
	padding-left: 0;
	padding-right: 0;
}

.container {
	margin-bottom: 1rem;
	/* Giảm khoảng cách giữa phần điều khoản và form đăng ký */
}
</style>
<body>
	<%@ include file="/views/headerNoPanner.jsp"%>
	<%@ include file="/views/chat.jsp"%>
	<br>
	<!-- /header -->
	<section class="vh-90">
		<div class="container d-flex justify-content-center align-items-center">
			<div class="row">
				<div class="col-sm-8">
					<%@ include file="/views/formDieuKhoan.jsp"%>
					<br>
				</div>
				<div class="col-sm-4">
					<div class="form-container">
						<form action="/DangKy/submit" method="post"
							enctype="multipart/form-data" id="registerForm">
							<div
								class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
								<h1 class="lead fw-normal mb-0 me-3">Ứng Viên</h1>
							</div>
							<div class="row">
								<div class="col">
									<label class="form-label" for="fullname">Họ và Tên <span
										style="color: red;">*</span></label> <input type="text" id="fullname"
										name="fullname" class="form-control"
										placeholder="Nhập họ và tên" value="${fullname}" /> <span
										class="text-danger" style="font-size: 0.9em;">${fullnameError}</span>
								</div>
								<div class="col">
									<label class="form-label" for="username">Tên Tài Khoản
										<span style="color: red;">*</span>
									</label> <input type="text" id="username" name="username"
										class="form-control" placeholder="Nhập tên tài khoản"
										value="${username}" /> <span class="text-danger"
										style="font-size: 0.9em;">${usernameError}</span>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<label class="form-label" for="password">Mật Khẩu <span
										style="color: red;">*</span></label> <input type="password"
										id="password" name="password" class="form-control"
										placeholder="Nhập mật khẩu" value="${password}" /> <span
										class="text-danger" style="font-size: 0.9em;">${passwordError}</span>
								</div>
								<div class="col">
									<label class="form-label" for="phonenumber">Số Điện
										Thoại <span style="color: red;">*</span>
									</label> <input type="text" id="phonenumber" name="phonenumber"
										class="form-control" placeholder="Nhập số điện thoại"
										value="${phonenumber}" /> <span class="text-danger"
										style="font-size: 0.9em;">${phonenumberError}</span>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<label class="form-label" for="email">Email <span
										style="color: red;">*</span></label> <input type="email" id="email"
										name="email" class="form-control" placeholder="Nhập email"
										value="${email}" /> <span class="text-danger"
										style="font-size: 0.9em;">${emailError}</span>
								</div>
							</div>

							<div class="text-center text-lg-start mt-4 pt-2">
								<button type="submit" class="btn btn-success">Đăng Ký</button>
							</div>

							<p class="small fw-bold mt-2 pt-1 mb-0">
								Bạn đã có tài khoản? <a href="/Login" class="link-danger">Đăng
									Nhập</a>
							</p>
						</form>


						<form action="/DangKy/verifyToken" method="POST">
							<div class="modal" id="verificationModal" tabindex="-1"
								aria-labelledby="verificationModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="verificationModalLabel">Nhập
												mã xác minh</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<label for="token">Mã xác minh đã gửi vào email:</label> <input
												type="text" id="token" name="token" class="form-control" />
											<span class="text-danger" style="font-size: 0.9em;"
												id="tokenError"></span>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-success" id="verifyBtn">Xác
												minh</button>
										</div>
									</div>
								</div>
							</div>
						</form>

						<div class="modal fade" id="successModal" tabindex="-1"
							aria-labelledby="successModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="successModalLabel">Thông báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Đăng Ký thành Công</div>
									<div class="modal-footer">
										<a href="/Login" class="btn btn-success">Đăng Nhập</a>
									</div>
								</div>
							</div>
						</div>
						
						<div class="modal fade" id="errorMessage" tabindex="-1"	
							aria-labelledby="errorModalLabel" aria-hidden="false">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="errorModalLabel">Thông báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Đăng Ký Thất bại</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-success"
											data-bs-dismiss="modal">OK</button>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal thông báo điều khoản -->
						<div class="modal fade" id="termsErrorModal" tabindex="-1"
							aria-labelledby="termsErrorModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="termsErrorModalLabel">Thông
											báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Bạn cần đồng ý với điều khoản để
										tiếp tục đăng ký.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-success"
											data-bs-dismiss="modal">OK</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="/views/footer.jsp"%>

	<%-- <script>
		window.onload = function() {
	<%if (request.getAttribute("successMessage") != null) {%>
		var successModal = new bootstrap.Modal(document
					.getElementById('successModal'));
			successModal.show();
	<%}%>
		};
	</script> --%>

	<script>
		window.onload = function() {
			// Hiển thị modal đăng ký thành công nếu thành công
	<%if (request.getAttribute("successModal") != null) {%>
		var successModal = new bootstrap.Modal(document
					.getElementById('successModal'));
			successModal.show();
	<%}%>
	
	<%if (request.getAttribute("errorMessage") != null) {%>
	var successModal = new bootstrap.Modal(document
				.getElementById('errorMessage'));
		successModal.show();
<%}%>
		// Hiển thị modal mã xác minh nếu cần
	<%if (request.getAttribute("showVerificationForm") != null) {%>
		var verificationModal = new bootstrap.Modal(document
					.getElementById('verificationModal'));
			verificationModal.show();
	<%}%>
		};
	</script>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const form = document.getElementById('registerForm');
			const termsAgreedCheckbox = document.getElementById('termsAgreed');
			const termsErrorModal = new bootstrap.Modal(document
					.getElementById('termsErrorModal'));

			// Kiểm tra điều khoản khi gửi form
			form.addEventListener('submit', function(event) {
				if (!termsAgreedCheckbox.checked) {
					event.preventDefault(); // Ngăn form submit
					termsErrorModal.show(); // Hiển thị modal lỗi điều khoản
				}
			});

			// Khi người dùng nhấn "OK", chỉ đóng modal
			document.querySelector('#termsErrorModal .btn-success')
					.addEventListener('click', function() {
						termsErrorModal.hide(); // Đóng modal
					});

			// Khi người dùng nhấn "X", chỉ đóng modal
			document.querySelector('#termsErrorModal .btn-close')
					.addEventListener('click', function() {
						termsErrorModal.hide(); // Đóng modal
					});

		});
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
