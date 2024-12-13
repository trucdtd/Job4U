<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mẫu CV 3</title>
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
<link rel="stylesheet" href="/css/cv3.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>

	<%@ include file="/views/chat.jsp"%>
	<!-- header -->
	<br>

	<div class="resume-container" id="cv-content">
    <!-- Left Column -->
    <div class="left-column" id="sortable-left">
        <div class="photo-frame">
            <input type="file" accept="image/*" onchange="previewImage(event)" style="display: none;" id="fileInput">
            <img id="profileImage" src="profile.jpg" alt="Profile Image" onclick="triggerFileInput()">
        </div>
        <div class="section">
            <div class="contact-info">
                <h2 class="section-title">Contact Information</h2>
                <input class="hidden-input" type="email" id="email" value="hello@reallygreatsite.com">
                <input class="hidden-input" type="text" id="phone" value="+1 234 567 8910">
                <input class="hidden-input" type="date" id="dob" value="2004-09-28">
                <select class="hidden-input" id="gender">
                    <option value="male" selected>Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
                <input class="hidden-input" type="text" id="language" value="Vietnamese">
                <input class="hidden-input" type="text" id="address" value="Your Address">
            </div>
        </div>
        <div class="section" id="experienceSection">
            <h2 class="section-title">Experience</h2>
            <div class="input-group">
                <input class="hidden-input" type="text" placeholder="Enter experience">
            </div>
            <button class="hidden" type="button" onclick="addExperienceField()">+ Add Experience</button>
        </div>

        <div class="section" id="certificateSection">
            <h2 class="section-title">Certificates</h2>
            <div class="input-group">
                <input class="hidden-input" type="text" placeholder="Enter certificate">
            </div>
            <button class="hidden" type="button" onclick="addCertificateField()">+ Add Certificate</button>
        </div>
    </div>

    <!-- Right Column -->
    <div class="right-column" id="sortable-right">
        <div>
            <div class="personal-info">
                <h1 contenteditable="true">OLIVIA WILSON</h1>
                <h4 contenteditable="true">Marketing Manager</h4>
                <textarea class="hidden-input" name="careerGoal"
                    placeholder="I am a creative, cheerful, and hardworking individual who strives for excellence in all that I do. I am eager to learn and always look for ways to improve the lives of those around me."></textarea>
            </div>
        </div>

        <div class="section" id="educationSection">
            <h2 class="section-title">Education</h2>
            <div class="input-group">
                <input class="hidden-input project-name" type="text" placeholder="School Name">
                <input class="hidden-input" type="text" placeholder="Duration">
                <textarea class="hidden-input" placeholder="Description"></textarea>
            </div>
            <button class="hidden" type="button" onclick="addEducationField()">+ Add Education</button>
        </div>

        <div class="section" id="projectSection">
            <h2 class="section-title">Projects</h2>
            <div class="input-group">
                <input class="hidden-input project-name" type="text" placeholder="Project Name">
                <input class="hidden-input" type="text" placeholder="Enter Time">
                <textarea class="hidden-input" placeholder="Project description..."></textarea>
            </div>
            <button class="hidden" type="button" onclick="addProjectField()">+ Add Project</button>
        </div>

        <div class="section" id="hobbiesSection">
            <h2 class="section-title">Hobbies</h2>
            <div class="input-group">
                <input class="hidden-input" type="text" placeholder="Hobbies">
            </div>
            <button class="hidden" type="button" onclick="addHobbiesField()">+ Add Hobby</button>
        </div>
    </div>
</div>
<div class="button-container">
    <!-- <button class="save-button" type="button">Save CV</button> -->
    <button class="download-button" type="button" onclick="downloadCVAsPDF()">Download CV as PDF</button>
</div>

	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->

	<script>
		// Image preview function
		document.getElementById("profileImage").addEventListener(
				"click",
				function() {
					document.querySelector(".photo-frame input[type='file']")
							.click();
				});

		function previewImage(event) {
			const file = event.target.files[0];
			if (file && file.type.startsWith("image/")) {
				const reader = new FileReader();
				reader.onload = function() {
					document.getElementById("profileImage").src = reader.result;
				};
				reader.readAsDataURL(file);
			}
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

		function addEducationField() {
		    // Tạo một khối mới
		    var section = document.createElement("div");
		    section.classList.add("input-group");

		    // Nội dung HTML của khối
		    section.innerHTML = `
		        <input class="hidden-input project-name" type="text" placeholder="School Name">
		        <input class="hidden-input" type="text" placeholder="Time">
		        <textarea class="hidden-input" placeholder="Description"></textarea>
		    `;

		    // Chèn khối mới trước nút "Thêm Học Vấn"
		    document.getElementById("educationSection").insertBefore(section,
		        document.querySelector("#educationSection button"));
		}

		function addCertificateField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input" type="text" placeholder="Certificate">';
			// Thêm trường nhập liệu vào đầu danh sách
			document.getElementById("certificateSection").insertBefore(section,
					document.querySelector("#certificateSection button"));
		}

		function addExperienceField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input" type="text" placeholder="Experience">';
			// Thêm trường nhập liệu vào đầu danh sách
			document.getElementById("experienceSection").insertBefore(section,
					document.querySelector("#experienceSection button"));
		}

		function addProjectField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input project-name" type="text" placeholder="Project Name"><input class="hidden-input" type="text" placeholder="Time"><textarea class="hidden-input" placeholder="Description"></textarea>';
			// Thêm trường nhập liệu vào đầu danh sách
			document.getElementById("projectSection").insertBefore(section,
					document.querySelector("#projectSection button"));
		}

		function addHobbiesField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input" type="text" placeholder="Hobbies">';
			// Thêm trường nhập liệu vào đầu danh sách
			document.getElementById("hobbiesSection").insertBefore(section,
					document.querySelector("#hobbiesSection button"));
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
