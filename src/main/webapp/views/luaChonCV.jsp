<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/luaChonCV.css">
</head>
<body>
<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	
	<%@ include file="/views/chat.jsp"%>
	<br>
	<div class="container">
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv11.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV1" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV1" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Trang trọng</b>
			</div>
		</div>
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv44.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV2" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV2" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Thanh Lịch</b>
			</div>
		</div>

		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv33.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV3" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV3" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Nghệ Thuật</b>
			</div>
		</div>

		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv22.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV4" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV4" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Màu Sắc</b>
			</div>
		</div>
		
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv55.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV5" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV5" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Hiện Đại</b>
			</div>
		</div>
		
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv66.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV6" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV6" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Đơn Giản</b>
			</div>
		</div>
		
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv77.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV7" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV7" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Tinh Tế</b>
			</div>
		</div>
		
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv88.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV8" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV8" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Tiêu Chuẩn</b>
			</div>
		</div>
		
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv99.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV9" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV9" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Ấn Tượng</b>
			</div>
		</div>
		
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv100.jpg" alt="CV 1">
				<div class="buttons">
					<a style="text-decoration: none;" href="/luaCV/truocCV10" class="preview-btn">Xem trước</a>
					<a style="text-decoration: none;" href="/luaCV/mauCV10" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Đêm Mê</b>
			</div>
		</div>
		<!-- Add more templates similarly -->
	</div>
<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	
</body>
</html>