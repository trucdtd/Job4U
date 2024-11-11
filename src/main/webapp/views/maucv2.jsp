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
		
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background-color: #f4f4f4;
	display: flex;
	flex-direction: column;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

header, footer {
	width: 100%;
	background-color: #fff;
	z-index: 10;
}

footer {
	margin-top: auto;
}

/* CV Container */
.cv-container {
	width: 850px;
	background-color: #fff;
	padding: 40px;
	display: grid;
	grid-template-columns: 1fr 2fr;
	gap: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	position: relative;
	overflow: hidden;
	margin-top: 20px;
	margin-bottom: 20px;
}

/* Decorative Header and Footer */
.header-decoration, .footer-decoration {
	position: absolute;
	width: 100%;
	height: 120px;
	background-color: #2c3e50;
}

.header-decoration {
	top: 0;
	clip-path: polygon(0 0, 100% 0, 100% 50%, 0 100%);
}

.footer-decoration {
	bottom: 0;
	clip-path: polygon(0 50%, 100% 0, 100% 100%, 0 100%);
}

/* Left Column */
.left-column {
	background-color: #f4f4f4;
	padding: 20px;
	border-radius: 8px;
	border-right: 3px solid #2c3e50;
	z-index: 1;
}

.profile-picture {
	width: 100%;
	height: 200px;
	background-color: #ddd;
	border-radius: 8px;
	background-size: cover;
	background-position: center;
	margin-bottom: 20px;
	transition: all 0.3s ease-in-out;
}

.profile-picture:hover {
	transform: scale(1.05);
}

.section-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin-bottom: 10px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.contact-info, .education, .skills {
	margin-bottom: 20px;
}

.contact-info p, .education p, .skills p {
	margin: 5px 0;
	color: #555;
	font-size: 14px;
}

/* Right Column */
.right-column {
	z-index: 1;
	padding: 0 20px;
	padding-bottom: 40px;
}

.right-column h1 {
	padding-top: 53px;
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-bottom: 5px;
	padding-bottom: 50px;
}

.right-column h2 {
	margin-top: -50px;
	font-size: 17px;
	color: #666;
}

/* Work Experience Section */
.work-experience-item {
	margin-bottom: 15px;
}

.work-experience-item h4 {
	font-size: 16px;
	font-weight: bold;
	color: #333;
}

.work-experience-item p {
	color: #555;
	font-size: 14px;
	margin: 2px 0;
}

.profile, .work-experience {
	margin-bottom: 20px;
}

textarea {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
	min-height: 120px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	color: #333;
}

textarea:focus {
	border-color: #2c3e50;
	outline: none;
}

input[type="text"], input[type="email"], input[type="date"], select {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
	color: #333;
}

input[type="text"]:focus, input[type="email"]:focus, input[type="date"]:focus,
	select:focus {
	border-color: #2c3e50;
	outline: none;
}

button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 6px 12px; /* Giảm padding */
	cursor: pointer;
	margin-top: 10px;
	border-radius: 5px;
	font-size: 13px; /* Giảm font-size */
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #45a049;
}

button:focus {
	outline: none;
}

input, select, textarea {
    animation: fadeIn 0.5s forwards;
}

@keyframes fadeIn {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

/* Thêm hiệu ứng xuất hiện từ từ cho các nút "Thêm" */
button.add-field {
	opacity: 0;
	animation: fadeIn 0.5s forwards;
	animation-delay: 0.3s; /* Tạo độ trễ cho nút */
}

/* Ẩn nút thêm ban đầu */
.add-button-container {
	display: none;
	margin-top: 10px;
}

/* Hiển thị nút thêm khi hover vào khu vực nhập liệu */
.section:hover .add-button-container {
	display: block;
}

/* Hiệu ứng hover cho các input */
input[type="text"]:hover, input[type="email"]:hover, input[type="date"]:hover,
	select:hover {
	border-color: #2c3e50;
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<div class="cv-container">
		<!-- Decorative Header -->
		<div class="header-decoration"></div>
		<div class="inner-header-decoration"></div>

		<!-- Decorative Footer -->
		<div class="footer-decoration"></div>
		<div class="inner-footer-decoration"></div>

		<!-- Corner Triangles -->
		<div class="top-left-triangle"></div>
		<div class="bottom-right-triangle"></div>

		<!-- Left Column -->
		<div class="left-column">
			<div class="profile-picture" onclick="document.getElementById('profile-picture-input').click()" style="background-image: url('your-image-url.jpg');"></div>
			<input type="file" id="profile-picture-input" style="display: none;" accept="image/*" onchange="loadProfilePicture(event)">

			<div class="section">
				<div class="section-title">Contact</div>
				<div class="contact-info">
					<p>Điện Thoại: <input type="text" name="phone" placeholder="+123-456-7890"></p>
					<p>Email: <input type="email" name="email" placeholder="alfredo@example.com"></p>
					<p>Ngày Sinh: <input type="date" name="dob"></p>
					<p>Ngôn Ngữ: <input type="text" name="language" placeholder="Tiếng Việt"></p>
					<p>Giới Tính: <select name="gender"><option value="male">Nam</option><option value="female">Nữ</option></select></p>
				</div>
			</div>

			<!-- Học Vấn -->
			<div class="section">
				<div class="section-title">Học Vấn</div>
				<div id="education-section" class="draggable-section">
					<input type="text" name="education[]" placeholder="FPT Polytechnic" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('education-section')">+ Thêm Học Vấn</button>
				</div>
			</div>

			<div class="section">
				<div class="section-title">Chứng Chỉ</div>
				<div id="certificates-section">
					<input type="text" name="certificates[]" placeholder="Nhập chứng chỉ" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('certificates-section')">+ Thêm Chứng Chỉ</button>
				</div>
			</div>
		</div>

		<div class="right-column">
			<h1><input type="text" name="name" placeholder="Nguyễn Văn A"></h1>
			<h2><input type="text" name="title" placeholder="Vị Tí Ứng Tuyển"></h2>

			<div class="section">
				<div class="section-title">Mục Tiêu Nghề Nghiệp</div>
				<textarea name="careerGoal" placeholder="Nhập mục tiêu nghề nghiệp"></textarea>
			</div>

			<!-- Kỹ Năng -->
			<div class="section">
				<div class="section-title">Kỹ Năng</div>
				<div id="skills-section" class="draggable-section">
					<input type="text" name="skills[]" placeholder="Nhập kỹ năng" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('skills-section')">+ Thêm Kỹ Năng</button>
				</div>
			</div>

			<div class="section">
				<div class="section-title">Dự Án Đã Tham Gia</div>
				<div id="projects-section" class="draggable-section">
					<div class="work-experience-item">
						<input type="text" name="projects[]" placeholder="Tên dự án - Công ty">
						<input type="text" name="project-dates[]" placeholder="Thời gian">
						<textarea name="project-descriptions[]" placeholder="Mô tả"></textarea>
					</div>
				</div>
				<div class="add-button-container">
					<button onclick="addProjectField()">+ Thêm Dự Án</button>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
	<script>
		function addField(sectionId) {
		    const section = document.getElementById(sectionId);
		    const input = document.createElement("input");
		    input.type = "text";
		    input.name = sectionId.replace('-section', '') + "[]";
		    input.placeholder = "Nhập thông tin";
		    input.style.opacity = 0;
		    section.appendChild(input);

		    setTimeout(() => {
		        input.style.transition = "opacity 0.5s";
		        input.style.opacity = 1;
		    }, 50);
		}

		function addProjectField() {
		    const projectSection = document.getElementById('projects-section');
		    const div = document.createElement("div");
		    div.className = "work-experience-item";

		    div.innerHTML = `
		        <input type="text" name="projects[]" placeholder="Tên dự án - Công ty" style="opacity: 0;">
		        <input type="text" name="project-dates[]" placeholder="Thời gian" style="opacity: 0;">
		        <textarea name="project-descriptions[]" placeholder="Mô tả" style="opacity: 0;"></textarea>
		    `;
		    projectSection.appendChild(div);

		    const inputs = div.querySelectorAll('input, textarea');
		    setTimeout(() => {
		        inputs.forEach(input => {
		            input.style.transition = "opacity 0.5s";
		            input.style.opacity = 1;
		        });
		    }, 50);
		}

	</script>
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kích hoạt kéo thả cho các phần khác nhau
        const sections = ['education-section', 'skills-section', 'projects-section', 'certificates-section'];
        
        sections.forEach(sectionId => {
            const section = document.getElementById(sectionId);
            if (section) {
                new Sortable(section, {
                    animation: 150,
                    handle: '.section-title' // Bạn có thể thay đổi handle nếu cần
                });
            }
        });
    });
</script>
</body>
</html>