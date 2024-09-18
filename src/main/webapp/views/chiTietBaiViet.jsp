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
</head>
<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<!-- /header -->
	<div class="container">
		<br>

		<%-- <article>
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
									type="text" id="jobid" name="jobid" 
									value="${bv.jobid}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="applicationdeadline">Hạn nộp đơn:</label> <input
									class="form-control" type="text" id="applicationdeadline"
									 name="applicationdeadline"
									value="${bv.applicationdeadline}" readonly required>
							</div>
						</div>

						<!-- Job Title and Location -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="jobtitle">Tiêu Đề:</label> <input
									class="form-control" type="text" id="jobtitle" name="jobtitle"
									value="${bv.jobtitle}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="joblocation">Vị trí:</label> <input
									class="form-control" type="text" id="joblocation"
									name="joblocation" value="${bv.joblocation}" readonly required>
							</div>
						</div>

						<!-- Employer Details -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="companyname">Công Ty:</label> <input
									class="form-control" type="text" id="companyname"
									name="companyname" value="${bv.employer.companyname}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="companywebsite">Trang Web:</label> <input
									class="form-control" type="text" id="companywebsite"
									name="companywebsite" value="${bv.employer.companywebsite}" readonly
									required>
							</div>
						</div>

						<!-- Employer Address and Industry -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="address">Địa chỉ công ty:</label> <input
									class="form-control" type="text" id="address" name="address"
									value="${bv.employer.address}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="industry">Ngành công nghiệp:</label> <input
									class="form-control" type="text" id="industry" name="industry"
									value="${bv.employer.industry}" readonly required>
							</div>
						</div>

						<!-- Contact Person and Salary -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="contactperson">Người liên hệ:</label> <input
									class="form-control" type="text" id="contactperson"
									name="contactperson" value="${bv.employer.contactperson}"
									readonly required>
							</div>
							<div class="col-md-6">
								<label for="salary">Mức Lương:</label> <input
									class="form-control" type="text" id="salary" name="salary"
									value="${bv.salary}" required readonly oninput="formatSalary(this)">
							</div>
						</div>

						<hr>
						<!-- <div class="row p-2" style="margin-top: 10px;"></div>
						<button type="submit" class="btn btn-info"
							style="background-color: #00688B; color: white;">Cập
							Nhật</button>
						<a href="/admin" class="btn btn-danger">Hủy bỏ</a> -->
						<div class="row p-2" style="margin-top: 10px;"></div>
						<button type="submit" class="btn btn-info"
							style="background-color: #00688B; color: white;">Hiện Bài Viết</button>
						<a href="/admin" class="btn btn-info">Ẩn Bài Viết</a>
						<a href="/admin" class="btn btn-danger">Hủy</a>
					</form>
				</div>
			</div>


		</article> --%>
		<article>
			<div class="card">
				<div class="card-header d-flex justify-content-between">
					<div class="card-title">Chi Tiết Bài Viết</div>
					
				</div>
				<div class="card-body p-0">
					<form class="p-4 border border-1"
						<%-- action="/admin/updatePost/${bv.jobid}" method="post"> --%> 
								method="post">
						<!-- Job ID (Disabled) -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="jobid">ID:</label> <input class="form-control"
									type="text" id="jobid" name="jobid" value="${bv.jobid}"
									readonly required>
							</div>
							<div class="col-md-6">
								<label for="applicationdeadline">Hạn nộp đơn:</label> <input
									class="form-control" type="text" id="applicationdeadline"
									name="applicationdeadline" value="${bv.applicationdeadline}"
									readonly required>
							</div>
						</div>

						<!-- Job Title and Location -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="jobtitle">Tiêu Đề:</label> <input
									class="form-control" type="text" id="jobtitle" name="jobtitle"
									value="${bv.jobtitle}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="joblocation">Vị trí:</label> <input
									class="form-control" type="text" id="joblocation"
									name="joblocation" value="${bv.joblocation}" readonly required>
							</div>
						</div>

						<!-- Employer Details -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="companyname">Công Ty:</label> <input
									class="form-control" type="text" id="companyname"
									name="companyname" value="${bv.employer.companyname}" readonly
									required>
							</div>
							<div class="col-md-6">
								<label for="companywebsite">Trang Web:</label> <input
									class="form-control" type="text" id="companywebsite"
									name="companywebsite" value="${bv.employer.companywebsite}"
									readonly required>
							</div>
						</div>

						<!-- Employer Address and Industry -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="address">Địa chỉ công ty:</label> <input
									class="form-control" type="text" id="address" name="address"
									value="${bv.employer.address}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="industry">Ngành công nghiệp:</label> <input
									class="form-control" type="text" id="industry" name="industry"
									value="${bv.employer.industry}" readonly required>
							</div>
						</div>

						<!-- Contact Person and Salary -->
						<div class="row p-2">
							<div class="col-md-6">
								<label for="contactperson">Người liên hệ:</label> <input
									class="form-control" type="text" id="contactperson"
									name="contactperson" value="${bv.employer.contactperson}"
									readonly required>
							</div>
							<div class="col-md-6">
								<label for="salary">Mức Lương:</label> <input
									class="form-control" type="text" id="salary" name="salary"
									value="${bv.salary}" required readonly
									oninput="formatSalary(this)">
							</div>
						</div>

					</form>
					<div class="row p-2">
						<div class="col-md-12 d-flex justify-content-start">
							<form action="/admin/hidePost/${bv.jobid}" method="post"
								class="me-2">
								<button type="submit" class="btn"
									style="background-color: #198754; color: white;">Ẩn
									Bài Viết</button>
							</form>
							<form action="/admin/showPost/${bv.jobid}" method="post"
								class="me-2">
								<button type="submit" class="btn"
									style="background-color: #198754; color: white;">Hiện
									Bài Viết</button>
							</form>
							<a href="/admin" class="btn btn-danger">Hủy</a>
						</div>
					</div>
				</div>
			</div>
		</article>
		<br>


	</div>
	<!-- footer-->
	<%@ include file="/views/footer.jsp"%>
	<!-- /footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
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
			value = parseInt(value).toLocaleString('vi-VN').replace(/\./g, ','); // Đổi dấu chấm thành dấu phẩy
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
<script>
	window.onload = function() {
		let deadlineInput = document.getElementById('applicationdeadline');
		let deadlineValue = deadlineInput.value;

		// Chuyển giá trị deadline từ chuỗi sang đối tượng Date
		let deadlineDate = new Date(deadlineValue);

		// Kiểm tra xem giá trị deadline có hợp lệ không
		if (!isNaN(deadlineDate.getTime())) {
			// Định dạng ngày theo format dd/mm/yyyy
			let formattedDate = deadlineDate.toLocaleDateString('vi-VN');
			deadlineInput.value = formattedDate;
		}
	};
</script>
</html>
