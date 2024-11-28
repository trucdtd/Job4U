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
            max-width: 809px;

            padding: 20px;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .header {
            text-align: center;
            padding: 40px 0;
            border-bottom: 2px solid #ddd;
            background-color: #e3f2fd;
        }

        .header h1 {
            font-size: 40px;
            margin: 0;
            color: #1e88e5;
        }

        .header p {
            font-size: 20px;
            color: #64b5f6;
            margin: 10px 0 0 0;
        }

        .content {
            display: flex;
            gap: 20px;
        }

        .left-column {
            flex: 3;
            border-right: 2px solid #ddd;
            /* Thêm đường gạch dọc */
            padding-right: 20px;
        }

        .right-column {
            flex: 7;
            padding-left: 20px;
            /* Thêm khoảng cách cho cột phải */
        }

        .section {
            margin-bottom: 20px;
        }

        .section h2 {
            font-size: 20px;
            color: #333;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin-bottom: 8px;
        }

        .profile-summary p {
            margin: 0;
            line-height: 1.6;
        }

        .work-experience .job {
            margin-bottom: 15px;
        }

        .job h3 {
            font-size: 16px;
            margin: 0 0 5px;
        }

        .job p {
            margin: 5px 0;
            line-height: 1.6;
        }
    </style>
</head>

<body>
    <div class="cv-wrapper">
        <!-- Cột trái (Nội dung CV) -->
        <div class="container">
            <!-- Tiêu đề -->
            <div class="header">
                <h1 id="name">NGUYỄN VĂN A</h1>
                <p id="jobTitle">Quản lý Marketing</p>
            </div>

            <!-- Nội dung -->
            <div class="content">
                <!-- Cột bên trái -->
                <div class="left-column">
                    <div class="section contact">
                        <h2 id="contactTitle">Liên hệ</h2>
                        <ul>
                            <li id="phone">+123-456-7890</li>
                            <li id="email">richard@example.com</li>
                            <li id="address">123 Đường Anywhere, Thành phố Any</li>
                            <li id="website">www.richardsanchez.com</li>
                        </ul>
                    </div>

                    <div class="section education">
                        <h2 id="educationTitle">Học vấn</h2>
                        <p><strong>2021 - 2023:</strong> Cử nhân Quản trị Kinh doanh, Đại học Rockwell</p>
                        <p><strong>2018 - 2021:</strong> Cử nhân Marketing, Cao đẳng City</p>
                    </div>
                </div>

                <!-- Cột bên phải -->
                <div class="right-column">
                    <div class="section profile-summary">
                        <h2 id="profileSummaryTitle">Tóm tắt hồ sơ</h2>
                        <p id="profileSummaryText">Quản lý Marketing có kinh nghiệm và chú trọng chi tiết với thành tích
                            đã được chứng minh trong việc triển khai các chiến lược marketing sáng tạo và thành công.
                            Thành thạo trong quản lý dự án, lãnh đạo đội nhóm và tối ưu hóa chiến dịch để thúc đẩy sự
                            phát triển của thương hiệu.</p>
                    </div>

                    <div class="section work-experience">
                        <h2 id="workExperienceTitle">Kinh nghiệm làm việc</h2>
                        <div class="job">
                            <h3>Boostle Studio | Quản lý Marketing & Chuyên gia | 2020 - Hiện tại</h3>
                            <p>Đã dẫn dắt thành công các dự án xây dựng thương hiệu cho các tập đoàn quốc tế. Hợp tác
                                với các đội nhóm để tạo ra chiến lược marketing làm tăng doanh thu lên 25%.</p>
                        </div>
                        <div class="job">
                            <h3>Frugal Square | Quản lý Marketing | 2019 - 2020</h3>
                            <p>Xây dựng chiến lược marketing đa kênh và thực hiện các chiến dịch làm tăng sự tương tác
                                của khách hàng lên 30%.</p>
                        </div>
                        <div class="job">
                            <h3>Studio Shoreline | Chuyên gia Marketing | 2017 - 2019</h3>
                            <p>Quản lý các sáng kiến marketing kỹ thuật số và tối ưu hóa sự hiện diện trên mạng xã hội
                                để mở rộng phạm vi tiếp cận của đối tượng lên 50%.</p>
                        </div>
                    </div>

                    <div class="section skills">
                        <h2 id="skillsTitle">Kỹ năng</h2>
                        <ul>
                            <li id="projectManagement">Quản lý dự án</li>
                            <li id="marketingCampaigns">Chiến dịch Marketing</li>
                            <li id="teamLeadership">Lãnh đạo đội nhóm</li>
                            <li id="dataAnalysis">Phân tích dữ liệu</li>
                            <li id="creativeThinking">Suy nghĩ sáng tạo</li>
                        </ul>
                    </div>

                    <div class="section languages">
                        <h2 id="languagesTitle">Ngôn ngữ</h2>
                        <ul>
                            <li id="english">Tiếng Anh - Thành thạo</li>
                            <li id="spanish">Tiếng Tây Ban Nha - Trung cấp</li>
                        </ul>
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
			<button class="btn btn-secondary" onclick="goToHomePage()">Đóng
				lại</button>
		</div>
    </div>
    <script>
        document.getElementById('language').addEventListener('change', function () {
            const language = this.value;

            // Switch text content based on the selected language
            if (language === 'vi') {
                // Vietnamese Texts
                document.getElementById('name').textContent = 'RICHARD SANCHEZ';
                document.getElementById('jobTitle').textContent = 'Giám Đốc Marketing';
                document.getElementById('contactTitle').textContent = 'Liên hệ';
                document.getElementById('phone').textContent = '+123-456-7890';
                document.getElementById('email').textContent = 'richard@example.com';
                document.getElementById('address').textContent = '123 Đường Anywhere, Thành phố Any';
                document.getElementById('website').textContent = 'www.richardsanchez.com';
                document.getElementById('educationTitle').textContent = 'Học Vấn';

                document.getElementById('profileSummaryTitle').textContent = 'Tóm tắt hồ sơ';
                document.getElementById('profileSummaryText').textContent = 'Quản lý Marketing có kinh nghiệm và chú trọng chi tiết với thành tích đã được chứng minh trong việc triển khai các chiến lược marketing sáng tạo và thành công. Thành thạo trong quản lý dự án, lãnh đạo đội nhóm và tối ưu hóa chiến dịch để thúc đẩy sự phát triển của thương hiệu.';

                document.getElementById('workExperienceTitle').textContent = 'Kinh nghiệm làm việc';
                document.querySelectorAll('.job h3')[0].textContent = 'Boostle Studio | Quản lý Marketing & Chuyên gia | 2020 - Hiện tại';
                document.querySelectorAll('.job p')[0].textContent = 'Đã dẫn dắt thành công các dự án xây dựng thương hiệu cho các tập đoàn quốc tế. Hợp tác với các đội nhóm để tạo ra chiến lược marketing làm tăng doanh thu lên 25%.';

                document.querySelectorAll('.job h3')[1].textContent = 'Frugal Square | Quản lý Marketing | 2019 - 2020';
                document.querySelectorAll('.job p')[1].textContent = 'Xây dựng chiến lược marketing đa kênh và thực hiện các chiến dịch làm tăng sự tương tác của khách hàng lên 30%.';

                document.querySelectorAll('.job h3')[2].textContent = 'Studio Shoreline | Chuyên gia Marketing | 2017 - 2019';
                document.querySelectorAll('.job p')[2].textContent = 'Quản lý các sáng kiến marketing kỹ thuật số và tối ưu hóa sự hiện diện trên mạng xã hội để mở rộng phạm vi tiếp cận của đối tượng lên 50%.';

                document.getElementById('skillsTitle').textContent = 'Kỹ năng';
                document.getElementById('projectManagement').textContent = 'Quản lý dự án';
                document.getElementById('marketingCampaigns').textContent = 'Chiến dịch Marketing';
                document.getElementById('teamLeadership').textContent = 'Lãnh đạo đội nhóm';
                document.getElementById('dataAnalysis').textContent = 'Phân tích dữ liệu';
                document.getElementById('creativeThinking').textContent = 'Suy nghĩ sáng tạo';

                document.getElementById('languagesTitle').textContent = 'Ngôn ngữ';
                document.getElementById('english').textContent = 'Tiếng Anh - Thành thạo';
                document.getElementById('spanish').textContent = 'Tiếng Tây Ban Nha - Trung cấp';
                document.getElementById('useTemplateBtn').textContent = 'Sử dụng mẫu này';
                document.getElementById('closeBtn').textContent = 'Đóng';
            } else {
                // English Texts
                document.getElementById('name').textContent = 'RICHARD SANCHEZ';
                document.getElementById('jobTitle').textContent = 'Marketing Manager';
                document.getElementById('contactTitle').textContent = 'Contact';
                document.getElementById('phone').textContent = '+123-456-7890';
                document.getElementById('email').textContent = 'richard@example.com';
                document.getElementById('address').textContent = '123 Anywhere St, Any City';
                document.getElementById('website').textContent = 'www.richardsanchez.com';
                document.getElementById('educationTitle').textContent = 'Education';
                document.getElementById('profileSummaryTitle').textContent = 'Profile Summary';
                document.getElementById('profileSummaryText').textContent = 'Experienced and detail-driven Marketing Manager with a proven track record in delivering creative and successful marketing strategies. Skilled in project management, team leadership, and campaign optimization to drive brand growth.';

                document.getElementById('workExperienceTitle').textContent = 'Work Experience';
                document.querySelectorAll('.job h3')[0].textContent = 'Boostle Studio | Marketing Manager & Specialist | 2020 - Present';
                document.querySelectorAll('.job p')[0].textContent = 'Successfully led branding projects for international corporations. Collaborated with teams to create marketing strategies that increased revenue by 25%.';

                document.querySelectorAll('.job h3')[1].textContent = 'Frugal Square | Marketing Manager | 2019 - 2020';
                document.querySelectorAll('.job p')[1].textContent = 'Developed multi-channel marketing strategies and executed campaigns that increased customer engagement by 30%.';

                document.querySelectorAll('.job h3')[2].textContent = 'Studio Shoreline | Marketing Specialist | 2017 - 2019';
                document.querySelectorAll('.job p')[2].textContent = 'Managed digital marketing initiatives and optimized social media presence to grow audience reach by 50%.';

                document.getElementById('skillsTitle').textContent = 'Skills';
                document.getElementById('projectManagement').textContent = 'Project Management';
                document.getElementById('marketingCampaigns').textContent = 'Marketing Campaigns';
                document.getElementById('teamLeadership').textContent = 'Team Leadership';
                document.getElementById('dataAnalysis').textContent = 'Data Analysis';
                document.getElementById('creativeThinking').textContent = 'Creative Thinking';

                document.getElementById('languagesTitle').textContent = 'Languages';
                document.getElementById('english').textContent = 'English - Fluent';
                document.getElementById('spanish').textContent = 'Spanish - Intermediate';
                document.getElementById('useTemplateBtn').textContent = 'Use this Template';
                document.getElementById('closeBtn').textContent = 'Close';
            }
        });

    </script>
    <script>
		// Lắng nghe sự thay đổi trong lựa chọn ngôn ngữ
		document.getElementById("language").addEventListener("change",
				function() {
					var selectedLanguage = this.value; // Giá trị ngôn ngữ được chọn

					// Chuyển hướng đến mẫu CV tương ứng
					var link = document.getElementById("useTemplateLink");
					if (selectedLanguage === "vi") {
						link.href = "/luaCV/mauCV9"; // Mẫu CV tiếng Việt
					} else if (selectedLanguage === "en") {
						link.href = "/luaCV/mauCV9ta"; // Mẫu CV tiếng Anh
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
				link.href = "/luaCV/mauCV9"; // Mẫu CV tiếng Việt
			} else if (selectedLanguage === "en") {
				link.href = "/luaCV/mauCV9ta"; // Mẫu CV tiếng Anh
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