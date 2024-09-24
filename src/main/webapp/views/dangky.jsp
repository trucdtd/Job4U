<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Registration Form</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.3.2 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<style>
.form-control {
    padding: 1rem;
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
	padding: 2rem;
	background-color: #fff;
	border-radius: 10px;
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
	<br>
	<!-- /header -->

	<section class="vh-90">
		<div class="container">
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
								<h1 class="lead fw-normal mb-0 me-3">Đăng Ký</h1>
							</div>
							<div class="row">
								<div class="col">
									<label class="form-label" for="fullname">Họ và Tên</label> <input
										type="text" id="fullname" name="fullname" class="form-control"
										placeholder="Nhập họ và tên" value="${fullname}" /> <span
										class="text-danger">${fullnameError}</span>
								</div>
								<div class="col">
									<label class="form-label" for="username">Tên Tài Khoản</label>
									<input type="text" id="username" name="username"
										class="form-control" placeholder="Nhập tên tài khoản"
										value="${username}" /> <span class="text-danger">${usernameError}</span>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<label class="form-label" for="email">Email</label> <input
										type="email" id="email" name="email" class="form-control"
										placeholder="Nhập email" value="${email}" /> <span
										class="text-danger">${emailError}</span>
								</div>
								<div class="col">
									<label class="form-label" for="phonenumber">Số Điện
										Thoại</label> <input type="text" id="phonenumber" name="phonenumber"
										class="form-control" placeholder="Nhập số điện thoại"
										value="${phonenumber}" /> <span class="text-danger">${numberphoneError}</span>
								</div>
							</div>

							<div class="mb-4">
								<label class="form-label" for="password">Mật Khẩu</label> <input
									type="password" id="password" name="password"
									class="form-control" placeholder="Nhập mật khẩu"
									value="${password}" /> <span class="text-danger">${passwordError}</span>
							</div>

							<div class="mb-4">
								<label class="form-label">Đăng ký tài khoản</label>
								<div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="usertype"
											id="applicant" value="applicant"
											${usertype == 'applicant' ? 'checked' : ''}> <label
											class="form-check-label" for="applicant">Người Xin
											Việc</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="usertype"
											id="employer" value="employer"
											${usertype == 'employer' ? 'checked' : ''}> <label
											class="form-check-label" for="employer">Nhà Tuyển
											Dụng</label>
									</div>
								</div>
								<span class="text-danger">${usertypeError}</span>
							</div>

							<div id="employerDetails" style="display: none;">
								<div class="row">
									<div class="col">
										<label for="taxid" class="form-label">Mã số thuế:</label> <input
											type="text" id="taxid" name="taxid" class="form-control"
											value="${taxid}"> <span class="text-danger">${taxidError}</span>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<label for="companyName" class="form-label">Tên Công
											Ty</label> <input type="text" class="form-control" id="companyName"
											name="companyName" value="${companyName}"> <span
											class="text-danger">${companyNameError}</span>
									</div>
									<div class="col">
										<label for="companyWebsite" class="form-label">Website
											Công Ty</label> <input type="text" class="form-control"
											id="companyWebsite" name="companyWebsite"
											value="${companyWebsite}"> <span class="text-danger">${companyWebsiteError}</span>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<label for="companyAddress" class="form-label">Địa Chỉ</label>
										<input type="text" class="form-control" id="companyAddress"
											name="companyAddress" value="${companyAddress}"> <span
											class="text-danger">${companyAddressError}</span>
									</div>
									<div class="col">
										<label for="industry" class="form-label">Ngành nghề</label> <select
											class="form-control" id="industry" name="industry">
											<option value="" disabled selected>Chọn ngành nghề</option>
											<option value="Nông nghiệp">Nông nghiệp</option>
											<option value="Công nghiệp">Công nghiệp</option>
											<option value="Dịch vụ">Dịch vụ</option>
											<option value="construction">Xây dựng</option>
											<option value="Giao thông vận tải">Giao thông vận
												tải</option>
											<option value="Công nghệ thông tin">Công nghệ thông
												tin</option>
											<option value="Tài chính">Tài chính</option>
											<option value="Giáo dục">Giáo dục</option>
											<option value="Y tế">Y tế</option>
											<option value="Truyền thông">Truyền thông</option>
											<option value="Công nghệ ô tô">Công nghệ ô tô</option>
											<option value="Du lịch">Du lịch</option>
											<option value="Hành chính văn phòng">Hành chính văn
												phòng</option>
											<option value="Khác">Khác...</option>
										</select> <span class="text-danger">${industryError}</span>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<label for="contactPerson" class="form-label">Người
											Liên Hệ</label> <input type="text" class="form-control"
											id="contactPerson" name="contactPerson"
											value="${contactPerson}"> <span class="text-danger">${contactPersonError}</span>
									</div>
									<div class="col">
										<label for="companyLogo" class="form-label">Logo Công
											Ty</label> <input type="file" class="form-control" id="companyLogo"
											name="companyLogo">
									</div>
								</div>
								<div class="mb-3">
									<label for="companyDescription" class="form-label">Mô
										Tả Về Công Ty</label>
									<textarea class="form-control" id="companyDescription"
										name="companyDescription" rows="3">${companyDescription}</textarea>
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

						<!-- Modal thông báo điều khoản -->
						<!-- Modal thông báo điều khoản -->
<div class="modal fade" id="termsErrorModal" tabindex="-1" aria-labelledby="termsErrorModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="termsErrorModalLabel">Thông báo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">Bạn cần đồng ý với điều khoản để tiếp tục đăng ký.</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-bs-dismiss="modal">OK</button>
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
	<%if (request.getAttribute("successMessage") != null) {%>
		var successModal = new bootstrap.Modal(document
					.getElementById('successModal'));
			successModal.show();
	<%}%>
		};
	</script>

	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							const applicantRadio = document
									.getElementById("applicant");
							const employerRadio = document
									.getElementById("employer");
							const employerDetails = document
									.getElementById("employerDetails");
							const form = document
									.getElementById('registerForm');
							const termsAgreedCheckbox = document
									.getElementById('termsAgreed');
							const termsErrorModal = new bootstrap.Modal(
									document.getElementById('termsErrorModal'));
							const successModal = new bootstrap.Modal(document
									.getElementById('successModal'));

							function toggleEmployerDetails() {
								if (employerRadio.checked) {
									employerDetails.style.display = "block";
								} else {
									employerDetails.style.display = "none";
									clearEmployerDetails(); // Xóa các giá trị không cần thiết khi chuyển về "Người Xin Việc"
								}
							}

							function clearEmployerDetails() {
								document.getElementById("companyName").value = "";
								document.getElementById("companyWebsite").value = "";
								document.getElementById("companyAddress").value = "";
								document.getElementById("industry").value = "";
								document.getElementById("contactPerson").value = "";
								document.getElementById("companyDescription").value = "";
							}

							applicantRadio.addEventListener("change",
									toggleEmployerDetails);
							employerRadio.addEventListener("change",
									toggleEmployerDetails);
							toggleEmployerDetails(); // Gọi hàm ngay khi trang được load
						});
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const form = document.getElementById('registerForm');
	    const termsAgreedCheckbox = document.getElementById('termsAgreed');
	    const termsErrorModal = new bootstrap.Modal(document.getElementById('termsErrorModal'));

	    // Kiểm tra điều khoản khi gửi form
	    form.addEventListener('submit', function(event) {
	        if (!termsAgreedCheckbox.checked) {
	            event.preventDefault(); // Ngăn form submit
	            termsErrorModal.show(); // Hiển thị modal lỗi điều khoản
	        }
	    });

	    // Khi người dùng nhấn "OK", chỉ đóng modal
	    document.querySelector('#termsErrorModal .btn-success').addEventListener('click', function() {
	        termsErrorModal.hide(); // Đóng modal
	    });

	    // Khi người dùng nhấn "X", chỉ đóng modal
	    document.querySelector('#termsErrorModal .btn-close').addEventListener('click', function() {
	        termsErrorModal.hide(); // Đóng modal
	    });
	});
	</script>
</body>
</html>
