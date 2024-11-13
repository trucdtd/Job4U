<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mẫu CV 4</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
        display: flex;
        justify-content: center;
        flex-direction: column;
        min-height: 100vh;
    }
    .containerr {
        width: 800px;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        flex-grow: 1;
        margin-left: 357px;
    }
    .header {
        display: flex;
        align-items: center;
        background-color: #e0e5ec;
        padding: 15px;
        justify-content: center;
        height: 120px;
        border-radius: 10px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        margin: 7px 20px;
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
    .main-content {
        display: flex;
        flex-direction: row;
        padding: 20px;
    }
    .left-column {
        width: 30%;
        background-color: #e0e5ec;
        padding: 20px;
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
    .right-column {
        width: 70%;
        padding: 20px;
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
    input, textarea, select {
        width: 100%;
        padding: 8px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    select:focus {
        outline: none;
    }
    button {
        padding: 8px 15px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <div class="containerr">
        <div class="header">
            <img src="your-image-url.jpg" alt="Donna Stroupe" class="profile-photo">
            <div class="header-info">
               <h1 contenteditable="true">OLIVIA WILSON</h1>
            </div>
        </div>

        <div class="main-content">
            <div class="left-column">
                <div class="left-content">
                    <h2>Liên Hệ</h2>
                    <form id="contact-form">
                        <label>Email:</label>
                        <input type="email" name="email" required>
                        <label>Điện Thoại:</label>
                        <input type="text" name="phone" required>
                        <label>Ngày Sinh:</label>
                        <input type="date" name="dob" required>
                        <label for="gender">Giới Tính:</label>
                        <select name="gender" id="gender" required>
                            <option value="nam">Nam</option>
                            <option value="nu">Nữ</option>
                        </select>
                        <label>Quốc Tịch:</label>
                        <input type="text" name="nationality" required>

                        <h2>Kỹ Năng</h2>
                        <div id="skills">
                            <input type="text" name="skills[]" placeholder="Thêm kỹ năng" required>
                        </div>
                        <button type="button" onclick="addSkill()">Thêm kỹ năng</button>

                        <h2>Chứng Chỉ</h2>
                        <div id="certificates">
                            <input type="text" name="certificates[]" placeholder="Thêm chứng chỉ" required>
                        </div>
                        <button type="button" onclick="addCertificate()">Thêm chứng chỉ</button>
                    </form>
                </div>
            </div>

            <div class="right-column">
                <div class="section">
                    <h2>Mục Tiêu Nghề Nghiệp</h2>
                    <textarea name="career-objective" placeholder="Mục tiêu nghề nghiệp của bạn..." required></textarea>
                </div>

                <div class="section">
                    <h2>Học Vấn</h2>
                    <div id="education">
                        <input type="text" name="education[]" placeholder="Thêm học vấn" required>
                    </div>
                    <button type="button" onclick="addEducation()">Thêm học vấn</button>
                </div>

                <div class="section experience">
                    <h2>Kinh Nghiệm Làm Việc</h2>
                    <div id="experience">
                        <input type="text" name="experience[]" placeholder="Tên Dự Án" required>
                        <input type="text" name="experience[]" placeholder="Thời Gian" required>
                        <textarea name="career-objective" placeholder="Mô Tả" required></textarea>
                    </div>
                    <button type="button" onclick="addExperience()">Thêm công việc</button>
                </div>

                <div class="section">
                    <h2>Sở Thích</h2>
                    <div id="hobbies">
                        <input type="text" name="hobbies[]" placeholder="Thêm sở thích" required>
                    </div>
                    <button type="button" onclick="addHobby()">Thêm sở thích</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function addSkill() {
            let skillsDiv = document.getElementById("skills");
            let input = document.createElement("input");
            input.type = "text";
            input.name = "skills[]";
            input.placeholder = "Thêm kỹ năng";
            skillsDiv.appendChild(input);
        }

        function addCertificate() {
            let certificatesDiv = document.getElementById("certificates");
            let input = document.createElement("input");
            input.type = "text";
            input.name = "certificates[]";
            input.placeholder = "Thêm chứng chỉ";
            certificatesDiv.appendChild(input);
        }

        function addEducation() {
            let educationDiv = document.getElementById("education");
            let input = document.createElement("input");
            input.type = "text";
            input.name = "education[]";
            input.placeholder = "Thêm học vấn";
            educationDiv.appendChild(input);
        }

        function addExperience() {
            let experienceDiv = document.getElementById("experience");
            let experienceContainer = document.createElement("div");
            experienceContainer.classList.add("experience-container");

            let projectNameInput = document.createElement("input");
            projectNameInput.type = "text";
            projectNameInput.name = "experience[]";
            projectNameInput.placeholder = "Tên Dự Án";
            experienceContainer.appendChild(projectNameInput);

            let timeInput = document.createElement("input");
            timeInput.type = "text";
            timeInput.name = "experience[]";
            timeInput.placeholder = "Thời Gian";
            experienceContainer.appendChild(timeInput);

            let descriptionTextarea = document.createElement("textarea");
            descriptionTextarea.name = "experience[]";
            descriptionTextarea.placeholder = "Mô Tả";
            experienceContainer.appendChild(descriptionTextarea);

            experienceDiv.appendChild(experienceContainer);
        }

        function addHobby() {
            let hobbiesDiv = document.getElementById("hobbies");
            let input = document.createElement("input");
            input.type = "text";
            input.name = "hobbies[]";
            input.placeholder = "Thêm sở thích";
            hobbiesDiv.appendChild(input);
        }
    </script>
</body>
</html>