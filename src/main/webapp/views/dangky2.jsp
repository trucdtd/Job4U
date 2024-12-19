<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Đăng Ký</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Bootstrap CSS v5.3.2 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
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
</head>

<body>
	<%@ include file="/views/headerNoPanner.jsp"%>

	<%@ include file="/views/chat.jsp"%>
	<br>
	<!-- /header -->

	<section class="vh-90">
		<div
			class="container d-flex justify-content-center align-items-center">
			<div class="row g-0">
				<div class="col-sm-6 col-md-8">
					<%@ include file="/views/formDieuKhoan.jsp"%>
					<br>
				</div>
				<div class="col-6 col-md-4">
					<div class="form-container">
						<form action="/DangKy2/submit" method="post"
							enctype="multipart/form-data" id="registerForm">
							<div
								class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
								<h1 class="lead fw-normal mb-0 me-3">Nhà Tuyển Dụng</h1>
							</div>
							<div class="row">
								<div class="col">
									<label class="form-label" for="fullname">Họ và Tên <span
										style="color: red;">*</span></label> <input type="text" id="fullname"
										name="fullname" class="form-control"
										placeholder="Nhập họ và tên" value="${fullname}"
										onkeypress="return isLetter(event)" /> <span
										class="text-danger">${fullnameError}</span>
								</div>
								<div class="col">
									<label class="form-label" for="username">Tên Tài Khoản
										<span style="color: red;">*</span>
									</label> <input type="text" id="username" name="username"
										class="form-control" placeholder="Nhập tên tài khoản"
										value="${username}" /> <span class="text-danger">${usernameError}</span>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<label class="form-label" for="email">Email <span
										style="color: red;">*</span></label> <input type="email" id="email"
										name="email" class="form-control" placeholder="Nhập email"
										value="${email}" /> <span class="text-danger">${emailError}</span>
								</div>
								<div class="col">
									<label class="form-label" for="phonenumber">Số Điện
										Thoại <span style="color: red;">*</span>
									</label> <input type="text" id="phonenumber" name="phonenumber"
										class="form-control" placeholder="Nhập số điện thoại"
										value="${phonenumber}" /> <span class="text-danger">${phonenumberError}</span>
								</div>
							</div>
							<div class="mb-4">
								<label class="form-label" for="password">Mật Khẩu <span
									style="color: red;">*</span></label> <input type="password"
									id="password" name="password" class="form-control"
									placeholder="Nhập mật khẩu" value="${password}" /> <span
									class="text-danger">${passwordError}</span>
							</div>

							<div id="employerDetails">
								<div class="row">
									<div class="col">
										<img id="logoPreview"
											src="${pageContext.request.contextPath}/uploads/${logo}"
											alt="Logo" class="img-fluid"
											style="object-fit: cover; max-width: 100%; height: 200px;">
										<input type="file" class="form-control" id="logo" name="logo"
											accept="image/*" style="display: none;"> <label
											for="logo" class="form-control text-center"
											style="cursor: pointer; height: 30px; display: flex; align-items: center; justify-content: center;">
											Logo công ty </label>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<label for="companyname" class="form-label">Tên Công
											Ty <span style="color: red;">*</span>
										</label> <input type="text" class="form-control" id="companyname"
											name="companyname" value="${companyname}"> <span
											class="text-danger">${companyNameError}</span>
									</div>
									<div class="col">
										<label for="companywebsite" class="form-label">Website
											Công Ty <span style="color: red;">*</span>
										</label> <input type="text" class="form-control" id="companywebsite"
											name="companywebsite" value="${companywebsite}"> <span
											class="text-danger">${companyWebsiteError}</span>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<label for="address" class="form-label">Địa Chỉ <span
											style="color: red;">*</span></label> <input type="text"
											class="form-control" id="address" name="address"
											value="${address}"> <span class="text-danger">${companyAddressError}</span>
									</div>
									<div class="col">
										<label for="industry" class="form-label">Ngành nghề <span
											style="color: red;">*</span></label> <select class="form-select"
											id="industry" name="industry">
											<option value="" disabled selected>Chọn ngành nghề</option>
											<option value="Nông nghiệp">Nông nghiệp</option>
											<option value="Công nghiệp">Công nghiệp</option>
											<option value="Dịch vụ">Dịch vụ</option>
											<option value="Xây dựng">Xây dựng</option>
											<option value="Giao thông vận tải">Giao thông vận
												tải</option>
											<option value="Công nghệ thông tin">Công nghệ thông
												tin</option>
											<option value="Tài chính">Tài chính</option>
											<option value="Giáo dục Đào tạo">Giáo dục/Đào tạo</option>
											<option value="Y tế Dược">Y tế/Dược</option>
											<option value="Truyền thông">Truyền thông</option>
											<option value="Công nghệ ô tô">Công nghệ ô tô</option>
											<option value="Du lịch">Du lịch</option>
											<option value="Hành chính văn phòng">Hành chính văn
												phòng</option>
											<option value="Bán lẻ">Bán lẻ</option>
											<option value="Nhà hàng khách sạn">Nhà hàng khách
												sạn</option>
											<option value="Quản trị kinh doanh">Quản trị kinh
												doanh</option>
											<option value="Xuất nhập khẩu">Xuất nhập khẩu</option>
											<option value="Marketing">Marketing</option>
											<option value="Kỹ thuật điện">Kỹ thuật điện</option>
											<option value="Môi trường">Môi trường</option>
											<option value="Thương mại điện tử">Thương mại điện
												tử</option>
											<option value="Khác">Khác...</option>
										</select> <span class="text-danger">${industryError}</span>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<label for="contactperson" class="form-label">Người
											Liên Hệ <span style="color: red;">*</span>
										</label> <input type="text" class="form-control" id="contactperson"
											name="contactperson" value="${contactperson}"> <span
											class="text-danger">${contactPersonError}</span>
									</div>
									<div class="col">
										<label for="taxid" class="form-label">Mã số thuế: <span
											style="color: red;">*</span></label> <input type="text" id="taxid"
											name="taxid" class="form-control" value="${taxid}"> <span
											class="text-danger">${taxidError}</span>
									</div>
								</div>
								<div class="mb-3">
									<label for="companydescription" class="form-label">Mô
										Tả Về Công Ty</label>
									<textarea class="form-control" id="companydescription"
										name="companydescription" rows="3">${companydescription}</textarea>
									<span class="text-danger">${companyDescriptionError}</span>
								</div>
							</div>

							<div class="text-center text-lg-start mt-4 pt-2">
								<button type="submit" class="btn btn-success">Đăng Ký</button>
								<p class="small fw-bold mt-2 pt-1 mb-0">
									Bạn đã có tài khoản? <a href="/Login" class="link-danger">Đăng
										Nhập</a>
								</p>
							</div>
						</form>

						<form action="/DangKy2/verifyToken" method="POST">
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
						<div class="modal fade" id=termsErrorModal tabindex="-1"
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

	<script>
		document
				.getElementById('logo')
				.addEventListener(
						'change',
						function logoPreview(event) {
							const file = event.target.files[0]; // Lấy tệp được chọn
							if (file) {
								const reader = new FileReader(); // Tạo đối tượng FileReader
								reader.onload = function(e) {
									// Cập nhật src của img với dữ liệu ảnh
									document.getElementById('logoPreview').src = e.target.result;
								}
								reader.readAsDataURL(file); // Đọc tệp ảnh dưới dạng URL
							}
						});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
