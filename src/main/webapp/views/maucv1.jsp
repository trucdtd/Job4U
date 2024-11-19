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
<link rel="stylesheet" href="/css/cv1.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<div class="container mt-4">
		<div class="cv-container" id="cv-content">
			<div class="left-column" id="sortable-left">
				<div class="profile-photo">
					<input type="file" id="profile-image" accept="image/*"
						style="display: none;" onchange="previewImage(event)"> <label
						for="profile-image" class="upload-label"> <img
						id="profile-img-preview" src="path/to/default-image.jpg"
						alt="Ảnh ứng viên" class="cv-photo">
					</label>
				</div>
				<div class="contact section">
					<div  class="section-title">Liên Hệ</div>
					<input class="hidden-input" type="text" class="input-field" placeholder="Số điện thoại" /> <input class="hidden-input" type="email"
						placeholder="Email" id="emailcv" class="input-field"> <input class="hidden-input"
						type="date" placeholder="Ngày sinh" id="dateOfbirth"
						class="input-field"> <input class="hidden-input" type="text"
						placeholder="Ngôn Ngữ" id="languages" class="input-field">
					<input class="hidden-input" type="text" placeholder="Giới tính" id="gender"
						class="input-field">
				</div>
				<div class="skills section">
					<div class="section-title">Kỹ Năng</div>
					<div id="skills-container">
						<input class="hidden-input" type="text" id="skills" class="input-field"
							placeholder="Kỹ năng">
						<button id="add-skill-button" class="add-button" type="button"
							onclick="addSkillField()">+ Thêm Kỹ Năng</button>
					</div>
				</div>

				<div class="certifications section">
					<div class="section-title">Chứng chỉ</div>
					<div id="certifications-container">
						<input class="hidden-input" type="text" id="certifications" class="input-field"
							placeholder="Chứng chỉ">
						<button id="add-certification-button" class="add-button"
							type="button" onclick="addCertificationField()">+ Thêm
							Chứng Chỉ</button>
					</div>
				</div>
			</div>

			<div class="right-column" id="sortable-right">
				<h1 contenteditable="true">OLIVIA WILSON</h1>
				<h5 contenteditable="true">Marketing</h5>
				<div class="experience section">
					<div contenteditable="true" class="section-title">Kinh Nghiệm</div>
					<div id="experience-container">
						<textarea class="hidden-input" id="experience" 
							placeholder="I am a fun, hard-working creative who strives for excellence in everything I do. I’m an avid learner and seek to enhance the lives of everyone around me."></textarea>
						
					</div>
				</div>

				<div class="projects section">
					<div class="section-title">Dự Án Đã Tham Gia</div>
					<div id="projects-container">
						<div class="project-field">
							<input class="hidden-input" type="text" class="input-field" placeholder="Tên Dự Án">
							<input class="hidden-input" type="text" class="input-field" placeholder="Thời Gian">
							<textarea class="hidden-input" class="input-area" placeholder="Mô Tả"></textarea>
						</div>
						<button id="add-project-button" class="add-button" type="button"
							onclick="addProjectField()">+ Thêm Dự Án</button>
					</div>
				</div>
				<div class="hobbies section">
					<div class="section-title">Sở Thích</div>
					<div id="hobbies-container">
						<input class="hidden-input" type="text" id="hobbies" class="input-field"
							placeholder="Sở Thích">
						<button id="add-hobbies-button" class="add-button" type="button"
							onclick="addHobbiesField()">+ Thêm Sở Thích</button>
					</div>
				</div>
			</div>
		</div>
		<div class="button-container">
			<button class="save-button" type="button">Lưu CV</button>
			<button class="download-button" type="button"
				onclick="downloadCVAsPDF()">Tải CV Dưới Dạng PDF</button>
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
			newField.placeholder = 'Kỹ năng';

			skillsContainer.insertBefore(newField, addSkillButton);
		}

		function addCertificationField() {
			const certificationsContainer = document
					.getElementById('certifications-container');
			const addCertificationButton = document
					.getElementById('add-certification-button');

			const newField = document.createElement('input');
			newField.type = 'text';
			newField.className = 'input-field hidden-input';
			newField.placeholder = 'Chứng chỉ';

			certificationsContainer.insertBefore(newField,
					addCertificationButton);
		}

		function addHobbiesField() {
			const hobbiesContainer = document
					.getElementById('hobbies-container');
			const addHobbiesButton = document
					.getElementById('add-hobbies-button');

			const newField = document.createElement('input');
			newField.type = 'text';
			newField.className = 'input-field hidden-input';
			newField.placeholder = 'Sở Thích';

			hobbiesContainer.insertBefore(newField, addHobbiesButton);
		}

		function addProjectField() {
			const projectsContainer = document
					.getElementById('projects-container');
			const addProjectButton = document
					.getElementById('add-project-button');

			const newProjectField = document.createElement('div');
			newProjectField.classList.add('project-field');

			const projectName = document.createElement('input');
			projectName.type = 'text';
			projectName.className = 'input-field hidden-input';
			projectName.placeholder = 'Tên Dự Án';

			const projectTime = document.createElement('input');
			projectTime.type = 'text';
			projectTime.className = 'input-field hidden-input';
			projectTime.placeholder = 'Thời Gian';

			const projectDescription = document.createElement('textarea');
			projectDescription.className = 'input-area hidden-input';
			projectDescription.placeholder = 'Mô Tả';

			newProjectField.appendChild(projectName);
			newProjectField.appendChild(projectTime);
			newProjectField.appendChild(projectDescription);

			projectsContainer.insertBefore(newProjectField, addProjectButton);
		}
		document.addEventListener("DOMContentLoaded", function() {
			// Cho phép kéo-thả trong cột bên trái
			new Sortable(document.getElementById("sortable-left"), {
				animation : 150,
				group : "shared", // Tùy chọn: Cho phép kéo-thả qua lại giữa các cột
				draggable : ".section", // Các mục có thể kéo là những mục có lớp .section
				handle : ".section-title", // Kéo bằng tiêu đề của phần
				ghostClass : "sortable-ghost" // Thêm lớp cho phần tử đang kéo
			});

			// Cho phép kéo-thả trong cột bên phải
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