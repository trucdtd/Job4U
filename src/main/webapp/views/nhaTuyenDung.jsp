<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<title>Nhà tuyển dụng</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/nhaTuyendung.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->

	<div class="container">
		<div class="container mt-4">
			<!-- Thông báo thành công -->
			<div id="success" class="alert alert-success" style="display: none;"
				role="alert"></div>

			<!-- Thông báo lỗi -->
			<div id="error" class="alert alert-danger" style="display: none;"
				role="alert"></div>

			<!-- Nội dung trang -->
		</div>
		<div class="row">
			<!-- aside -->
			<div class="col-lg-3 col-md-3 p-2 d-flex">
				<div class="d-flex flex-column flex-shrink-0 p-3 text-dark"
					style="width: 100%; background: #EEEEEE;">
					<a href="#"
						class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none text-center">
						<i class="bi bi-bootstrap" style="font-size: 35px;"></i> <span
						class="fs-4 ms-2">Menu Tuyển Dụng</span>
					</a>
					<hr>
					<ul class="nav nav-pills flex-column mb-auto">
						<li><a href="#" class=" navnhatuyendung nav-link text-dark active"
							onclick="showTable(event, 'employersManagement')"> <i
								class="bi bi-speedometer2 me-2"></i> Quản Lý Bài Đăng
						</a></li>
						<li><a href="#" class="navnhatuyendung nav-link text-dark"
							onclick="showTable(event, 'postEmployers')"> <i
								class="bi bi-table me-2"></i> Đăng Bài Tuyển Dụng
						</a></li>
						<li><a href="#" class="navnhatuyendung nav-link text-dark"
							onclick="showTable(event, 'cvApply')"> <i
								class="bi bi-grid me-2"></i> CV Ứng Tuyển
						</a></li>
						<li><a href="#" class="navnhatuyendung nav-link text-dark"
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
				<div id="employersManagement" class="card">
					<div class="card-header">
						<div class="card-title">Quản Lý Bài Đăng Tuyển Dụng</div>
					</div>
					<div class="card-body p-0">
						<form class="p-2" action="/employers" method="get"
							id="nhaTuyenDung">
							<div class="table-responsive">
								<table id="myTable" class="table align-items-center">
									<thead class="thead-light">
										<tr>
											<th scope="col">Tên Công Việc</th>
											<th scope="col">Vị Trí</th>
											<!-- <th scope="col">Mô Tả Công Việc</th>
											<th scope="col">Yêu Cầu</th> -->
											<th scope="col">Lương</th>
											<th scope="col">Loại Công Việc</th>
											<th scope="col">Ngày Đăng</th>
											<!-- <th scope="col">Hạn Nộp Hồ Sơ</th> -->
											<th scope="col">Trạng Thái</th>
											<th scope="col">Hành Động</th>
											<th scope="col">Xem CV</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${jobPostings}" var="job">
											<tr data-jobid="${job.jobid}">
												<td>${job.jobtitle}</td>
												<td>${job.joblocation}</td>
												<%-- <td>${job.jobdescription}</td>
												<td>${job.jobrequirements}</td> --%>
												<td><span
													style="display: inline-flex; align-items: center;">
														<script>
												            var salary = Number(${job.salary});
												            if (!isNaN(salary)) {
												                document.write(salary.toLocaleString('vi-VN') + ' VND');
												            } else {
												                document.write('N/A');
												            }
												        </script>
												</span></td>
												<td>${job.jobtype}</td>
												<td class="formatted-date" data-date="${job.posteddate}"></td>
												<%-- <td>${job.applicationdeadline}</td> --%>
												<td>${job.active ? 'Hoạt Động' : 'Không Hoạt Động'}</td>
												<td>
													<div class="d-flex align-items-center">
														<button type="button" class="btn btn-sm btn-edit me-2"
															data-jobid="${job.jobid}" data-jobtitle="${job.jobtitle}"
															data-joblocation="${job.joblocation}"
															data-jobdescription="${job.jobdescription}"
															data-jobrequirements="${job.jobrequirements}"
															data-salary="${job.salary}" data-jobtype="${job.jobtype}"
															data-posteddate="${job.posteddate}"
															data-applicationdeadline="${job.applicationdeadline}">
															<img src="/img/icons8-edit-50.png" height="25px"
																width="25px" alt="Chỉnh sửa" />
														</button>
														<form action="/employers/delete" method="post"
															style="display: inline;"
															onsubmit="return confirmDelete();">
															<input type="hidden" name="jobId" value="${job.jobid}">
															<button type="submit" class="btn btn-sm">
																<img src="/img/icons8-delete-50.png" height="25px"
																	width="25px" alt="Xóa" />
															</button>
														</form>
													</div>
												</td>
												<!-- XEM CV -->
												<td>
													<form action="/job4u/employers/xemcv" method="post"
														onsubmit="return false;">
														<!-- Ngăn form gửi -->
														<button type="button" class="btn btn-sm btn-detail"
															data-bs-toggle="modal" data-bs-target="#detailModal"
															onclick="fetchCV(${job.jobid})">
															<img alt="" src="/img/icons8-eye-24.png" height="25px">
														</button>
													</form>
												</td>
												<!-- XEM CV -->
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>


				<!-- Modal Xem CV -->
				<div class="modal fade" id="detailModal" tabindex="-1"
					aria-labelledby="detailModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="detailModalLabel">CV đã nộp</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<table class="table">
									<thead>
										<tr>
											<th>Tên Ứng Viên</th>
											<th>Ngày Nộp</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${dsCV}" var="application">
											<tr>
												<td>${application.jobseeker.user.fullname}</td>
												<td>${application.jobseeker.createdat}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Đóng</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Bảng quản lý bài đăng-->
				<!-- bài đăng -->
				<div id="postEmployers" class="card" style="display: none;">
					<div class="card-header">
						<div class="card-title p-1">Đăng Bài Tuyển Dụng</div>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<div class="card-body p-0">
								<form class="p-4" action="/employers/submit" method="post"
									id="nhaTuyenDung" enctype="multipart/form-data">
									<div class="row">
										<div class="col-md-6 p-2">
											<label for="companyname" class="form-label">Tên công
												ty</label> <input type="text" class="form-control" id="companyname"
												name="companyname" value="${employer.companyname}" readonly>
										</div>
										<div class="col-md-6 p-2">
											<label for="companywebsite" class="form-label">Tên
												web công ty</label> <input type="text" class="form-control"
												id="companywebsite" name="companywebsite"
												value="${employer.companywebsite}" readonly>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 p-2">
											<label for="address" class="form-label">Địa chỉ công
												ty</label> <input type="text" class="form-control" id="address"
												name="address" value="${employer.address}" readonly>
										</div>
										<div class="col-md-6 p-2">
											<label for="industry" class="form-label">Ngành nghề</label> <select
												class="form-control" id="industry" name="industry" required>
												<option value="" disabled selected>Chọn ngành nghề</option>
												<option value="Nông nghiệp">Nông nghiệp</option>
												<option value="Công nghiệp">Công nghiệp</option>
												<option value="Dịch vụ">Dịch vụ</option>
												<option value="Xây dựng">Xây dựng</option>
												<option value="Giao thông vận tải">Giao thông vận
													tải</option>
												<option value="Công nghệ thông tin">Công nghệ thông
													tin</option>
												<option value="Tài chính">Tài chính</option>
												<option value="Giáo dục">Giáo dục</option>
												<option value="Y tế">Y tế</option>
												<option value="Truyền thông">Truyền thông</option>
												<option value="Công nghệ ô tô">Công nghệ ô tô</option>
												<option value="Du lịch">Du lịch</option>
												<option value="Hành chính văn phòng">Hành chính văn
													phòng</option>
												<option value="Khác">Khác...</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 p-2">
											<label for="jobtitle" class="form-label">Tiêu đề công
												việc</label> <input type="text" class="form-control" id="jobtitle"
												name="jobtitle" required>
										</div>
										<div class="col-md-12 p-2">
											<label for="logo" class="form-label">Logo công ty</label> <input
												type="file" class="form-control" id="logo" name="logo">
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 p-2">
											<label for="contactperson" class="form-label">Người
												liên hệ</label> <input type="text" class="form-control"
												id="contactperson" name="contactperson">
										</div>
										<div class="col-md-6 p-2">
											<label for="joblocation" class="form-label">Địa điểm
												làm việc</label> <select class="form-select" id="joblocation"
												name="joblocation">
												<option value="All" selected>Tất cả</option>
												<option value="An Giang">An Giang</option>
												<option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
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
									<div class="row">
										<div class="col-md-6 p-2">
											<label for="jobtype" class="form-label">Loại công
												việc</label> <select id="jobtype" name="jobtype" class="form-select"
												required>
												<option value="" disabled selected>Chọn 1 loại công
													việc</option>
												<option value="Toàn thời gian">Công việc toàn thời
													gian</option>
												<option value="Bán thời gian">Công việc bán thời
													gian</option>
												<option value="Thời vụ">Công việc thời vụ</option>
												<option value="Hợp đồng">Công việc theo hợp đồng</option>
												<option value="Tự do">Công việc tự do</option>
											</select>
										</div>
										<div class="col-md-6 p-2">
											<label for="salary" class="form-label">Lương</label>
											<div class="input-group">
												<span class="input-group-text">VND</span> <input
													type="number" class="form-control salary-input" id="salary"
													name="salary" min="0">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 p-2">
											<label for="companydescription" class="form-label">Mô
												tả về công ty</label>
											<textarea class="form-control" id="companydescription"
												name="companydescription" rows="4" readonly>${employer.companydescription}</textarea>
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
										<div class="col-md-12 p-2">
											<label for="jobdescription" class="form-label">Mô tả
												công việc</label>
											<textarea class="form-control" id="jobdescription"
												name="jobdescription" rows="4" required></textarea>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 p-2">
											<label for="posteddate" class="form-label">Ngày đăng</label>
											<input type="date" class="form-control" id="posteddate"
												name="posteddate" required>
										</div>
										<div class="col-md-6 p-2">
											<label for="applicationdeadline" class="form-label">Hạn
												nộp hồ sơ</label> <input type="date" class="form-control"
												id="applicationdeadline" name="applicationdeadline" required>
										</div>
									</div>
									<hr>
									<button type="submit" class="btn text-light p-2"
										style="background-color: #198754">Đăng bài</button>
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
					<div class="card-body p-2">
						<div class="table-responsive">
							<table id="cvTable" class="table align-items-center">
								<thead class="thead-light">
									<tr>
										<th scope="col">Tiêu để bài viết</th>
										<th scope="col">Thông tin người ứng tuyển</th>
										<th scope="col">Tên CV ứng tuyển</th>
										<th scope="col">Thời gian nộp hồ sơ</th>
										<th scope="col">Chi tiết hồ sơ</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dsCV}" var="cv">
										<tr>
											<th>${cv.job.jobtitle}</th>
											<td>${cv.jobseeker.user.fullname}</td>
											<th>${cv.resume}</th>
											<td class="formatted-date" data-date="${cv.applicationdate}"></td>
											<td>
												<form action="/cvDetails/${cv.applicationid}" method="get"
													style="display: inline;">
													<button type="submit"
														class="btn btn-success text-light text-white p-2">Xem
														Thêm</button>
												</form>
											</td>
										</tr>
									</c:forEach>
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
					<%@ include file="/views/dichVu.jsp"%>
					<br>
				</div>
			</div>
			<!-- article -->
		</div>

		<!-- Modal Chỉnh Sửa Bài Đăng Tuyển Dụng-->
		<div class="modal fade" id="editJobModal" tabindex="-1"
			aria-labelledby="editJobModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="editJobModalLabel">Chỉnh Sửa Bài
							Đăng Tuyển Dụng</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="editJobForm" action="/employers/edit" method="post">
							<input type="hidden" id="jobId" name="jobId" />
							<div class="mb-3">
								<label for="jobTitle" class="form-label">Tên Công Việc</label> <input
									type="text" class="form-control" id="jobTitle" name="jobTitle" />
							</div>
							<div class="mb-3">
								<label for="jobLocation" class="form-label">Vị Trí</label> <input
									type="text" class="form-control" id="jobLocation"
									name="jobLocation" />
							</div>
							<div class="mb-3">
								<label for="jobDescription" class="form-label">Mô Tả
									Công Việc</label>
								<textarea class="form-control" id="jobDescription"
									name="jobDescription"></textarea>
							</div>
							<div class="mb-3">
								<label for="jobRequirements" class="form-label">Yêu Cầu</label>
								<textarea class="form-control" id="jobRequirements"
									name="jobRequirements"></textarea>
							</div>
							<div class="mb-3">
								<label for="salary" class="form-label">Lương</label> <input
									type="number" class="form-control" id="salaryEdit"
									name="salaryEdit" />
							</div>
							<div class="mb-3">
								<label for="jobType" class="form-label">Loại Công Việc</label> <input
									type="text" class="form-control" id="jobType" name="jobType" />
							</div>
							<div class="mb-3">
								<label for="postedDate" class="form-label">Ngày Đăng</label> <input
									type="date" class="form-control" id="postedDate"
									name="postedDate" readonly />
							</div>
							<div class="mb-3">
								<label for="applicationDeadline" class="form-label">Hạn
									Nộp Hồ Sơ</label> <input type="date" class="form-control"
									id="applicationDeadline" name="applicationDeadline" />
							</div>
							<button type="submit" class="btn btn-success">Lưu Thay
								Đổi</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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

	//Thông báo lỗi
	document.addEventListener("DOMContentLoaded", function() {
		var notification = document.getElementById("notification");
		if (notification) {
			setTimeout(function() {
				notification.classList.add("hide");
				// Thực hiện ẩn thông báo hoàn toàn sau khi hiệu ứng hoàn tất
				setTimeout(function() {
					notification.style.display = "none";
				}, 300); // Thời gian trễ phải bằng thời gian hiệu ứng CSS
			}, 3000); // Hiển thị thông báo trong 3 giây
		}
	});

	document.addEventListener("DOMContentLoaded", function() {
		// Đặt ngày hiện tại cho trường "Ngày đăng"
		var now = new Date();
		var formattedDate = now.toISOString().slice(0, 10); // Định dạng theo kiểu yyyy-MM-dd

		var postedDateField = document.getElementById("posteddate");
		postedDateField.value = formattedDate;

		// Tạo sự kiện khi thay đổi hạn nộp hồ sơ
		var applicationDeadlineField = document
				.getElementById("applicationdeadline");
		applicationDeadlineField.addEventListener("change", function() {
			var postedDate = new Date(postedDateField.value);
			var applicationDeadline = new Date(applicationDeadlineField.value);

			// So sánh ngày
			if (applicationDeadline < postedDate) {
				alert("Hạn nộp hồ sơ không được chọn trước ngày đăng.");
				applicationDeadlineField.value = ""; // Xóa giá trị nếu không hợp lệ
			}
		});
	});
</script>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const editButtons = document.querySelectorAll('.btn-edit');

    editButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Lấy thông tin từ thuộc tính data của nút chỉnh sửa
            const jobId = button.getAttribute('data-jobid');
            const jobTitle = button.getAttribute('data-jobtitle');
            const jobLocation = button.getAttribute('data-joblocation');
            const jobDescription = button.getAttribute('data-jobdescription');
            const jobRequirements = button.getAttribute('data-jobrequirements');
            const salary = button.getAttribute('data-salary');
            const jobType = button.getAttribute('data-jobtype');
            const postedDate = button.getAttribute('data-posteddate');
            const applicationDeadline = button.getAttribute('data-applicationdeadline');

            // Điền thông tin vào modal
            document.getElementById('jobId').value = jobId;
            document.getElementById('jobTitle').value = jobTitle;
            document.getElementById('jobLocation').value = jobLocation;
            document.getElementById('jobDescription').value = jobDescription;
            document.getElementById('jobRequirements').value = jobRequirements;
            document.getElementById('salaryEdit').value = salary;
            document.getElementById('jobType').value = jobType;
            document.getElementById('postedDate').value = postedDate;
            document.getElementById('applicationDeadline').value = applicationDeadline;

            // Hiển thị modal
            const editJobModal = new bootstrap.Modal(document.getElementById('editJobModal'));
            editJobModal.show();
        });
    });

    // Xử lý form khi gửi
    document.getElementById('editJobForm').addEventListener('submit', (event) => {
        event.preventDefault();

        // Cập nhật ngày hiện tại cho ngày đăng
        const currentDate = new Date().toISOString().split('T')[0]; // Lấy ngày hiện tại
        document.getElementById('postedDate').value = currentDate; // Cập nhật vào trường ngày đăng

        // Lấy giá trị ngày đăng và hạn nộp hồ sơ
        const postedDate = new Date(document.getElementById('postedDate').value);
        const applicationDeadline = new Date(document.getElementById('applicationDeadline').value);

        // Kiểm tra hạn nộp hồ sơ không nhỏ hơn ngày đăng
        if (applicationDeadline < postedDate) {
            alert('Hạn nộp hồ sơ không được nhỏ hơn ngày đăng.');
            return; // Dừng quá trình gửi form
        }

        // Lấy dữ liệu từ form
        const formData = new FormData(event.target);

        // Gửi dữ liệu đến server
        fetch('/employers/edit', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                window.location.reload(); // Tải lại trang để xem thay đổi
            } else {
                // Xử lý lỗi
                alert('Đã có lỗi xảy ra. Vui lòng thử lại.');
            }
        })
        .catch(error => {
            console.error('Có lỗi xảy ra:', error);
            alert('Đã có lỗi xảy ra. Vui lòng thử lại.');
        });
    });
});
</script>

<script>
function confirmDelete() {
    return confirm("Bạn có chắc chắn muốn xóa bài đăng này?");
}
</script>

<script>
$(document).ready(function() {
    $('#myTable').DataTable({
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

    $('#cvTable').DataTable({
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
});
</script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const dateCells = document.querySelectorAll('.formatted-date');

        dateCells.forEach(cell => {
            const dateString = cell.getAttribute('data-date'); // Lấy giá trị ngày từ thuộc tính data-date
            const date = new Date(dateString); // Chuyển đổi chuỗi thành đối tượng Date

            // Kiểm tra xem ngày hợp lệ hay không
            if (!isNaN(date)) {
                // Định dạng ngày theo dd/MM/yyyy
                const options = { day: '2-digit', month: '2-digit', year: 'numeric' };
                const formattedDate = date.toLocaleDateString('vi-VN', options); // Định dạng theo ngôn ngữ Việt Nam

                cell.textContent = formattedDate; // Cập nhật nội dung của ô
            } else {
                cell.textContent = 'Ngày không hợp lệ'; // Hiển thị thông báo nếu ngày không hợp lệ
            }
        });
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- JS for DataTables -->
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<!-- CSS for DataTables -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

</html>
