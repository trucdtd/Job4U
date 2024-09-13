<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.bi {
	font-size: 1.2em;
	color: #0275d8;
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
												<i class="bi bi-briefcase"></i> Ngành Nghề:
											</h6>
											<p>${job.employer.industry}</p>
											<h6>
												<i class="bi bi-building"></i> Địa Chỉ:
											</h6>
											<p>${job.employer.address}</p>
											<h6>
												<i class="bi bi-briefcase-fill"></i> Vị Trí:
											</h6>
											<p>${job.jobtitle}</p>
										</div>
										<div class="col-lg-6">
											<h6>
												<i class="bi bi-geo-alt"></i> Địa Điểm Làm Việc:
											</h6>
											<p>${job.joblocation}</p>
											<%-- <h6>
												<i class="bi bi-currency-dollar"></i> Lương:
											</h6>
											<p id="salary">${job.salary}VNĐ</p> --%>
											<h6>
												<i class="bi bi-person"></i> Người Liên Hệ:
											</h6>
											<p>${job.employer.contactperson}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<h4>
												<i class="bi bi-calendar"></i> Ngày Đăng:
											</h4>
											<p>${formattedPostedDate}</p>
										</div>
									</div>
									<h4>
										<i class="bi bi-list-check"></i> Yêu cầu công việc
									</h4>
									<p>${job.jobrequirements}</p>
									<h4>
										<i class="bi bi-file-text"></i> Mô tả về công việc
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
							<span><i class="bi bi-briefcase"></i> Ngành nghề:</span><span>${job.employer.industry}</span>
						</div>
						<div class="info-detail">
							<span><i class="bi bi-building"></i> Địa chỉ:</span><span>${job.employer.address}</span>
						</div>
					</div>
					<div class="card">
						<div class="info">
							<h3>Thông tin công việc</h3>
							<div class="info-detail">
								<span><i class="bi bi-briefcase"></i> Vị trí:</span><span>${job.jobtitle}</span>
							</div>
							<div class="info-detail">
								<span><i class="bi bi-geo-alt"></i> Địa điểm làm việc:</span><span>${job.joblocation}</span>
							</div>
							<div class="info-detail">
								<span><i class="bi bi-currency-dollar"></i> Lương:</span><span
									id="salary">${job.salary} VNĐ</span>
							</div>
							<div class="info-detail">
								<span><i class="bi bi-calendar"></i> Ngày đăng:</span><span>${formattedPostedDate}</span>
							</div>
							<div class="info-detail">
								<span><i class="bi bi-calendar-check"></i> Hạn nộp:</span><span>${job.applicationdeadline}</span>
							</div>
						</div>
						<!-- Nút Quay lại và Ứng tuyển -->
						<div class="button-group d-flex justify-content-between mt-3">
							<a href="/job4u" class="btn btn-secondary w-50 me-2">Quay lại</a>
							<button type="button" class="btn btn-primary w-50">Ứng
								tuyển</button>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<div>
		<%@ include file="/views/footer.jsp"%>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
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
		});
	</script>
</body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
