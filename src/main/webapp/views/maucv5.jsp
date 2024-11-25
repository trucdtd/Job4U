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
<script
	src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!-- html2pdf Library -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f7f7f7;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.cv-container {
	width: 800px;
	background: white;
	display: flex;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	font-size: 16px;
	margin: 20px auto;
}

.personal-info {
	background-color: #f0e9e6;
	padding: 20px;
	margin-bottom: 20px;
}

.personal-info h2 {
	font-size: 28px;
	font-weight: bold;
}

.personal-info h4 {
	font-size: 18px;
	font-weight: 600;
}

.left-panel {
	width: 30%;
	background: #b48b7f;
	padding: 30px;
	color: #333;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.image-container {
	position: relative;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	overflow: hidden;
	margin-bottom: 20px;
}

/* The input to select the file, styled to fit within the circular image */
.image-input {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0; /* Hide the file input */
	cursor: pointer;
}

/* Profile image preview */
#profilePreview {
	width: 100%;
	height: 100%;
	object-fit: cover; /* Makes sure the image covers the entire circle */
	border-radius: 50%; /* Keeps the image round */
}

.right-panel {
	padding: 0px 20px;
	width: 70%;
}

textarea {
	width: 100%;
	padding: 10px;
	overflow: hidden;
	resize: none; /* Tắt tính năng thay đổi kích thước */
}

h3 {
	font-size: 20px;
	margin: 25px 0 15px 0;
	text-transform: uppercase;
	letter-spacing: 1px;
	border-bottom: 2px solid #ccc;
	padding-bottom: 5px;
}

.section {
	margin-bottom: 25px;
}

input, select {
	width: 100%;
	padding: 8px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
	box-sizing: border-box;
}

select {
	background-color: white;
	color: #555;
	appearance: none;
}

select:focus {
	outline: none;
	border-color: #66afe9;
	box-shadow: 0 0 8px rgba(102, 175, 233, 0.6);
}

.button-container {
    display: flex; /* Aligns buttons horizontally */
    justify-content: center; /* Centers buttons */
    gap: 10px; /* Adds space between buttons */
    margin-top: 20px;
}

.download-button {
    background-color: #4CAF50; /* Green background */
    color: white; /* White text */
    border: none; /* Remove border */
    padding: 10px 20px; /* Add padding */
    font-size: 14px; /* Adjust font size */
    cursor: pointer; /* Pointer cursor on hover */
    border-radius: 4px; /* Rounded corners */
    transition: background-color 0.3s; /* Smooth transition on hover */
}
.hidden-input {
  border: none;
  outline: none;
  background: none;
  color: inherit;

  /* Khi hover vào */
  &:hover {
    border: 1px dashed #45a049; /* Thay đổi màu và độ dày viền theo ý muốn */
  }
}
/* Initially hide the Add button */
.add-button {
    display: none;
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
    margin-top: 10px;
    border-radius: 4px;
}

/* Show the Add button when hovering over the section */
#education-section:hover .add-button,
#skills-section:hover .add-button,
#certifications-section:hover .add-button,
#projects-section:hover .add-button,
#hobbies-section:hover .add-button {
    display: block;
}
.project-name {
    
    font-weight: bold; /* Chữ đậm hơn */
    
}
</style>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<div class="cv-container" id="cv-content">
    <!-- Left Panel -->
    <div class="left-panel" id="sortable-left">
        <div class="image-container">
            <input type="file" id="profileImage" accept="image/*" onchange="previewImage(event)" class="image-input">
            <img id="profilePreview" src="https://via.placeholder.com/150" alt="Profile Picture" class="img-fluid rounded-circle" width="150" height="150">
        </div>
        <div class="section" class="contact-info">
            <h3 class="section-title">Liên Hệ</h3>
            <input class="hidden-input" type="text" name="phone" placeholder="Phone Number">
            <input class="hidden-input" type="email" name="email" placeholder="Email">
            <input type="text" class="hidden-input" name="address" placeholder="Address">
            <select class="hidden-input" name="gender">
                <option value="" disabled selected>Giới Tính</option>
                <option value="male">Nam</option>
                <option value="female">Nữ</option>
                <option value="other">Khác</option>
            </select>
            <input class="hidden-input" type="text" name="language" placeholder="Ngôn Ngữ">
        </div>
        <div class="section" class="skill" id="skills-section">
            <h3 class="section-title">Kỹ Năng</h3>
            <div id="skills-list">
                <div class="input-group">
                    <input class="hidden-input" type="text" name="skills[]" placeholder="Nhập Kỹ Năng">
                </div>
            </div>
            <button type="button" class="add-button" onclick="addSkill()">Thêm Kỹ Năng</button>
        </div>

        <div class="section" class="certification" id="certifications-section">
            <h3 class="section-title">Chứng Chỉ</h3>
            <div id="certifications-list">
                <div class="input-group">
                    <input class="hidden-input" type="text" name="certification[]" placeholder="Nhập Chứng Chỉ">
                </div>
            </div>
            <button type="button" class="add-button" onclick="addCertification()">Thêm Chứng Chỉ</button>
        </div>
    </div>

    <!-- Right Panel -->
    <div class="right-panel" id="sortable-right">
        <div class="personal-info">
            <h2 contenteditable="true">NGUYỄN VĂN A</h2>
            <h4 contenteditable="true">Quản Lý Tiếp Thị</h4>
            <textarea class="hidden-input" name="career-objective" placeholder="Career Objective" required></textarea>
        </div>
         <div class="section" id="education-section">
            <h3 class="section-title">Học Vấn</h3>
            <div id="education-list">
                <div class="input-group">
                    <input class="hidden-input" type="text" name="education[]" placeholder="Nhập Học Vấn">
                </div>
            </div>
            <button type="button" class="add-button" onclick="addEducation()">Thêm Học Vấn</button>
        </div>
        <div class="section" id="projects-section">
            <h3 class="section-title">Dự Án Đã Tham Gia</h3>
            <div id="projects-list">
                <div class="input-group">
                    <input class="hidden-input project-name" type="text" name="project_name[]" placeholder="Tên Dự Án">
                    <input class="hidden-input" type="text" name="project_time[]" placeholder="Thời Gian">
                    <textarea class="hidden-input" name="project_description[]" placeholder="Mô Tả Dự Án" rows="3"></textarea>
                </div>
            </div>
            <button type="button" class="add-button" onclick="addProject()">Thêm Dự Án</button>
        </div>
        <div class="section" id="hobbies-section">
            <h3 class="section-title">Sở Thích</h3>
            <div id="hobbies-list">
                <div class="input-group">
                    <input class="hidden-input" type="text" name="hobbies[]" placeholder="Nhập Sỏ Thích">
                </div>
            </div>
            <button type="button" class="add-button" onclick="addHobby()">Thêm Sở Thích</button>
        </div>
    </div>
</div>
	<div class="button-container">
		<!-- <button class="save-button" type="button">Lưu CV</button> -->
		<button class="download-button" type="button"
			onclick="downloadCVAsPDF()">Tải CV Dưới Dạng PDF</button>
	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->

<script>
    function addSkill() {
        let skillList = document.getElementById('skills-list');
        let newSkill = document.createElement('div');
        newSkill.classList.add('input-group');
        newSkill.innerHTML = '<input class="hidden-input" type="text" name="skills[]" placeholder="Nhập Kỹ Năng">';
        skillList.appendChild(newSkill);
    }

    function addCertification() {
        let certificationList = document.getElementById('certifications-list');
        let newCertification = document.createElement('div');
        newCertification.classList.add('input-group');
        newCertification.innerHTML = '<input class="hidden-input" type="text" name="certification[]" placeholder="Nhập Chứng Chỉ">';
        certificationList.appendChild(newCertification);
    }

    function addEducation() {
        let educationList = document.getElementById('education-list');
        let newEducation = document.createElement('div');
        newEducation.classList.add('input-group');
        newEducation.innerHTML = '<input class="hidden-input" type="text" name="education[]" placeholder="Nhập Học Vấn">';
        educationList.appendChild(newEducation);
    }
    
    function addProject() {
        let projectList = document.getElementById('projects-list');
        let newProject = document.createElement('div');
        newProject.classList.add('input-group');
        newProject.innerHTML = `
            <input class="hidden-input project-name" type="text" name="project_name[]" placeholder="Tên Dự Án">
            <input class="hidden-input" type="text" name="project_time[]" placeholder="Thời Gian">
            <textarea class="hidden-input" name="project_description[]" placeholder="Mô Tả Dự Án" rows="3"></textarea>
        `;
        projectList.appendChild(newProject);
    }

    function addHobby() {
        let hobbyList = document.getElementById('hobbies-list');
        let newHobby = document.createElement('div');
        newHobby.classList.add('input-group');
        newHobby.innerHTML = '<input class="hidden-input" type="text" name="hobbies[]" placeholder="Nhập Sỏ Thích">';
        hobbyList.appendChild(newHobby);
    }
    
    document.addEventListener("DOMContentLoaded", function() {
        // Cho phép kéo-thả trong cột bên trái
        new Sortable(document.getElementById("sortable-left"), {
            animation: 150,
            group: "shared",  // Tùy chọn: Cho phép kéo-thả qua lại giữa các cột
            draggable: ".section",  // Các mục có thể kéo là những mục có lớp .section
            handle: ".section-title",  // Kéo bằng tiêu đề của phần
            ghostClass: "sortable-ghost"  // Thêm lớp cho phần tử đang kéo
        });

        // Cho phép kéo-thả trong cột bên phải
        new Sortable(document.getElementById("sortable-right"), {
            animation: 150,
            group: "shared",
            draggable: ".section",
            handle: ".section-title",
            ghostClass: "sortable-ghost"
        });
    });
</script>
	<script>
// Function to handle image preview after selection
function previewImage(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            const preview = document.getElementById('profilePreview');
            preview.src = e.target.result;  // Update the image source with the selected file
        };
        
        reader.readAsDataURL(file);  // Read the selected file as a data URL
    }
}
</script>
	<script>
	function downloadCVAsPDF() {
	    const { jsPDF } = window.jspdf;
	    const cvContent = document.getElementById('cv-content'); // Your CV container

	    // Ensure html2pdf is loaded correctly
	    const options = {
	        margin: [10, 10, 10, 10], // Set margins
	        filename: 'CV.pdf', // The filename of the PDF
	        html2canvas: { scale: 2 }, // Increase the scale for better quality
	        jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' } // Set PDF format
	    };

	    // Use html2pdf to convert HTML to PDF
	    html2pdf().from(cvContent).set(options).save();
	}
	</script>
</body>
</html>