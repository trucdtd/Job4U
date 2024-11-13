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
body {
	background-color: #f8f9fa; /* Màu nền nhạt */
}

.card-header {
	background-color: #007bff; /* Màu xanh */
	color: white; /* Chữ màu trắng */
}

.label {
	font-weight: bold;
	color: #007bff; /* Màu xanh cho các nhãn */
}

.info {
	background-color: #e9ecef; /* Màu nền nhạt cho thông tin */
	padding: 10px;
	border-radius: 5px;
}

/* phần css cv */
.cv-container {
	width: 800px;
	background-color: #ffffff;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	display: flex;
	padding: 40px;
	gap: 30px;
}

.left-column {
	width: 35%;
	background-color: #f7f7f7;
	padding: 20px;
	border-radius: 15px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.section-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin: 15px 0 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
	border-bottom: 2px solid #333;
	padding-bottom: 5px;
	width: 100%; /* Đặt chiều rộng bằng với phần chứa */
	text-align: center; /* Căn giữa văn bản */
}

.about p, .contact p, .skills ul, .language p {
	font-size: 14px;
	color: #555;
	margin-bottom: 10px;
	line-height: 1.6;
}

.contact, .skills, .language {
	margin-bottom: 20px;
}

.skills ul, .language {
	list-style: none;
	padding-left: 0;
}

.right-column {
	width: 65%;
}

.right-column h1 {
	font-size: 36px;
	font-weight: 700;
	color: #444;
	margin-bottom: 5px;
}

.right-column h2 {
	font-size: 18px;
	font-weight: 500;
	color: #777;
	margin-bottom: 20px;
	letter-spacing: 1px;
}

.experience, .education, .references {
	margin-bottom: 30px;
}

.job, .education-item, .reference-item {
	margin-bottom: 20px;
	padding: 10px 0;
	border-left: 3px solid #888;
	padding-left: 15px;
}

.job h3, .education-item h3, .reference-item h3 {
	font-size: 16px;
	font-weight: 600;
	color: #333;
}

.job span, .education-item span, .reference-item span {
	display: block;
	font-size: 14px;
	color: #888;
	margin-top: 5px;
}

.description {
	font-size: 13px;
	color: #555;
	margin-top: 8px;
	line-height: 1.5;
}

.reference-item p {
	font-size: 13px;
	color: #555;
}

/* Container chính */
.cv-container {
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	padding: 30px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	font-family: 'Helvetica Neue', sans-serif;
	color: #444;
}

.cv-header {
	background-color: #1da868; /* Màu xanh lá nhạt hơn */
	color: #ffffff; /* Màu chữ trắng */
	padding: 20px 0; /* Khoảng cách bên trên và bên dưới */
	margin-bottom: 30px; /* Khoảng cách dưới tiêu đề */
}

.cv-header h2 {
	font-size: 36px;
	margin: 0;
}

.cv-header h4 {
	font-size: 18px;
	font-weight: 400;
	margin-top: 5px;
}
/* Body CV */
.cv-body {
	margin-top: 20px;
}

/* Phần thông tin cá nhân */
.info-grid {
	display: flex; /* Sử dụng flexbox để căn chỉnh */
	align-items: center; /* Căn giữa theo chiều dọc */
	gap: 20px; /* Khoảng cách giữa ảnh và thông tin */
}

.info-details {
	margin-left: 70px; /* Nhích sang bên phải 20px */
}

/* Các phần khác */
.cv-section {
	margin-bottom: 25px;
}

.cv-section h3 {
	font-size: 20px;
	color: #1da868;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
	padding-bottom: 5px;
}

.info-details {
	flex: 1; /* Để thông tin chiếm toàn bộ không gian còn lại */
}

/* Văn bản trong các phần */
p {
	font-size: 16px;
	line-height: 1.6;
}

/* Hiệu ứng khi in */
@media print {
	.cv-container {
		box-shadow: none;
	}
}

.input-field, .input-area {
	width: 100%;
	padding: 12px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
	color: #333;
	background-color: #f8f9fa;
}

.input-field:focus, .input-area:focus {
	border-color: #1da868; /* Màu viền khi ô nhập được chọn */
	box-shadow: 0 0 5px rgba(29, 168, 104, 0.5); /* Hiệu ứng bóng đổ */
}

.input-field::placeholder, .input-area::placeholder {
	color: #aaa; /* Màu chữ placeholder */
	font-style: italic;
}

.input-area {
	min-height: 100px;
	resize: vertical; /* Cho phép thay đổi chiều cao */
}

textarea {
	font-family: Arial, sans-serif;
	/* Đảm bảo font trong ô nhập giống nhau */
}

.upload-label {
	cursor: pointer;
	display: inline-block;
	position: relative;
}

.profile-photo {
	width: 100px; /* Đặt chiều rộng cố định */
	height: 133px; /* Đặt chiều cao cố định */
	border-radius: 5px;
	border: 2px solid #4CAF50; /* Đường viền màu xanh */
	overflow: hidden;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
}

.cv-photo {
	width: 100%; /* Đảm bảo ảnh luôn vừa khung */
	height: 100%; /* Đảm bảo ảnh luôn vừa khung */
	object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
}

.placeholder-photo {
	width: 100%;
	height: 100%;
	background-color: #f0f0f0;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
}

.placeholder {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: #a0a0a0;
}

button {
	padding: 8px 15px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 40px
}
/* Ẩn nút thêm mặc định */
.add-button {
	display: none;
}

/* Hiển thị nút thêm khi hover vào vùng chứa */
#skills-container:hover .add-button, #certifications-container:hover .add-button,
	#experience-container:hover .add-button, #projects-container:hover .add-button
	{
	display: inline-block;
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<div class="container mt-4">
		<div class="cv-container" id="cv-content">
			<div class="left-column" id="sortable-left">
				<div class="profile-photo">
					<input type="file" id="profile-image" accept="image/*"
						style="display: none;" onchange="previewImage(event)"> <label
						for="profile-image" class="upload-label"> <img
						id="profile-img-preview" src="path/to/default-image.jpg"
						alt="Ảnh ứng viên" class="cv-photo">
					</label>
				</div>
				<div class="contact section">
					<div class="section-title">Liên Hệ</div>
					<input type="text" placeholder="Số điện thoại" id="phonenumbercv"
						class="input-field"> <input type="email"
						placeholder="Email" id="emailcv" class="input-field"> <input
						type="date" placeholder="Ngày sinh" id="dateOfbirth"
						class="input-field"> <input type="language"
						placeholder="Ngôn Ngữ" id="languages" class="input-field">
					<input type="text" placeholder="Giới tính" id="gender"
						class="input-field">
				</div>
				<div class="skills section">
					<div class="section-title">Kỹ Năng</div>
					<div id="skills-container">
						<input type="text" id="skills" class="input-field"
							placeholder="Kỹ năng">
						<button id="add-skill-button" class="add-button" type="button"
							onclick="addSkillField()">+ Thêm Kỹ Năng</button>
					</div>
				</div>

				<div class="certifications section">
					<div class="section-title">Chứng chỉ</div>
					<div id="certifications-container">
						<input type="text" id="certifications" class="input-field"
							placeholder="Chứng chỉ">
						<button id="add-certification-button" class="add-button"
							type="button" onclick="addCertificationField()">+ Thêm
							Chứng Chỉ</button>
					</div>
				</div>

				
			</div>

			<div class="right-column" id="sortable-right">
				<h1 contenteditable="true">OLIVIA WILSON</h1>
				<div class="experience section">
					<div class="section-title">Kinh Nghiệm</div>
					<div id="experience-container">
						<textarea id="experience" class="input-area"
							placeholder="Kinh nghiệm làm việc"></textarea>
						<button id="add-experience-button" class="add-button"
							type="button" onclick="addExperienceField()">+ Thêm Kinh
							Nghiệm</button>
					</div>
				</div>

				<div class="projects section">
					<div class="section-title">Dự Án Đã Tham Gia</div>
					<div id="projects-container">
						<div class="project-field">
							<input type="text" class="input-field" placeholder="Tên Dự Án">
							<input type="text" class="input-field" placeholder="Thời Gian">
							<textarea class="input-area" placeholder="Mô Tả"></textarea>
						</div>
						<button id="add-project-button" class="add-button" type="button"
							onclick="addProjectField()">+ Thêm Dự Án</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script>
	function addSkillField() {
	    const skillsContainer = document.getElementById('skills-container');
	    const addSkillButton = document.getElementById('add-skill-button');

	    const newField = document.createElement('input');
	    newField.type = 'text';
	    newField.className = 'input-field';
	    newField.placeholder = 'Kỹ năng';

	    skillsContainer.insertBefore(newField, addSkillButton);
	}

	function addCertificationField() {
	    const certificationsContainer = document.getElementById('certifications-container');
	    const addCertificationButton = document.getElementById('add-certification-button');

	    const newField = document.createElement('input');
	    newField.type = 'text';
	    newField.className = 'input-field';
	    newField.placeholder = 'Chứng chỉ';

	    certificationsContainer.insertBefore(newField, addCertificationButton);
	}

	function addExperienceField() {
	    const experienceContainer = document.getElementById('experience-container');
	    const addExperienceButton = document.getElementById('add-experience-button');

	    const newField = document.createElement('textarea');
	    newField.className = 'input-area';
	    newField.placeholder = 'Kinh nghiệm làm việc';

	    experienceContainer.insertBefore(newField, addExperienceButton);
	}

	function addProjectField() {
	    const projectsContainer = document.getElementById('projects-container');
	    const addProjectButton = document.getElementById('add-project-button');

	    const newProjectField = document.createElement('div');
	    newProjectField.classList.add('project-field');

	    const projectName = document.createElement('input');
	    projectName.type = 'text';
	    projectName.className = 'input-field';
	    projectName.placeholder = 'Tên Dự Án';

	    const projectTime = document.createElement('input');
	    projectTime.type = 'text';
	    projectTime.className = 'input-field';
	    projectTime.placeholder = 'Thời Gian';

	    const projectDescription = document.createElement('textarea');
	    projectDescription.className = 'input-area';
	    projectDescription.placeholder = 'Mô Tả';

	    newProjectField.appendChild(projectName);
	    newProjectField.appendChild(projectTime);
	    newProjectField.appendChild(projectDescription);

	    projectsContainer.insertBefore(newProjectField, addProjectButton);
	}
	</script>

</body>
</html>