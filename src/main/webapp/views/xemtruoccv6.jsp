<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem Trước Mẫu CV</title>
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

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

body {
	display: flex;
	justify-content: center;
	padding: 20px;
	background-color: #f4f4f9;
}

.resume-container {
	display: flex;
	width: 800px;
	border: 1px solid #e0e0e0;
	background-color: white;
}

.left-column {
	background-color: #d2e4d9;
	padding: 20px;
}

.right-column {
	padding: 20px;
}

.personal-info {
	text-align: center;
	margin-left: 80px;
}

.photo-background {
	/* background-color: #e0e0e0; */
	/* Màu nền riêng biệt cho khung ảnh */
	padding: 30px;
	/* Tăng khoảng cách giữa ảnh và nền bao quanh */
	display: flex;
	justify-content: center;
	align-items: center;
	margin: -20px auto 20px auto;
	/* Căn giữa và thêm khoảng cách bên dưới */
	width: 210px;
	/* Tăng chiều rộng */
	height: 260px;
	/* Tăng chiều cao */
	margin-right: 20px;
}

.photo-frame {
	width: 150px;
	/* Chiều rộng cố định của ảnh */
	height: 200px;
	/* Chiều cao cố định (tỷ lệ 3:4) */
	overflow: hidden;
	border: 2px solid #4d5c4b;
	/* Đường viền cho khung ảnh */
	border-radius: 8px;
	/* Bo tròn góc khung ảnh (tuỳ chọn) */
	background-color: #ffffff;
	/* Màu nền của khung ảnh */
}

.photo-frame img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* Đảm bảo ảnh lấp đầy khung với tỷ lệ 3:4 */
}

h1 {
	font-size: 24px;
	color: #4d5c4b;
	text-align: center;
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

ul {
	list-style-type: none;
	padding: 0;
}

li {
	margin-bottom: 10px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.cv-container {
	width: 850px;
	background-color: #fff;
	padding: 40px;
	display: grid;
	grid-template-columns: 1fr 2fr;
	gap: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	position: relative;
	overflow: hidden;
}

/* Decorative Header and Footer */
/* .header-decoration,
        .footer-decoration,
        .inner-header-decoration,
        .inner-footer-decoration {
            position: absolute;
            width: 100%;
            height: 120px;
            background-color: #2c3e50;
        }

        .header-decoration {
            top: 0;
            clip-path: polygon(0 0, 100% 0, 100% 50%, 0 100%);
        }

        .inner-header-decoration {
            top: 15px;
            height: 90px;
            background-color: #34495e;
            clip-path: polygon(0 0, 100% 0, 100% 60%, 0 100%);
        }

        .footer-decoration {
            bottom: 0;
            clip-path: polygon(0 50%, 100% 0, 100% 100%, 0 100%);
        }

        .inner-footer-decoration {
            bottom: 15px;
            height: 90px;
            background-color: #34495e;
            clip-path: polygon(0 60%, 100% 0, 100% 100%, 0 100%);
        } */

/* Corner Triangles */
.top-left-triangle, .bottom-right-triangle {
	position: absolute;
	width: 0;
	height: 0;
	border-style: solid;
}

.top-left-triangle {
	top: 10px;
	left: 10px;
	border-width: 0 0 20px 20px;
	border-color: transparent transparent #2c3e50 transparent;
}

.bottom-right-triangle {
	bottom: 10px;
	right: 10px;
	border-width: 20px 20px 0 0;
	border-color: #2c3e50 transparent transparent transparent;
}

/* Left Column Border */
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
}

.section-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin-bottom: 10px;
	text-transform: uppercase;
}

.contact-info, .education, .skills {
	margin-bottom: 20px;
}

.contact-info p, .education p, .skills p {
	margin: 5px 0;
	color: #555;
	font-size: 14px;
}

.right-column {
	z-index: 1;
	padding: 0 20px;
	padding-bottom: 40px;
}

.right-column h1 h2 {
	padding-top: 53px;
	/* Điều chỉnh khoảng cách phù hợp */
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-bottom: 5px;
	padding-bottom: 50px;
}

.right-column h2 {
	font-size: 16px;
	color: #666;
	margin-bottom: 20px;
}

.profile, .work-experience, .references {
	margin-bottom: 20px;
}

.profile p {
	color: #555;
	font-size: 14px;
	line-height: 1.6;
}

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

.reference-item {
	font-size: 14px;
	color: #555;
}
</style>
</head>

<body>

	<div class="cv-wrapper">
		<!-- Left Column (CV Content) -->
		<div class="cv-container">
			<div class="left-column">
				<div class="profile-picture"
					style="background-image: url('your-image-url.jpg');"></div>
				<div class="section">
					<div class="section-title" id="contactTitle">Contact</div>
					<div class="contact-info">
						<p id="phoneText">Phone: +123-456-7890</p>
						<p id="emailText">Email: alfredo@example.com</p>
						<p id="websiteText">Website: www.alfredocvsite.com</p>
						<p id="addressText">Address: 123 Anywhere St, Any City</p>
					</div>
				</div>

				<div class="section">
					<div class="section-title" id="educationTitle">Education</div>
					<div class="education">
						<p id="eduText1">2025 - 2029: Bordell University</p>
						<p id="eduText2">Bachelor's Degree in Marketing</p>
						<p id="gpaText">GPA: 4.0</p>
					</div>
				</div>

				<div class="section">
					<div class="section-title" id="skillsTitle">Skills</div>
					<div class="skills">
						<p id="skillsText1">Project Management</p>
						<p id="skillsText2">Market Research</p>
						<p id="skillsText3">Client Relations</p>
					</div>
				</div>
			</div>

			<!-- Right Column -->
			<div class="right-column">
				<h1 id="nameText">NGUYỄN VĂN A</h1>
				<h2 id="positionText">Marketing Manager</h2>

				<div class="section">
					<div class="section-title" id="profileTitle">Profile</div>
					<div class="profile">
						<p id="profileText">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Mauris et ligula sit amet eros malesuada
							tincidunt. Fusce in velit ut erat ultrices dictum. Phasellus
							volutpat metus vel augue gravida, vitae pharetra erat pulvinar.</p>
					</div>
				</div>

				<div class="section">
					<div class="section-title" id="workExperienceTitle">Work
						Experience</div>
					<div class="work-experience">
						<div class="work-experience-item">
							<h4 id="jobTitle1">Marketing Manager - Nerozzle Studio</h4>
							<p id="jobDate1">2020 - Present</p>
							<p id="jobDescription1">Managed and drove comprehensive
								marketing strategies resulting in a 30% growth in the client
								base.</p>
						</div>
						<div class="work-experience-item">
							<h4 id="jobTitle2">Assistant Manager - Fingroup Studio</h4>
							<p id="jobDate2">2018 - 2020</p>
							<p id="jobDescription2">Supported senior managers in
								designing and implementing marketing campaigns, leading to
								increased engagement.</p>
						</div>
					</div>
				</div>

				<div class="section">
					<div class="section-title" id="referenceTitle">Reference</div>
					<div class="references">
						<p id="ref1">Benjamin Shah - Wanderer Inc. CTO</p>
						<p id="ref2">Ketut Sukle - Waveline Inc. CEO</p>
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
			<button class="btn btn-secondary" onclick="goToHomePage()">Đóng lại</button>
		</div>
	</div>

	<script>
		const translations = {
			en : {
				contactTitle : "Contact",
				phoneText : "Phone: +123-456-7890",
				emailText : "Email: alfredo@example.com",
				websiteText : "Website: www.alfredocvsite.com",
				addressText : "Address: 123 Anywhere St, Any City",
				educationTitle : "Education",
				eduText1 : "2025 - 2029: Bordell University",
				eduText2 : "Bachelor's Degree in Marketing",
				gpaText : "GPA: 4.0",
				skillsTitle : "Skills",
				skillsText1 : "Project Management",
				skillsText2 : "Market Research",
				skillsText3 : "Client Relations",
				nameText : "Alfredo Torres",
				positionText : "Marketing Manager",
				profileTitle : "Profile",
				profileText : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et ligula sit amet eros malesuada tincidunt...",
				workExperienceTitle : "Work Experience",
				jobTitle1 : "Marketing Manager - Nerozzle Studio",
				jobDate1 : "2020 - Present",
				jobDescription1 : "Managed and drove comprehensive marketing strategies resulting in a 30% growth in the client base.",
				jobTitle2 : "Assistant Manager - Fingroup Studio",
				jobDate2 : "2018 - 2020",
				jobDescription2 : "Supported senior managers in designing and implementing marketing campaigns.",
				referenceTitle : "Reference",
				ref1 : "Benjamin Shah - Wanderer Inc. CTO",
				ref2 : "Ketut Sukle - Waveline Inc. CEO",
				templateTitle : "Sample Elegant CV",
				languageLabel : "Language",
				useTemplateBtn : "Use this template",
				closeBtn : "Close",
			},
			vi : {
				contactTitle : "Liên hệ",
				phoneText : "Số điện thoại: +123-456-7890",
				emailText : "Email: alfredo@example.com",
				websiteText : "Website: www.alfredocvsite.com",
				addressText : "Địa chỉ: 123 Anywhere St, Any City",
				educationTitle : "Học vấn",
				eduText1 : "2025 - 2029: Đại học Bordell",
				eduText2 : "Cử nhân Marketing",
				gpaText : "GPA: 4.0",
				skillsTitle : "Kỹ năng",
				skillsText1 : "Quản lý dự án",
				skillsText2 : "Nghiên cứu thị trường",
				skillsText3 : "Quan hệ khách hàng",
				nameText : "NGUYỄN VĂN A",
				positionText : "Quản lý Marketing",
				profileTitle : "Giới thiệu",
				profileText : "Tôi là một người sáng tạo chăm chỉ, luôn cố gắng đạt sự xuất sắc trong mọi việc tôi làm. Tôi thích học hỏi và tìm cách cải thiện cuộc sống của những người xung quanh.",
				workExperienceTitle : "Kinh nghiệm làm việc",
				jobTitle1 : "Quản lý Marketing - Nerozzle Studio",
				jobDate1 : "2020 - Hiện tại",
				jobDescription1 : "Quản lý và triển khai các chiến lược marketing, dẫn đến tăng trưởng 30% lượng khách hàng.",
				jobTitle2 : "Trợ lý Quản lý - Fingroup Studio",
				jobDate2 : "2018 - 2020",
				jobDescription2 : "Hỗ trợ các quản lý cấp cao trong việc thiết kế và triển khai các chiến dịch marketing.",
				referenceTitle : "Tham khảo",
				ref1 : "Benjamin Shah - CTO của Wanderer Inc.",
				ref2 : "Ketut Sukle - CEO của Waveline Inc.",
				templateTitle : "Mẫu CV Thanh lịch",
				languageLabel : "Ngôn ngữ",
				useTemplateBtn : "Sử dụng mẫu này",
				closeBtn : "Đóng",
			}
		};

		function switchLanguage(lang) {
			const trans = translations[lang];
			document.getElementById('contactTitle').textContent = trans.contactTitle;
			document.getElementById('phoneText').textContent = trans.phoneText;
			document.getElementById('emailText').textContent = trans.emailText;
			document.getElementById('websiteText').textContent = trans.websiteText;
			document.getElementById('addressText').textContent = trans.addressText;
			document.getElementById('educationTitle').textContent = trans.educationTitle;
			document.getElementById('eduText1').textContent = trans.eduText1;
			document.getElementById('eduText2').textContent = trans.eduText2;
			document.getElementById('gpaText').textContent = trans.gpaText;
			document.getElementById('skillsTitle').textContent = trans.skillsTitle;
			document.getElementById('skillsText1').textContent = trans.skillsText1;
			document.getElementById('skillsText2').textContent = trans.skillsText2;
			document.getElementById('skillsText3').textContent = trans.skillsText3;
			document.getElementById('nameText').textContent = trans.nameText;
			document.getElementById('positionText').textContent = trans.positionText;
			document.getElementById('profileTitle').textContent = trans.profileTitle;
			document.getElementById('profileText').textContent = trans.profileText;
			document.getElementById('workExperienceTitle').textContent = trans.workExperienceTitle;
			document.getElementById('jobTitle1').textContent = trans.jobTitle1;
			document.getElementById('jobDate1').textContent = trans.jobDate1;
			document.getElementById('jobDescription1').textContent = trans.jobDescription1;
			document.getElementById('jobTitle2').textContent = trans.jobTitle2;
			document.getElementById('jobDate2').textContent = trans.jobDate2;
			document.getElementById('jobDescription2').textContent = trans.jobDescription2;
			document.getElementById('referenceTitle').textContent = trans.referenceTitle;
			document.getElementById('ref1').textContent = trans.ref1;
			document.getElementById('ref2').textContent = trans.ref2;
			document.getElementById('templateTitle').textContent = trans.templateTitle;
			document.getElementById('languageLabel').textContent = trans.languageLabel;
			document.getElementById('useTemplateBtn').textContent = trans.useTemplateBtn;
			document.getElementById('closeBtn').textContent = trans.closeBtn;
		}

		// Event listener for language change
		document.getElementById('language').addEventListener('change',
				function() {
					switchLanguage(this.value);
				});

		// Default language is Vietnamese
		switchLanguage('vi');
	</script>
	<script>
    // Lắng nghe sự thay đổi trong lựa chọn ngôn ngữ
    document.getElementById("language").addEventListener("change", function() {
        var selectedLanguage = this.value; // Giá trị ngôn ngữ được chọn

        // Chuyển hướng đến mẫu CV tương ứng
        var link = document.getElementById("useTemplateLink");
        if (selectedLanguage === "vi") {
            link.href = "/luaCV/mauCV6";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV6ta";  // Mẫu CV tiếng Anh
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
            link.href = "/luaCV/mauCV6";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV6ta";  // Mẫu CV tiếng Anh
        }
    }
</script>
<script>
    function goToHomePage() {
        window.location.href = '/luaCV'; // Đường dẫn trang chủ
    }
</script>
</body>
</html>