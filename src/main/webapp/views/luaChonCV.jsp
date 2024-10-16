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
<link rel="stylesheet" href="/css/luaChonCV.css">
</head>
<body>
<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<br>
	<div class="container">
		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv2.jpg" alt="CV 1">
				<div class="buttons">
					<button class="preview-btn">Xem trước</button>
					<a href="/luaCV/mauCV1" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Trang trọng</b>
			</div>
		</div>

		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv3.jpg" alt="CV 1">
				<div class="buttons">
					<button class="preview-btn">Xem trước</button>
					<a href="/luaCV/mauCV1" class="use-btn">Dùng mẫu</a>
				</div>
			</div>
			<div class="info">
				<b>Trang trọng</b>
			</div>
		</div>

		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv4.jpg" alt="CV 1">
				<div class="buttons">
					<button class="preview-btn">Xem trước</button>
					<button class="use-btn">Dùng mẫu</button>
				</div>
			</div>
			<div class="info">
				<b>Thanh Lịch</b>
			</div>
		</div>

		<div class="cv-template">
			<div class="image-container">
				<img src="/img/cv5.jpg" alt="CV 1">
				<div class="buttons">
					<button class="preview-btn">Xem trước</button>
					<button class="use-btn">Dùng mẫu</button>
				</div>
			</div>
			<div class="info">
				<b>Màu Sắc</b>
			</div>
		</div>
		<!-- Add more templates similarly -->
	</div>
<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	
	<!-- <script>
    // Add functionality to buttons if needed
document.querySelectorAll('.use-btn').forEach(button => {
    button.addEventListener('click', () => {
        alert('Mẫu đã được chọn!');
    });
});

document.querySelectorAll('.preview-btn').forEach(button => {
    button.addEventListener('click', () => {
        alert('Xem trước mẫu này!');
    });
});

</script> -->
</body>
</html>