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
	/* Thay 100vh thành min-height */
}

.cv-container {
	width: 800px;
	/* Tăng chiều rộng */
	background: white;
	display: flex;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	font-size: 16px;
	/* Tăng kích thước font */
}

/* Left Panel */
.left-panel {
	width: 30%;
	/* Tăng phần chiều rộng của bên trái */
	background: #d9cbc7;
	padding: 30px;
	color: #333;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.left-panel img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	margin-bottom: 20px;
}

.left-panel h3 {
	border-bottom: 2px solid #000000;
}

.contact-info {
	width: 100%;
	margin-top: 20px;
}

.contact-info p {
	display: flex;
	align-items: center;
	margin: 12px 0;
	font-size: 14px;
}

.contact-info p span {
	font-size: 20px;
	margin-right: 10px;
}

.skill {
	margin-top: 20px;
	width: 100%;
}

.language {
	margin-top: 20px;
	width: 100%;
}

/* Right Panel */
.right-panel {
	/* Giảm chiều rộng của phần bên phải */
	padding: 30px 40px;
}

/* Personal Info Section */
.personal-info {
	background-color: #f0e9e6;
	padding: 12px;
	margin-bottom: 20px;
}

.personal-info h2 {
	font-size: 28px;
	font-weight: bold;
	margin: 0 0 10px 0;
}

.personal-info h4 {
	font-size: 18px;
	margin: 0 0 15px 0;
	color: #555;
}

.personal-info p {
	font-size: 14px;
	line-height: 1.6;
}

.right-panel h3 {
	font-size: 20px;
	margin: 25px 0 15px 0;
	color: #333;
	text-transform: uppercase;
	letter-spacing: 1px;
	border-bottom: 2px solid #ccc;
	padding-bottom: 5px;
}

.section {
	margin-bottom: 25px;
}

.section p {
	font-size: 16px;
	margin: 6px 0;
	line-height: 1.8;
}

.section p strong {
	font-weight: bold;
}
</style>
</head>

<body>

	<div class="cv-wrapper">
		<!-- Left Column (CV Content) -->
		<div class="cv-container">
			<!-- Left Panel -->
			<div class="left-panel">
				<img src="https://via.placeholder.com/150" alt="Profile Picture">
				<div class="contact-info">
					<h3 id="contactTitle">Liên Hệ</h3>
					<p>+1-234-567-890</p>
					<p>donna@example.com</p>
					<p>123 Avenue St, ABC City, ST 12345</p>
				</div>

				<div class="language">
					<h3 id="languageTitle">Ngôn Ngữ</h3>
					<p id="nativeLanguage">Tiếng Anh</p>
					<p id="advancedLanguage">Tiếng Tây Ban Nha</p>
				</div>

				<div class="skill">
					<h3 id="skillTitle">Kỹ Năng Máy Tính</h3>
					<p id="wordProcessing">Xử lý văn bản</p>
					<p id="spreadsheets">Bảng tính</p>
					<p id="presentations">Trình chiếu</p>
				</div>
			</div>

			<!-- Right Panel -->
			<div class="right-panel">
				<!-- Personal Info Section -->
				<div class="personal-info">
					<h2 id="name">NGUYỄN VĂN A</h2>
					<h4 id="position">Sinh Viên</h4>
					<p id="bio">Sinh viên Quản trị Kinh doanh, tôi là một người có
						trách nhiệm và ngăn nắp. Tôi đang mong đợi cơ hội trải nghiệm công
						việc đầu tiên.</p>
				</div>

				<div class="section">
					<h3 id="educationTitle">Học Vấn</h3>
					<p>
						<strong id="universityName">Đại học Borcellu</strong><br> <span
							id="degree">Ngành Quản trị Kinh doanh (đang theo học)</span>
					</p>
					<p>
						<strong>Fauget College</strong><br> 2018–2022
					</p>
				</div>

				<div class="section">
					<h3 id="volunteerTitle">Kinh Nghiệm Tình Nguyện</h3>
					<p>
						<strong id="companyName">InGuide Company</strong><br> <span
							id="description">Tham gia hoạt động quyên góp và phân phát
							tại các trường học nghèo.</span>
					</p>
				</div>

				<div class="section">
					<h3 id="hobbiesTitle">Sở Thích</h3>
					<p id="hobby1">Đọc sách</p>
					<p id="hobby2">Du lịch</p>
					<p id="hobby3">Vẽ tranh</p>
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
    const data = {
      vi: {
        contactTitle: "Liên Hệ",
        languageTitle: "Ngôn Ngữ",
        skillTitle: "Kỹ Năng Máy Tính",
        wordProcessing: "Xử lý văn bản",
        spreadsheets: "Bảng tính",
        presentations: "Trình chiếu",
        nativeLanguage: "Tiếng Anh",
        advancedLanguage: "Tiếng Tây Ban Nha",
        name: "NGUYỄN VĂN A",
        position: "Sinh Viên",
        bio: "Sinh viên Quản trị Kinh doanh, tôi là một người có trách nhiệm và ngăn nắp. Tôi đang mong đợi cơ hội trải nghiệm công việc đầu tiên.",
        educationTitle: "Học Vấn",
        universityName: "Đại học Borcellu",
        degree: "Ngành Quản trị Kinh doanh (đang theo học)",
        companyName: "InGuide Company",
        description: "Tham gia hoạt động quyên góp và phân phát tại các trường học nghèo.",
        volunteerTitle: "Kinh Nghiệm Tình Nguyện",
        hobbiesTitle: "Sở Thích",
        hobby1: "Đọc sách",
        hobby2: "Du lịch",
        hobby3: "Vẽ tranh",
        templateTitle: "Mẫu CV Thanh Lịch"
      },
      en: {
        contactTitle: "Contact",
        languageTitle: "Language",
        skillTitle: "Computer Skills",
        wordProcessing: "Word Processing",
        spreadsheets: "Spreadsheets",
        presentations: "Presentations",
        nativeLanguage: "Native English",
        advancedLanguage: "Advanced Spanish",
        name: "Donna Stroupe",
        position: "Student",
        bio: "Business Administration student, I consider myself a responsible and orderly person. I am looking forward to my first work experience.",
        educationTitle: "Education",
        universityName: "Borcellu University",
        degree: "Business Administration (currently studying)",
        companyName: "InGuide Company",
        description: "Participated in donation and distribution activities at poor schools.",
        volunteerTitle: "Volunteer Experience",
        hobbiesTitle: "Hobbies",
        hobby1: "Reading books",
        hobby2: "Traveling",
        hobby3: "Drawing",
        templateTitle: "Sample Elegant CV"
      }
    };

    function changeLanguage(lang) {
      const content = data[lang];
      document.getElementById("contactTitle").innerText = content.contactTitle;
      document.getElementById("languageTitle").innerText = content.languageTitle;
      document.getElementById("skillTitle").innerText = content.skillTitle;
      document.getElementById("wordProcessing").innerText = content.wordProcessing;
      document.getElementById("spreadsheets").innerText = content.spreadsheets;
      document.getElementById("presentations").innerText = content.presentations;
      document.getElementById("nativeLanguage").innerText = content.nativeLanguage;
      document.getElementById("advancedLanguage").innerText = content.advancedLanguage;
      document.getElementById("name").innerText = content.name;
      document.getElementById("position").innerText = content.position;
      document.getElementById("bio").innerText = content.bio;
      document.getElementById("educationTitle").innerText = content.educationTitle;
      document.getElementById("universityName").innerText = content.universityName;
      document.getElementById("degree").innerText = content.degree;
      document.getElementById("companyName").innerText = content.companyName;
      document.getElementById("description").innerText = content.description;
      document.getElementById("volunteerTitle").innerText = content.volunteerTitle;
      document.getElementById("hobbiesTitle").innerText = content.hobbiesTitle;
        document.getElementById("hobby1").innerText = content.hobby1;
        document.getElementById("hobby2").innerText = content.hobby2;
        document.getElementById("hobby3").innerText = content.hobby3;
      document.getElementById("templateTitle").innerText = content.templateTitle;
    }

    document.getElementById("language").addEventListener("change", (e) => {
      changeLanguage(e.target.value);
    });

    // Set default language to Vietnamese
    changeLanguage("vi");
  </script>
	<script>
    // Lắng nghe sự thay đổi trong lựa chọn ngôn ngữ
    document.getElementById("language").addEventListener("change", function() {
        var selectedLanguage = this.value; // Giá trị ngôn ngữ được chọn

        // Chuyển hướng đến mẫu CV tương ứng
        var link = document.getElementById("useTemplateLink");
        if (selectedLanguage === "vi") {
            link.href = "/luaCV/mauCV5";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV5ta";  // Mẫu CV tiếng Anh
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
            link.href = "/luaCV/mauCV5";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV5ta";  // Mẫu CV tiếng Anh
        }
    }
</script>
</body>
</html>