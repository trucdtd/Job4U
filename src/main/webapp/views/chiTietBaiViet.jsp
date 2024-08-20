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
	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<!-- /header -->
	<div class="container">
		<br>

		<article>
			<div class="card">
				<div class="card-header">
					<div class="card-title">Chi Tiết Bài Viết</div>
				</div>
				<div class="card-body p-0">
					<form class="p-4 border border-1"
						action="/admin/updatePost/${bv.jobid}" method="post">
						<!-- Job ID (Disabled) -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="jobid">ID:</label> <input class="form-control"
									type="text" id="jobid" name="jobid" disabled
									value="${bv.jobid}" required>
							</div>
							<div class="col-md-6">
								<label for="applicationdeadline">Hạn nộp đơn:</label> <input
									class="form-control" type="text" id="applicationdeadline"
									disabled name="applicationdeadline"
									value="${bv.applicationdeadline}" required>
							</div>
						</div>

						<!-- Job Title and Location -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="jobtitle">Tiêu Đề:</label> <input
									class="form-control" type="text" id="jobtitle" name="jobtitle"
									value="${bv.jobtitle}" required>
							</div>
							<div class="col-md-6">
								<label for="joblocation">Vị trí:</label> <input
									class="form-control" type="text" id="joblocation"
									name="joblocation" value="${bv.joblocation}" required>
							</div>
						</div>

						<!-- Employer Details -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="companyname">Công Ty:</label> <input
									class="form-control" type="text" id="companyname"
									name="companyname" value="${bv.employer.companyname}" required>
							</div>
							<div class="col-md-6">
								<label for="companywebsite">Trang Web:</label> <input
									class="form-control" type="text" id="companywebsite"
									name="companywebsite" value="${bv.employer.companywebsite}"
									required>
							</div>
						</div>

						<!-- Employer Address and Industry -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="address">Địa chỉ công ty:</label> <input
									class="form-control" type="text" id="address" name="address"
									value="${bv.employer.address}" required>
							</div>
							<div class="col-md-6">
								<label for="industry">Ngành công nghiệp:</label> <input
									class="form-control" type="text" id="industry" name="industry"
									value="${bv.employer.industry}" required>
							</div>
						</div>

						<!-- Contact Person and Salary -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="contactperson">Người liên hệ:</label> <input
									class="form-control" type="text" id="contactperson"
									name="contactperson" value="${bv.employer.contactperson}"
									required>
							</div>
							<div class="col-md-6">
								<label for="salary">Mức Lương:</label> <input
									class="form-control" type="text" id="salary" name="salary"
									value="${bv.salary}" required oninput="formatSalary(this)">
							</div>
						</div>

						<hr>
						<div class="row p-2" style="margin-top: 10px;"></div>
						<button type="submit" class="btn btn-info"
							style="background-color: #00688B; color: white;">Cập
							Nhật</button>
						<a href="/admin" class="btn btn-danger">Hủy bỏ</a>
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
		function formatSalary(input) {
			// Lấy giá trị từ ô input và loại bỏ ký tự không phải số
			let value = input.value.replace(/\D/g, '');

			// Nếu giá trị có ít nhất 4 ký tự, loại bỏ 3 ký tự cuối cùng
			if (value.length > 3) {
				value = value.slice(0, -3);
			}

			// Định dạng giá trị với dấu phẩy và thêm ký hiệu tiền tệ
			if (value) {
				value = parseInt(value).toLocaleString('vi-VN').replace(/\./g,
						','); // Đổi dấu chấm thành dấu phẩy
			}
			input.value = value + ' VND'; // Thêm ký hiệu VND
		}

		// Định dạng giá trị ban đầu khi trang được tải
		document.addEventListener('DOMContentLoaded', function() {
			const salaryInput = document.getElementById('salary');
			if (salaryInput) {
				formatSalary(salaryInput);
			}
		});
	</script>
</html>
</html>