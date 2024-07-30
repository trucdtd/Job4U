<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
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
					<div
						class="d-flex flex-column flex-shrink-0  text-white "
						style="width: 100%;background: #00688B " >
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
								aria-current="page" onclick="showTable(event, 'statisticalManagement')"> <svg
										class="bi me-1" width="16" height="16">
                                    <use xlink:href="#home"></use>
                                </svg> Quản Lý Thống Kê
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link text-white"
								aria-current="page" onclick="showTable(event, 'postService')"> <svg
										class="bi me-1" width="16" height="16">
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
				<div class="col-lg-9 col-md-9 ">
					<!-- Home table -->
					

					<!-- User Management table -->
					<div id="userManagement" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Tài Khoản</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">UserID</th>
											<th scope="col">Username</th>
											<th scope="col">Fullname</th>
											<th scope="col">Email</th>
											<th scope="col">PhoneNumber</th>
											<th scope="col">Role</th>
											<th scope="col">Button</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>john_doe</td>
											<td>John Doe</td>
											<td>john@example.com</td>
											<td>1234567890</td>
											<td>Admin</td>
											<td>

                    					<a href="/job4u/detailUser" class="btn btn-info" type="button" style="background-color: #00688B; color: white;">Chi tiết</a>
                    					<button class="btn btn-danger">Delete</button>
                  				
											</td>
											
										</tr>
										<!-- Add more rows as needed -->
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- Post Management table -->
					<div id="postManagement" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Bài Viết</div>
						</div>
						<div class="card-body p-0">
						<form action="/job4u/detail" method="post">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead class="thead-light">
										<tr>
											<th scope="col">EmployerID</th>
											<th scope="col">Company Name</th>
											<th scope="col">JobTitle</th>
											<th scope="col">Job Requirenments</th>
											<th scope="col">Job Location</th>
											<th scope="col">Industry</th>
											<th scope="col">Salary</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${qlBV}" var="bv">
										<tr>
											<th scope="row">${bv.jobid}</th>
											<td>${bv.employer.companyname}</td>
											<td>${bv.jobtitle}</td>
											<td>${bv.jobrequirements}</td>
											<td>${bv.joblocation}</td>
											<td>${bv.jobdescription}</td>
											<td>${bv.salary}</td>
											<td>
                    					<a href="/job4u/detail/${bv.jobid}" class="btn btn-info" type="button" style="background-color: #00688B; color: white;">Chi tiết</a>
                    					<button class="btn btn-danger">Delete</button>
											</td>
										</tr>
										<!-- Add more rows as needed -->
										</c:forEach>
									</tbody>
								</table>
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
											<td>
											<button class="btn btn-success">Detail</button>
											</td>
										</tr>
										<!-- Add more rows as needed -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--statisticalManagement table -->
					<div id="statisticalManagement" class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Thống Kê</div>
						</div>
						<div class="card-body">
							<h5 class="card-title">
								<ol class="breadcrumb">
									<li class="breadcrumb-item">Biểu Đồ</li>
									<li class="breadcrumb-item"><a href="/Thongke">Thống kê chi tiết</a></li>
								</ol>
							</h5>
							<div class="panel panel-default">
                                <!-- /.panel-heading -->
                                
                                <!-- /.panel-body -->
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
    var activeLink = document.querySelector('.nav-link[onclick*="' + tableId + '"]');
    activeLink.classList.add('active');
}
</script>

</html>
</html>