<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<!--link icon gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</head>
<style>
</style>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->
		<div class="row">

			<div class="container-fluid h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">

					<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
						<div class="form-container">
							<!-- Thông báo thành công -->


							<c:if test="${not empty error}">
								<script>
									document
											.addEventListener(
													'DOMContentLoaded',
													function() {
														const successModal = new bootstrap.Modal(
																document
																		.getElementById('successModal'));
														successModal.show();
													});
								</script>

								<div class="modal fade" id="successModal" tabindex="-1"
									aria-labelledby="successModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="successModalLabel">Thông
													báo</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">${error}</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													onclick="window.location.href='/changePass'">OK</button>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							
							<c:if test="${not empty message}">
								<script>
									document
											.addEventListener(
													'DOMContentLoaded',
													function() {
														const successModal = new bootstrap.Modal(
																document
																		.getElementById('successModal'));
														successModal.show();
													});
								</script>

								<div class="modal fade" id="successModal" tabindex="-1"
									aria-labelledby="successModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="successModalLabel">Thông
													báo</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">${message}</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													onclick="window.location.href='/Login'">OK</button>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							
							<form class="p-4 border border-1" action="/changePass/submit"
								method="post">
								<div
									class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
									<p class="lead fw-normal mb-0 me-3">Change Password</p>
								</div>

								<!-- Old Password input -->
								<div data-mdb-input-init class="form-outline">
									<label class="form-label" for="oldPassword">Old
										Password</label> <input type="password" id="oldPassword"
										name="oldPassword" class="form-control form-control-lg"
										placeholder="Enter old password" />
								</div>

								<!-- New Password input -->
								<div data-mdb-input-init class="form-outline">
									<label class="form-label" for="newPassword">New
										Password</label> <input type="password" id="newPassword"
										name="newPassword" class="form-control form-control-lg"
										placeholder="Enter new password" />
								</div>

								<!-- Confirm New Password input -->
								<div data-mdb-input-init class="form-outline">
									<label class="form-label" for="confirmNewPassword">Confirm
										New Password</label> <input type="password" id="confirmNewPassword"
										name="confirmNewPassword" class="form-control form-control-lg"
										placeholder="Confirm new password" />
								</div>

								<div class="text-center text-lg-start mt-4 pt-2">
									<button type="submit" class="btn btn-primary btn-lg">Change
										Password</button>
									<p class="small fw-bold mt-2 pt-1 mb-0">
										Forgot your password? <a href="#!" class="link-danger">Reset</a>
									</p>
								</div>

							</form>


						</div>
					</div>
				</div>
				<!-- footer -->
				<%@ include file="/views/footer.jsp"%>
				<!-- /footer -->
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>