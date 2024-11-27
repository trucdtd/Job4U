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

.cv-container {
	max-width: 750px;
	display: flex;
	background: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Sidebar styling */
.sidebar {
	width: 35%;
	background: #1f1f1f;
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.sidebar img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	margin-bottom: 20px;
}

.sidebar .section {
	width: 100%;
	margin-bottom: 20px;
}

.sidebar .section h3 {
	font-size: 16px;
	margin-bottom: 10px;
	text-transform: uppercase;
	border-bottom: 1px solid #444;
	padding-bottom: 5px;
}

.sidebar .section ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.sidebar .section ul li {
	font-size: 14px;
	margin: 5px 0;
}

/* Main content styling */
.main-content {
	width: 65%;
	padding: 20px;
}

.main-header {
	text-align: left;
	margin-bottom: 20px;
}

.main-header h2 {
	font-size: 28px;
	color: #333;
	margin: 0;
}

.main-header h3 {
	font-size: 18px;
	color: #666;
	margin-top: 5px;
	font-weight: normal;
}

.main-content .section {
	margin-top: 20px;
}

.main-content .section h3 {
	font-size: 16px;
	color: #333;
	margin-bottom: 10px;
	text-transform: uppercase;
	border-bottom: 1px solid #ddd;
	padding-bottom: 5px;
}

.main-content .experience {
	margin-bottom: 20px;
}

.main-content .experience div {
	margin-bottom: 15px;
}

.main-content .experience h4 {
	font-size: 14px;
	color: #555;
	margin: 0;
}

.main-content .experience p {
	font-size: 12px;
	color: #777;
	margin: 5px 0;
}

.references div {
	margin-bottom: 10px;
}

.references h4 {
	font-size: 14px;
	color: #333;
	margin: 0;
}

.references p {
	font-size: 12px;
	color: #555;
}
</style>
</head>

<body>
	<div class="cv-wrapper">
		<!-- Cột trái (Nội dung CV) -->
		<div class="cv-container">
			<!-- Thanh bên -->
			<div class="sidebar">
				<img src="https://via.placeholder.com/150" alt="Ảnh đại diện">
				<div class="section">
					<h3 id="contactTitle">Thông tin liên hệ</h3>
					<ul>
						<li><strong id="emailTitle">Email:</strong>
							olivia@example.com</li>
						<li><strong id="phoneTitle">Số điện thoại:</strong> +123 456
							789</li>
						<li><strong id="websiteTitle">Trang web:</strong>
							www.olivia-consulting.com</li>
						<li><strong id="linkedinTitle">LinkedIn:</strong>
							linkedin.com/in/olivia</li>
					</ul>
				</div>

				<div class="section">
					<h3 id="educationTitle">Giáo dục</h3>
					<p id="educationSchool">Trường Kinh doanh Bordeaux</p>
					<p id="educationDegree">Thạc sĩ Quản trị Kinh doanh</p>
					<p id="educationYears">2005-2008</p>
				</div>

				<div class="section">
					<h3 id="skillsTitle">Kỹ năng</h3>
					<ul>
						<li id="managementSkills">Kỹ năng quản lý</li>
						<li id="marketingSkills">Tiếp thị kỹ thuật số</li>
						<li id="negotiationSkills">Đàm phán</li>
						<li id="criticalSkills">Tư duy phản biện</li>
					</ul>
				</div>
			</div>

			<!-- Nội dung chính -->
			<div class="main-content">
				<!-- Tiêu đề chính -->
				<div class="main-header">
					<h2 id="nameTitle">NGUYỄN VĂN A</h2>
					<h3 id="title">Tư vấn viên Kinh doanh</h3>
				</div>

				<div class="section">
					<h3 id="aboutMeTitle">Giới thiệu về tôi</h3>
					<p id="aboutMeDesc">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Cras eget nisi nunc.</p>
				</div>

				<div class="section">
					<h3 id="experienceTitle">Kinh nghiệm</h3>
					<div class="experience">
						<div>
							<h4 id="experience1Title">Tư vấn viên Kinh doanh - Gloyard
								International Co.</h4>
							<p id="experience1Years">2020 - Hiện tại</p>
							<p id="experience1Desc">Cung cấp chiến lược kinh doanh và
								quản lý các dự án tư vấn cho khách hàng toàn cầu.</p>
						</div>
						<div>
							<h4 id="experience2Title">Tư vấn viên Kinh doanh Junior -
								Ingosud Company</h4>
							<p id="experience2Years">2015 - 2020</p>
							<p id="experience2Desc">Phát triển quy trình vận hành và nâng
								cao sự hài lòng của khách hàng.</p>
						</div>
						<div>
							<h4 id="experience3Title">Tư vấn viên Kinh doanh Junior -
								Ingosud Company</h4>
							<p id="experience3Years">2010 - 2015</p>
							<p id="experience3Desc">Hỗ trợ lập kế hoạch dự án và phối hợp
								công việc nhóm để đạt được kết quả thành công.</p>
						</div>
					</div>
				</div>

				<div class="section references">
					<h3 id="referencesTitle">Tham khảo</h3>
					<div>
						<h4 id="reference1Name">Bailey Dupont</h4>
						<p id="reference1Job">Giám đốc điều hành Wardline Inc.</p>
					</div>
					<div>
						<h4 id="reference2Name">Harumi Kabayashi</h4>
						<p id="reference2Job">Giám đốc điều hành Wardline Inc.</p>
					</div>
				</div>
			</div>
		</div>

		<!-- Cột phải (Chọn ngôn ngữ & Nút hành động) -->
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
        vi: {
            contactTitle: "Liên Hệ",
            emailTitle: "Email",
            phoneTitle: "Số Điện Thoại",
            websiteTitle: "Website",
            linkedinTitle: "LinkedIn",
            educationTitle: "Giáo Dục",
            educationSchool: "Trường Đại Học Kinh Tế Bordeaux",
            educationDegree: "Thạc Sĩ Quản Trị Kinh Doanh",
            educationYears: "2005-2008",
            skillsTitle: "Kỹ Năng",
            managementSkills: "Kỹ Năng Quản Lý",
            marketingSkills: "Marketing Kỹ Thuật Số",
            negotiationSkills: "Đàm Phán",
            criticalSkills: "Tư Duy Phê Phán",
            nameTitle: "NGUYỄN VĂN A",
            title: "Tư Vấn Kinh Doanh",
            aboutMeTitle: "Giới Thiệu Bản Thân",
            aboutMeDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            experienceTitle: "Kinh Nghiệm Làm Việc",
            experience1Title: "Tư Vấn Kinh Doanh - Gloyard International Co.",
            experience1Years: "2020 - Hiện tại",
            experience1Desc: "Cung cấp chiến lược kinh doanh và quản lý các dự án tư vấn cho khách hàng toàn cầu.",
            experience2Title: "Tư Vấn Kinh Doanh Junior - Công Ty Ingosud",
            experience2Years: "2015 - 2020",
            experience2Desc: "Phát triển quy trình hoạt động và cải thiện sự hài lòng của khách hàng.",
            experience3Title: "Tư Vấn Kinh Doanh Junior - Công Ty Ingosud",
            experience3Years: "2010 - 2015",
            experience3Desc: "Hỗ trợ lập kế hoạch dự án và phối hợp các nỗ lực của nhóm để đạt được kết quả thành công.",
            referencesTitle: "Tham Khảo",
            reference1Name: "Bailey Dupont",
            reference1Job: "Giám Đốc Điều Hành Wardline Inc.",
            reference2Name: "Harumi Kabayashi",
            reference2Job: "Giám Đốc Điều Hành Wardline Inc.",
            templateTitle: "Mẫu CV Thanh Lịch",
            languageLabel: "Ngôn Ngữ",
            useTemplateBtn: "Sử Dụng Mẫu Này",
            closeBtn: "Đóng"
        },
        en: {
            contactTitle: "Contact",
            emailTitle: "Email",
            phoneTitle: "Phone",
            websiteTitle: "Website",
            linkedinTitle: "LinkedIn",
            educationTitle: "Education",
            educationSchool: "Bordeaux Business School",
            educationDegree: "Master's in Business Administration",
            educationYears: "2005-2008",
            skillsTitle: "Skills",
            managementSkills: "Management Skills",
            marketingSkills: "Digital Marketing",
            negotiationSkills: "Negotiation",
            criticalSkills: "Critical Thinking",
            nameTitle: "Olivia Schumacher",
            title: "Business Consultant",
            aboutMeTitle: "About Me",
            aboutMeDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            experienceTitle: "Experience",
            experience1Title: "Business Consultant - Gloyard International Co.",
            experience1Years: "2020 - Present",
            experience1Desc: "Provided business strategies and managed consulting projects for global clients.",
            experience2Title: "Junior Business Consultant - Ingosud Company",
            experience2Years: "2015 - 2020",
            experience2Desc: "Developed operational workflows and improved client satisfaction.",
            experience3Title: "Junior Business Consultant - Ingosud Company",
            experience3Years: "2010 - 2015",
            experience3Desc: "Assisted in project planning and coordinated team efforts for successful outcomes.",
            referencesTitle: "References",
            reference1Name: "Bailey Dupont",
            reference1Job: "Wardline Inc. CEO",
            reference2Name: "Harumi Kabayashi",
            reference2Job: "Wardline Inc. CEO",
            templateTitle: "Sample Elegant CV",
            languageLabel: "Language",
            useTemplateBtn: "Use this template",
            closeBtn: "Close"
        }
    };
    
    function changeLanguage(lang) {
        const content = translations[lang];
    
        document.getElementById("contactTitle").innerText = content.contactTitle;
        document.getElementById("emailTitle").innerText = content.emailTitle;
        document.getElementById("phoneTitle").innerText = content.phoneTitle;
        document.getElementById("websiteTitle").innerText = content.websiteTitle;
        document.getElementById("linkedinTitle").innerText = content.linkedinTitle;
        document.getElementById("educationTitle").innerText = content.educationTitle;
        document.getElementById("educationSchool").innerText = content.educationSchool;
        document.getElementById("educationDegree").innerText = content.educationDegree;
        document.getElementById("educationYears").innerText = content.educationYears;
        document.getElementById("skillsTitle").innerText = content.skillsTitle;
        document.getElementById("managementSkills").innerText = content.managementSkills;
        document.getElementById("marketingSkills").innerText = content.marketingSkills;
        document.getElementById("negotiationSkills").innerText = content.negotiationSkills;
        document.getElementById("criticalSkills").innerText = content.criticalSkills;
        document.getElementById("nameTitle").innerText = content.nameTitle;
        document.getElementById("title").innerText = content.title;
        document.getElementById("aboutMeTitle").innerText = content.aboutMeTitle;
        document.getElementById("aboutMeDesc").innerText = content.aboutMeDesc;
        document.getElementById("experienceTitle").innerText = content.experienceTitle;
        document.getElementById("experience1Title").innerText = content.experience1Title;
        document.getElementById("experience1Years").innerText = content.experience1Years;
        document.getElementById("experience1Desc").innerText = content.experience1Desc;
        document.getElementById("experience2Title").innerText = content.experience2Title;
        document.getElementById("experience2Years").innerText = content.experience2Years;
        document.getElementById("experience2Desc").innerText = content.experience2Desc;
        document.getElementById("experience3Title").innerText = content.experience3Title;
        document.getElementById("experience3Years").innerText = content.experience3Years;
        document.getElementById("experience3Desc").innerText = content.experience3Desc;
        document.getElementById("referencesTitle").innerText = content.referencesTitle;
        document.getElementById("reference1Name").innerText = content.reference1Name;
        document.getElementById("reference1Job").innerText = content.reference1Job;
        document.getElementById("reference2Name").innerText = content.reference2Name;
        document.getElementById("reference2Job").innerText = content.reference2Job;
        document.getElementById("templateTitle").innerText = content.templateTitle;
        document.getElementById("languageLabel").innerText = content.languageLabel;
        document.getElementById("useTemplateBtn").innerText = content.useTemplateBtn;
        document.getElementById("closeBtn").innerText = content.closeBtn;
    }
    
    document.getElementById("language").addEventListener("change", (event) => {
        const lang = event.target.value;
        changeLanguage(lang);
    });
</script>
	<script>
    // Lắng nghe sự thay đổi trong lựa chọn ngôn ngữ
    document.getElementById("language").addEventListener("change", function() {
        var selectedLanguage = this.value; // Giá trị ngôn ngữ được chọn

        // Chuyển hướng đến mẫu CV tương ứng
        var link = document.getElementById("useTemplateLink");
        if (selectedLanguage === "vi") {
            link.href = "/luaCV/mauCV7";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV7ta";  // Mẫu CV tiếng Anh
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
            link.href = "/luaCV/mauCV7";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV7ta";  // Mẫu CV tiếng Anh
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