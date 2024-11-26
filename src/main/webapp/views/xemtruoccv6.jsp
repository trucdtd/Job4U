<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cv-wrapper {
	display: flex;
	gap: 20px;
	padding: 20px;
	background-color: #f5f5f5;
	font-family: Arial, sans-serif;
}

/* Phần bên trái */
.cv-left {
	width: 70%;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.cv-header {
	text-align: center;
	margin-bottom: 20px;
}

.profile-photo {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-bottom: 10px;
}

.cv-header h1 {
	font-size: 1.8em;
	color: #45a049;
	margin: 0;
}

.cv-header h2 {
	font-size: 1.2em;
	color: #333;
	margin: 10px 0;
}

.cv-header p {
	font-size: 1em;
	color: #666;
	line-height: 1.5;
}

.cv-section h3 {
	font-size: 1.2em;
	color: #45a049;
	margin-bottom: 10px;
	border-bottom: 2px solid #45a049;
	display: inline-block;
}

.cv-section ul {
	list-style: none;
	padding: 0;
}

.cv-section ul li {
	font-size: 1em;
	color: #333;
	margin-bottom: 5px;
}

/* Phần bên phải */
.cv-right-panel {
	width: 30%;
	padding: 20px;
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.cv-right-panel h3 {
	font-size: 1.4em;
	color: #45a049;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
}

.form-control {
	width: 100%;
	padding: 8px;
	font-size: 1em;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.color-options {
	display: flex;
	gap: 10px;
	margin-top: 10px;
}

.color-option {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	border: 2px solid transparent;
	cursor: pointer;
}

.btn {
	display: block;
	width: 100%;
	padding: 10px;
	font-size: 1em;
	margin: 10px 0;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn-primary {
	background-color: #45a049;
	color: #fff;
}

.btn-secondary {
	background-color: #ccc;
	color: #333;
}

body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f7f7f7;
	min-height: 100vh;
}

.container {
	width: 750px;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 30px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-bottom: 30px;
	border-bottom: 2px solid #ddd;
	margin-bottom: 30px;
}

.header .profile-pic {
	border-radius: 50%;
	width: 120px;
	height: 120px;
	background-color: #b3acac;
	margin-left: 45px;
}

.header .name {
	font-size: 36px;
	font-weight: bold;
	color: #333;
}

.header .title {
	font-size: 18px;
	color: #777;
}

.header .contact {
	font-size: 14px;
	color: #555;
}

.header .contact a {
	text-decoration: none;
	color: #555;
	margin-right: 15px;
}

.header .contact a:hover {
	text-decoration: underline;
}

/* Flexbox for the left and right columns */
.content {
	display: flex;
	justify-content: space-between;
}

.left-column {
	width: 30%; /* Set width for left column */
	padding-right: 30px;
	border-right: 2px solid #ddd;
	/* Add border to right side of left column */
}

.right-column {
	width: 70%; /* Set width for right column */
	padding-left: 30px;
}

.section {
	margin-bottom: 30px;
}

.section h3 {
	font-size: 22px;
	color: #333;
	border-bottom: 2px solid #ddd;
	padding-bottom: 5px;
	margin-bottom: 15px;
}

.section ul {
	list-style-type: none;
	padding-left: 0;
	margin: 0;
}

.section ul li {
	margin-bottom: 10px;
	color: #555;
	font-size: 14px;
}

.section ul li span {
	font-weight: bold;
}
</style>
</head>

<body>

	<div class="cv-wrapper">
		<!-- Left Column (CV Content) -->
		<div class="container">
			<div class="header">
				<img src="profile.jpg" alt="" class="profile-pic">
				<div>
					<div class="name" id="name">NGUYỄN VĂN A</div>
					<div class="title" id="title">Nhà Thiết Kế Đồ Họa</div>
					<div class="contact">
						<a href="tel:+1234567890" id="phone">+123 456 7890</a> <a
							href="mailto:olivia@email.com" id="email">olivia@email.com</a> <a
							href="https://www.oliviaportfolio.com" target="_blank"
							id="portfolio">www.oliviaportfolio.com</a>
					</div>
				</div>
			</div>

			<div class="content">
				<div class="left-column">
					<div class="section">
						<h3 id="educationTitle">Giáo Dục</h3>
						<ul>
							<li><span>Bachelor of Design</span>, Design University -
								2016 - 2018</li>
							<li><span>Bachelor of Design</span>, Design University -
								2018 - 2020</li>
						</ul>
					</div>

					<div class="section">
						<h3 id="languagesTitle">Ngôn Ngữ</h3>
						<ul>
							<li id="languagesTitle1">Tiếng Anh</li>
							<li id="languagesTitle2">Tiếng Tây Ban Nha</li>
							<li id="languagesTitle3">Tiếng Pháp</li>
						</ul>
					</div>
				</div>

				<div class="right-column">
					<div class="section">
						<h3 id="profileTitle">Hồ Sơ</h3>
						<p id="profileDescription">Nhà thiết kế đồ họa sáng tạo và
							hướng đến kết quả với hơn 5 năm kinh nghiệm. Thành thạo Adobe
							Creative Suite, xây dựng thương hiệu và giao tiếp hình ảnh. Đam
							mê tạo ra các giải pháp thiết kế sáng tạo thể hiện bản sắc thương
							hiệu và thu hút đối tượng.</p>
					</div>

					<div class="section">
						<h3 id="workTitle">Kinh Nghiệm Làm Việc</h3>
						<ul>
							<li><span>Graphic Designer</span>, Ghyarid International Co.
								- 2019 - 2020</li>
							<li><span>Senior Graphic Designer</span>, Arwen Industries -
								2020 - 2021</li>
							<li><span>Lead Graphic Designer</span>, Ghyarid
								International Co. - 2021 - Present</li>
						</ul>
					</div>

					<div class="section">
						<h3 id="expertiseTitle">Chuyên Môn</h3>
						<ul>
							<li id="expertiseTitle1">Kỹ Năng Quản Lý</li>
							<li id="expertiseTitle2">Marketing Kỹ Thuật Số</li>

						</ul>
					</div>

					<div class="section">
						<h3 id="referencesTitle">Tham Khảo</h3>
						<ul>
							<li><span>Bailey Dupont</span>, Ghyarid International Co. -
								CCO</li>
							<li><span>Hamuri Kobayashi</span>, Arwen Industries - CEO</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Right Panel (Language Selector & Action Buttons) -->
		<div class="cv-right-panel">
			<h3>Mẫu CV Thanh lịch</h3>
			<div class="form-group">
				<label for="language">Ngôn ngữ</label> <select id="language"
					class="form-control">
					<option value="vi">Tiếng Việt</option>
					<option value="en">English</option>
				</select>
			</div>
			<a style="text-decoration: none;" id="useTemplateLink">
				<button class="btn btn-primary">Dùng mẫu này</button>
			</a>
			<button class="btn btn-secondary">Đóng lại</button>
		</div>
	</div>

	<script>
		const translations = {
			vi : {
				name : "NGUYỄN VĂN A",
				title : "Nhà Thiết Kế Đồ Họa",
				phone : "+123 456 7890",
				email : "olivia@email.com",
				portfolio : "www.oliviaportfolio.com",
				educationTitle : "Giáo Dục",
				languagesTitle : "Ngôn Ngữ",
				languagesTitle1 : "Tiếng Anh",
				languagesTitle2 : "Tiếng Tây Ban Nha",
				languagesTitle3 : "Tiếng Pháp",
				profileTitle : "Hồ Sơ",
				profileDescription : "Nhà thiết kế đồ họa sáng tạo và hướng đến kết quả với hơn 5 năm kinh nghiệm. Thành thạo Adobe Creative Suite, xây dựng thương hiệu và giao tiếp hình ảnh. Đam mê tạo ra các giải pháp thiết kế sáng tạo thể hiện bản sắc thương hiệu và thu hút đối tượng.",
				workTitle : "Kinh Nghiệm Làm Việc",
				expertiseTitle : "Chuyên Môn",
				expertiseTitle1 : "Kỹ Năng Quản Lý",
				expertiseTitle2 : "Marketing Kỹ Thuật Số",
				referencesTitle : "Tham Khảo",
				templateTitle : "Mẫu CV Thanh Lịch",
				languageLabel : "Ngôn Ngữ",
				useTemplateBtn : "Sử Dụng Mẫu Này",
				closeBtn : "Đóng"
			},
			en : {
				name : "Olivia Wilson",
				title : "Graphics Designer",
				phone : "+123 456 7890",
				email : "olivia@email.com",
				portfolio : "www.oliviaportfolio.com",
				educationTitle : "Education",
				languagesTitle : "Languages",
				languagesTitle1 : "English",
				languagesTitle2 : "Spanish",
				languagesTitle3 : "French",
				profileTitle : "Profile",
				profileDescription : "Creative and results-driven graphic designer with over 5 years of experience. Skilled in Adobe Creative Suite, branding, and visual communication. Passionate about creating innovative design solutions that capture brand identity and engage audiences.",
				workTitle : "Work Experience",
				expertiseTitle : "Expertise",
				expertiseTitle1 : "Management Skills",
				expertiseTitle2 : "Expertise",
				referencesTitle : "Digital Marketing",
				templateTitle : "Sample Elegant CV",
				languageLabel : "Language",
				useTemplateBtn : "Use this template",
				closeBtn : "Close"
			}
		};

		function changeLanguage(lang) {
			let content = translations[lang];

			document.getElementById("name").innerText = content.name;
			document.getElementById("title").innerText = content.title;
			document.getElementById("phone").innerText = content.phone;
			document.getElementById("email").innerText = content.email;
			document.getElementById("portfolio").innerText = content.portfolio;
			document.getElementById("educationTitle").innerText = content.educationTitle;
			document.getElementById("languagesTitle").innerText = content.languagesTitle;
			document.getElementById("languagesTitle1").innerText = content.languagesTitle1;
			document.getElementById("languagesTitle2").innerText = content.languagesTitle2;
			document.getElementById("languagesTitle3").innerText = content.languagesTitle3;
			document.getElementById("profileTitle").innerText = content.profileTitle;
			document.getElementById("profileDescription").innerText = content.profileDescription;
			document.getElementById("workTitle").innerText = content.workTitle;
			document.getElementById("expertiseTitle").innerText = content.expertiseTitle;
			document.getElementById("expertiseTitle1").innerText = content.expertiseTitle1;
			document.getElementById("expertiseTitle2").innerText = content.expertiseTitle2;
			document.getElementById("referencesTitle").innerText = content.referencesTitle;
			document.getElementById("templateTitle").innerText = content.templateTitle;
			document.getElementById("languageLabel").innerText = content.languageLabel;
			document.getElementById("useTemplateBtn").innerText = content.useTemplateBtn;
			document.getElementById("closeBtn").innerText = content.closeBtn;
		}

		document.getElementById("language").addEventListener("change",
				function() {
					changeLanguage(this.value);
				});

		// Set default language to Vietnamese
		changeLanguage("vi");
	</script>
	<script>
		// Lắng nghe sự thay đổi trong lựa chọn ngôn ngữ
		document.getElementById("language").addEventListener("change",
				function() {
					var selectedLanguage = this.value; // Giá trị ngôn ngữ được chọn

					// Chuyển hướng đến mẫu CV tương ứng
					var link = document.getElementById("useTemplateLink");
					if (selectedLanguage === "vi") {
						link.href = "/luaCV/mauCV6"; // Mẫu CV tiếng Việt
					} else if (selectedLanguage === "en") {
						link.href = "/luaCV/mauCV6ta"; // Mẫu CV tiếng Anh
					}
				});

		window.onload = function() {
			var languageSelect = document.getElementById("language");
			var selectedLanguage = languageSelect.value; // Lấy giá trị ngôn ngữ hiện tại

			// Kiểm tra nếu không có giá trị ngôn ngữ được chọn thì mặc định chọn tiếng Việt
			if (!selectedLanguage || selectedLanguage === "") {
				languageSelect.value = "vi"; // Chọn mặc định Tiếng Việt
				selectedLanguage = "vi"; // Cập nhật giá trị ngôn ngữ sau khi thay đổi
			}

			// Đảm bảo nút "Dùng mẫu này" sẽ dẫn đến mẫu CV phù hợp
			var link = document.getElementById("useTemplateLink");
			if (selectedLanguage === "vi") {
				link.href = "/luaCV/mauCV6"; // Mẫu CV tiếng Việt
			} else if (selectedLanguage === "en") {
				link.href = "/luaCV/mauCV6ta"; // Mẫu CV tiếng Anh
			}
		}
	</script>
</body>
</html>