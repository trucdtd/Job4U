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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- DataTables CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- DataTables JS -->
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
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
									Bài Viết <br> <small class="text-muted">
										<div class="d-flex align-items-center">
											<input type="date" id="post-start-date"
												class="form-control me-2" onchange="updateData('posts')"
												style="width: 150px;"> <input type="date"
												id="post-end-date" class="form-control"
												onchange="updateData('posts')" style="width: 150px;">
										</div>
									</small>
								</h5>
								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-file-text"></i>
									</div>
									<div class="ps-3">
										<h6 id="post-count">${postToday}</h6>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xxl-4 col-md-6 mb-4">
						<div class="card info-card customers-card shadow-sm">
							<div class="card-body">
								<h5 class="card-title">
									Người Dùng <br> <small class="text-muted">
										<div class="d-flex align-items-center">
											<input type="date" id="user-start-date"
												class="form-control me-2" onchange="updateData('users')"
												style="width: 150px;"> <input type="date"
												id="user-end-date" class="form-control"
												onchange="updateData('users')" style="width: 150px;">
										</div>
									</small>
								</h5>

								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6 id="user-count">${usersToday}</h6>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xxl-4 col-md-6 mb-4">
						<div class="card info-card sales-card shadow-sm">
							<div class="card-body">
								<h5 class="card-title">
									Dịch Vụ <br> <small class="text-muted">
										<div class="d-flex align-items-center">
											<input type="date" id="sales-start-date"
												class="form-control me-2" onchange="updateData('services')"
												style="width: 150px;"> <input type="date"
												id="sales-end-date" class="form-control"
												onchange="updateData('services')" style="width: 150px;">
										</div>
									</small>
								</h5>

								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-cart" style="color: green;"></i>
									</div>
									<div class="ps-3">
										<h6 id="sales-count">${serviceToday}</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Table for Sold Services -->
					<div class="col-12">
						<div class="card recent-sales shadow-sm">
							<div class="card-body">
								<h5 class="card-title">Dịch Vụ Đã Bán</h5>
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
										<tr>
											<th style="color: red;" scope="row"><strong>Tổng
													Doanh Thu:</strong></th>
											<td></td>
											<td></td>
											<td style="color: red;"><c:choose>
													<c:when test="${totalRevenue != null}">
														<span style="display: inline-flex; align-items: center;">
															${totalRevenue.toString().replaceAll("(\\d)(?=(\\d{3})+(?!\\d))", "$1,")}
															VND </span>
													</c:when>
												</c:choose></td>
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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
	function updateData(type) {
	    // Lấy các phần tử nhập ngày bắt đầu và kết thúc cho từng loại thống kê
	    const startDateInput = document.getElementById(`${type}-start-date`);
	    const endDateInput = document.getElementById(`${type}-end-date`);

	    // Kiểm tra xem các phần tử có tồn tại hay không
	    if (!startDateInput || !endDateInput) {
	        console.error(`Không tìm thấy phần tử với ID ${type}-start-date hoặc ${type}-end-date`);
	        return;
	    }

	    const startDate = startDateInput.value;
	    const endDate = endDateInput.value;

	    // Kiểm tra xem cả hai ngày bắt đầu và kết thúc đã được chọn hay chưa
	    if (startDate && endDate) {
	        // Gọi API tương ứng để lấy dữ liệu thống kê
	        fetch(`/thongke/${type}?start=${startDate}&end=${endDate}`)
	            .then(response => response.json())
	            .then(data => {
	                // Cập nhật dữ liệu thống kê lên giao diện
	                document.getElementById(`${type}-count`).innerText = data.count;
	            })
	            .catch(error => console.error("Lỗi khi lấy dữ liệu:", error));
	    }
	}
	</script>

	<!-- Khởi tạo DataTable -->
	<script>
		$(document)
				.ready(
						function() {
							$('#tkTable')
									.DataTable(
											{
												"paging" : true,
												"searching" : true,
												"ordering" : true,
												"info" : true,
												"language" : {
													"paginate" : {
														"next" : "Tiếp theo",
														"previous" : "Trước đó"
													},
													"lengthMenu" : "Hiển thị _MENU_ mục",
													"info" : "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
													"zeroRecords" : "Không tìm thấy kết quả nào",
													"infoEmpty" : "Không có dữ liệu",
													"infoFiltered" : "(lọc từ _MAX_ mục)",
													"search" : "Tìm kiếm:"
												}
											});
						});
	</script>
</body>
</html>

