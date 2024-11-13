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
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	padding: 0;
	margin: 0;
	background-color: #f4f4f9;
}

.resume-container {
	display: flex;
	width: 800px;
	border: 1px solid #e0e0e0;
	background-color: white;
	margin: auto;
	flex-grow: 1;
}

.left-column, .right-column {
	padding: 20px;
}

.left-column {
	width: 35%;
	background-color: #d2e4d9;
}

.right-column {
	width: 65%;
	margin-top: 20px;
}

.photo-background {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px;
}

.personal-info {
	text-align: center;
}

.photo-frame input[type="file"] {
	display: none;
}

.photo-frame {
	width: 150px;
	height: 200px;
	margin: auto;
	overflow: hidden;
	border: 2px solid #4d5c4b;
	border-radius: 8px;
	background-color: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
}

.photo-frame img {
	max-width: 100%;
	max-height: 100%;
	object-fit: scale-down;
	cursor: pointer;
}

h1 {
	font-size: 24px;
	color: #4d5c4b;
}

h2 {
	font-size: 15px;
	color: #4d5c4b;
	margin-bottom: 10px;
}

.section-title {
	font-size: 18px;
	margin-top: 20px;
	color: #4d5c4b;
	border-bottom: 2px solid #4d5c4b;
	padding-bottom: 5px;
}

p {
	font-size: 14px;
	color: #555;
	line-height: 1.6;
}

.contact-info, .skills, .reference {
	margin-bottom: 20px;
}

.contact-info p, .skills p, .reference p {
	font-size: 14px;
	color: #555;
	margin-bottom: 5px;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="date"],
	select, textarea {
	width: 100%;
	max-width: 100%;
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
	box-sizing: border-box;
}

.skills .input-group {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.skills .input-group input[type="text"] {
	flex: 1;
	padding: 8px;
	margin-right: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.skills .input-group button {
	padding: 6px 12px;
	background-color: #4d5c4b;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.input-group input[type="text"], .input-group textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

button {
	padding: 8px 15px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.input-group button:hover {
	background-color: #3b4b3b;
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<br>

	<div class="resume-container">
		<!-- Left Column -->
		<div class="left-column">
			<div class="photo-frame">
				<input type="file" accept="image/*" onchange="previewImage(event)">
				<img id="profileImage" src="profile.jpg" alt="Profile Image">
			</div>
			<div class="contact-info">
				<h2 class="section-title">Thông Tin</h2>
				<label for="email">Email:</label> <input type="email" id="email"
					value="hello@reallygreatsite.com"> <label for="phone">Phone:</label>
				<input type="tel" id="phone" value="+1 234 567 8910"> <label
					for="dob">Ngày Sinh:</label> <input type="date" id="dob"
					value="2004-09-28"> <label for="gender">Giới Tính:</label>
				<select id="gender">
					<option value="male" selected>Nam</option>
					<option value="female">Nữ</option>
					<option value="other">Khác</option>
				</select> <label for="language">Ngôn Ngữ:</label> <input type="text"
					id="language" value="Việt Nam">
			</div>

			<div class="skills" id="educationSection">
				<h2 class="section-title">Học Vấn</h2>
				<div class="input-group">
					<input type="text" placeholder="Nhập học vấn">
				</div>
				<button type="button" onclick="addEducationField()">+ Thêm
					Học Vấn</button>
			</div>

			<div class="skills" id="certificateSection">
				<h2 class="section-title">Chứng Chỉ</h2>
				<div class="input-group">
					<input type="text" placeholder="Nhập chứng chỉ">
				</div>
				<button type="button" onclick="addCertificateField()">+
					Thêm Chứng Chỉ</button>
			</div>

		</div>

		<!-- Right Column -->
		<div class="right-column">
			<div class="personal-info">
				<h1 contenteditable="true">OLIVIA WILSON</h1>
				<!-- <h2 contenteditable="true">GRAPHIC DESIGNER</h2> -->
				<textarea rows="4" cols="50"
					placeholder="Write a personal summary here...">I am a fun, hard-working creative who strives for excellence in everything I do. I’m an avid learner and seek to enhance the lives of everyone around me.</textarea>
			</div>

			<div id="experienceSection">
				<h2 class="section-title">Chứng Chỉ</h2>
				<div class="input-group">
					<input type="text" placeholder="Nhập kinh nghiệm">
				</div>
				<button type="button" onclick="addExperienceField()">+ Thêm
					Kinh Nghiệm</button>
			</div>


			<div id="projectSection">
				<h2 class="section-title">Dự Án Đã Tham Gia</h2>
				<div class="input-group">
					<input type="text" placeholder="Nhập thời gian"> <input
						type="text" placeholder="Tên dự án">
					<textarea placeholder="Mô tả dự án..."></textarea>
				</div>
				<button type="button" onclick="addProjectField()">+ Thêm Dự
					Án</button>
			</div>

			<div id="hobbiesSection">
				<h2 class="section-title">Sở Thích</h2>
				<div class="input-group">
					<input type="text" placeholder="Sở Thích">
				</div>
				<button type="button" onclick="addHobbiesField()">+ Thêm Sở
					Thích</button>
			</div>
		</div>
	</div>
	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->

	<script>
        // Image preview function
        document.getElementById("profileImage").addEventListener("click", function () {
            document.querySelector(".photo-frame input[type='file']").click();
        });
        
        function previewImage(event) {
            const file = event.target.files[0];
            if (file && file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = () => document.getElementById('profileImage').src = reader.result;
                reader.readAsDataURL(file);
            } else {
                alert('Please select an image file.');
            }
        }

        // Dynamic field functions for Education, Certificate, Experience, and Project sections
       function addEducationField() {
    const educationSection = document.getElementById('educationSection');
    const newField = document.createElement('div');
    newField.classList.add('input-group');
    newField.innerHTML = `
        <input type="text" placeholder="Nhập học vấn">
    `;
    // Insert the new field before the button
    educationSection.insertBefore(newField, educationSection.querySelector("button"));
}

function addCertificateField() {
    const certificateSection = document.getElementById('certificateSection');
    const newField = document.createElement('div');
    newField.classList.add('input-group');
    newField.innerHTML = `
        <input type="text" placeholder="Nhập chứng chỉ">
    `;
    // Insert the new field before the button
    certificateSection.insertBefore(newField, certificateSection.querySelector("button"));
}

function addExperienceField() {
    const experienceSection = document.getElementById('experienceSection');
    const newField = document.createElement('div');
    newField.classList.add('input-group');
    newField.innerHTML = `
        <input type="text" placeholder="Nhập kinh nghiệm">
    `;
    // Insert the new field before the button
    experienceSection.insertBefore(newField, experienceSection.querySelector("button"));
}

function addProjectField() {
    const projectSection = document.getElementById('projectSection');
    const newField = document.createElement('div');
    newField.classList.add('input-group');
    newField.innerHTML = `
        <input type="text" placeholder="Nhập thời gian">
        <input type="text" placeholder="Tên dự án">
        <textarea placeholder="Mô tả dự án..."></textarea>
    `;
    // Insert the new field before the button
    projectSection.insertBefore(newField, projectSection.querySelector("button"));
}
function addHobbiesField() {
    const experienceSection = document.getElementById('hobbiesSection');
    const newField = document.createElement('div');
    newField.classList.add('input-group');
    newField.innerHTML = `
        <input type="text" placeholder="Nhập Sở Thích">
    `;
    // Insert the new field before the button
    experienceSection.insertBefore(newField, experienceSection.querySelector("button"));
}
    </script>
</body>
</html>