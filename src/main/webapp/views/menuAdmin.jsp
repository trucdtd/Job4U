<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
/* Màu nền mặc định của các liên kết menu */
.navnhatuyendung {
	text-decoration: none;
	padding: 10px 20px;
	display: block;
	border-radius: 4px;
	color: black; /* Đảm bảo màu chữ mặc định là đen */
}

.navnhatuyendung:hover, .navnhatuyendung.active {
	background-color: #ffffff;
}

/* Đảm bảo rằng lớp active không ghi đè */
.navnhatuyendung.active {
	background-color: #ffffff !important;
}

.content {
	flex-grow: 1;
	padding: 20px;
	background-color: #c0c0c0;
}

.card {
	margin-bottom: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #198754;
	color: white;
	border-bottom: none;
	border-radius: 8px 8px 0 0;
}

.table th, .table td {
	vertical-align: middle;
}

.table thead th {
	background-color: #198754;
	color: white;
}

.btn-primary, .btn-danger {
	border-radius: 4px;
}

.dataTables_length, .dataTables_filter {
	margin-top: 1rem; /* mt-3 */
	margin-bottom: 1rem; /* mb-3 */
}

.form-label {
	color: #198754;
	font-weight: bold;
}
</style>

</head>
<body>
	<div class="col-lg-3 col-md-3 p-2 d-flex">
		<div class="d-flex flex-column flex-shrink-0 p-3 text-dark"
			style="width: 100%; background: #198754;">
			<a href="#"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
				<svg class="bi me-2" width="25" height="25">
                            <use xlink:href="#bootstrap"></use>
                        </svg> <span class="card-title p-2">Menu Quản
					Lý Người Dùng</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="#"
					class=" navnhatuyendung nav-link text-dark active"
					onclick="showTable(event, 'userManagement')"> <i
						class="bi bi-people-fill"></i> Quản Lý Tài Khoản
				</a></li>
				<li><a href="#" class="navnhatuyendung nav-link text-dark"
					onclick="showTable(event, 'postManagement')"> <i
						class="bi bi-table me-2"></i> Quản Lý Bài Viết
				</a></li>
				<li><a href="#" class="navnhatuyendung nav-link text-dark"
					onclick="showTable(event, 'cvManagement')"> <i
						class="bi bi-grid me-2"></i> Quản Lý CV
				</a></li>
				<li><a href="#" class="navnhatuyendung nav-link text-dark"
					onclick="showTable(event, 'statisticalManagement')"> <i
						class="bi bi-graph-up"></i> Quản Lý Thống Kê
				</a></li>
			</ul>
			<hr>
		</div>
	</div>


	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>
</html>