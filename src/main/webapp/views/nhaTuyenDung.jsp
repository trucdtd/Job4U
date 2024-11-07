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
<!-- CSS for DataTables -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
</head>
<style>
/* Modal background */
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

/* Modal content */
.modal-content {
	background-color: #fff;
	border-radius: 8px;
	width: 90%;
	max-width: 400px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
	overflow: hidden;
}

/* Modal header */
.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 20px;
	border-bottom: 1px solid #ddd;
}

.modal-header h2 {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin: 0;
}

/* Close button */
.close {
	font-size: 20px;
	font-weight: bold;
	color: #999;
	cursor: pointer;
}

.close:hover {
	color: #555;
}

/* Modal body */
.modal-body {
	padding: 20px;
	font-size: 16px;
	color: #333;
	text-align: center;
}

/* Modal footer */
.modal-footer {
	padding: 15px 20px;
	border-top: 1px solid #ddd;
	display: flex;
	justify-content: center;
}

/* OK Button */
.modal-button {
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.modal-button:hover {
	background-color: #45a049;
}
</style>

<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->

	<!-- Modal Hiển Thị Thông Báo Thanh Toán -->
	<c:if test="${not empty message}">
		<div id="paymentSuccessModal" class="modal" style="display: flex;">
			<div class="modal-content">
				<div class="modal-header">
					<h2>Thông báo</h2>
					<span class="close" onclick="closeModal()">&times;</span>
				</div>
				<div class="modal-body">
					<p>${message}</p>
				</div>
				<div class="modal-footer">
					<button onclick="closeModal()" class="modal-button">OK</button>
				</div>
			</div>
		</div>
	</c:if>

	<div class="container">
		<div class="row">
			<!-- aside -->
			<div class="col-lg-3 col-md-3 p-2 d-flex">
				<div class="card p-3 text-dark" style="width: 100%;">
					<a href="#"
						class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none text-center">
						<i class="bi bi-journal-arrow-down" style="font-size: 40px"></i> <span
						class="fs-4 ms-2" style="background: #198754; color: white;">Menu
							Tuyển Dụng</span>
					</a>
					<hr>
					<ul class="nav flex-column mb-auto">
						<li><a href="#"
							class="navnhatuyendung nav-link text-dark active"
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
							onclick="showTable(event, 'myServices')"> <i
								class="bi bi-bag-heart me-2"></i> Gói Dịch Dụ đã mua
						</a></li>
						<li><a href="#" class="navnhatuyendung nav-link text-dark"
							onclick="showTable(event, 'postingServices')"> <img
								width="20" height="20"
								src="https://img.icons8.com/ios/50/card-in-use.png"
								alt="card-in-use" /> Mua Dịch Vụ
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
											<th scope="col">Lương</th>
											<th scope="col">Loại Công Việc</th>
											<th scope="col">Ngày Đăng</th>
											<!-- <th scope="col">Trạng Thái</th> -->
											<th scope="col">Hành Động</th>
											<th scope="col">Xem CV</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${jobPostings}" var="job">
											<tr data-jobid="${job.jobid}">
												<td>${job.jobtitle}</td>
												<td>${job.joblocation}</td>
												<td><c:choose>
														<c:when test="${not empty job.salary}">
															<span style="display: inline-flex; align-items: center;">
																${job.salary.toString().replaceAll("(\\d)(?=(\\d{3})+(?!\\d))", "$1,")}
																VND </span>
														</c:when>
														<c:otherwise>
												            Thỏa Thuận
												        </c:otherwise>
													</c:choose></td>
												<td>${job.jobtype}</td>
												<td class="formatted-date" data-date="${job.posteddate}"></td>
												<%-- <td>${job.active ? 'Hoạt Động' : 'Không Hoạt Động'}</td> --%>
												<td>
													<div class="d-flex align-items-center">
														<button type="button" class="btn btn-sm btn-edit me-2"
															title="Chỉnh sửa" data-jobid="${job.jobid}"
															data-jobtitle="${job.jobtitle}"
															data-joblocation="${job.joblocation}"
															data-jobdescription="${job.jobdescription}"
															data-jobrequirements="${job.jobrequirements}"
															data-salary="${job.salary}" data-jobtype="${job.jobtype}"
															data-posteddate="${job.posteddate}"
															data-applicationdeadline="${job.applicationdeadline}">
															<img alt="Chỉnh sửa" src="/img/icons8-edit-50.png"
																height="25px" width="25px" />
														</button>
														<form action="/employers/delete" method="post"
															style="display: inline;"
															onsubmit="return confirmDelete();">
															<input type="hidden" name="jobId" value="${job.jobid}">
															<button type="submit" class="btn btn-sm" title="Xóa">
																<img alt="Xóa" src="/img/icons8-delete-50.png"
																	height="25px" width="25px" />
															</button>
														</form>
														<button type="button" class="btn btn-sm" title="mua">
															<img alt="mua" src="/img/icons8-pin-50.png" height="25px"
																width="25px" />
														</button>
													</div>
												</td>
												<!-- XEM CV -->
												<td>
													<form action="/employers/xemcv" method="get">
														<!-- Chuyển từ POST sang GET -->
														<!-- Ẩn input để truyền jobId vào request -->
														<input type="hidden" name="jobId" value="${job.jobid}">
														<button type="submit" class="btn btn-sm btn-detail"
															title="Xem CV">
															<img alt="Xem CV" src="/img/icons8-eye-48.png"
																height="25px">
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
									<div class="row mb-3 align-items-center">
										<div class="col-md-4">
											<div class="bg-image me-3">
												<img id="logoPreview"
													src="${pageContext.request.contextPath}/uploads/${employer.logo}"
													alt="Logo" class="img-fluid"
													style="object-fit: cover; max-width: 100%; height: 200px;">
												<input type="file" class="form-control" id="logo"
													name="logo" accept="image/*" style="display: none;">
												<label for="logo" class="form-control text-center"
													style="cursor: pointer; height: 30px; display: flex; align-items: center; justify-content: center;">
													Cập nhật logo mới tại đây</label>
											</div>
										</div>

										<div class="col-md-8">
											<div class="mb-3">
												<label for="companyname" class="form-label">Tên công
													ty</label> <input type="text" class="form-control" id="companyname"
													name="companyname" value="${employer.companyname}" readonly>
											</div>
											<div>
												<label for="companywebsite" class="form-label">Tên
													web công ty</label> <input type="text" class="form-control"
													id="companywebsite" name="companywebsite"
													value="${employer.companywebsite}" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 p-2">
											<label for="address" class="form-label">Địa chỉ công
												ty</label> <input type="text" class="form-control" id="address"
												name="address" value="${employer.address}" readonly>
										</div>
										<div class="col-md-6 p-2">
											<label for="industry" class="form-label">Ngành nghề</label> <input
												type="text" class="form-control" id="industry"
												name="industry" value="${employer.industry}" readonly>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 p-2">
											<label for="jobtitle" class="form-label">Tiêu đề công
												việc</label> <input type="text" class="form-control" id="jobtitle"
												name="jobtitle" required>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 p-2">
											<label for="contactperson" class="form-label">Người
												liên hệ & số điện thoại</label> <input type="text"
												class="form-control" id="contactperson" name="contactperson">
										</div>
										<div class="col-md-6 p-2">
											<label for="joblocation" class="form-label">Địa điểm
												làm việc</label> <input type="text" class="form-control"
												id="joblocation" name="joblocation">
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
												<span class="input-group-text">VND</span> <input type="text"
													class="form-control salary-input" id="salary" name="salary"
													min="0"
													placeholder="ví dụ: 12 - 15 Triệu hoặc để trống nếu muốn Thỏa Thuận">
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
										<div class="col-md-6 p-2" style="display: none;">
											<label for="posteddate" class="form-label">Ngày đăng</label>
											<input type="text" class="form-control" id="posteddate"
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
										<th scope="col">Trạng thái</th>
										<th scope="col">Chi tiết hồ sơ</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dsCV}" var="cv">
										<tr>
											<th>${cv.job.jobtitle}</th>
											<td>${cv.jobseeker.fullnamecv}</td>
											<th>${cv.resume}</th>
											<td class="formatted-date" data-date="${cv.applicationdate}"></td>
											<td><c:choose>
													<c:when test="${cv.status == 0}">Đang chờ</c:when>
													<c:when test="${cv.status == 1}">Được chấp nhận</c:when>
													<c:when test="${cv.status == 2}">Bị từ chối</c:when>
													<c:otherwise>Không xác định</c:otherwise>
												</c:choose></td>
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
					<br>
					<%@ include file="/views/dichVu.jsp"%>

				</div>

				<!-- Gói Dịch vụ đã mua -->
				<div id="myServices" class="card" style="display: none;">
					<div class="card-header">
						<div class="card-title">Dịch vụ đã mua</div>
					</div>
					<br>
					<div class="card-body p-2">
						<div class="table-responsive">
							<table id="myServicesTable" class="table align-items-center">
								<thead class="thead-light">
									<tr>
										<th scope="col">Tên dịch vụ</th>
										<th scope="col">Nội dung dịch vụ</th>
										<th scope="col">Số lượng cho phép</th>
										<th scope="col">Trạng thái</th>
										<th scope="col">Ngày mua</th>
										<th scope="col">Ngày hết hạn</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dsDV}" var="dv">
										<tr>
											<th>${dv.service.servicename}</th>
											<td>${dv.service.description}</td>
											<th>${dv.numberofjobsallowed}</th>
											<th>${dv.isactive ? 'Hoạt Động' : 'Không Hoạt Động'}</th>
											<td class="formatted-date" data-date="${dv.purchasedate}"></td>
											<td class="formatted-date" data-date="${dv.expirydate}"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
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
							<input type="hidden" id="jobIdedit" name="jobIdedit"
								class="form-control" />
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
									type="text" class="form-control" id="salaryEdit"
									name="salaryEdit" placeholder="Thỏa Thuận" />
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

	//Xử lý đăng bài
	document.addEventListener("DOMContentLoaded", function() {
	    // Lấy ngày hiện tại
	    var now = new Date();
	    var formattedDate = now.toISOString().slice(0, 10); // Định dạng theo kiểu yyyy-MM-dd

	    // Gán giá trị ngày hiện tại vào trường "posteddate"
	    var postedDateField = document.getElementById("posteddate");
	    postedDateField.value = formattedDate;

	    // Tạo sự kiện khi form được gửi
	    var form = document.getElementById("nhaTuyenDung");
	    form.addEventListener("submit", function(event) {
	        // Ngăn chặn gửi form mặc định
	        event.preventDefault();

	        // Gửi form
	        form.submit();
	    });

	    // Tạo sự kiện khi thay đổi hạn nộp hồ sơ
	    var applicationDeadlineField = document.getElementById("applicationdeadline");
	    applicationDeadlineField.addEventListener("change", function() {
	        var applicationDeadline = new Date(applicationDeadlineField.value); // Hạn nộp hồ sơ
	        var postedDate = new Date(); // Ngày hiện tại

	        // So sánh ngày
	        if (applicationDeadline <= postedDate) {
	            alert("Hạn nộp hồ sơ không được chọn trước hoặc bằng ngày đăng.");
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
            const jobData = {
            	jobIdedit: button.getAttribute('data-jobid'),
                jobTitle: button.getAttribute('data-jobtitle'),
                jobLocation: button.getAttribute('data-joblocation'),
                jobDescription: button.getAttribute('data-jobdescription'),
                jobRequirements: button.getAttribute('data-jobrequirements'),
                salary: button.getAttribute('data-salary'),
                jobType: button.getAttribute('data-jobtype'),
                postedDate: button.getAttribute('data-posteddate'),
                applicationDeadline: button.getAttribute('data-applicationdeadline')
            };

            // Điền thông tin vào modal
            document.getElementById('jobIdedit').value = jobData.jobIdedit;
            document.getElementById('jobTitle').value = jobData.jobTitle;
            document.getElementById('jobLocation').value = jobData.jobLocation;
            document.getElementById('jobDescription').value = jobData.jobDescription;
            document.getElementById('jobRequirements').value = jobData.jobRequirements;
            document.getElementById('salaryEdit').value = jobData.salary;
            document.getElementById('jobType').value = jobData.jobType;
            document.getElementById('postedDate').value = jobData.postedDate;
            document.getElementById('applicationDeadline').value = jobData.applicationDeadline;
            console.log('jobId:', document.getElementById('jobId').value);
            console.log('jobTitle:', document.getElementById('jobTitle').value);
            // Hiển thị modal
            const editJobModal = new bootstrap.Modal(document.getElementById('editJobModal'));
            editJobModal.show();
        });
    });

    // Xử lý form khi gửi
    document.getElementById('editJobForm').addEventListener('submit', (event) => {
        event.preventDefault();

        // Cập nhật ngày hiện tại cho ngày đăng
        const currentDate = new Date().toISOString().split('T')[0];
        document.getElementById('postedDate').value = currentDate;

        // Lấy giá trị ngày đăng và hạn nộp hồ sơ
        const postedDate = new Date(document.getElementById('postedDate').value);
        const applicationDeadline = new Date(document.getElementById('applicationDeadline').value);

        // Kiểm tra hạn nộp hồ sơ không nhỏ hơn ngày đăng
        if (applicationDeadline < postedDate) {
            alert('Hạn nộp hồ sơ không được nhỏ hơn ngày đăng.');
            return;
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
    $('#myServicesTable').DataTable({
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
	<script>
document.getElementById('logo').addEventListener('change', function(event) {
    const file = event.target.files[0]; // Lấy tệp được chọn
    if (file) {
        const reader = new FileReader(); // Tạo đối tượng FileReader
        reader.onload = function(e) {
            // Cập nhật src của img với dữ liệu ảnh
            document.getElementById('logoPreview').src = e.target.result;
        }
        reader.readAsDataURL(file); // Đọc tệp ảnh dưới dạng URL
    }
});
</script>
	<script>
    // Close modal function
    function closeModal() {
        document.getElementById("paymentSuccessModal").style.display = "none";
    }
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- JS for DataTables -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</body>
</html>
