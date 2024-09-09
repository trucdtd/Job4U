<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<div class="form-container">
								<form method="POST" action="/QuenMatKhau/DatLaiMatKhau">
    <!-- Trường nhập mật khẩu mới -->
    <div class="form-outline mb-4">
        <label class="form-label" for="newPassword">Mật khẩu mới</label>
        <input type="password" id="newPassword" name="newPassword" class="form-control" required />
    </div>

    <!-- Trường xác nhận mật khẩu mới -->
    <div class="form-outline mb-4">
        <label class="form-label" for="confirmPassword">Xác nhận mật khẩu</label>
        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required />
    </div>

    <!-- Thông báo lỗi nếu có vấn đề với mật khẩu -->
    <div class="alert alert-danger" style="display: ${error != null ? 'block' : 'none'};">
        ${error}
    </div>

    <!-- Nút submit để gửi form đặt lại mật khẩu -->
    <button type="submit" class="btn btn-primary">Đặt lại mật khẩu</button>
</form>
							</div>
						</div>
					</div>
					</div>
				</div>
				<%@ include file="/views/footer.jsp"%>
		</section>
	</footer>
</body>
</html>