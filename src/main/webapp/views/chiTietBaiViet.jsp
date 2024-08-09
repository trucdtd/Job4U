<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết Bài Viết</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/quanlyuser.css">
</head>
<body>
<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->
		<br>

		<article>

			<div class="tab-pane mt-2" id="page1">
					<div class="card">
						<div class="card-header">
							<div class="card-title">Chi Tiết Bài Viết</div>
						</div>
						<div class="card-body p-0">
							<form class="p-4 border border-1" action="/admin/updatePost" method="post">
							<c:if test="${not empty error}">
								<div class="alert alert-danger" role="alert">${error}</div>
							</c:if>
								<div class="row p-2">
									<div class="col-md-6">
										<label for="jobtitle">ID:</label> <input
											class="form-control" type="text"
											placeholder="Tiêu đề bài viết" aria-label="Tiêu đề bài viết"
											style="border-radius: 10px;" id="jobtitle" name="jobtitle"
											value="${bv.jobid}" required>
									</div>
									<div class="col-md-6">
										<label for="joblocation">Vị trí:</label> <input
											class="form-control" type="text"
											placeholder="Vị trí công việc" aria-label="Vị trí công việc"
											style="border-radius: 10px;" id="joblocation"
											name="joblocation" value="${bv.posteddate}" required>
									</div>
								</div>
							
								<div class="row p-2">
									<div class="col-md-6">
										<label for="jobtitle">Tiêu Đề:</label> <input
											class="form-control" type="text"
											placeholder="Tiêu đề bài viết" aria-label="Tiêu đề bài viết"
											style="border-radius: 10px;" id="jobtitle" name="jobtitle"
											value="${bv.jobtitle}" required>
									</div>
									<div class="col-md-6">
										<label for="joblocation">Vị trí:</label> <input
											class="form-control" type="text"
											placeholder="Vị trí công việc" aria-label="Vị trí công việc"
											style="border-radius: 10px;" id="joblocation"
											name="joblocation" value="${bv.joblocation}" required>
									</div>
								</div>

								<div class="row p-2">
									<div class="col-md-6">
										<label for="companyname">Công Ty</label> <input
											class="form-control" type="text" placeholder="Tên Công Ty"
											aria-label="Tên Công Ty" style="border-radius: 10px;"
											id="companyname" name="companyname"
											value="${bv.employer.companyname}" required>
									</div>
									<div class="col-md-6">
										<label for="companywebsite">Trang Web</label> <input
											class="form-control" type="text"
											placeholder="Trang web công ty"
											aria-label="Trang web công ty" style="border-radius: 10px;"
											id="companywebsite" name="companywebsite"
											value="${bv.employer.companywebsite}" required>
									</div>
								</div>

								<div class="row p-2">
									<div class="col-md-6">
										<label for="address">Địa chỉ công ty</label> <input
											class="form-control" type="text"
											placeholder="Địa chỉ Công Ty" aria-label="Địa chỉ Công Ty"
											style="border-radius: 10px;" id="address" name="address"
											value="${bv.employer.address}" required>
									</div>
									<div class="col-md-6">
										<label for="industry">Ngành công nghiệp</label> <input
											class="form-control" type="text"
											placeholder="Ngành Công nghiệp"
											aria-label="Ngành Công nghiệp" style="border-radius: 10px;"
											id="industry" name="industry" value="${bv.employer.industry}"
											required>
									</div>
								</div>

								<div class="row p-2">
									<div class="col-md-6">
										<label for="contactperson">Người liên hệ</label> <input
											class="form-control" type="text" placeholder="Người liên hệ"
											aria-label="Người liên hệ" style="border-radius: 10px;"
											id="contactperson" name="contactperson"
											value="${bv.employer.contactperson}" required>
									</div>
									<div class="col-md-6">
										<label for="salary">Mức Lương:</label> <input
											class="form-control" type="text" placeholder="Mức lương"
											aria-label="Mức lương" style="border-radius: 10px;"
											id="salary" name="salary" value="${bv.salary}" required>
									</div>
								</div>


								<hr>
								<div class="row p-2" style="margin-top: 10px;">
									<div class="card-action">
										<button formaction="/admin/updatePost/${bv.jobid}"
									class="btn btn-info" style="background-color: #00688B; color: white;">Cập
									Nhật</button>
										<a href="/admin" class="btn btn-danger">Hủy
											bỏ</a>
									</div>
								</div>
							</form>

						</div>

	</div>
	</article>
	<br>
	<hr>
	<!-- footer-->
	<%@ include file="/views/footer.jsp"%>
	<!-- /footer -->
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
		function validateForm() {
			var email = document.forms["userForm"]["email"].value;
			var phonenumber = document.forms["userForm"]["phonenumber"].value;
			var password = document.forms["userForm"]["password"].value;
			var emailRegex = /^[A-Za-z0-9._%+-]+@(gmail\.com|fpt\.edu\.vn)$/;
			var phoneRegex = /^\d{10}$/;
			var errorMsg = "";

			if (!emailRegex.test(email)) {
				errorMsg += "Định dạng email không hợp lệ!\n";
			}

			if (!phoneRegex.test(phonenumber)) {
				errorMsg += "Số điện thoại phải đủ 10 số và không được nhập chữ!\n";
			}

			if (password.length < 8) {
				errorMsg += "Mật khẩu phải có độ dài tối thiểu 8 ký tự!\n";
			}

			if (errorMsg) {
				alert(errorMsg);
				return false;
			}

			return true;
		}
	</script>


</html>
</html>