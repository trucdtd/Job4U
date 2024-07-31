<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Post</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/quanlyuser.css">
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- header -->
		<div class="container">
			<div class="row">
				<!-- aside -->
				<div class="col-lg-3 col-md-3">
					<div class="d-flex flex-column flex-shrink-0 text-white "
						style="width: 100%; background: #00688B">
						<a href="#"
							class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
							<svg class="bi me-2" width="25" height="25">
                            <use xlink:href="#bootstrap"></use>
                        </svg> <span class="card-title">Menu User
								Management</span>
						</a>
						<hr>
						<ul class="nav nav-pills flex-column mb-auto">
							<li><a href="#" class="nav-link text-white active"
								onclick="showTable(event, 'userManagement')"> <svg
										class="bi me-1" width="16" height="16">
                                    <use xlink:href="#speedometer2"></use>
                                </svg> Quản Lý Tài Khoản
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'postManagement')"> <svg
										class="bi me-1" width="16" height="16">
                                    <use xlink:href="#table"></use>
                                </svg> Quản Lý Bài Viết
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'cvManagement')"> <svg
										class="bi me-1" width="16" height="16">
                                <use xlink:href="#grid"></use>
                                </svg> Quản Lý CV

							</a></li>
							<li class="nav-item"><a href="#" class="nav-link text-white"
								aria-current="page"
								onclick="showTable(event, 'statisticalManagement')"> <svg
										class="bi me-1" width="16" height="16">
                                    <use xlink:href="#home"></use>
                                </svg> Quản Lý Thống Kê
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link text-white"
								aria-current="page" onclick="showTable(event, 'postService')">
									<svg class="bi me-1" width="16" height="16">
                                    <use xlink:href="#home"></use>
                                </svg> Dịch Vụ Bài Đăng
							</a></li>

						</ul>
						<hr>
						<div class="dropdown">
<a href="#"
								class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
								id="dropdownUser1" data-bs-toggle="dropdown"
								aria-expanded="false"> <img src="https://github.com/mdo.png"
								alt="" width="30" height="30" class="rounded-circle me-2">
								<strong>mdo</strong>
							</a>

						</div>
					</div>
				</div>
				<!-- aside -->
				<!-- article -->
				<div class=" col-lg-9 col-md-9">
					<!-- Home table -->
					

					<!-- Post Management table -->
					<div id="postManagement" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Chi Tiết Bài Viết</div>
						</div>
						<div class="card-body p-0">
							<form class="p-4 border border-1" action="" method="post">
								<div class="row p-2">
									<div class="col-md-6">
										<label for="jobtitle">Tiêu Đề:</label> <input
											class="form-control" type="text"
											placeholder="Tiêu đề bài viết" aria-label="Tiêu đề bài viết"
											style="border-radius: 10px;" id="jobtitle" name="jobtitle" value="${bv.jobtitle}" required>
									</div>
									<div class="col-md-6">
										<label for="joblocation">Vị trí:</label> <input
											class="form-control" type="text"
											placeholder="Vị trí công việc" aria-label="Vị trí công việc"
											style="border-radius: 10px;" id="joblocation" name="joblocation" value="${bv.joblocation}" required>
									</div>
								</div>

								<div class="row p-2">
									<div class="col-md-6">
										<label for="companyname">Công Ty</label> <input
											class="form-control" type="text" placeholder="Tên Công Ty"
											aria-label="Tên Công Ty" style="border-radius: 10px;"
											id="companyname" name="companyname" value="${bv.employer.companyname}" required>
									</div>
									<div class="col-md-6">
										<label for="companywebsite">Trang Web</label> <input
											class="form-control" type="text"
											placeholder="Trang web công ty"
											aria-label="Trang web công ty" style="border-radius: 10px;"
											id="companywebsite" name="companywebsite" value="${bv.employer.companywebsite}" required>
									</div>
								</div>

								<div class="row p-2">
									<div class="col-md-6">
										<label for="address">Địa chỉ công ty</label> <input
											class="form-control" type="text"
											placeholder="Địa chỉ Công Ty" aria-label="Địa chỉ Công Ty"
											style="border-radius: 10px;" id="address" name="address" value="${bv.employer.address}" required>
									</div>
									<div class="col-md-6">
										<label for="industry">Ngành công nghiệp</label> <input
											class="form-control" type="text"
											placeholder="Ngành Công nghiệp"
											aria-label="Ngành Công nghiệp" style="border-radius: 10px;"
id="industry" name="industry" value="${bv.employer.industry}" required>
									</div>
								</div>

								<div class="row p-2">
									<div class="col-md-6">
										<label for="contactperson">Người liên hệ</label> <input
											class="form-control" type="text" placeholder="Người liên hệ"
											aria-label="Người liên hệ" style="border-radius: 10px;"
											id="contactperson" name="contactperson" value="${bv.employer.contactperson}" required>
									</div>
									<div class="col-md-6">
										<label for="salary">Mức Lương:</label> <input
											class="form-control" type="text" placeholder="Mức lương"
											aria-label="Mức lương" style="border-radius: 10px;"
											id="salary" name="salary" value="${bv.salary}" required>
									</div>
								</div>

								<div class="row p-2">
									<div class="col-md-6">
										<label for="jobtype">Loại Công việc:</label> <select
											id="jobtype" name="jobtype" value="${bv.jobtype}" class="form-select" required>
											<option value="Full time">Full time</option>
											<option value="Part time">Part time</option>
										</select>
									</div>
									<div class="col-md-6">
										<label for="jobrequirements">Yêu Cầu công việc:</label>
										<textarea id="jobrequirements" name="jobrequirements" value="${bv.jobrequirements}" rows="3" cols="40"
											placeholder="Yêu cầu công việc" required></textarea>
									</div>
								</div>

								<hr>
								<div class="row p-2" style="margin-top: 10px;">
									<div class="card-action">
										<button class="btn btn-success"
											style="background-color: #00688B">Submit</button>
										<button class="btn btn-danger">Cancel</button>
									</div>
								</div>
							</form>

						</div>

					</div>

					<!-- CV Management table -->
					<div id="cvManagement" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý CV</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">CVID</th>
											<th scope="col">Name</th>
											<th scope="col">Position</th>
											<th scope="col">Date Submitted</th>
											<th scope="col">Status</th>
											<th scope="col">Button</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>Alex Smith</td>
											<td>Developer</td>
											<td>2023-01-05</td>
											<td>Reviewed</td>
											<td><button>Edit</button></td>
										</tr>
										<!-- Add more rows as needed -->
									</tbody>
								</table>
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
</html>