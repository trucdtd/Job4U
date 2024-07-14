<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà tuyển dụng</title>
<!--link icon gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	display: flex;
	min-height: 100vh;
	margin: 0;
}

.sidebar {
	min-width: 250px;
	max-width: 250px;
	background-color: #007bff; /* Màu xanh dương */
	padding: 20px 0;
	color: white;
}

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
}
</style>
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->

		<div class="row">
			<aside class="col-md-3">
				<div class="sidebar">
					<a class="navbar-brand mb-3" href="#">Quản Lý Tuyển Dụng</a> 
					<a href="#" class="nav-link">Đăng bài tuyển dụng</a> 
					<a href="#" class="nav-link">CV ứng tuyển</a>
					<a href="#" class="nav-link">Bài tuyển dụng</a> 
					<a href="#" class="nav-link">Dịch vụ bài đăng</a>			
				</div>
			</aside>
			
			<article class="col-md-9">
				<div class="content">
				<h1>Main Content</h1>
				<p>This is the main content area.</p>
			</div>
			</article>
		</div>
		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- /footer -->
	</div>
</body>
</html>