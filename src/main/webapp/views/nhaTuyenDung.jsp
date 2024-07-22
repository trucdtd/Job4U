<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employes Page</title>
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
}

.sidebar a:hover {
	background-color: #0056b3; /* Màu xanh dương đậm hơn khi hover */
}

.content {
	flex-grow: 1;
	padding: 20px;
	background-color: #f8f9fa; /* Màu nền cho khu vực nội dung */
	display: none; /* Ẩn tất cả các phần nội dung */
}

.content.active {
	display: block; /* Hiển thị phần nội dung được chọn */
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
				<div class="col-md-3">
					<div class="d-flex flex-column flex-shrink-0 p-3 text-white "
						style="width: 260px; background: #00688B">
						<a href="#"
							class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none text-center">
							<svg class="bi me-2" width="25" height="25">
                            <use xlink:href="#bootstrap"></use>
                        </svg> <span class="card-title">Menu Employers</span>
						</a>
						<hr>
						<ul class="nav nav-pills flex-column mb-auto">
							<li><a href="#" class="nav-link text-white active"
								aria-current="page"
								onclick="showTable(event, 'employersManagement')"> <svg
										class="bi me-2" width="16" height="16">
                                    <use xlink:href="#speedometer2"></use>
                                </svg> Quản Lý Tuyển Dụng
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'postEmployers')"> <svg
										class="bi me-2" width="16" height="16">
                                    <use xlink:href="#table"></use>
                                </svg> Đăng Bài Tuyển Dụng
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'cvApply')"> <svg class="bi me-2"
										width="16" height="16">
                                <use xlink:href="#grid"></use>
                                </svg> CV Ứng Tuyển
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'listEmployers')"> <svg
										class="bi me-2" width="16" height="16">
                                <use xlink:href="#low"></use>
                                </svg> Bài Tuyển Dụng
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'postingServices')"> <svg
										class="bi me-2" width="16" height="16">
                                    <use xlink:href="#home"></use>
                                </svg> Dịch Vụ Bài Đăng
							</a></li>
						</ul>
						<hr>
					</div>
				</div>
				<!-- aside -->
				<!-- article -->
				<!-- Quản Lý Tuyển Dụng -->
				<div class="col-md-9">
					<!-- Home table -->
					<div id="employersManagement" class="card">
						<div class="card-header">
							<div class="card-title">Quản Lý Tuyển Dụng</div>
						</div>
						<div class="card-body p-0">
							<a>xem thêm</a>
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
									<form class="p-4" action="/job4u//employers/create" method="post">
										<div class="row p-2">
											<div class="col-md-6">
												<label for="companyname" class="form-label">Tên công
													ty</label> <input type="text" class="form-control" id="companyname"
													name="companyname" required>
											</div>
											<div class="col-md-6">
												<label for="companywebsite" class="form-label">Tên
													web công ty</label> <input type="text" class="form-control"
													id="companywebsite" name="companywebsite">
											</div>
										</div>

										<div class="row p-2">
											<div class="col-md-6">
												<label for="address" class="form-label">Địa chỉ công
													ty </label> <input type="text" class="form-control" id="address"
													name="address">
											</div>
											<div class="col-md-6">
												<label for="industry" class="form-label">Ngành nghề</label>
												<select class="form-control" id="industry" name="industry"
													required>
													<option value="" disabled selected>Chọn ngành nghề</option>
													<option value="agriculture">Nông nghiệp</option>
													<option value="industry">Công nghiệp</option>
													<option value="services">Dịch vụ</option>
													<option value="construction">Xây dựng</option>
													<option value="transportation">Giao thông vận tải</option>
													<option value="it">Công nghệ thông tin</option>
													<option value="finance">Tài chính</option>
													<option value="education">Giáo dục</option>
													<option value="healthcare">Y tế</option>
													<option value="media">Truyền thông</option>
													<option value="automotive-technology">Công nghệ ô
														tô</option>
													<option value="tourism">Du lịch</option>
													<option value="office">Hành chính văn phòng</option>
													<option value="other">Khác...</option>
												</select>
											</div>
										</div>

										<div class="row p-2">
											<div class="col-md-6">
												<label for="jobTitle" class="form-label">Tiêu đề
													công việc</label> <input type="text" class="form-control"
													id="jobtitle" name="jobtitle" required>
											</div>
											<div class="col-md-6">
												<label for="salary" class="form-label">Lương</label> <input
													type="number" class="form-control" id="salary"
													name="salary">
											</div>
										</div>

										<div class="row p-2">
											<div class="col-md-6">
												<label for="companydescription" class="form-label">Mô
													tả công ty</label>
												<textarea class="form-control" id="companydescription"
													name="companydescription" rows="4"></textarea>
											</div>
											<div class="col-md-6">
												<label for="jobrequirements" class="form-label">Yêu
													cầu công việc</label>
												<textarea class="form-control" id="jobrequirements"
													name="jobrequirements" rows="4" required></textarea>
											</div>
										</div>
										<div class="row p-2">
											<div class="col-md-6">
												<label for="joblocation" class="form-label">Địa điểm
													làm việc</label> <input type="text" class="form-control"
													id="joblocation" name="joblocation" required>
											</div>
											<div class="col-md-6">
												<label for="jobtype" class="form-label">Loại công
													việc</label> <input type="text" class="form-control" id="jobtype"
													name="jobtype" required>
											</div>
										</div>


										<div class="row p-2">
											<div class="col-md-6">
												<label for="posteddate" class="form-label">Ngày đăng</label>
												<input type="datetime-local" class="form-control"
													id="posteddate" name="posteddate" required>
											</div>

											<div class="col-md-6">
												<label for="applicationdeadline" class="form-label">Hạn
													nộp hồ sơ</label> <input type="datetime-local" class="form-control"
													id="applicationdeadline" name="applicationdeadline"
													required>
											</div>
										</div>
										<hr>

										<button type="submit" class="btn text-light"
											style="background-color: #00688B">Đăng bài</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Quản lý cv -->
					<div id="cvApply" class="card">
						
						<div class="card-header">
							<div class="card-title">CV Ứng tuyển</div>
						</div>
						<div class="card-body p-0">
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
											<button class="btn btn-success">Xem thêm</button>
										</td>
										<td>CV ứng tuyển</td>

									</tr>
									<!-- Add more rows as needed -->
								</tbody>
							</table>
						</div>
					</div>

					<!-- Quản lý bài đăng -->
					<div id="listEmployers" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Bài tuyển dụng</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<p>thêm thông tin</p>
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
