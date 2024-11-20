<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<title>Thống Kê Nhà Tuyển Dụng</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- DataTables CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
</head>

<body>
	<div class="container">
		<div class="row mt-3 justify-content-center">
			Từ Ngày
			<div class="col-12 col-md-3 mb-2">
				<input type="date" class="form-control" name="startdate"
					aria-describedby="helpId" placeholder="" />
			</div>
			Đến Ngày
			<div class="col-12 col-md-3 mb-2">
				<input type="date" class="form-control" name="enddate"
					aria-describedby="helpId" placeholder="" />
			</div>
			<div class="col-12 col-md-3 mb-2">
				<a type="button" class="btn btn-danger w-100">Tìm Kiếm</a>
			</div>
		</div>


		<!-- Row for the 3 Cards -->
		<div class="row mt-3 justify-content-between">
			<div class="col-md-4">
				<div class="pricing-card special">
					<div class="pricing-header">
						<h4 class="text-center">Bài Đăng</h4>
					</div>
					<div class="pricing-body text-center d-flex align-items-center justify-content-center"
					style="height: 80px;">
						<i class="bi bi-file-text me-2" style="color: green; font-size: 3rem;"></i>
							<h2  style="margin-bottom: 0;">${jobPostings.size()}</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="pricing-card special">
					<div class="pricing-header">
						<h4 class="text-center">CV Ứng tuyển</h4>
					</div>
					<div class="pricing-body text-center d-flex align-items-center justify-content-center"

					style="height: 80px;">
						<i class="bi bi-people me-2" style="color: green; font-size: 3rem;"></i>
							<h2  style="margin-bottom: 0;">${dsCV.size()}</h2>
						<!-- Màu xanh và kích thước lớn -->

					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="pricing-card special">
					<div class="pricing-header">
						<h4 class="text-center">Dịch Vụ Đã Mua</h4>
					</div>
					<div class="pricing-body text-center" style="height: 80px;">
						<div
							class="pricing-body text-center d-flex align-items-center justify-content-center"
							style="height: 80px;">
							<!-- Sử dụng Flexbox để căn chỉnh icon và số lượng trên cùng một hàng -->
							<i class="bi bi-bag-heart me-2"
								style="color: green; font-size: 3rem;"></i>
							<h2  style="margin-bottom: 0;">${dsDV.size()}</h2>
							<!-- Xóa margin dưới của h6 để căn chỉnh đúng -->
						</div>
					</div>
				</div>
			</div>

		</div>


		<!-- Bảng thống kê bài viết chấp nhận và từ chối -->
		<div class="table-responsive">
			<table id="statisticalTable" class="table align-items-center">
				<thead class="thead-light">
					<tr>
						<th scope="col">Tên Bài Viết</th>
						<th scope="col">Số Lượng CV</th>
						<th scope="col">Chấp Nhận</th>
						<th scope="col">Từ chối</th>
					</tr>
				</thead>
				<tbody>
					<!-- Lặp qua joblistings và hiển thị thông tin -->
					<c:forEach items="${joblistings}" var="joblist">
						<tr>
							<!-- Lấy tên bài viết -->
							<td>${joblist[0].jobtitle}</td>
							<!-- joblist[0] là đối tượng JoblistingsEntity -->
							<!-- Lấy tổng số CV -->
							<td>${joblist[1]}</td>
							<!-- joblist[1] là số lượng ứng tuyển -->
							<!-- Lấy số lượng chấp nhận -->
							<td>${joblist[2]}</td>
							<!-- joblist[2] là số lượng ứng tuyển đã chấp nhận -->
							<!-- Lấy số lượng từ chối -->
							<td>${joblist[3]}</td>
							<!-- joblist[3] là số lượng ứng tuyển bị từ chối -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


	</div>


	<script>
		$(document)
				.ready(
						function() {
							$('#statisticalTable')
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
													"zeroRecords" : "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
													"infoEmpty" : "Không có dữ liệu", // Thông báo khi không có hàng
													"infoFiltered" : "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
													"search" : "Tìm kiếm:", // Nhãn cho ô tìm kiếm
												}
											});
						});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- JS for DataTables -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</body>

</html>
