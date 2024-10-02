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
body {
	font-family: 'Open Sans', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #E6F3F3; /* Màu nền từ hình ảnh */
}

.containerr {
	width: 80%;
	max-width: 1200px;
	margin: 20px auto;
	background-color: #E6F3F3;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.header {
	display: flex;
	align-items: center;
}

.header img {
	border-radius: 50%;
	width: 120px;
	height: 120px;
	object-fit: cover;
	margin-right: 20px;
}

.header h1 {
	font-size: 2.5em;
	margin: 0;
	color: #333;
}

.header p {
	margin: 5px 0;
	font-size: 1.2em;
	color: #555;
}

.section {
	margin-top: 30px;
}

.section h2 {
	font-size: 1.8em;
	 border-bottom: 2px solid #28a745;
	display: inline-block;
	margin-bottom: 10px;
}

.section ul {
	list-style-type: none;
	padding: 0;
}

.section ul li {
	margin-bottom: 10px;
	font-size: 1.2em;
	color: #555;
}

.skills, .languages {
	display: flex;
	justify-content: space-between;
}

.skill, .language {
	width: 48%;
}

.progress-bar {
	background-color: #f4f4f4;
	border-radius: 5px;
	margin-top: 5px;
	position: relative;
}

.progress {
	background-color: #007BFF;
	height: 10px;
	border-radius: 5px;
}

</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<!-- /header -->
	
		<br>
		<article>
			<div class="containerr">
    <!-- Header -->
    <div class="header">
        <img src="profile-image.jpg" alt="Profile Image">
        <div>
            <h1>Nguyễn Văn A</h1>
            <p>Ngày sinh: 12/12/1990</p>
            <p>Giới tính: Nam</p>
        </div>
    </div>

    <!-- Profile Summary -->
    <div class="section">
        <h2>Tóm tắt</h2>
        <p>Một lập trình viên với 5 năm kinh nghiệm phát triển các ứng dụng web và di động, có kỹ năng chuyên sâu về Java, Spring, và Angular.</p>
    </div>

    <!-- Experience -->
    <div class="section">
        <h2>Kinh nghiệm làm việc</h2>
        <ul>
            <li>
                <strong>Senior Developer</strong> - Công ty ABC (2020 - Hiện tại)
                <p>Phát triển và bảo trì các ứng dụng web bằng Java và Spring Framework.</p>
            </li>
            <li>
                <strong>Junior Developer</strong> - Công ty XYZ (2017 - 2020)
                <p>Làm việc trong đội phát triển ứng dụng di động và tích hợp API.</p>
            </li>
        </ul>
    </div>

    <!-- Education -->
    <div class="section">
        <h2>Trình độ học vấn</h2>
        <ul>
            <li>
                <strong>Cử nhân CNTT</strong> - Đại học Công nghệ (2013 - 2017)
            </li>
        </ul>
    </div>

    <!-- Skills -->
    <div class="section skills">
        <div class="skill">
            <h2>Kỹ năng</h2>
            <ul>
                <li>Java
                    <div class="progress-bar">
                        <div class="progress" style="width: 90%;"></div>
                    </div>
                </li>
                <li>Spring Framework
                    <div class="progress-bar">
                        <div class="progress" style="width: 80%;"></div>
                    </div>
                </li>
                <li>Angular
                    <div class="progress-bar">
                        <div class="progress" style="width: 70%;"></div>
                    </div>
                </li>
            </ul>
        </div>

        <!-- Languages -->
        <div class="language">
            <h2>Ngôn ngữ</h2>
            <ul>
                <li>Tiếng Việt
                    <div class="progress-bar">
                        <div class="progress" style="width: 100%;"></div>
                    </div>
                </li>
                <li>Tiếng Anh
                    <div class="progress-bar">
                        <div class="progress" style="width: 75%;"></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <!-- Interests -->
    <div class="section">
        <h2>Sở thích</h2>
        <div class="interests">
            <span>Đọc sách</span>
            <span>Chơi thể thao</span>
            <span>Đi du lịch</span>
        </div>
    </div>
</div>
		</article>

		<br>


	</div>
	<!-- footer-->
	<%@ include file="/views/footer.jsp"%>
	<!-- /footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</html>