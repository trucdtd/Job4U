<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mẫu CV 4</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!-- html2pdf Library -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<link rel="stylesheet" href="/css/cv4.css">
</head>
<body>

	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->

	<div class="container">
    <div class="cv-container" id="cv-content">
        <div class="header">
            <div class="photo-frame">
                <input type="file" id="fileInput" accept="image/*" onchange="previewImage(event)" style="display: none;"> 
                <img id="profileImage" src="your-image-url.jpg" alt="Donna Stroupe" class="profile-photo" onclick="triggerFileInput()">
            </div>
            <div class="header-info">
                <h1 contenteditable="true">OLIVIA WILSON</h1>
                <h5 contenteditable="true">Marketing</h5>
            </div>
        </div>

        <div class="main-content">
            <!-- Left Column -->
            <div class="left-column" id="sortable-left">
                <div class="section">
                    <div class="section-title">Contact</div>
                    <label>Email:</label> 
                    <input class="hidden-input" type="email" name="email" required value="hello@reallygreatsite.com">
                    <label>Phone:</label> 
                    <input class="hidden-input" type="text" name="phone" required value="099876554"> 
                    <label>Date of Birth:</label> 
                    <input class="hidden-input" type="date" name="dob" required>
                    <label for="gender">Gender:</label> 
                    <select class="hidden-input" name="gender" id="gender" required>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select> 
                    <label>Nationality:</label> 
                    <input class="hidden-input" type="text" name="nationality" required value="Nationality">
                </div>

                <div class="section">
                    <div class="section-title">Skills</div>
                    <div id="skills-container">
                        <input class="hidden-input" type="text" name="skills[]" placeholder="Add Skill" required>
                    </div>
                    <button type="button" onclick="addSkill()">+ Add Skill</button>
                </div>

                <div class="section">
                    <div class="section-title">Certificates</div>
                    <div id="certificates-container">
                        <input class="hidden-input" type="text" name="certificates[]" placeholder="Add Certificate" required>
                    </div>
                    <button type="button" onclick="addCertificate()">+ Add Certificate</button>
                </div>
            </div>

            <!-- Right Column -->
            <div class="right-column" id="sortable-right">
                <div class="section">
                    <div class="section-title">Career Objective</div>
                    <textarea class="hidden-input" name="career-objective" placeholder="I am a fun, hard-working creative who strives for excellence in everything I do. I’m an avid learner and seek to enhance the lives of everyone around me." required></textarea>
                </div>

                <div class="section">
                    <div class="section-title">Education</div>
                    <div id="education">
                        <input class="hidden-input" type="text" name="education[]" placeholder="Add Education" required>
                    </div>
                    <button type="button" onclick="addEducation()">+ Add Education</button>
                </div>

                <div class="section">
                    <div class="section-title">Projects</div>
                    <div id="experience">
                        <input class="hidden-input project-name" type="text" name="experience[]" placeholder="Project Name" required> 
                        <input class="hidden-input" type="text" name="experience[]" placeholder="Time Period" required>
                        <textarea class="hidden-input" name="experience[]" placeholder="Description" required></textarea>
                    </div>
                    <button type="button" onclick="addExperience()">+ Add Project</button>
                </div>

                <div class="section">
                    <h2 class="section-title">Hobbies</h2>
                    <div id="hobbies">
                        <input class="hidden-input" type="text" name="hobbies[]" placeholder="Add Hobby" required>
                    </div>
                    <button type="button" onclick="addHobby()">+ Add Hobby</button>
                </div>
            </div>
        </div>
    </div>
    <div class="button-container">
        <!-- <button class="save-button" type="button">Save CV</button> -->
        <button class="download-button" type="button" onclick="downloadCVAsPDF()">Download CV as PDF</button>
    </div>
</div>

	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script>
		function addSkill() {
			let skillsContainer = document.getElementById("skills-container");
			let input = document.createElement("input");
			input.type = "text";
			input.name = "skills[]";
			input.className = "hidden-input";
			input.placeholder = "Add Skill";
			skillsContainer.appendChild(input);
		}

		function addCertificate() {
			let certificatesContainer = document
					.getElementById("certificates-container");
			let input = document.createElement("input");
			input.type = "text";
			input.name = "certificates[]";
			input.className = "hidden-input";
			input.placeholder = "Add Certificate";
			certificatesContainer.appendChild(input);
		}

		// Add new education input
		function addEducation() {
			let educationDiv = document.getElementById("education");
			let input = document.createElement("input");
			input.type = "text";
			input.name = "education[]";
			input.className = "hidden-input";
			input.placeholder = "Add Education";
			educationDiv.appendChild(input);
		}

		// Add new experience input
		function addExperience() {
    let experienceDiv = document.getElementById("experience");
    let experienceContainer = document.createElement("div");
    experienceContainer.classList.add("experience-container");

    // Tên Dự Án
    let projectNameInput = document.createElement("input");
    projectNameInput.type = "text";
    projectNameInput.name = "experience[]";
    projectNameInput.className = "hidden-input project-name";
    projectNameInput.placeholder = "Project Name";
    experienceContainer.appendChild(projectNameInput);

    // Thời Gian
    let timeInput = document.createElement("input");
    timeInput.type = "text";
    timeInput.name = "experience[]";
    timeInput.className = "hidden-input";
    timeInput.placeholder = "Time Period";
    experienceContainer.appendChild(timeInput);

    // Mô Tả
    let descriptionTextarea = document.createElement("textarea");
    descriptionTextarea.name = "experience[]";
    descriptionTextarea.className = "hidden-input";
    descriptionTextarea.placeholder = "Description";
    experienceContainer.appendChild(descriptionTextarea);

    experienceDiv.appendChild(experienceContainer);
}

		// Add new hobby input
		function addHobby() {
			let hobbiesDiv = document.getElementById("hobbies");
			let input = document.createElement("input");
			input.type = "text";
			input.name = "hobbies[]";
			input.className = "hidden-input";
			input.placeholder = "Add Hobby";
			hobbiesDiv.appendChild(input);
		}

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
	function previewImage(event) {
    const file = event.target.files[0]; // Lấy file từ input
    if (file) {
        const reader = new FileReader(); // Tạo FileReader để đọc file
        reader.onload = function (e) {
            const profileImage = document.getElementById("profileImage");
            profileImage.src = e.target.result; // Gán ảnh đã chọn vào thẻ img
        };
        reader.readAsDataURL(file); // Đọc file dưới dạng Data URL
    }
}

function triggerFileInput() {
    document.getElementById("fileInput").click(); // Mở hộp chọn file khi nhấn vào ảnh
}
</script>
</body>
</html>
