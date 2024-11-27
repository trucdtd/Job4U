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
<link rel="stylesheet" href="/css/cv7.css">
<body>
<html>
<!-- header -->
<%@ include file="/views/headerNoPanner.jsp"%>
<%@ include file="/views/chat.jsp"%>
<div class="cv-container" id="cv-content">

	<div class="sidebar" id="sortable-left">
		<input type="file" id="fileInput" onchange="previewImage(event)"
			accept="image/*" style="display: none;"> <img
			id="profileImage" src="https://via.placeholder.com/150"
			alt="Profile Photo" class="sidebar-img"
			onclick="document.getElementById('fileInput').click();">
		<div class="section">
			<h3 class="section-title">Contact</h3>
			<ul>
				<li><input class="hidden-input" type="text" placeholder="Email"></li>
				<li><input class="hidden-input" type="text"
					placeholder="Phone Number"></li>
				<li><input class="hidden-input" type="text"
					placeholder="Gender"></li>
				<li><input class="hidden-input" type="date"
					placeholder="Date of Birth"></li>
				<li><input class="hidden-input" type="text"
					placeholder="Address"></li>

			</ul>
		</div>

		<div class="section">
			<h3 class="section-title">Skills</h3>
			<ul id="skills-list">
				<li><input class="hidden-input" type="text"
					placeholder="Skills"></li>
			</ul>
			<button class="add-button" onclick="addSkill()">Add</button>
		</div>

		<div class="section">
			<h3 class="section-title">Education</h3>
			<ul id="education-list">
				<li><input class="hidden-input" type="text"
					placeholder="School Name"> <input class="hidden-input"
					type="text" placeholder="Study Duration"> <textarea
						style="width: 100%;" class="hidden-input"
						placeholder="Description of Major"></textarea></li>
			</ul>
			<button class="add-button" onclick="addEducation()">Add</button>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main-content" id="sortable-right">
		<div class="main-header">
			<h1 contenteditable="true">Olivia Schumacher</h1>
			<h4 contenteditable="true">Marketing Manager</h4>
		</div>

		<div class="section">
			<h3 class="section-title">About Me</h3>
			<textarea class="hidden-input"
				placeholder="Write something about yourself..."></textarea>
		</div>

		<div class="section">
			<h3 class="section-title">Projects Participated</h3>
			<div class="experience">
				<ul id="projects-list">
					<li><input class="hidden-input" type="text"
						placeholder="Project Name"> <input class="hidden-input"
						type="text" placeholder="Duration"> <textarea
							class="hidden-input" placeholder="Description"></textarea></li>
				</ul>
				<button class="add-button" onclick="addProject()">Add</button>
			</div>
		</div>

		<div class="section references">
			<h3 class="section-title">Hobbies</h3>
			<ul id="hobbies-list">
				<li><input class="hidden-input" type="text"
					placeholder="Hobbies"></li>
			</ul>
			<button class="add-button" onclick="addHobby()">Add</button>
		</div>
	</div>
</div>
<div class="button-container">
	<button class="download-button" type="button"
		onclick="downloadCVAsPDF()">Download CV as PDF</button>
</div>
<!-- footer -->
<%@ include file="/views/footer.jsp"%>
<!-- footer -->
<script>
function addSkill() {
    const skillsList = document.getElementById("skills-list");
    const newSkill = document.createElement("li");
    newSkill.innerHTML = `<input class="hidden-input" type="text" placeholder="Skills">`;
    skillsList.appendChild(newSkill);
}

function addEducation() {
    const educationList = document.getElementById("education-list");
    const newEducation = document.createElement("li");
    newEducation.innerHTML = `
        <input class="hidden-input" type="text" placeholder="School Name">
        <input class="hidden-input" type="text" placeholder="Study Duration">
        <textarea class="hidden-input" placeholder="Description of Major"></textarea>
    `;
    educationList.appendChild(newEducation);
}

function addProject() {
    const projectsList = document.getElementById("projects-list");
    const newProject = document.createElement("li");
    newProject.innerHTML = `
        <input class="hidden-input" type="text" placeholder="Project Name">
        <input class="hidden-input" type="text" placeholder="Duration">
        <textarea class="hidden-input" placeholder="Description"></textarea>
    `;
    projectsList.appendChild(newProject);
}

function addHobby() {
    const hobbiesList = document.getElementById("hobbies-list");
    const newHobby = document.createElement("li");
    newHobby.innerHTML = `<input class="hidden-input" type="text" placeholder="Hobbies">`;
    hobbiesList.appendChild(newHobby);
}
//Enable drag-and-drop functionality for sections in both columns
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
function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function() {
        var output = document.getElementById('profileImage');
        output.src = reader.result;  // Update image after selection
    };
    reader.readAsDataURL(event.target.files[0]);  // Read the selected image
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