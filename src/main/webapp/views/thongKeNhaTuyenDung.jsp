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
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<div class="container">
		<div class="d-flex align-items-center p-2">
			<form action="/employers/thongKeTheoKhoangThoiGian" method="get">
				<div class="d-flex align-items-center p-2">
					<!-- First Input Field for Start Date -->
					<div class="mb-3 me-2">
						<input type="date" class="form-control border-0 shadow"
							name="startdate" id="startdate" />
					</div>

					<!-- Second Input Field for End Date -->
					<div class="mb-3 me-2">
						<input type="date" class="form-control border-0 shadow"
							name="enddate" id="enddate" />
					</div>

					<!-- Search Button -->
					<div class="mb-3 me-2">
						<button type="submit" class="btn btn-danger mt-0 shadow">Tìm
							Kiếm</button>
					</div>
				</div>
			</form>

			<!-- Second Form for Statistics -->
			<form action="/employers/thongKeTatCa" method="post">
				<input type="hidden" name="employerid"
					value="${employer.employerid}" />
				<!-- Button for "Thống kê tất cả" -->
				<div class="mb-3 me-2">
					<button type="submit" class="btn btn-warning shadow mt-0">Thống
						kê tất cả</button>
				</div>
			</form>

			<!-- Export Button -->
			<div class="d-flex align-items-center p-2">
				<div class="mb-3 me-2">
					<button id="exportExcel" class="btn btn-primary shadow mt-0">Xuất
						Excel</button>
				</div>
			</div>
		</div>

		<!-- Row for the 3 Cards -->
		<div class="row mt-3 justify-content-between">
			<div class="col-md-4">
				<div class="pricing-card special">
					<div class="pricing-header">
						<h4 class="text-center">Bài Đăng</h4>
					</div>
					<div
						class="pricing-body text-center d-flex align-items-center justify-content-center"
						style="height: 80px;">
						<i class="bi bi-file-text me-2"
							style="color: green; font-size: 3rem;"></i>
						<h2 style="margin-bottom: 0;">${jobPostings.size()}</h2>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="pricing-card special">
					<div class="pricing-header">
						<h4 class="text-center">CV Ứng tuyển</h4>
					</div>
					<div
						class="pricing-body text-center d-flex align-items-center justify-content-center"
						style="height: 80px;">
						<i class="bi bi-people me-2"
							style="color: green; font-size: 3rem;"></i>
						<h2 style="margin-bottom: 0;">${applicationsMap.size()}</h2>
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
							<h2 style="margin-bottom: 0;">${userServices.size()}</h2>
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
						<th scope="col">Chờ xem</th>
				</thead>
				<tbody>
					<!-- Lặp qua từng bài đăng -->
					<c:forEach items="${jobPostings}" var="jobPosting">
						<tr>
							<!-- Lấy tên bài viết -->
							<td>${jobPosting.jobtitle}</td>

							<!-- Hiển thị tổng số CV đã ứng tuyển cho bài viết này -->
							<td>${totalApplicationsMap[jobPosting.jobid]}</td>
							<!-- Truy xuất số lượng ứng tuyển từ Map -->

							<!-- Hiển thị số lượng CV đã chấp nhận -->
							<td>${acceptedApplicationsMap[jobPosting.jobid]}</td>

							<!-- Hiển thị số lượng CV đã từ chối -->
							<td>${rejectedApplicationsMap[jobPosting.jobid]}</td>

							<!-- Hiển thị số lượng CV đang chờ -->
							<td>${pendingApplicationsMap[jobPosting.jobid]}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>



	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->

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

	<script>
		document
				.querySelector('form')
				.addEventListener(
						'submit',
						function(event) {
							// Lấy giá trị ngày bắt đầu và ngày kết thúc
							const startdate = document
									.getElementById('startdate').value;
							const enddate = document.getElementById('enddate').value;

							// Kiểm tra xem người dùng có nhập ngày bắt đầu và ngày kết thúc không
							if (!startdate) {
								alert("Vui lòng chọn ngày bắt đầu ");
								event.preventDefault(); // Ngừng gửi form nếu điều kiện không thỏa mãn
								return;
							}
							// Kiểm tra xem người dùng có nhập ngày bắt đầu và ngày kết thúc không
							if (!enddate) {
								alert("Vui lòng chọn ngày kết thúc.");
								event.preventDefault(); // Ngừng gửi form nếu điều kiện không thỏa mãn
								return;
							}

							// Kiểm tra ngày kết thúc không được lớn hơn ngày bắt đầu
							if (new Date(enddate) < new Date(startdate)) {
								alert("Ngày kết thúc không được lớn hơn ngày bắt đầu.");
								event.preventDefault(); // Ngừng gửi form nếu điều kiện không thỏa mãn
								return;
							}
						});
	</script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
	<script>
		document.getElementById("exportExcel").addEventListener(
				"click",
				function() {
					const table = document.getElementById("statisticalTable"); // ID của bảng
					const wb = XLSX.utils.book_new(); // Tạo workbook mới
					const ws = XLSX.utils.table_to_sheet(table); // Tạo worksheet từ bảng

					// Thêm worksheet vào workbook
					XLSX.utils.book_append_sheet(wb, ws,
							"ThongKeBaiDangTuyenDung");

					// Xuất workbook ra file Excel
					XLSX.writeFile(wb, "ThongKeBaiDangTuyenDung.xlsx");
				});
	</script>



</body>

</html>
