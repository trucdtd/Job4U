<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mẫu CV 4</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 4px;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            flex-direction: column;
            min-height: 100vh;
        }
        .cv-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            font-family: 'Helvetica Neue', sans-serif;
            color: #444;
        }

        .header {
            display: flex;
            align-items: center;
            background-color: #e0e5ec;
            padding: 15px;
            justify-content: flex-start;
            height: 120px;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin: 7px 20px;
        }
.section-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin: 15px 0 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
	border-bottom: 2px solid #333;
	padding-bottom: 5px;
	width: 100%; /* Đặt chiều rộng bằng với phần chứa */
	text-align: center; /* Căn giữa văn bản */
}
        .profile-photo {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            margin-right: 15px;
            object-fit: cover;
            float: left;
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

        .main-content {
            display: flex;
            flex-direction: row;
            padding: 20px;
        }

        .left-column, .right-column {
            margin-top: -20px;
        }

        .left-column {
            width: 30%;
            background-color: #e0e5ec;
            padding: 20px;
            border-radius: 10px;
        }

        .right-column {
            width: 70%;
            padding: 20px;
            margin-top: -41px;
        }

        .section {
            margin-top: 20px;
            padding: 10px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
            margin: 10px 0 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 5px;
        }

        button:hover {
            background-color: #45a049;
        }

        .sortable-ghost {
            opacity: 0.4;
        }
        
        
    </style>
</head>
<body>

<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->

    <div class="container">
        <div class="cv-container" id="cv-content">
            <div class="header">
                <img src="your-image-url.jpg" alt="Donna Stroupe" class="profile-photo">
                <div class="header-info">
                    <h1 contenteditable="true">OLIVIA WILSON</h1>
                </div>
            </div>

            <div class="main-content">
                <!-- Left Column -->
                <div class="left-column" id="sortable-left">
                        <form id="contact-form">
                        <div class="section-title">Liên Hệ</div>
                            <label>Email:</label> <input type="email" name="email" required>
                            <label>Điện Thoại:</label> <input type="text" name="phone" required>
                            <label>Ngày Sinh:</label> <input type="date" name="dob" required>
                            <label for="gender">Giới Tính:</label> <select name="gender" id="gender" required>
                                <option value="nam">Nam</option>
                                <option value="nu">Nữ</option>
                            </select>
                            <label>Quốc Tịch:</label> <input type="text" name="nationality" required>
                        </form>

                        <div id="skills">
                         <div class="section-title">Kỹ Năng</div>
                            <input type="text" name="skills[]" placeholder="Thêm kỹ năng" required>
                            <button type="button" onclick="addSkill()">+ Thêm kỹ năng</button>
                        </div>

                        <div id="certificates">
             				<div class="section-title">Chứng Chỉ</div>
                            <input type="text" name="certificates[]" placeholder="Thêm chứng chỉ" required>
                            <button type="button" onclick="addCertificate()">+ Thêm chứng chỉ</button>
                        </div>
                        
                    </div>


                <!-- Right Column -->
                <div class="right-column" id="sortable-right">
                    <div class="section">
                        <div class="section-title">Mục Tiêu Nghề Nghiệp</div>
                        <textarea name="career-objective" placeholder="Mục tiêu nghề nghiệp của bạn..." required></textarea>
                    </div>

                    <div class="section" >
                        <div class="section-title">Học Vấn</div>
                        <div id="education">
                            <input type="text" name="education[]" placeholder="Thêm học vấn" required>
                        </div>
                        <button type="button" onclick="addEducation()">+ Thêm học vấn</button>
                    </div>

                    <div class="section" >
                        <div class="section-title">Kinh Nghiệm Làm Việc</div>
                        <div id="experience">
                            <input type="text" name="experience[]" placeholder="Tên Dự Án" required>
                            <input type="text" name="experience[]" placeholder="Thời Gian" required>
                            <textarea name="experience[]" placeholder="Mô Tả" required></textarea>
                        </div>
                        <button type="button" onclick="addExperience()">+ Thêm công việc</button>
                    </div>

                    <div class="section" >
                        <h2 class="section-title">Sở Thích</h2>
                        <div id="hobbies">
                            <input type="text" name="hobbies[]" placeholder="Thêm sở thích" required>
                        </div>
                        <button type="button" onclick="addHobby()">+ Thêm sở thích</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<br>
<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
    <script>
        // Add new skill input
        function addSkill() {
            let skillsDiv = document.getElementById("skills");
            let input = document.createElement("input");
            input.type = "text";
            input.name = "skills[]";
            input.placeholder = "Thêm kỹ năng";
            skillsDiv.appendChild(input);
        }

        // Add new certificate input
        function addCertificate() {
            let certificatesDiv = document.getElementById("certificates");
            let input = document.createElement("input");
            input.type = "text";
            input.name = "certificates[]";
            input.placeholder = "Thêm chứng chỉ";
            certificatesDiv.appendChild(input);
        }

        // Add new education input
        function addEducation() {
            let educationDiv = document.getElementById("education");
            let input = document.createElement("input");
            input.type = "text";
            input.name = "education[]";
            input.placeholder = "Thêm học vấn";
            educationDiv.appendChild(input);
        }

        // Add new experience input
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

        // Add new hobby input
        function addHobby() {
            let hobbiesDiv = document.getElementById("hobbies");
            let input = document.createElement("input");
            input.type = "text";
            input.name = "hobbies[]";
            input.placeholder = "Thêm sở thích";
            hobbiesDiv.appendChild(input);
        }

     // Enable drag-and-drop functionality for sections in both columns
        document.addEventListener("DOMContentLoaded", function () {
            // Enable dragging within left column
            new Sortable(document.getElementById("sortable-left"), {
                animation: 150,
                group: "shared",
                draggable: ".section",
                handle: ".section-title",
                ghostClass: "sortable-ghost"
            });

            // Enable dragging within right column
            new Sortable(document.getElementById("sortable-right"), {
                animation: 150,
                group: "shared",
                draggable: ".section",
                handle: ".section-title",
                ghostClass: "sortable-ghost"
            });
        });
    </script>
</body>
</html>
