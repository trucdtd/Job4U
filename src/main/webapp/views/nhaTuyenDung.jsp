<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà tuyển dụng</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/quanlyuser.css">
<style>
.sidebar a {
	color: white;
	text-decoration: none;
	padding: 10px 20px;
	display: block;
	border-radius: 4px;
}

.sidebar a:hover, .sidebar a.active {
	background-color: #0056b3;
}

.content {
	flex-grow: 1;
	padding: 20px;
	background-color: #f8f9fa;
}

.card {
	margin-bottom: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #00688B;
	color: white;
	border-bottom: none;
	border-radius: 8px 8px 0 0;
}

.table th, .table td {
	vertical-align: middle;
}

.table thead th {
	background-color: #00688B;
	color: white;
}

.btn-primary, .btn-danger {
	border-radius: 4px;
}
</style>
<link rel="stylesheet" href="/css/header.css">
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- header -->
		<div class="container">
			<div class="row">
				<!-- aside -->
				<div class="col-lg-3 col-md-3 p-2 d-flex">
					<div class="d-flex flex-column flex-shrink-0 p-3 text-white"
						style="width: 100%; background: #00688B;">
						<a href="#"
							class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none text-center">
							<i class="bi bi-bootstrap" style="font-size: 25px;"></i> <span
							class="fs-4 ms-2">Menu Tuyển Dụng</span>
						</a>
						<hr>
						<ul class="nav nav-pills flex-column mb-auto">
							<li><a href="#" class="nav-link text-white active"
								onclick="showTable(event, 'employersManagement')"> <i
									class="bi bi-speedometer2 me-2"></i> Quản Lý Tuyển Dụng
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'postEmployers')"> <i
									class="bi bi-table me-2"></i> Đăng Bài Tuyển Dụng
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'cvApply')"> <i
									class="bi bi-grid me-2"></i> CV Ứng Tuyển
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'postingServices')"> <i
									class="bi bi-house me-2"></i> Dịch Vụ Bài Đăng
							</a></li>
						</ul>
						<hr>
					</div>
				</div>
				<!-- aside -->

				<!-- article -->
				<!-- Quản Lý Tuyển Dụng -->
				<div class="col-lg-9 col-md-9 p-2">
					<!-- Home table -->
					<div id="employersManagement" class="card">
						<div class="card-header">
							<div class="card-title">Quản Lý Tuyển Dụng</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">Tên Công Việc</th>
											<th scope="col">Vị Trí</th>
											<th scope="col">Ngày Đăng</th>
											<th scope="col">Hạn Nộp Hồ Sơ</th>
											<th scope="col">Hành Động</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Java Developer</td>
											<td>Hà Nội</td>
											<td>2023-07-30</td>
											<td>2023-08-30</td>
											<td>
												<button type="button" class="btn btn-sm btn-primary">Chỉnh
													Sửa</button>
												<button type="button" class="btn btn-sm btn-danger">Xóa</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- Bảng quản lý bài đăng-->
					<div id="postEmployers" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title p-1">Đăng Bài Tuyển Dụng</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<div class="card-body p-0">
									<form class="p-4" action="/job4u/employers/submit" method="post" id="nhaTuyenDung" enctype="multipart/form-data">
										<div class="row">
											<div class="col-md-6 p-2">
												<label for="companyname" class="form-label">Tên công
													ty</label> <input type="text" class="form-control" id="companyname"
													name="companyname" value="${employer.companyname}">
											</div>
											<div class="col-md-6 p-2">
												<label for="companywebsite" class="form-label">Tên
													web công ty</label> <input type="text" class="form-control"
													id="companywebsite" name="companywebsite" value="${employer.companywebsite}">
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 p-2">
												<label for="address" class="form-label">Địa chỉ công
													ty</label> <input type="text" class="form-control" id="address"
													name="address" value="${employer.address}">
											</div>
											<div class="col-md-6 p-2">
												<label for="industry" class="form-label">Ngành nghề</label>
												<select class="form-control" id="industry" name="industry"
													required>
													<option value="" disabled selected>Chọn ngành nghề</option>
													<option value="Nông nghiệp">Nông nghiệp</option>
													<option value="Công nghiệp">Công nghiệp</option>
													<option value="Dịch vụ">Dịch vụ</option>
													<option value="construction">Xây dựng</option>
													<option value="Giao thông vận tải">Giao thông vận
														tải</option>
													<option value="Công nghệ thông tin<">Công nghệ
														thông tin</option>
													<option value="Tài chính">Tài chính</option>
													<option value="Giáo dục">Giáo dục</option>
													<option value="Y tế">Y tế</option>
													<option value="Truyền thông">Truyền thông</option>
													<option value="Công nghệ ô tô">Công nghệ ô tô</option>
													<option value="Du lịch">Du lịch</option>
													<option value="Hành chính văn phòng">Hành chính
														văn phòng</option>
													<option value="Khác">Khác...</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 p-2">
												<label for="contactperson" class="form-label">Người
													liên hệ</label> <input type="text" class="form-control"
													id="contactperson" name="contactperson">
											</div>
											<div class="col-md-6 p-2">
												<label for="logo" class="form-label">Logo công ty</label>
												<input type="file" class="form-control" id="logo" name="logo">
											</div>
										</div>
										<div class="row ">
											<div class="col-md-6 p-2">
												<label for="jobtitle" class="form-label">Tiêu đề
													công việc</label> <input type="text" class="form-control"
													id="jobtitle" name="jobtitle" required>
											</div>
											<div class="col-md-6 p-2">
												<label for="joblocation" class="form-label">Địa điểm
													làm việc</label>
												<!-- <input type="text" class="form-control"
													id="joblocation" name="joblocation" required> -->
												<select class="form-select" id="joblocation"
													name="joblocation">
													<option value="All" selected>Tất cả</option>
													<option value="An Giang">An Giang</option>
													<option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng
														Tàu</option>
													<option value="Bạc Liêu">Bạc Liêu</option>
													<option value="Bắc Giang">Bắc Giang</option>
													<option value="Bắc Kạn">Bắc Kạn</option>
													<option value="Bắc Ninh">Bắc Ninh</option>
													<option value="Bến Tre">Bến Tre</option>
													<option value="Bình Định">Bình Định</option>
													<option value="Bình Dương">Bình Dương</option>
													<option value="Bình Phước">Bình Phước</option>
													<option value="Bình Thuận">Bình Thuận</option>
													<option value="Cà Mau">Cà Mau</option>
													<option value="Cao Bằng">Cao Bằng</option>
													<option value="Cần Thơ">Cần Thơ</option>
													<option value="Đà Nẵng">Đà Nẵng</option>
													<option value="Đắk Lắk">Đắk Lắk</option>
													<option value="Đắk Nông">Đắk Nông</option>
													<option value="Điện Biên">Điện Biên</option>
													<option value="Đồng Nai">Đồng Nai</option>
													<option value="Đồng Tháp">Đồng Tháp</option>
													<option value="Gia Lai">Gia Lai</option>
													<option value="Hà Giang">Hà Giang</option>
													<option value="Hà Nam">Hà Nam</option>
													<option value="Hà Nội">Hà Nội</option>
													<option value="Hà Tĩnh">Hà Tĩnh</option>
													<option value="Hải Dương">Hải Dương</option>
													<option value="Hải Phòng">Hải Phòng</option>
													<option value="Hậu Giang">Hậu Giang</option>
													<option value="Hòa Bình">Hòa Bình</option>
													<option value="Hưng Yên">Hưng Yên</option>
													<option value="Khánh Hòa">Khánh Hòa</option>
													<option value="Kiên Giang">Kiên Giang</option>
													<option value="Kon Tum">Kon Tum</option>
													<option value="Lai Châu">Lai Châu</option>
													<option value="Lâm Đồng">Lâm Đồng</option>
													<option value="Lạng Sơn">Lạng Sơn</option>
													<option value="Lào Cai">Lào Cai</option>
													<option value="Long An">Long An</option>
													<option value="Nam Định">Nam Định</option>
													<option value="Nghệ An">Nghệ An</option>
													<option value="Ninh Bình">Ninh Bình</option>
													<option value="Ninh Thuận">Ninh Thuận</option>
													<option value="Phú Thọ">Phú Thọ</option>
													<option value="Phú Yên">Phú Yên</option>
													<option value="Quảng Bình">Quảng Bình</option>
													<option value="Quảng Nam">Quảng Nam</option>
													<option value="Quảng Ngãi">Quảng Ngãi</option>
													<option value="Quảng Ninh">Quảng Ninh</option>
													<option value="Quảng Trị">Quảng Trị</option>
													<option value="Sóc Trăng">Sóc Trăng</option>
													<option value="Sơn La">Sơn La</option>
													<option value="Tây Ninh">Tây Ninh</option>
													<option value="Thái Bình">Thái Bình</option>
													<option value="Thái Nguyên">Thái Nguyên</option>
													<option value="Thanh Hóa">Thanh Hóa</option>
													<option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
													<option value="Tiền Giang">Tiền Giang</option>
													<option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
													<option value="Trà Vinh">Trà Vinh</option>
													<option value="Tuyên Quang">Tuyên Quang</option>
													<option value="Vĩnh Long">Vĩnh Long</option>
													<option value="Vĩnh Phúc">Vĩnh Phúc</option>
													<option value="Yên Bái">Yên Bái</option>
												</select>
											</div>
										</div>
										<div class="row ">
											<div class="col-md-6 p-2">
												<label for="jobtype" class="form-label">Loại công
													việc</label> <select id="jobtype" name="jobtype"
													class="form-select" required>
													<option value="" disabled selected>Chọn 1 loại
														công việc</option>
													<option value="full-time">Công việc toàn thời gian</option>
													<option value="part-time">Công việc bán thời gian</option>
													<option value="temporary">Công việc thời vụ</option>
													<option value="contract">Công việc theo hợp đồng</option>
													<option value="freelance">Công việc tự do</option>
												</select>
											</div>
											<div class="col-md-6 p-2">
												<label for="salary" class="form-label">Lương</label>
												<div class="input-group">
													<span class="input-group-text">$</span> <input
														type="number" class="form-control salary-input"
														id="salary" name="salary" min="0">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 p-2">
												<label for="companydescription" class="form-label">Mô
													tả về công ty</label>
												<textarea class="form-control" id="companydescription" name="companydescription" rows="4" required>${employer.companydescription}</textarea>
											</div>

										</div>
										<div class="row">
											<div class="col-md-12 p-2">
												<label for="jobrequirements" class="form-label">Yêu
													cầu công việc</label>
												<textarea class="form-control" id="jobrequirements"
													name="jobrequirements" rows="4" required></textarea>
											</div>

										</div>
										<div class="row">
											<div class="col-md-6 p-2">
												<label for="posteddate" class="form-label">Ngày đăng</label>
												<input type="datetime-local" class="form-control"
													id="posteddate" name="posteddate" required>
											</div>
											<div class="col-md-6 p-2">
												<label for="applicationdeadline" class="form-label">Hạn
													nộp hồ sơ</label> <input type="datetime-local" class="form-control"
													id="applicationdeadline" name="applicationdeadline"
													required>
											</div>
										</div>
										<hr>
										<button type="submit" class="btn text-light p-2"
											style="background-color: #00688B">Đăng bài</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Quản lý cv -->
					<div id="cvApply" class="card" style="display: none;">

						<div class="card-header">
							<div class="card-title">CV Ứng tuyển</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">Tiêu để bài viết</th>
											<th scope="col">Thông tin ứng tuyển</th>
											<th scope="col">CV ứng tuyển</th>
											<th scope="col">Thời gian nộp hồ sơ</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>Tuyển dụng nhân viên IT Java</th>
											<td>Trần Thảo Trinh
												<button type="submit" class="btn text-light text-white p-2"
													style="background-color: #00688B">Xem Thêm</button>
											</td>
											<td>CV ứng tuyển</td>

										</tr>
										<!-- Add more rows as needed -->
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- Dịch vụ -->
					<div id="postingServices" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Dịch vụ bài đăng</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<p>thêm thông tin</p>
							</div>
						</div>
					</div>
				</div>
				<!-- article -->
			</div>
		</div>
		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- footer -->
	</div>


</body>
<script>
	function showTable(event, tableId) {
		event.preventDefault(); // Ngăn chặn hành vi mặc định

		// Ẩn tất cả các bảng
		var tables = document.querySelectorAll('.col-md-9 .card');
		tables.forEach(function(table) {
			table.style.display = 'none';
		});

		// Hiển thị bảng được chọn
		document.getElementById(tableId).style.display = 'block';

		// Loại bỏ lớp active khỏi tất cả các liên kết
		var links = document.querySelectorAll('.nav-link');
		links.forEach(function(link) {
			link.classList.remove('active');
		});

		// Thêm lớp active vào liên kết được bấm
		var activeLink = document.querySelector('.nav-link[onclick*="'
				+ tableId + '"]');
		activeLink.classList.add('active');
	}
</script>

</html>
