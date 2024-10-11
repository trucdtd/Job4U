<%@ page language="java" contentType="text/html; charset=UTF-8"
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
						<option value="1day"
							<c:if test="${timeframe == '1day'}">selected</c:if>>Trong
							ngày</option>
						<option value="1month"
							<c:if test="${timeframe == '1month'}">selected</c:if>>1
							tháng</option>
						<option value="6months"
							<c:if test="${timeframe == '6months'}">selected</c:if>>6
							tháng</option>
						<option value="12months"
							<c:if test="${timeframe == '12months'}">selected</c:if>>12
							tháng</option>
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
						<h5 class="card-title">${statistics.newUsers} Người dùng đăng ký</h5>
						<canvas id="userChart"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mb-4">
					<div class="card-header bg-success text-white">Thống kê Bài
						đăng</div>
					<div class="card-body">
						<h5 class="card-title">${statistics.newPosts} Bài đăng</h5>
						<canvas id="postChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JS for Charts -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
    // Lấy dữ liệu từ server-side và gán giá trị mặc định nếu null
   const userData = ${statistics.newUsers != null ? statistics.newUsers : 0};
const postData = ${statistics.newPosts != null ? statistics.newPosts : 0};

    // Vẽ biểu đồ người dùng
    new Chart(document.getElementById('userChart'), {
        type: 'line',
        data: {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
            datasets: [{
                label: 'Người dùng đăng ký',
                data: [userData, 0, 0, 0, 0, 0], // Tạm thời dùng 1 giá trị nếu không có dữ liệu đầy đủ
                borderColor: 'rgba(54, 162, 235, 1)',
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
            }]
        }
    });

    // Vẽ biểu đồ bài đăng
    new Chart(document.getElementById('postChart'), {
        type: 'line',
        data: {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
            datasets: [{
                label: 'Bài đăng',
                data: [postData, 0, 0, 0, 0, 0], // Tạm thời dùng 1 giá trị nếu không có dữ liệu đầy đủ
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
            }]
        }
    });
</script>
<c:set var="userData" value="${statistics.newUsers != null ? statistics.newUsers : 0}" />
<c:set var="postData" value="${statistics.newPosts != null ? statistics.newPosts : 0}" />

<script>
    // Sử dụng biến từ JSP để truyền vào biểu đồ
    const userData = ${userData};
    const postData = ${postData};
</script>


</body>

</html>
