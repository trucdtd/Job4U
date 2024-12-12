<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mẫu CV 1</title>
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
<link rel="stylesheet" href="/css/cv1.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<%@ include file="/views/chat.jsp"%>
	<!-- header -->
	<div class="container mt-4">
		<div class="cv-container" id="cv-content">
			<div class="left-column" id="sortable-left">
				<div class="profile-photo">
					<input type="file" id="profile-image" accept="image/*"
						style="display: none;" onchange="previewImage(event)"> <label
						for="profile-image" class="upload-label"> <img
						id="profile-img-preview" src="path/to/default-image.jpg"
						alt="Candidate Photo" class="cv-photo">
					</label>
				</div>
				<div class="contact section">
					<div class="section-title">Contact</div>
					<input class="hidden-input" type="text" class="input-field"
						placeholder="Phone Number" /> <input class="hidden-input"
						type="email" placeholder="Email" id="emailcv" class="input-field">
					<input class="hidden-input" type="date" placeholder="Date of Birth"
						id="dateOfbirth" class="input-field"> <input
						class="hidden-input" type="text" placeholder="Languages"
						id="languages" class="input-field"> <input
						class="hidden-input" type="text" placeholder="Gender" id="gender"
						class="input-field"> <input class="hidden-input"
						type="text" placeholder="Address" id="address" class="input-field">
				</div>
				<div class="skills section">
					<div class="section-title">Skills</div>
					<div id="skills-container">
						<input class="hidden-input" type="text" id="skills"
							class="input-field" placeholder="Skill">
						<button id="add-skill-button" class="add-button" type="button"
							onclick="addSkillField()">+ Add Skill</button>
					</div>
				</div>

				<div class="certifications section">
					<div class="section-title">Certifications</div>
					<div id="certifications-container">
						<input class="hidden-input" type="text" id="certifications"
							class="input-field" placeholder="Certification">
						<button id="add-certification-button" class="add-button"
							type="button" onclick="addCertificationField()">+ Add
							Certification</button>
					</div>
				</div>
			</div>

			<div class="right-column" id="sortable-right">
				<h1 contenteditable="true">OLIVIA WILSON</h1>
				<p contenteditable="true">Marketing Manager</p>
				<div class="experience section">
					<div class="section-title">Career Objective</div>
					<div id="experience-container">
						<textarea class="hidden-input" id="experience"
							placeholder="I am a creative, cheerful, hardworking person who always strives for excellence in everything I do. I am eager to learn and always look for ways to improve the lives of those around me."></textarea>
					</div>
				</div>

				<div class="education section">
					<div class="section-title">Education</div>
					<div id="education-container">
						<div class="education-field">
							<input class="hidden-input education-institution project-name"
								type="text" placeholder="Institution Name" /> <input
								class="hidden-input education-time" type="text"
								placeholder="Time Period" />
							<textarea class="hidden-input education-description"
								placeholder="Description"></textarea>
						</div>
						<button id="add-education-button" class="add-button" type="button"
							onclick="addEducationField()">+ Add Education</button>
					</div>
				</div>

				<div class="projects section">
					<div class="section-title">Projects</div>
					<div id="projects-container">
						<div class="project-field">
							<input class="hidden-input project-name" type="text"
								class="input-field" placeholder="Project Name"> <input
								class="hidden-input" type="text" class="input-field"
								placeholder="Time Period">
							<textarea class="hidden-input" class="input-area"
								placeholder="Description"></textarea>
						</div>
						<button id="add-project-button" class="add-button" type="button"
							onclick="addProjectField()">+ Add Project</button>
					</div>
				</div>
				<div class="hobbies section">
					<div class="section-title">Hobbies</div>
					<div id="hobbies-container">
						<input class="hidden-input" type="text" id="hobbies"
							class="input-field" placeholder="Hobby">
						<button id="add-hobbies-button" class="add-button" type="button"
							onclick="addHobbiesField()">+ Add Hobby</button>
					</div>
				</div>
			</div>
		</div>
		<div class="button-container">
			<!-- <button class="save-button" type="button">Save CV</button> -->
			<button class="download-button" type="button"
				onclick="downloadCVAsPDF()">Download CV as PDF</button>
		</div>
	</div>
	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script>
    function addSkillField() {
        const skillsContainer = document.getElementById('skills-container');
        const addSkillButton = document.getElementById('add-skill-button');
        
        const newField = document.createElement('input');
        
        newField.type = 'text';
        newField.className = 'input-field hidden-input';
        newField.placeholder = 'Skill';

        skillsContainer.insertBefore(newField, addSkillButton);
    }

    function addCertificationField() {
        const certificationsContainer = document.getElementById('certifications-container');
        const addCertificationButton = document.getElementById('add-certification-button');

        const newField = document.createElement('input');
        newField.type = 'text';
        newField.className = 'input-field hidden-input';
        newField.placeholder = 'Certification';

        certificationsContainer.insertBefore(newField, addCertificationButton);
    }

    function addHobbiesField() {
        const hobbiesContainer = document.getElementById('hobbies-container');
        const addHobbiesButton = document.getElementById('add-hobbies-button');

        const newField = document.createElement('input');
        newField.type = 'text';
        newField.className = 'input-field hidden-input';
        newField.placeholder = 'Hobby';

        hobbiesContainer.insertBefore(newField, addHobbiesButton);
    }

    function addProjectField() {
        const projectsContainer = document.getElementById('projects-container');
        const addProjectButton = document.getElementById('add-project-button');

        const newProjectField = document.createElement('div');
        newProjectField.classList.add('project-field');

        const projectName = document.createElement('input');
        projectName.type = 'text';
        projectName.className = 'input-field hidden-input project-name';
        projectName.placeholder = 'Project Name';

        const projectTime = document.createElement('input');
        projectTime.type = 'text';
        projectTime.className = 'input-field hidden-input';
        projectTime.placeholder = 'Time Period';

        const projectDescription = document.createElement('textarea');
        projectDescription.className = 'input-area hidden-input';
        projectDescription.placeholder = 'Description';

        newProjectField.appendChild(projectName);
        newProjectField.appendChild(projectTime);
        newProjectField.appendChild(projectDescription);

        projectsContainer.insertBefore(newProjectField, addProjectButton);
    }
    
    function addEducationField() {
        const educationContainer = document.getElementById('education-container');
        const addEducationButton = document.getElementById('add-education-button');

        const newEducationField = document.createElement('div');
        newEducationField.classList.add('education-field');

        const educationInstitution = document.createElement('input');
        educationInstitution.type = 'text';
        educationInstitution.className = 'input-field hidden-input education-institution project-name';
        educationInstitution.placeholder = 'Institution Name';

        const educationTime = document.createElement('input');
        educationTime.type = 'text';
        educationTime.className = 'input-field hidden-input education-time';
        educationTime.placeholder = 'Time Period';

        const educationDescription = document.createElement('textarea');
        educationDescription.className = 'input-area hidden-input education-description';
        educationDescription.placeholder = 'Description';

        newEducationField.appendChild(educationInstitution);
        newEducationField.appendChild(educationTime);
        newEducationField.appendChild(educationDescription);

        educationContainer.insertBefore(newEducationField, addEducationButton);
    }
    
    document.addEventListener("DOMContentLoaded", function() {
        // Enable drag-and-drop in the left column
        new Sortable(document.getElementById("sortable-left"), {
            animation: 150,
            group: "shared", // Option: Allow drag-and-drop between columns
            draggable: ".section", // Draggable items are those with the class .section
            handle: ".section-title", // Drag by the section title
            ghostClass: "sortable-ghost" // Add a class for the item being dragged
        });

        // Enable drag-and-drop in the right column
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
		function previewImage(event) {
			const reader = new FileReader();
			reader.onload = function() {
				const preview = document.getElementById('profile-img-preview');
				preview.src = reader.result; // Gán ảnh mới vào thẻ <img>
			};
			reader.readAsDataURL(event.target.files[0]); // Đọc ảnh dưới dạng URL
		}
	</script>
	<script>
	function downloadCVAsPDF() {
	    const { jsPDF } = window.jspdf;
	    const cvContent = document.getElementById('cv-content'); // Your CV container

	    // Ensure html2pdf is loaded correctly
	    const options = {
	    		margin: [2, 2, 2, 2], // Set margins
	        filename: 'CV.pdf', // The filename of the PDF
	        html2canvas: { scale: 2 }, // Increase the scale for better quality
	        jsPDF: { unit: 'mm', format: 'a1', orientation: 'portrait' } // Set PDF format
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
