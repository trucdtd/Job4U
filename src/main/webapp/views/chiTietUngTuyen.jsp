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
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

.container {
	padding: 20px;
	max-width: 1000px;
	margin: 0 auto;
}

.company-logo {
	width: 100px;
	height: 100px;
	object-fit: contain;
	border-radius: 5px;
	border: 1px solid #dee2e6;
	padding: 5px;
	background-color: #fff;
}

.company-name {
	font-weight: bold;
	color: #0275d8;
	font-size: 1.5em;
	margin-top: 10px;
}

.info-detail {
	margin-bottom: 10px;
}

.info-detail i {
	color: #0275d8;
	margin-right: 5px;
}

.btn-apply {
	width: 100%;
}

.modal-header {
	background-color: #198754;
	color: white;
}

.file-upload {
	border: 2px dashed #007bff;
	padding: 15px;
	text-align: center;
	color: #007bff;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 5px;
}

.file-upload:hover {
	background-color: #e6f0ff;
}

.custom-card {
	border-radius: 10px;
}

.custom-card .card-title {
	font-size: 1.25rem;
}

.custom-card .list-unstyled li {
	font-size: 1rem;
}

.custom-card i {
	font-size: 1.2rem;
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
			<div>
				<c:if test="${not empty message}">
					<div class="alert alert-info">${message}</div>
				</c:if>
			</div>

			<div class="row">
				<!-- Nội dung chính -->
				<div class="col-md-8">
					<div class="card mb-4 custom-card">
						<div class="card-body">
							<div class="d-flex align-items-center">
								<img
									src="${pageContext.request.contextPath}/uploads/${job.employer.logo}"
									alt="Logo công ty" class="company-logo me-3">
								<div>
									<h2 class="company-name text-success">${job.jobtitle}</h2>
									<a href="#" target="_blank" class="text-primary"><i
										class="bi bi-globe"></i> Truy cập website:
										${job.employer.companywebsite} </a>
								</div>
							</div>
							<hr>
							<h4>Chi tiết tuyển dụng</h4>
							<div class="info">
								<div class="info-detail">
									<i class="bi bi-briefcase text-success"></i> <strong>Vị
										trí:</strong> ${job.jobtitle}
								</div>
								<div class="info-detail">
									<i class="bi bi-briefcase text-success"></i> <strong>Nghề
										nghiệp:</strong> ${job.jobcategories.jobcategoryname}
								</div>
								<div class="info-detail">
									<i class="bi bi-geo-alt text-success"></i> <strong>Địa
										điểm làm việc:</strong> ${job.joblocation}
								</div>
								<div class="info-detail">
									<i class="bi bi-currency-dollar text-success"></i> <strong>Lương:</strong>
									<c:choose>
										<c:when test="${not empty job.salary}">
											<span style="display: inline-flex; align-items: center;">
												${job.salary.toString().replaceAll("(\\d)(?=(\\d{3})+(?!\\d))", "$1,")}
												VND </span>
										</c:when>
										<c:otherwise>
								            Thỏa Thuận
								        </c:otherwise>
									</c:choose>
								</div>
								<div class="info-detail">
									<i class="bi bi-calendar-check text-success"></i> <strong>Ngày
										Đăng:</strong> <span id="postedDate">${job.posteddate}</span>
								</div>
								<div class="info-detail">
									<i class="bi bi-calendar-check text-success"></i> <strong>Hạn
										nộp:</strong> <span id="applicationDeadline">${job.applicationdeadline}</span>
								</div>
							</div>
							<hr>
							<h5>Mô tả về công việc</h5>
							<p>${job.jobdescription}</p>
							<h5>Yêu cầu công việc</h5>
							<p>${job.jobrequirements}</p>
							<div class="mt-4">
								<c:choose>
									<c:when test="${not empty userid}">
										<c:choose>
											<c:when test="${not hasApplied}">
												<!-- Nếu người dùng chưa ứng tuyển và role không phải là 2 và 0 -->
												<c:if test="${userRole != 2 && userRole != 0}">
													<button type="button" class="btn btn-success btn-apply"
														data-bs-toggle="modal" data-bs-target="#uploadCvModal">
														<i class="bi bi-upload text-light"></i> Ứng tuyển ngay
													</button>
												</c:if>
											</c:when>
											<c:otherwise>
												<!-- Nếu người dùng đã ứng tuyển -->
												<button type="button" class="btn btn-secondary" disabled>
													<i class="bi bi-check text-light"></i> Đã ứng tuyển
												</button>
											</c:otherwise>
										</c:choose>
										<!-- Nút báo cáo, hiển thị cho người dùng đã đăng nhập -->
										<button type="button" class="btn btn-danger btn-report"
											data-bs-toggle="modal" data-bs-target="#reportModal">
											<i class="bi bi-flag text-light"></i> Báo cáo bài viết
										</button>
									</c:when>
									<c:otherwise>
										<!-- Nếu người dùng chưa đăng nhập -->
										<button type="button" class="btn btn-success btn-apply"
											data-bs-toggle="modal" data-bs-target="#loginModal">
											<i class="bi bi-lock text-light"></i> Đăng nhập để ứng tuyển
										</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>

				<!-- Sidebar thông tin công ty -->
				<div class="col-md-4">
					<div class="card mb-4 shadow-sm custom-card">
						<div class="card-body">
							<!-- Tiêu đề -->
							<h5 class="card-title text-center text-success">Thông tin
								công ty</h5>

							<!-- Tên Công Ty -->
							<div class="text-center mb-3">
								<h6 class="fw-bold">${job.employer.companyname}</h6>
								<p class="text-muted">${job.employer.companydescription}</p>
							</div>

							<!-- Thông tin chi tiết -->
							<ul class="list-unstyled">
								<li class="mb-3"><i
									class="bi bi-building me-2 text-success"></i> <strong>Địa
										chỉ:</strong> ${job.employer.address}</li>
								<li class="mb-3"><i class="bi bi-person me-2 text-success"></i>
									<strong>Người liên hệ:</strong> ${job.employer.contactperson}</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal đăng nhập -->
		<div class="modal fade" id="loginModal" tabindex="-1"
			aria-labelledby="loginModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content custom-card">
					<div class="modal-header">
						<h5 class="modal-title" id="loginModalLabel">Đăng nhập để
							tiếp tục</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Vui lòng đăng nhập để có thể ứng tuyển cho công việc này.</p>
						<a href="/Login" class="btn btn-success">Đăng nhập</a>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Hủy</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal Upload CV -->
		<div class="modal fade" id="uploadCvModal" tabindex="-1"
			aria-labelledby="uploadCvModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<form id="cvUploadForm" action="/chiTiet/${jobid}" method="post"
					enctype="multipart/form-data">
					<div class="modal-content custom-card">
						<div class="modal-header">
							<h5 class="modal-title" id="uploadCvModalLabel">Nộp CV của
								bạn</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<!-- Lựa chọn CV có sẵn hoặc tải file -->
							<div class="mb-3">
								<label for="cvOptions" class="form-label">Lựa chọn:</label> <select
									id="cvOptions" name="cvOptions" class="form-select" required>
									<option value="null">Chọn một tùy chọn</option>
									<option value="upload">Tải lên file CV mới</option>
									<option value="choose">Chọn CV có sẵn</option>
								</select>
							</div>

							<!-- Phần tải file CV -->
							<div class="mb-3" id="uploadFileDiv" style="display: none;">
								<label for="cvFile" class="form-label">Tải lên file CV:</label>
								<div class="file-upload mb-2"
									onclick="document.getElementById('cvFile').click();">
									<i class="bi bi-cloud-arrow-up"></i>
									<p>Kéo thả hoặc chọn file CV</p>
								</div>
								<input type="file" class="form-control d-none" id="cvFile"
									name="cvFile" onchange="displayFileName()">
								<p id="fileName" class="mt-2"></p>

								<!-- Đây là nơi hiển thị tên file -->
							</div>
							<!-- Phần chọn CV có sẵn -->
							<div class="mb-3" id="existingCvDiv" style="display: none;">
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
							<button type="submit" class="btn btn-success">Nộp CV</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- Modal Báo cáo -->
		<div class="modal fade" id="reportModal" tabindex="-1"
			aria-labelledby="reportModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="reportModalLabel">Báo cáo bài
							viết</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="/report" method="post">
							<div class="mb-3">
								<label for="reportReason" class="form-label">Lý do báo
									cáo</label>
								<textarea class="form-control" id="reportReason"
									name="reportReason" rows="3" required></textarea>
							</div>
							<button type="submit" class="btn btn-danger">Gửi báo cáo</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/views/footer.jsp"%>
		${script}
		<script>
			document
					.addEventListener(
							'DOMContentLoaded',
							function() {
								// Hàm định dạng ngày thành ngày/tháng/năm
								function formatDate(dateString) {
									var date = new Date(dateString);
									var day = String(date.getDate()).padStart(
											2, '0');
									var month = String(date.getMonth() + 1)
											.padStart(2, '0'); // Tháng trong JS bắt đầu từ 0
									var year = date.getFullYear();
									return day + '/' + month + '/' + year;
								}

								// Định dạng lương
								function formatSalary(salaryText) {
									salaryText = salaryText.replace('VNĐ', '')
											.trim();
									var salaryNumber = parseFloat(salaryText
											.replace(/\./g, '').replace(/,/g,
													''));
									var formattedSalary = salaryNumber
											.toString().replace(
													/\B(?=(\d{3})+(?!\d))/g,
													'.');
									return formattedSalary + ' VNĐ';
								}

								var salaryElements = document
										.querySelectorAll(".info-detail span[id='salary']");
								salaryElements
										.forEach(function(element) {
											var salaryText = element.textContent
													|| element.innerText;
											element.innerHTML = formatSalary(salaryText);
										});

								// Định dạng ngày đăng
								var postedDateElement = document
										.querySelector(".info-detail span[id='postedDate']");
								if (postedDateElement) {
									var postedDateText = postedDateElement.textContent
											|| postedDateElement.innerText;
									postedDateElement.innerHTML = formatDate(postedDateText);
								}

								// Định dạng hạn nộp
								var deadlineElement = document
										.querySelector(".info-detail span[id='applicationDeadline']");
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
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	</div>
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

</body>
</html>
