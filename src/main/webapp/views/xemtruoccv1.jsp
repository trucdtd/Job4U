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
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 800px;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: grid;
            grid-template-columns: 300px auto;
            gap: 20px;
        }

        .left-section {
            background-color: #f8f8f8;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }

        .left-section img {
            width: 100px;
            height: 133px;
            /* Đảm bảo tỷ lệ 3:4 */
            object-fit: cover;
            margin-bottom: 15px;
            border: 2px;
            /* Thêm viền khung */
            border-radius: 8px;
            /* Bo góc nhẹ */

        }

        .left-section h3 {
            border-bottom: 2px solid #ddd;
            /* Thêm gạch dưới */
            padding-bottom: 5px;
            /* Tạo khoảng cách giữa chữ và gạch */
            margin-bottom: 15px;
            /* Tạo khoảng cách dưới tiêu đề */
            text-align: center;
            /* Căn giữa tiêu đề */

            /* Màu chữ */
            font-size: 16px;
            /* Kích thước chữ */
        }

        .left-section p,
        .left-section ul {
            font-size: 14px;
            margin: 5px 0;
            color: #555;
        }

        .left-section ul {
            list-style: none;
            padding: 0;
        }

        .left-section ul li {
            margin: 8px 0;
        }

        .right-section {
            padding: 10px 20px;
        }

        .right-section h1 {
            font-size: 24px;
            margin-bottom: 5px;
            color: #333;
        }

        .right-section p {
            font-size: 14px;
            color: #777;
            margin-bottom: 20px;
        }

        .right-section h2 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #555;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
        }

        .right-section .section {
            margin-bottom: 20px;
        }

        .right-section .job {
            margin-bottom: 15px;
        }

        .right-section .job h3 {
            font-size: 16px;
            margin: 0;
            color: #333;
        }

        .right-section .job p {
            font-size: 14px;
            margin: 2px 0;
            color: #555;
        }

        h2 {
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="cv-wrapper">
        <!-- Phần CV -->
        <div class="container">
            <!-- Phần bên trái -->
            <div class="left-section">
                <img src="https://via.placeholder.com/100x133" alt="Ảnh ứng viên">
                <h3 id="contactTitle">Liên Hệ</h3>
                <ul>
                    <li id="phone">123-456-7890</li>
                    <li id="email">hello@email.com</li>
                    <li id="website">www.website.com</li>
                    <li id="address">123 Đường Anywhere, Thành phố bất kỳ</li>
                </ul>
                <h3 id="skillsTitle">Kỹ Năng</h3>
                <ul>
                    <li id="skill1">Kỹ năng quản lý</li>
                    <li id="skill2">Đàm phán</li>
                    <li id="skill3">Tư duy phản biện</li>
                    <li id="skill4">Lãnh đạo</li>
                    <li id="skill5">Tiếp thị số</li>
                </ul>
                <h3 id="languagesTitle">Ngôn Ngữ</h3>
                <ul>
                    <li id="language1">Tiếng Anh</li>
                    <li id="language2">Tiếng Tây Ban Nha</li>
                </ul>
            </div>
        
            <!-- Phần bên phải -->
            <div class="right-section">
                <h1 id="name">NGUYỄN VĂN A</h1>
                <p id="jobTitle">Quản Lý Tiếp Thị</p>
                <div class="section">
                    <h2 id="aboutMeHeading">Về Tôi</h2>
                    <div class="job">
                        <p id="aboutMeContent">Tôi có hơn 5 năm kinh nghiệm trong lĩnh vực tiếp thị và quản lý các chiến lược kinh doanh.</p>
                    </div>
                </div>
        
                <div class="section">
                    <h2 id="experienceHeading">Kinh Nghiệm Làm Việc</h2>
                    <div class="job">
                        <h3 id="job1Title">Quản Lý Tiếp Thị</h3>
                        <p><strong id="job1Time">2022 - 2023</strong></p>
                        <p id="job1Company">Arrowhead Industries</p>
                        <p id="job1Desc">Phụ trách triển khai chiến lược tiếp thị, quản lý nhóm và đạt được mục tiêu doanh số.</p>
                    </div>
                    <div class="job">
                        <h3 id="job2Title">Quản Lý Tiếp Thị</h3>
                        <p><strong id="job2Time">2020 - 2021</strong></p>
                        <p id="job2Company">Gingerleaf International Co.</p>
                        <p id="job2Desc">Phát triển các chiến dịch tiếp thị sáng tạo, mở rộng thương hiệu và tăng doanh thu.</p>
                    </div>
                </div>
                <div class="section">
                    <h2 id="educationHeading">Học Vấn</h2>
                    <div class="job">
                        <h3 id="education1Title">Đại học Rimberio</h3>
                        <p><strong id="education1Time">2019 - 2022</strong></p>
                        <p id="education1Desc">Cử nhân Quản trị Kinh doanh với thành tích xuất sắc.</p>
                    </div>
                    <div class="job">
                        <h3 id="education2Title">Đại học Borcelle</h3>
                        <p><strong id="education2Time">2016 - 2018</strong></p>
                        <p id="education2Desc">Cử nhân Quản trị Kinh doanh với chuyên ngành Tiếp thị.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Phần bảng điều khiển bên phải -->
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
                en: {
                    name: "Olivia Wilson",
                    jobTitle: "Marketing Manager",
                    contactTitle: "Contact",
                    phone: "123-456-7890",
                    email: "hello@email.com",
                    website: "www.website.com",
                    address: "123 Anywhere St., Any City",
                    skillsTitle: "Skills",
                    skill1: "Management",
                    skill2: "Negotiation",
                    skill3: "Critical Thinking",
                    skill4: "Leadership",
                    skill5: "Digital Marketing",
                    languagesTitle: "Languages",
                    language1: "English",
                    language2: "Spanish",
                    aboutMeHeading: "About Me",
                    aboutMeContent: "I have more than 5 years of experience in marketing and managing business strategies.",
                    job1Title: "Marketing Manager",
                    job1Time: "2022 - 2023",
                    job1Company: "Arrowhead Industries",
                    job1Desc: "Responsible for implementing marketing strategies, managing the team, and meeting sales targets.",
                    job2Title: "Marketing Manager",
                    job2Time: "2020 - 2021",
                    job2Company: "Gingerleaf International Co.",
                    job2Desc: "Developed creative marketing campaigns, expanded the brand, and increased sales.",
                    educationHeading: "Education",
                    education1Title: "Rimberio University",
                    education1Time: "2019 - 2022",
                    education1Desc: "Bachelor's degree in Business Administration with distinction.",
                    education2Title: "Borcelle University",
                    education2Time: "2016 - 2018",
                    education2Desc: "Bachelor's degree in Business Administration with a focus on Marketing.",
                    panelTitle: "Elegant CV Template",
                    aboutMeHeading: "About Me",
                    experienceHeading: "Work Experience",
                    educationHeading: "Education"
                },
                vi: {
                    name: "NGUYỄN VĂN A",
                    jobTitle: "Quản Lý Tiếp Thị",
                    contactTitle: "Liên Hệ",
                    phone: "123-456-7890",
                    email: "hello@email.com",
                    website: "www.website.com",
                    address: "123 Đường Anywhere, Thành phố bất kỳ",
                    skillsTitle: "Kỹ Năng",
                    skill1: "Kỹ năng quản lý",
                    skill2: "Đàm phán",
                    skill3: "Tư duy phản biện",
                    skill4: "Lãnh đạo",
                    skill5: "Tiếp thị số",
                    languagesTitle: "Ngôn Ngữ",
                    language1: "Tiếng Anh",
                    language2: "Tiếng Tây Ban Nha",
                    job1Title: "Quản Lý Tiếp Thị",
                    job1Time: "2022 - 2023",
                    aboutMeHeading: "Về Tôi",
                    aboutMeContent: "Tôi có hơn 5 năm kinh nghiệm trong lĩnh vực tiếp thị và quản lý các chiến lược kinh doanh.",
                    job1Company: "Arrowhead Industries",
                    job1Desc: "Phụ trách triển khai chiến lược tiếp thị, quản lý nhóm và đạt được mục tiêu doanh số.",
                    job2Title: "Quản Lý Tiếp Thị",
                    job2Time: "2020 - 2021",
                    job2Company: "Gingerleaf International Co.",
                    job2Desc: "Phát triển các chiến dịch tiếp thị sáng tạo, mở rộng thương hiệu và tăng doanh thu.",
                    educationHeading: "Học Vấn",
                    education1Title: "Đại học Rimberio",
                    education1Time: "2019 - 2022",
                    education1Desc: "Cử nhân Quản trị Kinh doanh với thành tích xuất sắc.",
                    education2Title: "Đại học Borcelle",
                    education2Time: "2016 - 2018",
                    education2Desc: "Cử nhân Quản trị Kinh doanh với chuyên ngành Tiếp thị.",
                    panelTitle: "Mẫu CV Thanh lịch",
                    aboutMeHeading: "Về Tôi",
                    experienceHeading: "Kinh Nghiệm Làm Việc",
                    educationHeading: "Học Vấn"
                }
            };
        
            document.getElementById('language').addEventListener('change', function(e) {
                const lang = e.target.value;
                const t = translations[lang];
        
                document.getElementById('name').textContent = t.name;
                document.getElementById('jobTitle').textContent = t.jobTitle;
                document.getElementById('contactTitle').textContent = t.contactTitle;
                document.getElementById('phone').textContent = t.phone;
                document.getElementById('email').textContent = t.email;
                document.getElementById('website').textContent = t.website;
                document.getElementById('address').textContent = t.address;
                document.getElementById('skillsTitle').textContent = t.skillsTitle;
                document.getElementById('skill1').textContent = t.skill1;
                document.getElementById('skill2').textContent = t.skill2;
                document.getElementById('skill3').textContent = t.skill3;
                document.getElementById('skill4').textContent = t.skill4;
                document.getElementById('skill5').textContent = t.skill5;
                document.getElementById('languagesTitle').textContent = t.languagesTitle;
                document.getElementById('language1').textContent = t.language1;
                document.getElementById('language2').textContent = t.language2;
                document.getElementById('aboutMeHeading').textContent = t.aboutMeHeading;
                document.getElementById('aboutMeContent').textContent = t.aboutMeContent;
                document.getElementById('job1Title').textContent = t.job1Title;
                document.getElementById('job1Time').textContent = t.job1Time;
                document.getElementById('job1Company').textContent = t.job1Company;
                document.getElementById('job1Desc').textContent = t.job1Desc;
                document.getElementById('job2Title').textContent = t.job2Title;
                document.getElementById('job2Time').textContent = t.job2Time;
                document.getElementById('job2Company').textContent = t.job2Company;
                document.getElementById('job2Desc').textContent = t.job2Desc;
                document.getElementById('educationHeading').textContent = t.educationHeading;
                document.getElementById('education1Title').textContent = t.education1Title;
                document.getElementById('education1Time').textContent = t.education1Time;
                document.getElementById('education1Desc').textContent = t.education1Desc;
                document.getElementById('education2Title').textContent = t.education2Title;
                document.getElementById('education2Time').textContent = t.education2Time;
                document.getElementById('education2Desc').textContent = t.education2Desc;
                document.getElementById('panelTitle').textContent = t.panelTitle;
                document.getElementById('aboutMeHeading').textContent = t.aboutMeHeading;
                document.getElementById('experienceHeading').textContent = t.experienceHeading;
                document.getElementById('educationHeading').textContent = t.educationHeading;
            });
        </script>
        <script>
    // Lắng nghe sự thay đổi trong lựa chọn ngôn ngữ
    document.getElementById("language").addEventListener("change", function() {
        var selectedLanguage = this.value; // Giá trị ngôn ngữ được chọn

        // Chuyển hướng đến mẫu CV tương ứng
        var link = document.getElementById("useTemplateLink");
        if (selectedLanguage === "vi") {
            link.href = "/luaCV/mauCV1";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV1ta";  // Mẫu CV tiếng Anh
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
            link.href = "/luaCV/mauCV1";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV1ta";  // Mẫu CV tiếng Anh
        }
    }
</script>
</body>
</html>