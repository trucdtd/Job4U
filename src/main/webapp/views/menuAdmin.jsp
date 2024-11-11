<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Admin</title>
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="/css/admin.css">
<style>
/* CSS cho menu con */
.sub-menu {
	display: none; /* Ẩn menu con khi không nhấn */
	padding-left: 20px;
	list-style: none;
}

/* Nếu bạn muốn thêm hiệu ứng */
.sub-menu a {
	padding-left: 15px;
}
</style>
</head>
<body>
	<div class="col-lg-3 col-md-3 p-2 d-flex">
		<div class="card p-3 text-dark" style="width: 100%;">

			<a href="#"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none text-center">
				<i class="bi bi-journal-arrow-down" style="font-size: 40px"></i> <span
				class="fs-4 ms-2" style="background: #198754; color: white;">Menu
					ADMIN</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="#" class=" navqlndung nav-link text-dark active"
					onclick="showTable(event, 'userManagement')"> <i
						class="bi bi-speedometer2 me-2"></i> Quản Lý Tài Khoản
				</a></li>
				<li><a href="#" class="navqlndung nav-link text-dark"
					onclick="showTable(event, 'postManagement')"> <i
						class="bi bi-table me-2"></i> Quản Lý Bài Viết
				</a></li>
				<li><a href="#" class="navqlndung nav-link text-dark"
					onclick="showTable(event, 'cvManagement')"> <i
						class="bi bi-grid me-2"></i> Quản Lý CV
				</a></li>
				<li><a href="#" class="navqlndung nav-link text-dark"
					onclick="toggleSubMenu(event); showTable(event, 'serviceManagement')"> <i class="bi bi-house me-2"></i>
						Quản Lý Dịch Vụ
				</a> <!-- Sub-menu for Quản Lý Dịch Vụ -->
					<ul class="sub-menu"
						style="display: none; list-style: none; padding-left: 20px;">
						<li><a href="#" class="navqlndung nav-link text-dark"
							onclick="showTable(event, 'serviceNew')">Thêm dịch vụ</a></li>
					</ul></li>
				<li><a href="#" class="navqlndung nav-link text-dark"
					onclick="showTable(event, 'servicesSold')"><img width="20"
						height="20"
						src="https://img.icons8.com/pulsar-line/48/buy-sign.png"
						alt="buy-sign" /> Dịch Vụ Đã Bán </a></li>
				<li><a href="#" class="navqlndung nav-link text-dark"
					onclick="showTable(event, 'statisticalManagement')"><img
						width="20" height="20"
						src="https://img.icons8.com/ios/50/card-in-use.png"
						alt="card-in-use" /> Quản Lý Thống Kê </a></li>

			</ul>
			<hr>

		</div>
	</div>


	<script>
	//code sổ menu con
	function toggleSubMenu(event) {
		  event.preventDefault(); // Ngừng chuyển hướng của link
		  
		  // Tìm menu con gần nhất của mục "Quản Lý Dịch Vụ"
		  const subMenu = event.target.closest('li').querySelector('.sub-menu');
		  
		  // Kiểm tra và thay đổi trạng thái hiển thị của menu con
		  if (subMenu) {
		    const isVisible = subMenu.style.display === 'block';
		    subMenu.style.display = isVisible ? 'none' : 'block';
		  }
		}
	</script>
	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
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