<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thống Kê Hệ Thống</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<!-- Header Section -->
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h1>Thống Kê Hệ Thống</h1>
			<div>
				<form action="${pageContext.request.contextPath}/thongke"
					method="GET">
					<select name="timeframe" class="form-select"
						aria-label="Thống kê theo thời gian" onchange="this.form.submit()">
						<option value="1day">Trong ngày</option>
						<option value="1month">1 tháng</option>
						<option value="6months">6 tháng</option>
						<option value="12months" selected>12 tháng</option>
					</select>
				</form>
			</div>
		</div>

		<!-- Row 1: Thống kê Người dùng & Bài đăng -->
		<div class="row">
			<div class="col-md-6">
				<div class="card mb-4">
					<div class="card-header bg-primary text-white">Thống kê Người
						dùng</div>
					<div class="card-body">
						<h5 class="card-title">${newUsersData[11]}Người dùng đăng ký</h5>
						<canvas id="userChart"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mb-4">
					<div class="card-header bg-success text-white">Thống kê Bài
						đăng</div>
					<div class="card-body">
						<h5 class="card-title">${newPostsData[11]}Bài đăng</h5>
						<canvas id="postChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JS for Charts -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
    var userStatistics = /*[[${userStatistics}]]*/ [];
    var jobStatistics = /*[[${jobStatistics}]]*/ [];

    // Extract data for chart
    var userData = userStatistics.map(item => item[1]); // Số lượng người dùng
    var jobData = jobStatistics.map(item => item[1]);   // Số lượng bài đăng

    var labels = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];

    // Render biểu đồ người dùng
    new Chart(document.getElementById('userChart'), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Người dùng đăng ký',
                data: userData,
                borderColor: 'rgba(54, 162, 235, 1)',
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
            }]
        }
    });

    // Render biểu đồ bài đăng
    new Chart(document.getElementById('postChart'), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Bài đăng',
                data: jobData,
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
            }]
        }
    });
</script>
</body>
</html>
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
	<link rel="stylesheet" href="/css/thongke.css">
</head>
<body>
	<div class="container">
		<section class="section dashboard">
			<div class="row">
				<!-- Left side columns -->
				<div class="container mt-5">
					<!-- Header Section -->
					<div class="d-flex justify-content-between align-items-center mb-4">
						<h1>Thống Kê Hệ Thống</h1>
						<div>
							<form action="${pageContext.request.contextPath}/thongke"
								method="GET">
								<select name="timeframe" class="form-select"
									aria-label="Thống kê theo thời gian"
									onchange="this.form.submit()">
									<option value="1day">Trong ngày</option>
									<option value="1month">1 tháng</option>
									<option value="6months">6 tháng</option>
									<option value="12months" selected>12 tháng</option>
								</select>
							</form>
						</div>
					</div>

					<!-- Row 1: Thống kê Người dùng & Bài đăng -->
					<div class="row">
						<div class="col-md-6">
							<div class="card mb-4">
								<div class="card-header bg-primary text-white">Thống kê
									Người dùng</div>
								<div class="card-body">
									<h5 class="card-title">${newUsersData[11]}Người dùng đăng
										ký</h5>
									<canvas id="userChart"></canvas>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card mb-4">
								<div class="card-header bg-success text-white">Thống kê
									Bài đăng</div>
								<div class="card-body">
									<h5 class="card-title">${newPostsData[11]}Bài đăng</h5>
									<canvas id="postChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-8">
					<div class="row">
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>
										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										<span>| Today</span>
									</h5>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>145</h6>
											<span class="text-success small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>
								<div class="card-body">
									<h5 class="card-title">
										<span>| This Month</span>
									</h5>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>$3,264</h6>
											<span class="text-success small pt-1 fw-bold">8%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xxl-4 col-xl-12">
							<div class="card info-card customers-card">
								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>
										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										<span>| This Year</span>
									</h5>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6>1244</h6>
											<span class="text-danger small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">decrease</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>
						
						<div class="col-12">
							<div class="card recent-sales overflow-auto">
								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>
										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>
								<div class="card-body">
									<h5 class="card-title">
										Recent Sales <span>| Today</span>
									</h5>
									<table class="table table-borderless datatable">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Customer</th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row"><a href="#">#2457</a></th>
												<td>Brandon Jacob</td>
												<td><a href="#" class="text-primary">At praesentium
														minu</a></td>
												<td>$64</td>
												<td><span class="badge bg-success">Approved</span></td>
											</tr>
											<tr>
												<th scope="row"><a href="#">#2147</a></th>
												<td>Bridie Kessler</td>
												<td><a href="#" class="text-primary">Blanditiis
														dolor omnis similique</a></td>
												<td>$47</td>
												<td><span class="badge bg-warning">Pending</span></td>
											</tr>
											<tr>
												<th scope="row"><a href="#">#2049</a></th>
												<td>Ashleigh Langosh</td>
												<td><a href="#" class="text-primary">At recusandae
														consectetur</a></td>
												<td>$147</td>
												<td><span class="badge bg-success">Approved</span></td>
											</tr>
											<tr>
												<th scope="row"><a href="#">#2644</a></th>
												<td>Angus Grady</td>
												<td><a href="#" class="text-primar">Ut voluptatem
														id earum et</a></td>
												<td>$67</td>
												<td><span class="badge bg-danger">Rejected</span></td>
											</tr>
											<tr>
												<th scope="row"><a href="#">#2644</a></th>
												<td>Raheem Lehner</td>
												<td><a href="#" class="text-primary">Sunt similique
														distinctio</a></td>
												<td>$165</td>
												<td><span class="badge bg-success">Approved</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
	</div>
	<br>
	<%@ include file="/views/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const contactButton = document.getElementById('contact-button');
			const message = document.getElementById('message');
			const closeButton = document.querySelector('#message .btn-close');
			const additionalButton = document
					.getElementById('additional-button');
			const popupForm = document.getElementById('popup-form');
			const formCloseButton = popupForm.querySelector('.btn-close');

			contactButton.addEventListener('click', function() {
				message.style.display = message.style.display === 'none'
						|| message.style.display === '' ? 'block' : 'none';
			});

			closeButton.addEventListener('click', function() {
				message.style.display = 'none';
			});

			additionalButton.addEventListener('click', function() {
				popupForm.style.display = 'block';
			});

			formCloseButton.addEventListener('click', function() {
				popupForm.style.display = 'none';
			});
		});
	</script>
	
	<script>
    var userStatistics = /*[[${userStatistics}]]*/ [];
    var jobStatistics = /*[[${jobStatistics}]]*/ [];

    // Extract data for chart
    var userData = userStatistics.map(item => item[1]); // Số lượng người dùng
    var jobData = jobStatistics.map(item => item[1]);   // Số lượng bài đăng

    var labels = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];

    // Render biểu đồ người dùng
    new Chart(document.getElementById('userChart'), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Người dùng đăng ký',
                data: userData,
                borderColor: 'rgba(54, 162, 235, 1)',
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
            }]
        }
    });

    // Render biểu đồ bài đăng
    new Chart(document.getElementById('postChart'), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Bài đăng',
                data: jobData,
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
            }]
        }
    });
</script>
	
</body>
</html>