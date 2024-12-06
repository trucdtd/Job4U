<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
	<link rel="stylesheet" href="/css/cv9.css">
</head>
<body>
	<!-- header -->
<%@ include file="/views/headerNoPanner.jsp"%>

<%@ include file="/views/chat.jsp"%>
<!-- header -->
<div class="containerr" id="cv-content">
    <!-- Title -->
    <div class="header">
        <h1 contenteditable="true">OLIVIA WILSON</h1>
        <h5 contenteditable="true">Marketing Manager</h5>
    </div>

    <!-- Content -->
    <div class="content">
        <!-- Left Column -->
        <div class="left-column" id="sortable-left">
            <!-- Contact Section -->
            <div class="section contact">
                <h2 class="section-title">Contact</h2>
                <input class="hidden-input" type="text" value="+123-456-7890" /> 
                <input class="hidden-input" type="text" value="richard@example.com" /> 
                <input class="hidden-input" type="text" value="123 Anywhere St, Any City" />
                <input class="hidden-input" type="text" value="Nam" />
            </div>

            <!-- Education Section -->
            <div class="section">
                <h2 class="section-title">Education</h2>
                <div class="education-container">
                    <div class="education-item">
                        <input class="hidden-input project-name" type="text" placeholder="University Name" value="Rockwell University" />
                        <input class="hidden-input" type="text" placeholder="Degree" value="Bachelor of Business Management" /> 
                        <input class="hidden-input" type="text" placeholder="Time Period" value="2021 - 2023" />
                    </div>
                    <button class="add-button" onclick="addEducation()">Add</button>
                </div>
            </div>

            <!-- Languages Section -->
            <div class="section">
                <h2 class="section-title">Languages</h2>
                <div class="language-container">
                    <div class="language-item">
                        <input class="hidden-input" type="text" value="English" />
                    </div>
                    <button class="add-button" onclick="addLanguage()">Add</button>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div class="right-column" id="sortable-right">
            <div class="section profile-summary">
                <h2 class="section-title">Profile Summary</h2>
                <textarea class="hidden-input">Experienced and detail-driven Marketing Manager with a proven track record in delivering creative and successful marketing strategies. Skilled in project management, team leadership, and campaign optimization to drive brand growth.</textarea>
            </div>

            <div class="section">
                <h2 class="section-title">Work Experience</h2>
                <div class="work-experience-container">
                    <input class="hidden-input project-name" type="text" placeholder="Project Name" value="Boostle Studio" /> 
                    <input class="hidden-input" type="text" placeholder="Time Period" value="2020 - Present" />
                    <textarea class="hidden-input" placeholder="Description"></textarea>
                </div>
                <button class="add-button" onclick="addWorkExperience()">Add</button>
            </div>

            <!-- Skills Section -->
            <div class="section">
                <h2 class="section-title">Skills</h2>
                <div class="skills-container">
                    <input class="hidden-input" type="text" value="Project Management" />
                </div>
                <button class="add-button" onclick="addSkill()">Add</button>
            </div>

            <!-- Hobbies Section -->
            <div class="section">
                <h2 class="section-title">Hobbies</h2>
                <div class="hobbies-container">
                    <input class="hidden-input" type="text" value="Hobby" />
                </div>
                <button class="add-button" onclick="addHobby()">Add</button>
            </div>
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
    function addWorkExperience() {
        const section = document.querySelector('.work-experience-container');
        
        const inputProject = document.createElement('input');
        inputProject.type = 'text';
        inputProject.placeholder = 'Project Name';
        inputProject.classList.add('hidden-input', 'project-name'); // Add hidden-input class

        const inputPeriod = document.createElement('input');
        inputPeriod.type = 'text';
        inputPeriod.placeholder = 'Time Period';
        inputPeriod.classList.add('hidden-input'); // Add hidden-input class

        const textarea = document.createElement('textarea');
        textarea.placeholder = 'Description';
        textarea.classList.add('hidden-input'); // Add hidden-input class

        section.appendChild(inputProject);
        section.appendChild(inputPeriod);
        section.appendChild(textarea);
    }

    // Function to add Skills
    function addSkill() {
        const section = document.querySelector('.skills-container');
        
        const inputSkill = document.createElement('input');
        inputSkill.type = 'text';
        inputSkill.placeholder = 'Skill';
        inputSkill.classList.add('hidden-input'); // Add hidden-input class

        section.appendChild(inputSkill);
    }

    // Function to add Hobbies
    function addHobby() {
        const section = document.querySelector('.hobbies-container');
        
        const inputHobby = document.createElement('input');
        inputHobby.type = 'text';
        inputHobby.placeholder = 'Hobby';
        inputHobby.classList.add('hidden-input'); // Add hidden-input class

        section.appendChild(inputHobby);
    }

    // Function to add Education
    function addEducation() {
        const section = document.querySelector('.education-container');
        const educationItem = document.createElement('div');
        educationItem.classList.add('education-item');

        const inputSchool = document.createElement('input');
        inputSchool.type = 'text';
        inputSchool.placeholder = 'University Name';
        inputSchool.classList.add('hidden-input', 'project-name'); // Add hidden-input and project-name classes

        const inputDegree = document.createElement('input');
        inputDegree.type = 'text';
        inputDegree.placeholder = 'Degree';
        inputDegree.classList.add('hidden-input'); // Add hidden-input class

        const inputPeriod = document.createElement('input');
        inputPeriod.type = 'text';
        inputPeriod.placeholder = 'Time Period';
        inputPeriod.classList.add('hidden-input'); // Add hidden-input class

        educationItem.appendChild(inputSchool);
        educationItem.appendChild(inputDegree);
        educationItem.appendChild(inputPeriod);
        section.insertBefore(educationItem, section.querySelector('.add-button'));
    }

    // Function to add Languages
    function addLanguage() {
        const section = document.querySelector('.language-container');
        const languageItem = document.createElement('div');
        languageItem.classList.add('language-item');

        const inputLanguage = document.createElement('input');
        inputLanguage.type = 'text';
        inputLanguage.placeholder = 'Language';
        inputLanguage.classList.add('hidden-input'); // Add hidden-input class

        languageItem.appendChild(inputLanguage);
        section.insertBefore(languageItem, section.querySelector('.add-button'));
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

</body>
</html>
