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
	<div class="container mt-5">
		<section class="section dashboard">
			<div class="row">

				<!-- Title Section -->
				<div class="col-12 mb-4">
					<h1>Thống Kê Hệ Thống</h1>
				</div>

				<div class="row text-center">
					<!-- Sales Card -->
					<div class="col-xxl-4 col-md-6 mb-4">
						<div class="card info-card sales-card shadow-sm">
							<div class="card-body">
								<h5 class="card-title">
									Bài viết <span class="text-muted">| <select
										id="timeframe" onchange="updatePostData()">
											<option value="today">Hôm nay</option>
											<option value="6months">6 tháng</option>
											<option value="1year">1 năm</option>
									</select>
									</span>
								</h5>
								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-file-text"></i>
										<!-- Thay đổi icon thành bài viết -->
									</div>
									<div class="ps-3">
										<h6 id="post-count">145</h6>
										<!-- Thay đổi ID để quản lý bài viết -->
										<span class="text-success small fw-bold">12%</span> <span
											class="text-muted small">tăng</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					


					<!-- Customers Card -->
					<div class="col-xxl-4 col-md-6 mb-4">
						<div class="card info-card customers-card shadow-sm">
							<div class="card-body">
								<h5 class="card-title">
									Người dùng <span class="text-muted">| <select
										id="user-timeframe" onchange="updateUserData()">
											<option value="today">Hôm nay</option>
											<option value="6months">6 tháng</option>
											<option value="1year">1 năm</option>
									</select>
									</span>
								</h5>
								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
										<!-- Biểu tượng người dùng -->
									</div>
									<div class="ps-3">
										<h6 id="user-count">1244</h6>
										<!-- ID để hiển thị dữ liệu người dùng -->
										<span class="text-danger small fw-bold" id="user-percentage">12%</span>
										<span class="text-muted small">giảm</span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xxl-4 col-md-6 mb-4">
						<div class="card info-card sales-card shadow-sm">
							<div class="card-body">
								<h5 class="card-title">
									Doanh số <span class="text-muted">| <select
										id="sales-timeframe" onchange="updateSalesData()">
											<option value="today">Hôm nay</option>
											<option value="6months">6 tháng</option>
											<option value="1year">1 năm</option>
									</select>
									</span>
								</h5>
								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-cart"></i>
										<!-- Biểu tượng giỏ hàng -->
									</div>
									<div class="ps-3">
										<h6 id="sales-count">145</h6>
										<!-- ID để hiển thị dữ liệu doanh số -->
										<span class="text-success small fw-bold" id="sales-percentage">12%</span>
										<span class="text-muted small">tăng</span>
									</div>
								</div>
							</div>
						</div>
					</div>




					<!-- Charts Section -->
					<%-- <div class="row">
				<div class="col-12 mb-4">
                    <form action="${pageContext.request.contextPath}/thongke" method="GET" >
                        <div class="col-md-4">
                            <select name="timeframe" class="form-select" aria-label="Thống kê theo thời gian" onchange="this.form.submit()">
                                <option value="1day">Trong ngày</option>
                                <option value="1month">1 tháng</option>
                                <option value="6months">6 tháng</option>
                                <option value="12months" selected>12 tháng</option>
                            </select>
                        </div>
                    </form>
                </div>
					<div class="col-md-6 mb-4">
						<div class="card shadow-sm">
							<div class="card-header bg-primary text-white">Thống kê
								Người dùng</div>
							<div class="card-body">
								<h5 class="card-title">${newUsersData[11]}Người dùng đăng
									ký</h5>
								<canvas id="userChart"></canvas>
							</div>
						</div>
					</div>

					<div class="col-md-6 mb-4">
						<div class="card shadow-sm">
							<div class="card-header bg-success text-white">Thống kê Bài
								đăng</div>
							<div class="card-body">
								<h5 class="card-title">${newPostsData[11]}Bài đăng</h5>
								<canvas id="postChart"></canvas>
							</div>
						</div>
					</div>
				</div> --%>

					<!-- Recent Sales Section -->
					<div class="col-12">
						<div class="card recent-sales shadow-sm">
							<div class="card-body">
								<h5 class="card-title">
									Recent Sales <span class="text-muted">| Hôm nay</span>
								</h5>
								<table class="table table-borderless datatable">
									<thead>
										<tr>
											<th>#</th>
											<th>Customer</th>
											<th>Product</th>
											<th>Price</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<!-- Add dynamic data rows here -->
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
		</section>
	</div>

	<!-- ChartJS and custom script -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            var userStatistics = /*[[${userStatistics}]]*/ [];
            var jobStatistics = /*[[${jobStatistics}]]*/ [];

            var labels = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];

            new Chart(document.getElementById('userChart'), {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Người dùng đăng ký',
                        data: userStatistics.map(item => item[1]),
                        borderColor: 'rgba(54, 162, 235, 1)',
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    }]
                }
            });

            new Chart(document.getElementById('postChart'), {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Bài đăng',
                        data: jobStatistics.map(item => item[1]),
                        borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    }]
                }
            });
        });
    </script>

	<script>
	function updatePostData() {
	    var timeframe = document.getElementById("post-timeframe").value;
	    var postCountElement = document.getElementById("post-count");
	    var postPercentageElement = document.getElementById("post-percentage");

	    if (timeframe === "today") {
	        postCountElement.innerText = "145"; // Dữ liệu giả định cho hôm nay
	        postPercentageElement.innerText = "5%"; // Phần trăm giả định cho hôm nay
	    } else if (timeframe === "6months") {
	        postCountElement.innerText = "1023"; // Dữ liệu giả định cho 6 tháng
	        postPercentageElement.innerText = "8%"; // Phần trăm giả định cho 6 tháng
	    } else if (timeframe === "1year") {
	        postCountElement.innerText = "3456"; // Dữ liệu giả định cho 1 năm
	        postPercentageElement.innerText = "15%"; // Phần trăm giả định cho 1 năm
	    }
	}
    </script>

	<script>
	function updateUserData() {
	    var timeframe = document.getElementById("user-timeframe").value;
	    var userCountElement = document.getElementById("user-count");
	    var userPercentageElement = document.getElementById("user-percentage");

	    if (timeframe === "today") {
	        userCountElement.innerText = "150"; // Dữ liệu giả định cho hôm nay
	        userPercentageElement.innerText = "5%"; // Phần trăm giả định
	    } else if (timeframe === "6months") {
	        userCountElement.innerText = "1050"; // Dữ liệu giả định cho 6 tháng
	        userPercentageElement.innerText = "10%"; // Phần trăm giả định
	    } else if (timeframe === "1year") {
	        userCountElement.innerText = "1244"; // Dữ liệu giả định cho 1 năm
	        userPercentageElement.innerText = "12%"; // Phần trăm giả định
	    }
	}
    </script>

	<script>
    function updateSalesData() {
    var timeframe = document.getElementById("sales-timeframe").value;
    var salesCountElement = document.getElementById("sales-count");
    var salesPercentageElement = document.getElementById("sales-percentage");

    if (timeframe === "today") {
        salesCountElement.innerText = "145"; // Dữ liệu giả định cho hôm nay
        salesPercentageElement.innerText = "12%"; // Phần trăm giả định cho hôm nay
    } else if (timeframe === "6months") {
        salesCountElement.innerText = "890"; // Dữ liệu giả định cho 6 tháng
        salesPercentageElement.innerText = "9%"; // Phần trăm giả định cho 6 tháng
    } else if (timeframe === "1year") {
        salesCountElement.innerText = "1500"; // Dữ liệu giả định cho 1 năm
        salesPercentageElement.innerText = "18%"; // Phần trăm giả định cho 1 năm
    }
}
    </script>
</body>
</html>

