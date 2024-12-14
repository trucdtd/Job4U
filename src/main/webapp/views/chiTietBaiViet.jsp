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
<style>
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

/* Modal content */
.modal-content {
	background-color: #fff;
	border-radius: 8px;
	width: 90%;
	max-width: 400px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
	overflow: hidden;
}

/* Modal header */
.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 20px;
	border-bottom: 1px solid #ddd;
}

.modal-header h2 {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin: 0;
}

/* Close button */
.close {
	font-size: 20px;
	font-weight: bold;
	color: #999;
	cursor: pointer;
}

.close:hover {
	color: #555;
}

/* Modal body */
.modal-body {
	padding: 20px;
	font-size: 16px;
	color: #333;
	text-align: center;
}

/* Modal footer */
.modal-footer {
	padding: 15px 20px;
	border-top: 1px solid #ddd;
	display: flex;
	justify-content: center;
}

/* OK Button */
.modal-button {
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.modal-button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>

	<%@ include file="/views/chat.jsp"%>
	<!-- header -->

	<c:if test="${not empty message}">
		<div id="paymentSuccessModal" class="modal" style="display: flex;">
			<div class="modal-content">
				<div class="modal-header">
					<h2>Thông báo</h2>
					<span class="close" onclick="closeModal()">&times;</span>
				</div>
				<div class="modal-body">
					<p>${message}</p>
				</div>
				<div class="modal-footer">
					<button onclick="closeModal()" class="modal-button">OK</button>
				</div>
			</div>
		</div>
	</c:if>
	<div class="container">
		<br>
		<article>
			<div class="card">
				<div class="card-header d-flex justify-content-between">
					<div class="card-title">Chi Tiết Bài Viết</div>
					<div class="text-end">
						<span
							class="badge 
                    ${bv.active ? 'bg-success' : 'bg-danger'}">
							${bv.active ? 'Đang Hiện' : 'Đang Ẩn'} </span>
					</div>
				</div>
				<div class="card-body p-4">
					<form method="post">
						<!-- Job ID and Deadline -->
						<div class="row mb-3">
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
						<div class="row mb-3">
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
						<div class="row mb-3">
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
						<div class="row mb-3">
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
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="contactperson">Người liên hệ:</label> <input
									class="form-control" type="text" id="contactperson"
									name="contactperson" value="${bv.employer.contactperson}"
									readonly required>
							</div>
							<div class="col-md-6">
								<label for="salary">Mức Lương:</label> <input
									class="form-control" type="text" id="salary" name="salary"
									value="${bv.salary}" readonly required>
							</div>
						</div>

						<!-- Job Type and Description -->
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="jobtype">Loại hình công việc:</label> <input
									class="form-control" type="text" id="jobtype" name="jobtype"
									value="${bv.jobtype}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="jobdescription">Mô tả công việc:</label> <input
									class="form-control" type="text" id="jobdescription"
									name="jobdescription" value="${bv.jobdescription}" readonly
									required>
							</div>
						</div>

						<!-- Field and Education Requirements -->
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="field">Lĩnh vực:</label> <input class="form-control"
									type="text" id="field" name="field"
									value="${bv.employer.industry}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="education">Yêu cầu học vấn:</label> <input
									class="form-control" type="text" id="education"
									name="education" value="${bv.jobrequirements}" readonly
									required>
							</div>
						</div>
					</form>

					<div class="row">
						<div class="col-md-12 d-flex justify-content-start">
							<c:if test="${bv.active == false}">
								<form action="/admin/showPost/${bv.jobid}" method="post"
									class="me-2">
									<button type="submit" class="btn btn-success">Hiện Bài
										Viết</button>
								</form>
							</c:if>

							<c:if test="${bv.active == true}">
								<form action="/admin/hidePost/${bv.jobid}" method="post"
									class="me-2">
									<button type="submit" class="btn btn-success">Ẩn Bài
										Viết</button>
								</form>
							</c:if>

							<form action="/admin">
								<button type="submit" class="btn btn-danger">Quay lại</button>
							</form>
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
<!-- <script>
	// Giả sử giá trị salary ban đầu là một số
	const salaryInput = document.getElementById('salary');
	let salaryValue = parseFloat(salaryInput.value.replace(/,/g, '')); // Chuyển đổi thành số, bỏ dấu phẩy

	// Hàm định dạng số
	function formatSalary(value) {
		return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

	// Gán giá trị đã định dạng vào input
	salaryInput.value = formatSalary(salaryValue);
</script> -->
<script>
	// Lấy phần tử input salary
	const salaryInput = document.getElementById('salary');

	// Lấy giá trị từ input
	let salaryValue = salaryInput.value.trim();

	// Kiểm tra nếu giá trị là số và không rỗng
	if (!isNaN(salaryValue) && salaryValue !== "") {
		// Chuyển giá trị thành số để định dạng
		salaryValue = parseFloat(salaryValue);
		// Định dạng lại giá trị với dấu phẩy và thêm " VND"
		salaryInput.value = new Intl.NumberFormat('vi-VN').format(salaryValue)
				+ ' VND';
	} else {
		// Nếu giá trị không hợp lệ, đảm bảo vẫn thêm " VND"
		salaryInput.value += " VND";
	}
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
<script>
	// Close modal function
	function closeModal() {
		document.getElementById("paymentSuccessModal").style.display = "none";
	}
</script>
</html>
