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
<link rel="stylesheet" href="/css/cv6.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>

	<%@ include file="/views/chat.jsp"%>
	<!-- header -->

	<div class="containerr" id="cv-content">
    <div class="header">
        <input type="file" id="profile-pic-input" class="profile-pic"
            title="Upload profile picture" /> <img id="profile-pic-preview"
            class="profile-pic" style="display: none;" />

        <div>
            <h1 contenteditable="true">Olivia Wilson</h1>
            <h5 contenteditable="true">Marketing Manager</h5>
            <div>
                <input class="hidden-input" type="tel"
                    placeholder="Enter Phone Number" value="+123 456 7890"> <input
                    class="hidden-input" type="email" placeholder="Email"
                    value="olivia@email.com"> <input class="hidden-input"
                    type="date" value="https://www.oliviaportfolio.com"> <input
                    class="hidden-input" type="text" placeholder="Gender"
                    value="Gender">
            </div>
        </div>
    </div>

    <div class="content">
        <div class="left-column" id="sortable-left">
            <div class="section">
                <h3 class="section-title">Education</h3>
                <ul id="education-list">
                    <li><input class="hidden-input" type="text"
                        placeholder="School"> <input class="hidden-input"
                        type="text" placeholder="Major"> <input
                        class="hidden-input" type="text" placeholder="Time">
                        <button class="add-button" onclick="addEducation()">Add</button>
                    </li>
                </ul>

            </div>

            <!-- Languages -->
            <div class="section">
                <h3 class="section-title">Languages</h3>
                <ul id="languages-list">
                    <li><input class="hidden-input" type="text"
                        placeholder="Language">
                        <button class="add-button" onclick="addLanguage()">Add</button></li>

                </ul>

            </div>

            <!-- Hobbies -->
            <div class="section">
                <h3 class="section-title">Hobbies</h3>
                <ul id="hobbies-list">
                    <li><input class="hidden-input" type="text"
                        placeholder="Hobby">
                        <button class="add-button" onclick="addHobby()">Add</button></li>
                </ul>

            </div>
            <div class="section">
                <h3 class="section-title">Skills</h3>
                <ul id="skills-list">
                    <li><input class="hidden-input" type="text"
                        placeholder="Skill">
                        <button class="add-button" onclick="addSkill()">Add</button></li>
                </ul>

            </div>
        </div>

        <div class="right-column" id="sortable-right">
            <div class="section">
                <h3 class="section-title">Career Objective</h3>
                <textarea class="hidden-input"
                    placeholder="I am a creative, hardworking person, always striving for excellence in everything I do. I am eager to learn and always look for ways to improve the lives of those around me."
                    rows="4" style="width: 100%;"></textarea>
            </div>

            <!-- Projects -->
            <div class="section">
                <h3 class="section-title">Projects Involved</h3>
                <ul id="experience-list">
                    <li><input class="hidden-input project-name" type="text"
                        placeholder="Project Name"> <input class="hidden-input"
                        type="text" placeholder="Time"> <textarea
                            class="hidden-input" placeholder="Description" rows="4"
                            style="width: 100%;"></textarea>
                        <button class="add-button" onclick="addExperience()">Add</button></li>
                </ul>

            </div>
        </div>
    </div>
</div>
<div class="button-container">
    <!-- <button class="save-button" type="button">Save CV</button> -->
    <button class="download-button" type="button"
        onclick="downloadCVAsPDF()">Download CV as PDF</button>
</div>
<br>
<!-- footer -->
<%@ include file="/views/footer.jsp"%>
<!-- footer -->
<script>
function addEducation() {
    const educationList = document.getElementById('education-list');
    const newEducation = document.createElement('li');
    newEducation.innerHTML = `
        <input class="hidden-input" type="text" placeholder="School">
        <input class="hidden-input" type="text" placeholder="Major">
        <input class="hidden-input" type="text" placeholder="Time">
    `;
    educationList.insertBefore(newEducation, educationList.firstChild); // Add to the top of the list
}

function addLanguage() {
    const languageList = document.getElementById('languages-list');
    const newLanguage = document.createElement('li');
    newLanguage.innerHTML = `
        <input class="hidden-input" type="text" placeholder="Language">
        
    `;
    languageList.insertBefore(newLanguage, languageList.firstChild); // Add to the top of the list
}

function addHobby() {
    const hobbyList = document.getElementById('hobbies-list');
    const newHobby = document.createElement('li');
    newHobby.innerHTML = '<input class="hidden-input" type="text" placeholder="Hobby">';
    hobbyList.insertBefore(newHobby, hobbyList.firstChild); // Add to the top of the list
}

function addSkill() {
    const skillList = document.getElementById('skills-list');
    const newSkill = document.createElement('li');
    newSkill.innerHTML = '<input class="hidden-input" type="text" placeholder="Skill">';
    skillList.insertBefore(newSkill, skillList.firstChild); // Add to the top of the list
}

function addExperience() {
    const experienceList = document.getElementById('experience-list');
    const newExperience = document.createElement('li');
    newExperience.innerHTML = `
        <input class="hidden-input project-name" type="text" placeholder="Project Name">
        <input class="hidden-input" type="text" placeholder="Time">
        <textarea class="hidden-input" placeholder="Description" rows="4" style="width: 100%;"></textarea>
    `;
    experienceList.insertBefore(newExperience, experienceList.firstChild); // Add to the top of the list
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
	<script>
		// Hàm tự động thay đổi chiều cao
		function autoResizeTextarea(textarea) {
		  textarea.style.height = 'auto'; // Đặt chiều cao về auto để tính lại kích thước
		  textarea.style.height = textarea.scrollHeight + 'px'; // Gán chiều cao bằng chiều cao nội dung
		}
		
		// Gắn sự kiện cho textarea
		document.querySelectorAll('textarea').forEach((textarea) => {
		  textarea.addEventListener('input', function () {
		    autoResizeTextarea(this);
		  });
		
		  // Gọi hàm ngay khi tải trang (để điều chỉnh nếu có dữ liệu sẵn)
		  autoResizeTextarea(textarea);
		});
	</script>
	<script>
	// Enable drag-and-drop functionality for sections in both columns
		document.addEventListener("DOMContentLoaded", function() {
			// Enable dragging within left column
			new Sortable(document.getElementById("sortable-left"), {
				animation : 150,
				group : "shared",
				draggable : ".section",
				handle : ".section-title",
				ghostClass : "sortable-ghost"
			});

			// Enable dragging within right column
			new Sortable(document.getElementById("sortable-right"), {
				animation : 150,
				group : "shared",
				draggable : ".section",
				handle : ".section-title",
				ghostClass : "sortable-ghost"
			});
		});
		</script>
	<script>
		document.getElementById('profile-pic-input').addEventListener('change', function(event) {
    const file = event.target.files[0];
    const preview = document.getElementById('profile-pic-preview');
    const input = document.getElementById('profile-pic-input');

    if (file) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            preview.style.display = 'block'; // Hiển thị ảnh preview
            preview.src = e.target.result; // Đặt nguồn cho ảnh preview
            input.style.display = 'none'; // Ẩn nút chọn ảnh
        }

        reader.readAsDataURL(file); // Đọc ảnh đã chọn
    }
});
		</script>
</body>
</html>