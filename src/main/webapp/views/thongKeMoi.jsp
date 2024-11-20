<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thống Kê</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- DataTables CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="/css/thongke.css">
</head>
<body>
	<%@ include file="/views/headerNoPanner.jsp"%>
	<div class="container">

		<section class="section dashboard">
			<div class="row">
				<!-- Title Section -->
				<div class="container mb-2">
				<div class="alert alert-danger ${status}" role="alert">${text}</div>
					<form action="/thongke" method="post" class="d-flex rounded-3">
						<div class="mb-3 me-2">
							<input type="date" class="form-control border-0 shadow"
								name="startdate" id="" aria-describedby="helpId" placeholder="" />
						</div>
						<div class="mb-3 me-3">
							<input type="date" class="form-control border-0 shadow"
								name="enddate" id="" aria-describedby="helpId" placeholder="" />
						</div>
						<div class=" mb-3 me-2">
							<button type="submit" class="btn btn-success mt-0 shadow">Thống
								kê</button>
						</div>
						<div class="mb-3">
							<a type="button" href="/thongke" class="btn btn-warning shadow">Thống kê tất cả</a>
						</div>

					</form>
				</div>
				<div class="row text-center">
					<!-- Sales Card -->
					<div class="col-xxl-4 col-md-6 mb-4">
						<div class="card info-card sales-card shadow border-0">
							<div class="card-body">
								<h5 class="card-title">
									Bài Viết <br>
									<!--<small class="text-muted">
										<!-- <div class="d-flex align-items-center">
											<input type="date" id="post-start-date"
												class="form-control me-2" style="width: 150px;"> <input
												type="date" id="post-end-date" class="form-control"
												style="width: 150px;">
										</div> -->
									<!-- </small> -->
								</h5>
								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-file-text"></i>
									</div>
									<div class="ps-3">
										<h6 id="post-count">${countJoblisting}</h6>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xxl-4 col-md-6 mb-2">
						<div class="card info-card customers-card shadow border-0">
							<div class="card-body">
								<h5 class="card-title">
									Người Dùng <br>
									<!-- <small class="text-muted">
										<div class="d-flex align-items-center">
											<input type="date" id="user-start-date"
												class="form-control me-2" style="width: 150px;"> <input
												type="date" id="user-end-date" class="form-control"
												style="width: 150px;">
										</div>
									</small> -->
								</h5>
								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6 id="user-count">${countUser}</h6>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xxl-4 col-md-6 mb-2">
						<div class="card info-card sales-card shadow border-0">
							<div class="card-body">
								<h5 class="card-title">
									Dịch Vụ <br>
									<!--  <small class="text-muted">
										<div class="d-flex align-items-center">
											<input type="date" id="service-start-date"
												class="form-control me-2" style="width: 150px;"> <input
												type="date" id="service-end-date" class="form-control"
												style="width: 150px;">
										</div>
									</small> -->
								</h5>
								<div class="d-flex align-items-center justify-content-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-cart" style="color: green;"></i>
									</div>
									<div class="ps-3">
										<h6 id="sales-count">${countService}</h6>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Table for Sold Services -->
					<div class="col-12">
						<div class="card recent-sales shadow border-0">
							<div class="card-body">
								<h5 class="card-title">Dịch Vụ Đã Bán</h5>
								<table id="tkTable" class="table table-borderless datatable">
									<thead>
										<tr>
											<th>Tên Dịch Vụ</th>
											<th>Tên Người Mua</th>
											<th>Ngày Mua</th>
											<th>Giá Tiền</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="totalRevenue" value="0" />
										<c:forEach items="${qlTK}" var="tk">
											<tr>
												<th scope="row">${tk.service.servicename}</th>
												<td>${tk.user.fullname}</td>
												<td class="purchaseDate">${tk.purchasedate}</td>
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
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script>
	function fetchStatistics(startDate, endDate, type) {
		let apiUrl;
		let countElement;

		// Xác định loại API và phần tử hiển thị số liệu
		if (type === 'post') {
			apiUrl = /thongke/posts?startDate=${startDate}&endDate=${endDate};
			countElement = $('#post-count');
		} else if (type === 'user') {
			apiUrl = /thongke/users?startDate=${startDate}&endDate=${endDate};
			countElement = $('#user-count');
		} else if (type === 'service') {
			apiUrl = /thongke/services?startDate=${startDate}&endDate=${endDate};
			countElement = $('#service-count');
		}
		// Log URL để kiểm tra giá trị của startDate và endDate trong URL
		console.log("API URL:", apiUrl);

		// Gửi yêu cầu AJAX
		$.ajax({
			url : apiUrl,
			type : 'GET',
			success : function(data) {
				countElement.text(data.count || 0); // Hiển thị 0 nếu không có dữ liệu
			},
			error : function(xhr, status, error) {
				console.error('Error fetching data:', error);
				countElement.text(0); // Hiển thị 0 trong trường hợp có lỗi
			}
		});
	}

	// Xử lý khi người dùng thay đổi ngày
	$('input[type="date"]')
			.on(
					'change',
					function() {
						let type = $(this).closest('.card').hasClass(
								'sales-card') ? 'post'
								: $(this).closest('.card').hasClass(
										'customers-card') ? 'user'
										: 'service';
						let startDate = $(this).closest('.card-body').find(
						'input[type="date"]').first().val();
				let endDate = $(this).closest('.card-body').find(
						'input[type="date"]').last().val();

				// Log giá trị của startDate và endDate để kiểm tra
				console.log("Start Date:", startDate);
				console.log("End Date:", endDate);

				if (startDate && endDate) {
					// Format ngày thành YYYY-MM-DD
					const formattedStartDate = new Date(startDate)
							.toISOString().slice(0, 10);
					const formattedEndDate = new Date(endDate)
							.toISOString().slice(0, 10);

					fetchStatistics(formattedStartDate,
							formattedEndDate, type);
				}
					});
			</script>

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

	<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Lấy tất cả các thẻ <td> có class="purchaseDate"
        const purchaseDateCells = document.querySelectorAll('.purchaseDate');

        // Duyệt qua tất cả các phần tử này
        purchaseDateCells.forEach(function(cell) {
            const purchasedate = cell.innerText;
            
            // Kiểm tra nếu purchasedate có giá trị hợp lệ
            if (purchasedate) {
                // Chuyển đổi thành đối tượng Date
                const date = new Date(purchasedate);

                // Đảm bảo rằng đối tượng Date hợp lệ
                if (!isNaN(date.getTime())) {
                    // Thay đổi giờ thành 09:00
                    date.setHours(9, 0, 0, 0);

                    // Định dạng lại ngày (chỉ lấy phần ngày mà không có giờ)
                    const formattedDate = date.toISOString().split('T')[0]; // "yyyy-MM-dd"

                    // Cập nhật lại nội dung của thẻ <td>
                    cell.innerText = formattedDate;
                } else {
                    console.error("Invalid date format.");
                }
            }
        });
    });
</script>
</body>
</html>