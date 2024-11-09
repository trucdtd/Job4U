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
                    <input type="file" accept="image/*" onchange="previewImage(event)">
                    <img id="profileImage" src="profile.jpg" alt="Profile Image">
                </div>
            </div>
            <div class="contact-info">
                <h2 class="section-title">Thông Tin</h2>
                <label for="email">Email:</label>
                <input type="email" id="email" value="hello@reallygreatsite.com"><br>
                <label for="phone">Phone:</label>
                <input type="tel" id="phone" value="+1 234 567 8910"><br>
                <label for="dob">Ngày Sinh:</label>
                <input type="date" id="dob" value="2004-09-28"><br>
                <label for="gender">Giới Tính:</label>
                <select id="gender">
                    <option value="male" selected>Nam</option>
                    <option value="female">Nữ</option>
                    <option value="other">Khác</option>
                </select><br>
                <label for="language">Ngôn Ngữ:</label>
                <input type="text" id="language" value="Việt Nam"><br>
            </div>

         	  <div class="skills">
                <h2 class="section-title">Học Vấn</h2>
                <input type="text" value="Icon Design"><br>
            </div>
             <div class="skills">
                <h2 class="section-title">Chứng Chỉ</h2>
                <input type="text" value="Icon Design"><br>
            </div>
        </div>

        <!-- Right Column -->
        <div class="right-column">
            <div class="personal-info">
                <h1 contenteditable="true">OLIVIA WILSON</h1>
                <h2 contenteditable="true">GRAPHIC DESIGNER</h2>
                <textarea rows="4" cols="50" placeholder="Write a personal summary here...">I am a fun, hard-working creative who strives for excellence in everything I do. I’m an avid learner and seek to enhance the lives of everyone around me.</textarea>
            </div>

            <h2 class="section-title">Dự Án Đã Tham Gia</h2>
            <ul>
                <li>
                    <input type="text" value="Really Great University">
                    <input type="text" value="Master in Product Design">
                    <input type="text" value="2010 - 2013">
                </li>
                <li>
                    <input type="text" value="Really Great University">
                    <input type="text" value="Bachelor Degree in Digital Analysis">
                    <input type="text" value="2008 - 2010">
                </li>
                <li>
                    <input type="text" value="Really Great University">
                    <input type="text" value="Bachelor in Graphic Design">
                    <input type="text" value="2006 - 2008">
                </li>
            </ul>
        </div>
    </div>
    
    <script>
function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function() {
        var output = document.getElementById('profileImage');
        output.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
}
</script>
</body>
</html>