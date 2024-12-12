<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mẫu CV 6</title>
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
	<div class="cv-container" id="cv-content">
		<!-- Decorative Header -->
		<!-- <div class="header-decoration"></div>
		<div class="inner-header-decoration"></div>

		Decorative Footer
		<div class="footer-decoration"></div>
		<div class="inner-footer-decoration"></div>

		Corner Triangles
		<div class="top-left-triangle"></div>
		<div class="bottom-right-triangle"></div> -->

		<!-- Left Column -->
		<div class="left-column" id="sortable-left">
			<div class="profile-photo">
				<!-- Hide file input and click anywhere in the box to select an image -->
				<input class="an" type="file" id="profile-image" accept="image/*"
					onchange="previewImage(event)"> <label for="profile-image"
					class="upload-label"> <img id="profile-img-preview"
					src="path/to/default-image.jpg" alt="Candidate's Photo">
				</label>
			</div>
			<div class="section">
				<div class="section-title">Contact</div>
				<div class="contact-info">
					
						<input type="text" class="hidden-input" name="phone"
							placeholder="Enter phone number">

					
						<input type="email" class="hidden-input" name="email"
							placeholder="alfredo@example.com">
					
						<input class="hidden-input" type="date" name="dob">
					
						<input class="hidden-input" type="text" name="language"
							placeholder="Vietnamese">
					
						<select class="hidden-input" name="gender"><option
								value="male">Male</option>
							<option value="female">Female</option></select>
					
						<input class="hidden-input" type="text" name="address"
							placeholder="Address">
				
				</div>
			</div>

			<!-- Skills -->
			<div class="section">
				<div class="section-title">Skills</div>
				<div id="skills-section" class="draggable-section">
					<input class="hidden-input" type="text" name="skills[]"
						placeholder="Enter skill" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('skills-section')">+ Add Skill</button>
				</div>
			</div>

			<div class="section">
				<div class="section-title">Certificates</div>
				<div id="certificates-section">
					<input class="hidden-input" type="text" name="certificates[]"
						placeholder="Enter certificate" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('certificates-section')">+ Add Certificate</button>
				</div>
			</div>
		</div>

		<!-- Right Column -->
		<div class="right-column" id="sortable-right">
			<h1 placeholder="Enter career objective" contenteditable="true">OLIVIA WILSON</h1>
			<h5 contenteditable="true">Marketing Manager</h5>

			<!-- <h2><input type="text" name="title" placeholder="Position Applied For"></h2> -->

			<div class="section">
				<div class="section-title">Career Objective</div>
				<textarea class="hidden-input" name="careerGoal"
					placeholder="I am a creative, hardworking person always striving for excellence in everything I do. I am always eager to learn and look for ways to improve the lives of those around me."></textarea>
			</div>

			<div class="section">
				<div class="section-title">Education</div>
				<div id="education-section" class="draggable-section">
					<!-- First sample education entry -->
					<div class="education-item draggable" draggable="true">
						<input class="hidden-input project-name" type="text" name="education[]"
							placeholder="School Name" class="education-name"> <input
							class="hidden-input" type="text" name="education-dates[]"
							placeholder="Dates" class="education-time">
						<textarea class="hidden-input" name="education-descriptions[]"
							placeholder="Description"></textarea>
					</div>
				</div>
				<div class="add-button-container">
					<button onclick="addEducationField()">+ Add Education</button>
				</div>
			</div>

			<div class="section">
				<div class="section-title">Projects Involved</div>
				<div id="projects-section" class="draggable-section">
					<div class="work-experience-item">
						<input class="hidden-input project-name" type="text"
							name="projects[]" placeholder="Project Name - Company"> <input
							class="hidden-input" type="text" name="project-dates[]"
							placeholder="Dates">
						<textarea class="hidden-input" name="project-descriptions[]"
							placeholder="Description"></textarea>
					</div>
				</div>
				<div class="add-button-container">
					<button onclick="addProjectField()">+ Add Project</button>
				</div>
			</div>

			<div class="section">
				<div class="section-title">Hobbies</div>
				<div id="hobbies-section" class="draggable-section">
					<input class="hidden-input" type="text" name="hobbies[]"
						placeholder="Enter hobby" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('hobbies-section')">+ Add Hobby</button>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
	<script>
	function addField(sectionId) {
		  const section = document.getElementById(sectionId);
		  const input = document.createElement("input");
		  input.type = "text";
		  input.name = sectionId.replace('-section', '') + "[]";
		  input.placeholder = "Enter Information";
		  input.classList.add("hidden-input"); // Thêm class "hidden-input"
		  section.appendChild(input);

		  setTimeout(() => {
		    input.style.transition = "opacity 0.5s";
		    input.style.opacity = 1;
		  }, 50);
		}

		function addProjectField() {
			  const projectSection = document.getElementById('projects-section');
			  const div = document.createElement("div");
			  div.className = "work-experience-item";

			  div.innerHTML = `
			      <input type="text" name="projects[]" placeholder="Project Name" class="hidden-input project-name" style="opacity: 0;">
			      <input type="text" name="project-dates[]" placeholder="Time" class="hidden-input" style="opacity: 0;">
			      <textarea name="project-descriptions[]" placeholder="Description" class="hidden-input" style="opacity: 0;"></textarea>
			  `;
			  projectSection.appendChild(div);

			  // Chọn tất cả các input và textarea bên trong div mới
			  const inputs = div.querySelectorAll('input, textarea');
			  setTimeout(() => {
			    inputs.forEach(input => {
			      input.style.transition = "opacity 0.5s";
			      input.style.opacity = 1;
			    });
			  }, 50);
			}
		function addEducationField() {
		    const educationSection = document.getElementById('education-section');
		    const div = document.createElement('div');
		    div.className = 'education-item';

		    div.innerHTML = `
		        <input type="text" name="educations[]" placeholder="School Name" class="hidden-input project-name education-institution" style="opacity: 0;">
		        <input type="text" name="education-dates[]" placeholder="Time" class="hidden-input education-time" style="opacity: 0;">
		        <textarea name="education-descriptions[]" placeholder="Description" class="hidden-input education-description" style="opacity: 0;"></textarea>
		    `;

		    educationSection.appendChild(div);

		    // Hiệu ứng hiển thị mượt mà
		    const inputs = div.querySelectorAll('input, textarea');
		    setTimeout(() => {
		        inputs.forEach(input => {
		            input.style.transition = 'opacity 0.5s';
		            input.style.opacity = 1;
		        });
		    }, 50);
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
	function previewImage(event) {
	    const file = event.target.files[0];
	    if (file) {
	        const reader = new FileReader();
	        reader.onload = function(e) {
	            document.getElementById('profile-img-preview').src = e.target.result;
	        };
	        reader.readAsDataURL(file);
	    }
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
