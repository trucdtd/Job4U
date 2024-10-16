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
<style>
/* CSS cho toàn trang */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	background-color: #f9f9f9;
	padding: 20px;
}

.cv-container {
	display: flex;
	width: 100%;
	max-width: 900px;
	margin: 0 auto;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
}

.left-column {
	width: 35%;
	background-color: #f4f4f4;
	padding: 30px;
	text-align: center;
}

.profile-pic {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-bottom: 20px;
}

.left-column h2 {
	font-size: 22px;
	color: #333;
}

.info {
	text-align: left;
	margin-top: 20px;
}

.info h3 {
	font-size: 16px;
	color: #555;
	margin-bottom: 10px;
}

.info p {
	font-size: 14px;
	color: #777;
	line-height: 1.5;
}

.skills {
	margin-top: 20px;
	text-align: left;
}

.skills h3 {
	font-size: 16px;
	color: #555;
	margin-bottom: 10px;
}

.skill-bar {
	margin-bottom: 15px;
}

.skill-bar p {
	font-size: 14px;
	color: #777;
	margin-bottom: 5px;
}

.bar {
	background-color: #ddd;
	height: 10px;
	border-radius: 5px;
}

.bar span {
	display: block;
	height: 100%;
	background-color: #4caf50;
	border-radius: 5px;
}

.right-column {
	width: 65%;
	padding: 30px;
}

.right-column h1 {
	font-size: 28px;
	color: #333;
}

.right-column h3 {
	font-size: 20px;
	color: #555;
	margin-top: 20px;
	margin-bottom: 10px;
}

.right-column p {
	font-size: 14px;
	color: #777;
	line-height: 1.6;
	margin-bottom: 15px;
}

.photo-frame {
	width: 150px; /* Chiều rộng theo tỷ lệ 3x4 */
	height: 200px; /* Chiều cao theo tỷ lệ 3x4 */
	border: 2px solid #ccc; /* Khung viền */
	border-radius: 50%; /* Tạo hình tròn hoặc oval */
	overflow: hidden; /* Đảm bảo ảnh không tràn ra ngoài */
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f8f8f8; /* Màu nền cho khung */
}

.profile-photo {
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* Đảm bảo ảnh lấp đầy toàn bộ khung mà không bị biến dạng */
}
</style>

</head>
<body>
	<div class="cv-container">
		<div class="left-column">
			<div class="photo-frame">
				<img src="profile.jpg" alt="Ảnh thẻ" class="profile-photo">
			</div>
			<div class="info">
				<h3>Thông tin liên hệ</h3>
				<p>
					Địa chỉ: <br>123 Đường ABC, Quận 1, TP.HCM
				</p>
				<p>
					Số điện thoại: <br>0123 456 789
				</p>
				<p>
					Email: <br>ananguyen@gmail.com
				</p>
			</div>

			<div class="skills">
				<h3>Kỹ năng</h3>
				<div class="skill-bar">
					<p>Kỹ năng giao tiếp</p>
					<div class="bar">
						<span style="width: 80%;"></span>
					</div>
				</div>
				<div class="skill-bar">
					<p>Kỹ năng tổ chức</p>
					<div class="bar">
						<span style="width: 75%;"></span>
					</div>
				</div>
				<div class="skill-bar">
					<p>Tiếng Anh</p>
					<div class="bar">
						<span style="width: 90%;"></span>
					</div>
				</div>
			</div>
		</div>

		<div class="right-column">
			<h1>Anan Nguyễn</h1>
			<h3>Học vấn</h3>
			<p>
				<strong>Cử nhân Quản trị Kinh doanh</strong> <br> Đại học ABC <br>
				2015 - 2019
			</p>

			<h3>Kinh nghiệm làm việc</h3>
			<p>
				<strong>Chuyên viên hỗ trợ khách hàng</strong> <br> Công ty XYZ
				<br> 2020 - Hiện tại
			</p>
			<p>- Hỗ trợ khách hàng qua điện thoại, email và trực tiếp.</p>
			<p>- Giải quyết các vấn đề liên quan đến dịch vụ và sản phẩm của
				công ty.</p>

			<h3>Hoạt động ngoại khóa</h3>
			<p>
				<strong>Tình nguyện viên</strong> <br> Tổ chức ABC <br>
				2018 - 2019
			</p>
			<p>- Tham gia các hoạt động tình nguyện và hỗ trợ cộng đồng.</p>
		</div>
	</div>
	</script>
	<script>

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

</script>
</body>
</html>