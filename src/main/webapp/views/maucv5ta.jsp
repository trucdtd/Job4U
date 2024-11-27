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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!-- html2pdf Library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<link rel="stylesheet" href="/css/cv5.css">
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	
	<%@ include file="/views/chat.jsp"%>
	<!-- header -->
	<div class="cv-container" id="cv-content">
    <!-- Left Panel -->
    <div class="left-panel" id="sortable-left">
        <div class="image-container">
            <input type="file" id="profileImage" accept="image/*" onchange="previewImage(event)" class="image-input">
            <img id="profilePreview" src="https://via.placeholder.com/150" alt="Profile Picture" class="img-fluid rounded-circle" width="150" height="150">
        </div>
        <div class="section" class="contact-info">
            <h3 class="section-title">Contact</h3>
            <input class="hidden-input" type="text" name="phone" placeholder="Phone Number">
            <input class="hidden-input" type="email" name="email" placeholder="Email">
            <input type="text" class="hidden-input" name="address" placeholder="Address">
            <select class="hidden-input" name="gender">
                <option value="" disabled selected>Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <input class="hidden-input" type="text" name="language" placeholder="Language">
        </div>
        <div class="section" class="skill" id="skills-section">
            <h3 class="section-title">Skills</h3>
            <div id="skills-list">
                <div class="input-group">
                    <input class="hidden-input" type="text" name="skills[]" placeholder="Enter Skills">
                </div>
            </div>
            <button type="button" class="add-button" onclick="addSkill()">Add Skill</button>
        </div>

        <div class="section" class="certification" id="certifications-section">
            <h3 class="section-title">Certifications</h3>
            <div id="certifications-list">
                <div class="input-group">
                    <input class="hidden-input" type="text" name="certification[]" placeholder="Enter Certification">
                </div>
            </div>
            <button type="button" class="add-button" onclick="addCertification()">Add Certification</button>
        </div>
    </div>

    <!-- Right Panel -->
    <div class="right-panel" id="sortable-right">
        <div class="personal-info">
            <h2 contenteditable="true">OLIVIA WILSON</h2>
            <h4 contenteditable="true">Marketing Manager</h4>
            <textarea class="hidden-input" name="career-objective" placeholder="I am a creative, hardworking person who always strives for excellence in everything I do. I am eager to learn and always find ways to improve the lives of those around me." required></textarea>
        </div>
         <div class="section" id="education-section">
            <h3 class="section-title">Education</h3>
            <div id="education-list">
                <div class="input-group">
                    <input class="hidden-input" type="text" name="education[]" placeholder="Enter Education">
                </div>
            </div>
            <button type="button" class="add-button" onclick="addEducation()">Add Education</button>
        </div>
        <div class="section" id="projects-section">
            <h3 class="section-title">Projects</h3>
            <div id="projects-list">
                <div class="input-group">
                    <input class="hidden-input project-name" type="text" name="project_name[]" placeholder="Project Name">
                    <input class="hidden-input" type="text" name="project_time[]" placeholder="Time Period">
                    <textarea class="hidden-input" name="project_description[]" placeholder="Project Description" rows="3"></textarea>
                </div>
            </div>
            <button type="button" class="add-button" onclick="addProject()">Add Project</button>
        </div>
        <div class="section" id="hobbies-section">
            <h3 class="section-title">Hobbies</h3>
            <div id="hobbies-list">
                <div class="input-group">
                    <input class="hidden-input" type="text" name="hobbies[]" placeholder="Enter Hobbies">
                </div>
            </div>
            <button type="button" class="add-button" onclick="addHobby()">Add Hobby</button>
        </div>
    </div>
</div>
<div class="button-container">
    <!-- <button class="save-button" type="button">Save CV</button> -->
    <button class="download-button" type="button" onclick="downloadCVAsPDF()">Download CV as PDF</button>
</div>
<!-- footer -->
<%@ include file="/views/footer.jsp"%>
<!-- footer -->

<script>
    function addSkill() {
        let skillList = document.getElementById('skills-list');
        let newSkill = document.createElement('div');
        newSkill.classList.add('input-group');
        newSkill.innerHTML = '<input class="hidden-input" type="text" name="skills[]" placeholder="Enter Skills">';
        skillList.appendChild(newSkill);
    }

    function addCertification() {
        let certificationList = document.getElementById('certifications-list');
        let newCertification = document.createElement('div');
        newCertification.classList.add('input-group');
        newCertification.innerHTML = '<input class="hidden-input" type="text" name="certification[]" placeholder="Enter Certification">';
        certificationList.appendChild(newCertification);
    }

    function addEducation() {
        let educationList = document.getElementById('education-list');
        let newEducation = document.createElement('div');
        newEducation.classList.add('input-group');
        newEducation.innerHTML = '<input class="hidden-input" type="text" name="education[]" placeholder="Enter Education">';
        educationList.appendChild(newEducation);
    }
    
    function addProject() {
        let projectList = document.getElementById('projects-list');
        let newProject = document.createElement('div');
        newProject.classList.add('input-group');
        newProject.innerHTML = `
            <input class="hidden-input project-name" type="text" name="project_name[]" placeholder="Project Name">
            <input class="hidden-input" type="text" name="project_time[]" placeholder="Time Period">
            <textarea class="hidden-input" name="project_description[]" placeholder="Project Description" rows="3"></textarea>
        `;
        projectList.appendChild(newProject);
    }

    function addHobby() {
        let hobbyList = document.getElementById('hobbies-list');
        let newHobby = document.createElement('div');
        newHobby.classList.add('input-group');
        newHobby.innerHTML = '<input class="hidden-input" type="text" name="hobbies[]" placeholder="Enter Hobbies">';
        hobbyList.appendChild(newHobby);
    }
    
    document.addEventListener("DOMContentLoaded", function() {
        // Allow dragging in the left column
        new Sortable(document.getElementById("sortable-left"), {
            animation: 150,
            group: "shared",  // Option: Allow dragging between columns
            draggable: ".section",  // Items that can be dragged have the .section class
            handle: ".section-title",  // Drag by the section title
            ghostClass: "sortable-ghost"  // Add a class to the item being dragged
        });

        // Allow dragging in the right column
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
</body>
</html>