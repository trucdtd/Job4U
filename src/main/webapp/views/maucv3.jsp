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
    min-height: 100vh; /* Chiều cao tối thiểu để trang bao phủ toàn bộ chiều cao */
    padding: 0; /* Xóa padding mặc định */
    margin: 0; /* Xóa margin mặc định */
    background-color: #f4f4f9;
}

.resume-container {
    display: flex;
    width: 800px;
    border: 1px solid #e0e0e0;
    background-color: white;
    margin: auto; /* Căn giữa resume-container */
    flex-grow: 1; /* Để phần chính chiếm khoảng trống giữa header và footer */
}

/* Các thành phần bên trong resume-container */
.left-column, .right-column {
    padding: 20px;
}

.left-column {
    width: 35%;
    background-color: #d2e4d9;
}

.right-column {
    width: 65%;
}

/* Thiết lập linh hoạt cho phần khung hình */
.photo-background {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 30px;
}
.personal-info {
            text-align: center;
        }

.photo-frame {
    width: 150px;
    height: 200px;
    overflow: hidden;
    border: 2px solid #4d5c4b;
    border-radius: 8px;
    background-color: #ffffff;
}

.photo-frame img {
    width: 100%;
    height: 100%;
    object-fit: cover;
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

.contact-info,
.skills,
.reference {
    margin-bottom: 20px;
}

.contact-info p,
.skills p,
.reference p {
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
</style>

<body>
<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<br>
    <div class="resume-container">
        <!-- Left Column -->
        <div class="left-column">
            <div class="photo-background">
                <div class="photo-frame">
                    <img src="profile.jpg" alt="Profile Image">
                </div>
            </div>
            <div class="contact-info">
                <h2 class="section-title">CONTACT</h2>
                <p>Email: hello@reallygreatsite.com</p>
                <p>Phone: +1 234 567 8910</p>
                <p>Location: 43 Anywhere St., Any City</p>
                <p>Website: www.reallygreatsite.com</p>
            </div>

            <div class="skills">
                <h2 class="section-title">SKILLS</h2>
                <p>Icon Design</p>
                <p>Photography</p>
                <p>Content Creation</p>
                <p>Social Media</p>
            </div>

            <div class="reference">
                <h2 class="section-title">REFERENCE</h2>
                <p>Helene Paquet</p>
                <p>Holto Werner &amp; Schomer</p>
                <p>Email: helene@holto.com</p>
                <p>Lee Landra, Inc.</p>
                <p>CEO Landra, Inc.</p>
                <p>Tel: +1 555 234 5678</p>
            </div>
        </div>

        <!-- Right Column -->
        <div class="right-column">
            <div class="personal-info">
                <h1>OLIVIA WILSON</h1>
                <h2>GRAPHIC DESIGNER</h2>
                <p>I am a fun, hard-working creative who strives for excellence in everything I do. I’m an avid learner and seek to enhance the lives of everyone around me.</p>
            </div>

            <h2 class="section-title">EDUCATION</h2>
            <ul>
                <li><strong>Really Great University</strong><br>Master in Product Design<br>2010 - 2013</li>
                <li><strong>Really Great University</strong><br>Bachelor Degree in Digital Analysis<br>2008 - 2010</li>
                <li><strong>Really Great University</strong><br>Bachelor in Graphic Design<br>2006 - 2008</li>
            </ul>

            <h2 class="section-title">EXPERIENCE</h2>
            <ul>
                <li><strong>Senior Fashion Manager</strong><br>2007 - Present<br>Worked on marketing for top fashion brands</li>
                <li><strong>Fashion Journalist</strong><br>2007 - 2008<br>Responsible for content publishing to multiple brands</li>
            </ul>
        </div>
    </div>
	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
</body>
</html>