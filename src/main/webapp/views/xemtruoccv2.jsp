<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem Trước Mẫu CV</title>
<style>
/* Thêm kiểu CSS như đã tạo trước đây */
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
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
	display: flex;
	justify-content: center;
}

.container {
	width: 800px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

/* Header Section Styling */
.header {
	display: flex;
	align-items: center;
	background-color: #e0e5ec;
	padding: 15px;
	justify-content: center;
	height: 120px;
	border-radius: 10px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 25px;
}

.profile-photo {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	margin-right: 15px;
	object-fit: cover;
}

.header-info {
	text-align: center;
	flex-grow: 1;
}

.header-info h1 {
	font-size: 24px;
	margin: 0;
	color: #333;
}

.header-info p {
	font-size: 16px;
	color: #555;
	margin: 5px 0 0;
}

/* Main Content Styling */
.main-content {
	display: flex;
	flex-direction: row;
	padding: 20px;
}

/* Left Column Styling */
.left-column {
	width: 30%;
	background-color: #e0e5ec;
	padding: 20px;
	box-sizing: border-box;
	border-radius: 10px;
}

.left-content h2 {
	font-size: 16px;
	color: #333;
	margin-bottom: 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
	border-bottom: 1px solid #ccc;
	padding-bottom: 5px;
}

.left-content p, .left-content ul {
	font-size: 14px;
	color: #555;
	list-style: none;
	padding: 0;
	margin: 5px 0;
}

.left-content ul {
	padding-left: 15px;
}

/* Skills Section Styling */

/* Right Column Styling */
.right-column {
	width: 70%;
	padding: 20px;
	box-sizing: border-box;
}

.section {
	margin-top: 20px;
}

.section h2 {
	font-size: 18px;
	color: #333;
	border-bottom: 1px solid #ccc;
	padding-bottom: 5px;
	margin-bottom: 10px;
}

.experience h3, .education p {
	font-size: 16px;
	font-weight: bold;
	margin: 5px 0;
	color: #333;
}

.experience p, .education span, .references ul li {
	font-size: 14px;
	color: #555;
}

.references ul {
	padding-left: 20px;
	list-style: none;
}
</style>
</head>

<body>
	<div class="cv-wrapper">
		<div class="container">
			<div class="header">
				<img src="your-image-url.jpg" alt="Donna Stroupe"
					class="profile-photo">
				<div class="header-info">
					<h1 id="name">Nguyễn Văn A</h1>
					<p id="job-title">Đại diện Bán hàng</p>
				</div>
			</div>

			<div class="main-content">
				<div class="left-column">
					<div class="left-content">
						<h2>Thông Tin Liên Hệ</h2>
						<p id="email">Email: feelgready@quickrx.com</p>
						<p id="phone">Điện Thoại: +123-456-7890</p>
						<p id="address">Địa Chỉ: 123 Anywhere St., Any City</p>
						<p id="website">Website: real.yourwebsite.com</p>

						<div class="skills">
							<h2 id="skills-title">Kỹ Năng</h2>
							<ul id="skills-list">
								<li>Bán Hàng & Tiếp Thị</li>
								<li>Kiến Thức Sản Phẩm</li>
								<li>Xây Dựng Mối Quan Hệ Khách Hàng</li>
							</ul>
						</div>

						<h2 id="languages-title">Ngôn Ngữ</h2>
						<ul id="languages-list">
							<li>Tiếng Anh</li>
							<li>Tiếng Pháp</li>
						</ul>

						<!-- Thêm About Me -->
					</div>
				</div>

				<div class="right-column">
					<div class="about-me">
						<h3 id="aboutmee">Giới Thiệu Về Tôi</h3>
						<p id="aboutme">Tôi là một Nhân Viên Bán Hàng và chuyên gia
							trong việc xây dựng mối quan hệ khách hàng...</p>
					</div>
					<div class="work-experience">
						<h2 >Kinh Nghiệm Làm Việc</h2>

						<!-- Work Experience Item 1 -->
						<div class="work-experience-item">
							<h3 id="job1-title">Nhân Viên Bán Hàng Hàng Tiêu Dùng</h3>
							<p id="job1-time">Tháng 8, 2018 - Hiện Tại</p>
							<p id="job1-desc">Giao tiếp với khách hàng tiềm năng để tăng
								doanh số, quản lý tài khoản và cung cấp dịch vụ hậu mãi để đảm
								bảo sự hài lòng của khách hàng.</p>
						</div>

						<!-- Work Experience Item 2 -->
						<div class="work-experience-item">
							<h3 id="job2-title">Chuyên Viên Bán Hàng</h3>
							<p id="job2-time">Tháng 1, 2016 - Tháng 7, 2018</p>
							<p id="job2-desc">Lãnh đạo đội ngũ bán hàng cấp dưới, tổ chức
								các chiến dịch quảng bá, và phát triển các chiến lược bán hàng
								mới để thâm nhập thị trường.</p>
						</div>

						<!-- Work Experience Item 3 -->
						<div class="work-experience-item">
							<h3 id="job3-title">Điều Phối Viên Marketing</h3>
							<p id="job3-time">Tháng 3, 2013 - Tháng 12, 2015</p>
							<p id="job3-desc">Điều phối các sự kiện marketing, quản lý
								các tài khoản mạng xã hội, và hợp tác với đội ngũ bán hàng để
								cải thiện sự tương tác với khách hàng.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

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
		    en: {
		        name: "Donna Stroupe",
		        jobTitle: "Sales Representative",
		        email: "Email: feelgready@quickrx.com",
		        phone: "Phone: +123-456-7890",
		        address: "Address: 123 Anywhere St., Any City",
		        website: "Website: real.yourwebsite.com",
		        aboutMee: "About Me",
		        aboutMe: "I am a Sales Representative & a customer relationship expert...",
		        job1Title: "Consumer Goods Seller",
		        job1Time: "Aug 2018 - Present",
		        job1Desc: "Communicated with potential customers to increase sales, managed accounts, and provided after-sales support to ensure customer satisfaction.",
		        job2Title: "Sales Executive",
		        job2Time: "Jan 2016 - Jul 2018",
		        job2Desc: "Led a team of junior sales staff, organized promotional campaigns, and developed new sales strategies for market penetration.",
		        job3Title: "Marketing Coordinator",
		        job3Time: "Mar 2013 - Dec 2015",
		        job3Desc: "Coordinated marketing events, managed social media accounts, and collaborated with the sales team to improve customer engagement.",
		        workExperience: "Work Experience", // Dịch tiêu đề
		        skillsTitle: "Skills",
		        skills: [
		            "Sales & Marketing",
		            "Product Knowledge",
		            "Customer Relationship Building"
		        ],
		        languagesTitle: "Languages",
		        languages: [
		            "English",
		            "French"
		        ]
		    },
		    vi: {
		        name: "Nguyễn Văn A",
		        jobTitle: "Đại diện Bán hàng",
		        email: "Email: nguyenvana@example.com",
		        phone: "Điện thoại: +84-123-456-789",
		        address: "Địa chỉ: Số 123, Phố Bất kỳ, Thành phố",
		        website: "Website: thucte.trangwebcuaban.com",
		        aboutMee: "Giới Thiệu Về Tôi",
		        aboutMe: "Tôi là Đại diện Bán hàng chuyên quản lý mối quan hệ khách hàng...",
		        job1Title: "Người bán Hàng Tiêu dùng",
		        job1Time: "Tháng 8/2018 - Nay",
		        job1Desc: "Giao tiếp với khách hàng tiềm năng để tăng doanh số, quản lý tài khoản và cung cấp hỗ trợ sau bán hàng để đảm bảo sự hài lòng của khách hàng.",
		        job2Title: "Chuyên viên Bán hàng",
		        job2Time: "Tháng 1/2016 - Tháng 7/2018",
		        job2Desc: "Lãnh đạo đội ngũ bán hàng trẻ, tổ chức các chiến dịch quảng cáo, phát triển chiến lược bán hàng mới để xâm nhập thị trường.",
		        job3Title: "Điều phối viên Marketing",
		        job3Time: "Tháng 3/2013 - Tháng 12/2015",
		        job3Desc: "Điều phối các sự kiện marketing, quản lý tài khoản mạng xã hội, hợp tác với đội ngũ bán hàng để nâng cao sự tương tác với khách hàng.",
		        workExperience: "Kinh Nghiệm Làm Việc", // Tiêu đề gốc
		        skillsTitle: "Kỹ Năng",
		        skills: [
		            "Bán Hàng & Tiếp Thị",
		            "Kiến Thức Sản Phẩm",
		            "Xây Dựng Mối Quan Hệ Khách Hàng"
		        ],
		        languagesTitle: "Ngôn Ngữ",
		        languages: [
		            "Tiếng Anh",
		            "Tiếng Pháp"
		        ]
		    }
		};

		document.getElementById('language').addEventListener('change', (e) => {
		    const lang = e.target.value;
		    const content = translations[lang];

		    // Cập nhật thông tin cơ bản
		    document.getElementById('name').textContent = content.name;
		    document.getElementById('job-title').textContent = content.jobTitle;
		    document.getElementById('email').textContent = content.email;
		    document.getElementById('phone').textContent = content.phone;
		    document.getElementById('address').textContent = content.address;
		    document.getElementById('website').textContent = content.website;
		    document.getElementById('aboutmee').textContent = content.aboutMee;
		    document.getElementById('aboutme').textContent = content.aboutMe;

		    // Cập nhật kinh nghiệm làm việc
		    document.getElementById('job1-title').textContent = content.job1Title;
		    document.getElementById('job1-time').textContent = content.job1Time;
		    document.getElementById('job1-desc').textContent = content.job1Desc;
		    document.getElementById('job2-title').textContent = content.job2Title;
		    document.getElementById('job2-time').textContent = content.job2Time;
		    document.getElementById('job2-desc').textContent = content.job2Desc;
		    document.getElementById('job3-title').textContent = content.job3Title;
		    document.getElementById('job3-time').textContent = content.job3Time;
		    document.getElementById('job3-desc').textContent = content.job3Desc;
		    document.querySelector('.work-experience h2').textContent = content.workExperience;

		    // Cập nhật kỹ năng
		    document.getElementById('skills-title').textContent = content.skillsTitle;
		    const skillsList = document.getElementById('skills-list');
		    skillsList.innerHTML = ''; // Xóa các mục hiện tại
		    content.skills.forEach(skill => {
		        const li = document.createElement('li');
		        li.textContent = skill;
		        skillsList.appendChild(li);
		    });

		    // Cập nhật ngôn ngữ
		    document.getElementById('languages-title').textContent = content.languagesTitle;
		    const languagesList = document.getElementById('languages-list');
		    languagesList.innerHTML = ''; // Xóa các mục hiện tại
		    content.languages.forEach(language => {
		        const li = document.createElement('li');
		        li.textContent = language;
		        languagesList.appendChild(li);
		    });
		});

    </script>
	<script>
    // Lắng nghe sự thay đổi trong lựa chọn ngôn ngữ
    document.getElementById("language").addEventListener("change", function() {
        var selectedLanguage = this.value; // Giá trị ngôn ngữ được chọn

        // Chuyển hướng đến mẫu CV tương ứng
        var link = document.getElementById("useTemplateLink");
        if (selectedLanguage === "vi") {
            link.href = "/luaCV/mauCV2";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV2ta";  // Mẫu CV tiếng Anh
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
            link.href = "/luaCV/mauCV2";  // Mẫu CV tiếng Việt
        } else if (selectedLanguage === "en") {
            link.href = "/luaCV/mauCV2ta";  // Mẫu CV tiếng Anh
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