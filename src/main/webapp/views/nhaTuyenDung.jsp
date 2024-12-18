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
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
							onclick="showTable(event, 'postingServices')"> <i
								class="bi bi-bag"></i> Mua Dịch Vụ
						</a></li>
						<li><a href="/employers/thongKeTheoNgay"
							class="navnhatuyendung nav-link text-dark"> <img
								width="20" height="20"
								src="https://img.icons8.com/ios/50/card-in-use.png"
								alt="card-in-use" /> Thống Kê
						</a></li>
					</ul>
					<hr>
				</div>
			</div>
			<!-- aside -->

			<!-- article -->
			<!-- Quản Lý Tuyển Dụng -->
			<div class="col-lg-9 col-md-9 p-2">
				<div id="employersManagement" class="card p-2">
					<div class="card-header">
						<div class="card-title">Quản Lý Bài Đăng Tuyển Dụng</div>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<table id="myTable" class="table align-items-center">
								<thead class="thead-light">
									<tr>
										<th scope="col">Tên Công Việc</th>
										<th scope="col">Vị Trí</th>
										<th scope="col">Lương</th>
										<th scope="col">Ngày Đăng</th>
										<th scope="col">Trạng Thái Top</th>
										<th scope="col">Hành Động</th>
										<th scope="col">Xem CV</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${jobPostings}" var="job">
										<tr data-jobid="${job.jobid}">
											<td>${job.jobtitle}<!-- Hiển thị ngôi sao vàng nếu là công việc top -->
												<c:if test="${job.isTop}">
													<i class="bi bi-star-fill text-warning"></i>
													<!-- Ngôi sao vàng -->
												</c:if></td>
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
											<td class="formatted-date" data-date="${job.posteddate}"></td>
											<td>${job.isTop ? 'Đang chạy' : 'Chưa mua Top'}</td>
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
															<img alt="Xóa" src="/img/delete_red.png" height="25px"
																width="25px" />
														</button>
													</form>
													<!-- Nút mua dịch vụ lên top -->
													<button type="button" class="btn btn-sm btn-mua"
														title="Mua Top" data-jobidmua="${job.jobid}"
														data-jobtitle="${job.jobtitle}">
														<img alt="Mua" src="/img/icons8-cart-50.png" height="25px"
															width="25px">
													</button>
													<!-- Nút mua dịch vụ lên top -->
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
														<img alt="Xem CV" src="/img/icons8-eye-50.png"
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
											<label for="jobcategories" class="form-label"
												style="font-weight: bold; color: #198754;">Nghề
												nghiệp</label> <select id="jobcategories" name="jobcategories"
												class="form-select" required>
												<option value="" disabled selected>Chọn nghề nghiệp</option>
												<!-- Giúp hiển thị giá trị mặc định -->
												<c:forEach var="jobCategory" items="${dsnghe}">
													<option value="${jobCategory.jobcategoryid}">${jobCategory.jobcategoryname}</option>
												</c:forEach>
											</select>
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
										<th scope="col">Số điện thoại người ứng tuyển</th>
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
											<td>${cv.jobseeker.phonenumbercv}</td>
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

				<!-- Thống kê nhà tuyển dụng-->
				<div id="statistical" class="card" style="display: none;">
					<div class="card-header">
						<div class="card-title">Bảng Thống Kê Nhà Tuyển Dụng</div>
					</div>
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

		<!-- Modal Thanh Toán -->
		<div id="paymentModalghim" class="modal" style="display: none;">
			<div class="modal-content">
				<span class="close" onclick="closePaymentModalghim()">&times;</span>
				<div class="payment-container">
					<div class="payment-summary">
						<h3>Tóm tắt thanh toán</h3>
						<ul>
							<li><span>Gói đã chọn:</span> Gói đặc biệt lên Top</li>
							<li><span>Bài Viết:</span> <span id="jobTitleDisplay"></span></li>
						</ul>
						<div class="total-price">
							<h2>Tổng Tiền</h2>
							<h1>75.000 ₫</h1>
							<p>Ghim Bài đăng lên top những công việc hàng đầu trong 3
								ngày.</p>
						</div>
					</div>
					<form action="/employers/pay" method="post" class="payment-form">
						<input type="hidden" name="servicePrice" id="servicePriceInput"
							value="75000"> <input type="hidden" name="serviceId"
							id="serviceId" value="4"> <input type="hidden"
							name="jobId" id="jobid" value="${jobid}"> <input
							type="hidden" name="userId" id="userId" value="${userId}">

						<div class="payment-methods">
							<button class="momo2-btn" type="submit">
								<img src="/img/vnpay.png">
							</button>
						</div>
						<button class="submit-btn" style="background: #198754"
							type="submit">Thanh Toán</button>
					</form>
				</div>
			</div>
		</div>
		
		<!-- Modal thông báo không thể mua dịch vụ -->
<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="errorModalLabel">Thông Báo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="errorModalBody">
                <!-- Nội dung thông báo lỗi sẽ được chèn vào đây -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-bs-dismiss="modal">Đóng</button>
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
    
    document.addEventListener('DOMContentLoaded', () => {
        const buyButtons = document.querySelectorAll('.btn-mua'); // Nút Mua
        const paymentModalGhim = document.getElementById('paymentModalghim'); // Modal thanh toán
        const jobIdInput = document.getElementById('jobid'); // Đồng bộ với ID trong HTML
        const jobTitleDisplay = document.getElementById('jobTitleDisplay'); // Hiển thị tên bài viết trong modal
        const submitButton = document.querySelector('.submit-btn'); // Nút Thanh Toán
        const paymentForm = document.querySelector('.payment-form'); // Form thanh toán

        let selectedService = {}; // Thông tin dịch vụ đã chọn
        let jobIdSelected = null; // ID bài viết đã chọn
        let jobTitleSelected = ''; // Tên bài viết đã chọn

        // Gắn sự kiện click vào các nút Mua
        buyButtons.forEach(button => {
            button.addEventListener('click', () => {
                const jobId = button.getAttribute('data-jobidmua'); // Lấy Job ID từ data attribute
                const jobTitle = button.getAttribute('data-jobtitle'); // Lấy tên bài viết từ data attribute

                jobTitleDisplay.textContent = jobTitle; // Hiển thị tên bài viết trong modal
                jobIdInput.value = jobId; // Gán giá trị cho input hidden (jobId)

                console.log("Job ID ngay khi mở modal:", jobId); // Debug giá trị Job ID
                console.log("Job Title ngay khi mở modal:", jobTitle); // Debug giá trị tên bài viết
                openModal('paymentModalghim');
            });
        });

        // Xử lý sự kiện khi nhấn nút "Thanh Toán"
        submitButton.addEventListener('click', () => {
            console.log("Job ID khi nhấn Thanh Toán:", jobIdInput.value); // Kiểm tra giá trị jobId
            paymentForm.submit(); // Submit form
        });

        // Lắng nghe sự kiện click ngoài modal để đóng modal
        window.addEventListener('click', (event) => {
            const modals = document.querySelectorAll('.modal'); // Lấy tất cả các modal
            modals.forEach(modal => {
                if (event.target === modal) {
                    closeModal(modal.id);
                }
            });
        });

        // Hàm mở modal
        function openModal(modalId) {
            const modal = document.getElementById(modalId);
            if (modal) {
                modal.style.display = 'flex';
            }
        }

        // Hàm đóng modal
        function closeModal(modalId) {
            const modal = document.getElementById(modalId);
            if (modal) {
                modal.style.display = 'none';
            }
        }

        // Gắn sự kiện đóng modal khi nhấn biểu tượng đóng (&times;)
        const closeButtons = document.querySelectorAll('.close');
        closeButtons.forEach(button => {
            button.addEventListener('click', () => {
                const modal = button.closest('.modal');
                if (modal) {
                    closeModal(modal.id);
                }
            });
        });
    });
</script>

	<script>
    let selectedService = {};
    let jobIdSelected = null;

    // Mở modal chọn công việc
    function openJobSelectionModal(serviceName, servicePrice, serviceDescription, serviceId) {
        selectedService = { serviceName, servicePrice, serviceDescription, serviceId };

        if (serviceId === 4) {
            // Nếu là gói "Lên Top" (serviceId = 4), yêu cầu chọn bài viết
            document.getElementById('jobSelectionModal').style.display = 'flex';
        } else {
            // Nếu không phải là gói "Lên Top", hiển thị modal thanh toán trực tiếp
            openPaymentModal();
        }
    }

    // Mở modal thanh toán
    function openPaymentModal() {
        const paymentModal = document.getElementById('paymentModal');
        if (paymentModal) {
            paymentModal.style.display = 'flex';

            // Cập nhật thông tin dịch vụ trong modal thanh toán
            document.getElementById('serviceName').innerText = selectedService.serviceName || '';
            document.getElementById('serviceId').value = parseInt(selectedService.serviceId || 0);
            document.getElementById('servicePrice').innerText = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(selectedService.servicePrice || 0);
            document.getElementById('serviceDescription').innerText = selectedService.serviceDescription || '';
            document.getElementById('jobId').value = jobIdSelected || ""; // Nếu không chọn bài viết, đặt jobId là trống
            document.getElementById('servicePriceInput').value = selectedService.servicePrice || 0;
        }
    }

    // Đóng modal chọn công việc
    function closeJobSelectionModal() {
        const modal = document.getElementById('jobSelectionModal');
        if (modal) {
            modal.style.display = 'none';

            // Reset trạng thái modal chọn công việc (nếu cần thiết)
            jobIdSelected = null;
            document.getElementById('jobId').value = "";
            document.getElementById('jobIdSelected').innerText = "";
        }
    }

    // Đóng modal thanh toán
    function closePaymentModal() {
        const modal = document.getElementById('paymentModal');
        if (modal) {
            modal.style.display = 'none';

            // Reset trạng thái modal thanh toán
            jobIdSelected = null;
            selectedService = {};
            document.getElementById('jobId').value = "";
            document.getElementById('jobIdSelected').innerText = "";
            document.getElementById('serviceName').innerText = "";
            document.getElementById('servicePrice').innerText = "";
            document.getElementById('serviceDescription').innerText = "";
            document.getElementById('servicePriceInput').value = "";
        }
    }

    // Đóng modal paymentModalghim và reset trạng thái
    function closePaymentModalghim() {
        const modal = document.getElementById('paymentModalghim');
        if (modal) {
            modal.style.display = 'none';

            // Reset trạng thái modal paymentModalghim
            document.getElementById('jobIdDisplay').innerText = ""; // Reset hiển thị ID bài viết
            document.getElementById('jobid').value = "";           // Reset giá trị hidden input
            document.getElementById('servicePriceInput').value = ""; // Reset giá trị giá dịch vụ
            document.getElementById('serviceId').value = "";       // Reset giá trị serviceId
        }
    }

 // Chọn bài viết và mở modal thanh toán
    function selectJobPost(job) {
        closeJobSelectionModal();
        jobIdSelected = job.jobid; // Cập nhật jobIdSelected từ bài viết được chọn

        // Hiển thị tên công việc trong modal thanh toán
        document.getElementById('jobIdSelected').innerText = job.jobtitle;

        // Cập nhật giá trị cho hidden input
        document.getElementById('jobId').value = jobIdSelected;

        openPaymentModal();
    }

    // Submit form thanh toán
    function submitPayment() {
        const servicePriceFormatted = document.getElementById("servicePrice").innerText.replace(/[^\d.-]/g, '');
        document.getElementById("servicePriceInput").value = parseFloat(servicePriceFormatted);

        // Đảm bảo các hidden input có giá trị chính xác trước khi submit
        document.getElementById("serviceId").value = selectedService.serviceId || "";
        document.getElementById("jobId").value = jobIdSelected || "";
        document.querySelector(".payment-form").submit();
    }

    // Lắng nghe sự kiện click ngoài modal để đóng modal
    window.addEventListener('click', (event) => {
        const paymentModal = document.getElementById('paymentModal');
        const jobSelectionModal = document.getElementById('jobSelectionModal');
        const paymentModalghim = document.getElementById('paymentModalghim');

        // Kiểm tra nếu click ngoài modal thì đóng modal
        if (event.target === paymentModal) {
            closePaymentModal();
        }

        if (event.target === paymentModalghim) {
            closePaymentModalghim(); // Gọi hàm đóng modal và reset
        }

        if (event.target === jobSelectionModal) {
            closeJobSelectionModal();
        }
    });
</script>

<script>
    window.onload = function() {
        // Kiểm tra nếu có thông báo lỗi trong URL
        const urlParams = new URLSearchParams(window.location.search);
        const errorMessage = urlParams.get('errorModal');
        
        if (errorMessage) {
            // Giải mã thông báo lỗi từ URL
            const decodedMessage = decodeURIComponent(errorMessage);

            // Cập nhật tiêu đề và nội dung của modal thông báo
            document.getElementById('errorModalLabel').innerText = "Thông Báo";
            document.getElementById('errorModalBody').innerText = decodedMessage;

            // Hiển thị modal
            var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
            errorModal.show();

            // Lắng nghe sự kiện khi modal bị đóng
            document.getElementById('errorModal').addEventListener('hidden.bs.modal', function () {
                // Điều hướng về trang gốc (chưa có errorModal trong URL)
                window.location.href = window.location.pathname.split('?')[0]; // Quay lại trang hiện tại mà không có query string
            });
        }
    }
</script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- JS for DataTables -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</body>
</html>
