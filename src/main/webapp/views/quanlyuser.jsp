<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Người Dùng</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
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
		<div class="col-md-3">
			<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
				style="width: 260px;">
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
					<svg class="bi me-2" width="25" height="25">
						<use xlink:href="#bootstrap"></use></svg> <span class="card-title">Menu
						User Management</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a href="#" class="nav-link active"
						aria-current="page"> <svg class="bi me-2" width="16"
								height="16">
          		<use xlink:href="#home"></use></svg> Home
					</a></li>
					<li><a href="#" class="nav-link text-white"> <svg
								class="bi me-2" width="16" height="16">
          		<use xlink:href="#speedometer2"></use></svg> Quản Lý Tài Khoản
					</a></li>
					<li><a href="#" class="nav-link text-white"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#table"></use></svg> Quản Lý Bài Viết
					</a></li>
					<li><a href="#" class="nav-link text-white"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#grid"></use></svg> Quản Lý CV
					</a></li>
					
				</ul>
				<hr>
				<div class="dropdown">
					<a href="#"
						class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://github.com/mdo.png" alt="" width="30"
						height="30" class="rounded-circle me-2"> <strong>mdo</strong>
					</a>
					<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
						aria-labelledby="dropdownUser1" style="">
						<li><a class="dropdown-item" href="#">New project...</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Profile</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Sign out</a></li>
					</ul>
				</div>
			</div>
		</div>
			<!-- aside -->
			<!--article  -->
			<div class="col-md-9 ">
				<div class="card">
					<div class="card-header">
						<div class="card-title">Quản Lý Tài Khoản</div>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<!-- Projects table -->
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
										<th scope="row">/kaiadmin/</th>
										<td>4,569</td>
										<td>340</td>
										<td><i class="fas fa-arrow-up text-success me-3"></i>
											46,53%</td>
									</tr>
									<tr>
										<th scope="row">/kaiadmin/index.html</th>
										<td>3,985</td>
										<td>319</td>
										<td><i class="fas fa-arrow-down text-warning me-3"></i>
											46,53%</td>
									</tr>
									<tr>
										<th scope="row">/kaiadmin/charts.html</th>
										<td>3,513</td>
										<td>294</td>
										<td><i class="fas fa-arrow-down text-warning me-3"></i>
											36,49%</td>
									</tr>
									<tr>
										<th scope="row">/kaiadmin/tables.html</th>
										<td>2,050</td>
										<td>147</td>
										<td><i class="fas fa-arrow-up text-success me-3"></i>
											50,87%</td>
									</tr>
									<tr>
										<th scope="row">/kaiadmin/profile.html</th>
										<td>1,795</td>
										<td>190</td>
										<td><i class="fas fa-arrow-down text-danger me-3"></i>
											46,53%</td>
									</tr>
									<tr>
										<th scope="row">/kaiadmin/</th>
										<td>4,569</td>
										<td>340</td>
										<td><i class="fas fa-arrow-up text-success me-3"></i>
											46,53%</td>
									</tr>
									<tr>
										<th scope="row">/kaiadmin/index.html</th>
										<td>3,985</td>
										<td>319</td>
										<td><i class="fas fa-arrow-down text-warning me-3"></i>
											46,53%</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!--article -->

		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- footer -->
</div>

</body>
<script>
$('.navbar-toggler').on('click', function() {
	  $('.navbar-collapse').toggleClass('show');
	});
</script>
</html>
