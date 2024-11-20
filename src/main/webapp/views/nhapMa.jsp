<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhập Mã</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<style>
.alert {
	display: none; /* Ẩn thông báo lỗi khi trang được tải lần đầu */
}
</style>
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
							<form method="post" action="/QuenMatKhau/NhapMa">
								<div class="form-outline mb-4">
									<label class="form-label">Nhập mã của bạn</label> <input
										type="text" id="token" name="token" class="form-control"
										placeholder="Nhập mã đã gửi" />
								</div>
								<div class="alert alert-danger"
									style="display: ${error != null ? 'block' : 'none'};">
									${error}</div>
								<button type="submit" class="btn btn-success">Xác nhận</button>
							</form>

						</div>
					</div>
				</div>
			</div>
			<%@ include file="/views/footer.jsp"%>
		</section>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Kiểm tra xem có thông báo lỗi không
			var errorDiv = document.querySelector(".alert");
			if (errorDiv.textContent.trim() !== "") {
				errorDiv.style.display = "block"; // Hiển thị thông báo lỗi nếu có
			}
		});
	</script>
</body>
</html>