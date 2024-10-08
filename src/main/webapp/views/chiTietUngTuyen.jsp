<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin chi tiết</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	padding: 20px;
	max-width: 1200px;
	margin: 0 auto;
}

.card {
	border: 1px solid #ccc;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 2px 2px 5px #888888;
	margin-bottom: 20px;
}

.info-detail {
	display: flex;
	justify-content: space-between;
	margin-bottom: 5px;
}

.button {
	background-color: #0275d8;
	border: none;
	color: white;
	padding: 15px 32px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
}

.button:hover {
	background-color: #025aa5;
}

.logo img {
	width: 100px;
	height: 100px;
}

.company-name {
	font-weight: bold;
	color: #0275d8;
	font-size: 1.5em;
}

#salary {
	font-weight: bold;
	color: #d9534f;
	font-size: 1.2em;
}

.bii {
	font-size: 1.2em;
	color: #0275d8;
}

.modal-header {
	background-color: #007bff;
	color: white;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

.btn-outline-primary {
	border-color: #007bff;
}

.file-upload {
	border: 2px dashed #007bff;
	padding: 20px;
	text-align: center;
	color: #007bff;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.file-upload:hover {
	background-color: #e6f0ff;
}

.form-select {
	border-color: #007bff;
}

.custom-card {
	border: none;
	background-color: #ffffff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.cv-option {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 15px;
}

.icon-container {
	width: 40px;
	height: 40px;
	background-color: #007bff;
	color: white;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
}

.modal-footer {
	border-top: none;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="/views/header.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<article>
						<section class="member-details">
							<div class="row">
								<div class="col-lg-3 col-md-4 mb-4">
									<div class="img-container">
										<img src="https://bootdey.com/img/Content/avatar/avatar6.png"
											alt="team member" class="img-fluid">
									</div>
								</div>
								<div class="col-lg-9 col-md-8">
									<h2 class="company-name">${job.employer.companyname}</h2>
									<%-- <span>${job.employer.companywebsite}</span> --%>
									<p>${job.employer.companydescription}</p>
									<div class="row">
										<div class="col-lg-6">
											<h6>
												<i class="bii bi-briefcase"></i> Ngành Nghề:
											</h6>
											<p>${job.employer.industry}</p>
											<h6>
												<i class="bii bi-building"></i> Địa Chỉ:
											</h6>
											<p>${job.employer.address}</p>
											<h6>
												<i class="bii bi-briefcase-fill"></i> Vị Trí:
											</h6>
											<p>${job.jobtitle}</p>
										</div>
										<div class="col-lg-6">
											<h6>
												<i class="bii bi-geo-alt"></i> Địa Điểm Làm Việc:
											</h6>
											<p>${job.joblocation}</p>
											<%-- <h6>
												<i class="bi bi-currency-dollar"></i> Lương:
											</h6>
											<p id="salary">${job.salary}VNĐ</p> --%>
											<h6>
												<i class="bii bi-person"></i> Người Liên Hệ:
											</h6>
											<p>${job.employer.contactperson}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<h4>
												<i class="bii bi-calendar"></i> Ngày Đăng:
											</h4>
											<p>${formattedPostedDate}</p>
										</div>
									</div>
									<h4>
										<i class="bii bi-list-check"></i> Yêu cầu công việc
									</h4>
									<p>${job.jobrequirements}</p>
									<h4>
										<i class="bii bi-file-text"></i> Mô tả về công việc
									</h4>
									<p>${job.jobdescription}</p>
								</div>
							</div>
						</section>
					</article>
				</div>

				<!-- Sidebar với thông tin chi tiết -->
				<div class="col-md-5">
					<div class="card">
						<div class="logo">
							<img src="https://bootdey.com/img/Content/avatar/avatar6.png"
								alt="Company Logo">
						</div>
						<div class="info-detail">
							<span>Tên công ty:</span><span class="company-name">${job.employer.companyname}</span>
						</div>
						<div class="info-detail">
							<span>Website công ty:</span><span>${job.employer.companywebsite}</span>
						</div>
						<div class="info-detail">
							<span><i class="bii bi-briefcase"></i> Ngành nghề:</span><span>${job.employer.industry}</span>
						</div>
						<div class="info-detail">
							<span><i class="bii bi-building"></i> Địa chỉ:</span><span>${job.employer.address}</span>
						</div>
					</div>
					<div class="card">
						<div class="info">
							<h3>Thông tin công việc</h3>
							<div class="info-detail">
								<span><i class="bii bi-briefcase"></i> Vị trí:</span><span>${job.jobtitle}</span>
							</div>
							<div class="info-detail">
								<span><i class="bii bi-geo-alt"></i> Địa điểm làm việc:</span><span>${job.joblocation}</span>
							</div>
							<div class="info-detail">
								<span><i class="bii bi-currency-dollar"></i> Lương:</span><span
									id="salary">${job.salary} VNĐ</span>
							</div>
							<%-- <div class="info-detail">
								<span><i class="bi bi-calendar"></i> Ngày đăng:</span><span>${formattedPostedDate}</span>
							</div> --%>
							<div class="info-detail">
								<span><i class="bii bi-calendar-check"></i> Hạn nộp:</span> <span
									id="deadline">${job.applicationdeadline}</span>
							</div>

						</div>
						<!-- Nút Quay lại và Ứng tuyển -->
						<div class="button-group d-flex justify-content-between mt-3">
							<a href="/job4u" class="btn btn-secondary w-50 me-2">Quay lại</a>
							<button type="button" class="btn btn-primary w-50"
								data-bs-toggle="modal" data-bs-target="#uploadCvModal">
								<i class="bi bi-upload text-light"></i> Ứng tuyển
							</button>
						</div>
					</div>

				</div>

			</div>
		</div>

		<div class="modal fade" id="uploadCvModal" tabindex="-1"
			aria-labelledby="uploadCvModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<form id="cvUploadForm" action="/job4u/chiTiet/${job.jobid}"
					method="post" enctype="multipart/form-data">
					<div class="modal-content custom-card">
						<div class="modal-header">
							<h5 class="modal-title" id="uploadCvModalLabel">Nộp CV của
								bạn</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<!-- Lựa chọn CV có sẵn hoặc tải file -->
							<div class="form-group mb-4">
								<label for="cvOptions" class="form-label">Lựa chọn:</label> <select
									id="cvOptions" name="cvOptions" class="form-select" required>
									<option value="null">Chọn một tùy chọn</option>
									<option value="upload">Tải lên file CV mới</option>
									<option value="choose">Chọn CV có sẵn</option>
								</select>
							</div>

							<!-- Phần tải file CV -->
							<div class="form-group mb-3" id="uploadFileDiv"
								style="display: none;">
								<label for="cvFile" class="form-label">Tải lên file CV:</label>
								<div class="file-upload"
									onclick="document.getElementById('cvFile').click();">
									<i class="bi bi-cloud-arrow-up"></i>
									<p>Kéo thả hoặc chọn file CV</p>
								</div>
								<input type="file" class="form-control d-none" id="cvFile"
									name="cvFile" onchange="displayFileName()">
								<p id="fileName" class="mt-2"></p>=
								<!-- Đây là nơi hiển thị tên file -->
							</div>
							<!-- Phần chọn CV có sẵn -->
							<div class="form-group mb-3" id="existingCvDiv"
								style="display: none;">
								<label for="existingCv" class="form-label">Chọn CV có
									sẵn:</label> <select id="existingCv" name="id" class="form-select">
									<option value="">Chọn CV</option>
									<c:forEach var="list" items="${listCV}">
										<option value="${list.jobseekerid}">${list.resume}</option>
									</c:forEach>
								</select>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Hủy</button>
							<button type="submit" class="btn btn-primary">Nộp CV</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>

	<div>
		<%@ include file="/views/footer.jsp"%>
	</div>
	${script}

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Hàm định dạng ngày thành ngày/tháng/năm
			function formatDate(dateString) {
				var date = new Date(dateString);
				var day = String(date.getDate()).padStart(2, '0');
				var month = String(date.getMonth() + 1).padStart(2, '0'); // Tháng trong JS bắt đầu từ 0
				var year = date.getFullYear();
				return day + '/' + month + '/' + year;
			}

			// Định dạng lương
			function formatSalary(salaryText) {
				salaryText = salaryText.replace('VNĐ', '').trim();
				var salaryNumber = parseFloat(salaryText.replace(/\./g, '')
						.replace(/,/g, ''));
				var formattedSalary = salaryNumber.toString().replace(
						/\B(?=(\d{3})+(?!\d))/g, '.');
				return formattedSalary + ' VNĐ';
			}

			var salaryElement = document.getElementById("salary");
			var salaryText = salaryElement.textContent
					|| salaryElement.innerText;
			salaryElement.innerHTML = formatSalary(salaryText);

			var salaryElements = document
					.querySelectorAll(".info-detail span[id='salary']");
			salaryElements.forEach(function(element) {
				var salaryText = element.textContent || element.innerText;
				element.innerHTML = formatSalary(salaryText);
			});

			// Định dạng lại hạn nộp
			var deadlineElement = document
					.querySelector(".info-detail span[id='deadline']");
			if (deadlineElement) {
				var deadlineText = deadlineElement.textContent
						|| deadlineElement.innerText;
				deadlineElement.innerHTML = formatDate(deadlineText);
			}
		});
	</script>
	<script>
		document.getElementById('cvOptions').addEventListener(
				'change',
				function() {
					const option = this.value;
					const uploadFileDiv = document
							.getElementById('uploadFileDiv');
					const existingCvDiv = document
							.getElementById('existingCvDiv');

					if (option === 'upload') {
						uploadFileDiv.style.display = 'block';
						existingCvDiv.style.display = 'none';
					} else if (option === 'choose') {
						uploadFileDiv.style.display = 'none';
						existingCvDiv.style.display = 'block';
					} else {
						uploadFileDiv.style.display = 'none';
						existingCvDiv.style.display = 'none';
					}
				});
	</script>
	<script>
		function displayFileName() {
			var fileInput = document.getElementById('cvFile');
			var fileName = document.getElementById('fileName');

			if (fileInput.files.length > 0) {
				fileName.textContent = "File đã chọn: "
						+ fileInput.files[0].name;
			} else {
				fileName.textContent = ""; // Nếu không có file nào được chọn, để trống
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
