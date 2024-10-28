<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<!-- CSS for DataTables -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
										id="post-timeframe" onchange="updatePostData()">
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
										<h6 id="post-count">${postToday}</h6>
										<span class="text-success small fw-bold" id="post-percentage">0%</span>
										<span class="text-muted small">tăng</span>
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
										<h6 id="user-count">${usersToday}</h6>
										<span class="text-danger small fw-bold" id="user-percentage">0%</span>
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
									Dịch Vụ <span class="text-muted">| <select
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
										<i class="bi bi-cart" style="color: green;"></i>
										<!-- Biểu tượng giỏ hàng -->
									</div>
									<div class="ps-3">
										<h6 id="sales-count">${serviceToday}</h6>
										<span class="text-success small fw-bold" id="sales-percentage">0%</span>
										<span class="text-muted small">tăng</span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12">
						<div class="card recent-sales shadow-sm">
							<div class="card-body">
								<h5 class="card-title">Dịch Vụ Đã Bán</h5>
								<div class="table-responsive">
									<table id="tkTable" class="table table-borderless datatable">
										<thead>
											<tr>
												<th>Id Dịch Vụ</th>
												<th>Id Người Mua</th>
												<th>Ngày Mua</th>
												<th>Giá Tiền</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="totalRevenue" value="0" />
											<c:forEach items="${qlTK}" var="tk">
												<tr>
													<th scope="row">${tk.service.serviceid}</th>
													<td>${tk.user.userid}</td>
													<td>${tk.purchasedate}</td>
													<td><c:choose>
															<c:when test="${tk.service.price != null}">
																<span style="display: inline-flex; align-items: center;">
																	${tk.service.price.toString().replaceAll("(\\d)(?=(\\d{3})+(?!\\d))", "$1,")}
																	VND </span>
															</c:when>
														</c:choose></td>
												</tr>
												<c:set var="totalRevenue"
													value="${totalRevenue + tk.service.price}" />
											</c:forEach>
											<!-- Thêm dòng tính tổng doanh thu với màu đỏ -->
											<tr>
												<th style="color: red;" scope="row"><strong>Tổng
														Doanh Thu:</strong></th>
												<td></td>
												<!-- Cột User Id trống -->
												<td></td>
												<!-- Cột PurchaseDate trống -->

												<td style="color: red;"><c:choose>
														<c:when test="${totalRevenue != null}">
															<span style="display: inline-flex; align-items: center;">
																${totalRevenue.toString().replaceAll("(\\d)(?=(\\d{3})+(?!\\d))", "$1,")}
																VND </span>
														</c:when>
													</c:choose></td>
												<!-- Tổng doanh thu hiện ở cột Price -->
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
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->

	<!-- ChartJS and custom script -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		function updatePostData() {
			const timeframe = document.getElementById("post-timeframe").value;
			const postCountElement = document.getElementById("post-count");

			if (timeframe === "today") {
				postCountElement.innerText = "${postToday}";
			} else if (timeframe === "6months") {
				postCountElement.innerText = "${post6Months}";
			} else if (timeframe === "1year") {
				postCountElement.innerText = "${post1Year}";
			}
		}

		function updateUserData() {
	        const timeframe = document.getElementById("user-timeframe").value;
	        const userCountElement = document.getElementById("user-count");

	        if (timeframe === "today") {
	            userCountElement.innerText = "${usersToday}";
	        } else if (timeframe === "6months") {
	            userCountElement.innerText = "${usersSixMonths}";
	        } else if (timeframe === "1year") {
	            userCountElement.innerText = "${usersOneYear}";
	        }
	    }

		function updateSalesData() {
			const timeframe = document.getElementById("sales-timeframe").value;
			const salesCountElement = document.getElementById("sales-count");

			if (timeframe === "today") {
				salesCountElement.innerText = "${serviceToday}";
			} else if (timeframe === "6months") {
				salesCountElement.innerText = "${service6Months}";
			} else if (timeframe === "1year") {
				salesCountElement.innerText = "${service1Year}";
			}
		}
	</script>
	<script>
$(document).ready(function() {
    $('#tkTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });
</script>
</body>
</html>

