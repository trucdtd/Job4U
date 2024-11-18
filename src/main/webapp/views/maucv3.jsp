<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <!-- Bootstrap Icons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Sortable.js -->
    <script src="https://cdn.jsdelivr.net/npm/sortablejs@1.14.0/Sortable.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
            min-height: 100vh;
            background-color: #f4f4f9;
        }

        .resume-container {
            display: flex;
            width: 800px;
            border: 1px solid #e0e0e0;
            background-color: white;
            margin: auto;
            flex-grow: 1;
        }

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

        .section {
            margin-bottom: 20px;
        }

        .photo-frame {
            width: 150px;
            height: 200px;
            margin: auto;
            overflow: hidden;
            border: 2px solid #4d5c4b;
            border-radius: 8px;
            background-color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .photo-frame img {
            max-width: 100%;
            max-height: 100%;
            object-fit: scale-down;
            cursor: pointer;
        }

        h1, h2 {
            font-size: 24px;
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

        input[type="text"], input[type="email"], input[type="tel"], input[type="date"], select, textarea {
            width: 100%;
            max-width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .input-group input[type="text"] {
            flex: 1;
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .input-group button {
            padding: 6px 12px;
            background-color: #4d5c4b;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .input-group button:hover {
            background-color: #3b4b3b;
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
    <br>

    <div class="resume-container">
        <!-- Left Column -->
        <div class="left-column" id="sortable-left">
            <div class="section">
                <div class="photo-frame">
                    <input type="file" accept="image/*" onchange="previewImage(event)">
                    <img id="profileImage" src="profile.jpg" alt="Profile Image">
                </div>
            </div>
            <div class="section">
                <div class="contact-info">
                    <h2 class="section-title">Thông Tin</h2>
                    <label for="email">Email:</label>
                    <input type="email" id="email" value="hello@reallygreatsite.com">
                    <label for="phone">Phone:</label>
                    <input type="tel" id="phone" value="+1 234 567 8910">
                    <label for="dob">Ngày Sinh:</label>
                    <input type="date" id="dob" value="2004-09-28">
                    <label for="gender">Giới Tính:</label>
                    <select id="gender">
                        <option value="male" selected>Nam</option>
                        <option value="female">Nữ</option>
                        <option value="other">Khác</option>
                    </select>
                    <label for="language">Ngôn Ngữ:</label>
                    <input type="text" id="language" value="Việt Nam">
                </div>
            </div>

            <div class="section" id="educationSection">
                <h2 class="section-title">Học Vấn</h2>
                <div class="input-group">
                    <input type="text" placeholder="Nhập học vấn">
                </div>
                <button type="button" onclick="addEducationField()">+ Thêm Học Vấn</button>
            </div>

            <div class="section" id="certificateSection">
                <h2 class="section-title">Chứng Chỉ</h2>
                <div class="input-group">
                    <input type="text" placeholder="Nhập chứng chỉ">
                </div>
                <button type="button" onclick="addCertificateField()">+ Thêm Chứng Chỉ</button>
            </div>
        </div>

        <!-- Right Column -->
        <div class="right-column" id="sortable-right">
            <div class="section">
                <div class="personal-info">
                    <h1 contenteditable="true">OLIVIA WILSON</h1>
                    <textarea rows="4" cols="50" placeholder="Write a personal summary here...">I am a fun, hard-working creative who strives for excellence in everything I do. I’m an avid learner and seek to enhance the lives of everyone around me.</textarea>
                </div>
            </div>

            <div class="section" id="experienceSection">
                <h2 class="section-title">Kinh Nghiệm</h2>
                <div class="input-group">
                    <input type="text" placeholder="Nhập kinh nghiệm">
                </div>
                <button type="button" onclick="addExperienceField()">+ Thêm Kinh Nghiệm</button>
            </div>

            <div class="section" id="projectSection">
                <h2 class="section-title">Dự Án Đã Tham Gia</h2>
                <div class="input-group">
                    <input type="text" placeholder="Nhập thời gian">
                    <input type="text" placeholder="Tên dự án">
                    <textarea placeholder="Mô tả dự án..."></textarea>
                </div>
                <button type="button" onclick="addProjectField()">+ Thêm Dự Án</button>
            </div>

            <div class="section" id="hobbiesSection">
                <h2 class="section-title">Sở Thích</h2>
                <div class="input-group">
                    <input type="text" placeholder="Sở Thích">
                </div>
                <button type="button" onclick="addHobbiesField()">+ Thêm Sở Thích</button>
            </div>
        </div>
    </div>

    <br>
    <!-- footer -->
    <%@ include file="/views/footer.jsp"%>
    <!-- footer -->

    <script>
        // Image preview function
        document.getElementById("profileImage").addEventListener("click", function () {
            document.querySelector(".photo-frame input[type='file']").click();
        });

        function previewImage(event) {
            const file = event.target.files[0];
            if (file && file.type.startsWith("image/")) {
                const reader = new FileReader();
                reader.onload = function () {
                    document.getElementById("profileImage").src = reader.result;
                };
                reader.readAsDataURL(file);
            }
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

        // Add new fields (education, certificate, experience, etc.)
        function addEducationField() {
            var section = document.createElement("div");
            section.classList.add("input-group");
            section.innerHTML = '<input type="text" placeholder="Nhập học vấn">';
            document.getElementById("educationSection").appendChild(section);
        }

        function addCertificateField() {
            var section = document.createElement("div");
            section.classList.add("input-group");
            section.innerHTML = '<input type="text" placeholder="Nhập chứng chỉ">';
            document.getElementById("certificateSection").appendChild(section);
        }

        function addExperienceField() {
            var section = document.createElement("div");
            section.classList.add("input-group");
            section.innerHTML = '<input type="text" placeholder="Nhập kinh nghiệm">';
            document.getElementById("experienceSection").appendChild(section);
        }

        function addProjectField() {
            var section = document.createElement("div");
            section.classList.add("input-group");
            section.innerHTML = '<input type="text" placeholder="Tên dự án"><textarea placeholder="Mô tả dự án..."></textarea>';
            document.getElementById("projectSection").appendChild(section);
        }

        function addHobbiesField() {
            var section = document.createElement("div");
            section.classList.add("input-group");
            section.innerHTML = '<input type="text" placeholder="Sở Thích">';
            document.getElementById("hobbiesSection").appendChild(section);
        }
    </script>
</body>
</html>
