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

		<form action="/employers/thongKeTheoNgay" method="post">
			<div class="d-flex align-items-center p-2">
				<div class="mb-3 me-2">
					<input type="date" class="form-control border-0 shadow"
						name="startdate" id="startdate" />
				</div>
				<div class="mb-3 me-3">
					<input type="date" class="form-control border-0 shadow"
						name="enddate" id="enddate" />
				</div>
				<div class="row p-2">
					<div class="mb-3 me-2">
						<button type="submit" class="btn btn-danger mt-0 shadow">Tìm
							Kiếm</button>
					</div>
				</div>
		</form>
		<form action="/employers/thongKeTatCa" method="post">
			<input type="hidden" name="employerid" value="${employer.employerid}" />
			<div class="mb-3 me-2">
				<button type="submit" class="btn btn-warning shadow">Thống
					kê tất cả</button>
			</div>
		</form>


		<div class="mb-3 me-2">
			<button id="exportExcel" class="btn btn-primary shadow mt-0">Xuất
				Excel</button>
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
					<i class="bi bi-people me-2" style="color: green; font-size: 3rem;"></i>
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
document.getElementById("exportExcel").addEventListener("click", function() {
    // Lấy dữ liệu từ JSP (đã chuyển thành JSON)
    const jobPostings = ${jobPostings}; // Dữ liệu jobPostings (list các job)
    const totalApplicationsMap = ${totalApplicationsMap}; // Dữ liệu totalApplicationsMap
    const acceptedApplicationsMap = ${acceptedApplicationsMap}; // Dữ liệu acceptedApplicationsMap
    const rejectedApplicationsMap = ${rejectedApplicationsMap}; // Dữ liệu rejectedApplicationsMap
    const pendingApplicationsMap = ${pendingApplicationsMap}; // Dữ liệu pendingApplicationsMap

    // Tạo workbook mới
    const wb = XLSX.utils.book_new();

    // Tạo header cho worksheet
    const header = ["Tên Bài Viết", "Số Lượng CV", "Chấp Nhận", "Từ Chối", "Chờ Xử Lý"];

    // Tạo dữ liệu cho worksheet từ các job postings
    const data = jobPostings.map(job => [
        job.jobtitle, // Tên bài viết
        totalApplicationsMap[job.jobid] || 0, // Tổng số ứng tuyển
        acceptedApplicationsMap[job.jobid] || 0, // Số ứng tuyển đã chấp nhận
        rejectedApplicationsMap[job.jobid] || 0, // Số ứng tuyển đã từ chối
        pendingApplicationsMap[job.jobid] || 0 // Số ứng tuyển đang chờ xử lý
    ]);

    // Thêm header vào đầu dữ liệu
    data.unshift(header);

    // Chuyển dữ liệu thành worksheet
    const ws = XLSX.utils.aoa_to_sheet(data);

    // Thêm worksheet vào workbook
    XLSX.utils.book_append_sheet(wb, ws, "ThongKe");

    // Xuất workbook ra file Excel
    XLSX.writeFile(wb, "ThongKeNhaTuyenDung.xlsx");
});
</script>

</body>

</html>
