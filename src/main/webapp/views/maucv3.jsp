<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Sortable.js -->
<script
	src="https://cdn.jsdelivr.net/npm/sortablejs@1.14.0/Sortable.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
	<!-- header -->
	<br>

	<div class="resume-container" id="cv-content">
		<!-- Left Column -->
		<div class="left-column" id="sortable-left">
			<div class="section">
				<div class="photo-frame">
					<input type="file" accept="image/*" onchange="previewImage(event)">
					<img id="profileImage" src="profile.jpg" alt="Profile Image">
				</div>
			</div>
			<div class="section">
				<div class="contact-info">
					<h2 class="section-title">Thông Tin</h2>
					<label for="email">Email:</label> <input class="hidden-input"
						type="email" id="email" value="hello@reallygreatsite.com">
					<label for="phone">Phone:</label> <input class="hidden-input"
						type="text" id="phone" value="+1 234 567 8910"> <label
						for="dob">Ngày Sinh:</label> <input class="hidden-input"
						type="date" id="dob" value="2004-09-28"> <label
						for="gender">Giới Tính:</label> <select class="hidden-input"
						id="gender">
						<option value="male" selected>Nam</option>
						<option value="female">Nữ</option>
						<option value="other">Khác</option>
					</select> <label for="language">Ngôn Ngữ:</label> <input
						class="hidden-input" type="text" id="language" value="Việt Nam">
				</div>
			</div>

			<div class="section" id="educationSection">
				<h2 class="section-title">Học Vấn</h2>
				<div class="input-group">
					<input class="hidden-input" type="text" placeholder="Nhập học vấn">
				</div>
				<button class="hidden" type="button" onclick="addEducationField()">+
					Thêm Học Vấn</button>
			</div>

			<div class="section" id="certificateSection">
				<h2 class="section-title">Chứng Chỉ</h2>
				<div class="input-group">
					<input class="hidden-input" type="text"
						placeholder="Nhập chứng chỉ">
				</div>
				<button class="hidden" type="button" onclick="addCertificateField()">+
					Thêm Chứng Chỉ</button>
			</div>
		</div>

		<!-- Right Column -->
		<div class="right-column" id="sortable-right">
			<div class="section">
				<div class="personal-info">
					<h1 contenteditable="true">OLIVIA WILSON</h1>
					<textarea class="hidden-input" name="careerGoal"
						placeholder="I am a fun, hard-working creative who strives for excellence in everything I do. I’m an avid learner and seek to enhance the lives of everyone around me."></textarea>
				</div>
			</div>

			<div class="section" id="experienceSection">
				<h2 class="section-title">Kinh Nghiệm</h2>
				<div class="input-group">
					<input class="hidden-input" type="text"
						placeholder="Nhập kinh nghiệm">
				</div>
				<button class="hidden" type="button" onclick="addExperienceField()">+
					Thêm Kinh Nghiệm</button>
			</div>

			<div class="section" id="projectSection">
				<h2 class="section-title">Dự Án Đã Tham Gia</h2>
				<div class="input-group">
					<input class="hidden-input" type="text"
						placeholder="Nhập thời gian"> <input class="hidden-input"
						type="text" placeholder="Tên dự án">
					<textarea class="hidden-input" placeholder="Mô tả dự án..."></textarea>
				</div>
				<button class="hidden" type="button" onclick="addProjectField()">+
					Thêm Dự Án</button>
			</div>

			<div class="section" id="hobbiesSection">
				<h2 class="section-title">Sở Thích</h2>
				<div class="input-group">
					<input class="hidden-input" type="text" placeholder="Sở Thích">
				</div>
				<button class="hidden" type="button" onclick="addHobbiesField()">+
					Thêm Sở Thích</button>
			</div>
		</div>
	</div>
	<div class="button-container">
		<button class="save-button" type="button">Lưu CV</button>
		<button class="download-button" type="button"
			onclick="downloadCVAsPDF()">Tải CV Dưới Dạng PDF</button>
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

		// Add new fields (education, certificate, experience, etc.)
		function addEducationField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input" type="text" placeholder="Nhập học vấn">';
			document.getElementById("educationSection").insertBefore(section,
					document.querySelector("#educationSection button"));
		}

		function addCertificateField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input" type="text" placeholder="Nhập chứng chỉ">';
			// Thêm trường nhập liệu vào đầu danh sách
			document.getElementById("certificateSection").insertBefore(section,
					document.querySelector("#certificateSection button"));
		}

		function addExperienceField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input" type="text" placeholder="Nhập kinh nghiệm">';
			// Thêm trường nhập liệu vào đầu danh sách
			document.getElementById("experienceSection").insertBefore(section,
					document.querySelector("#experienceSection button"));
		}

		function addProjectField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input" type="text" placeholder="Dự án đã tham gia"><input class="hidden-input" type="text" placeholder="Tên dự án"><textarea class="hidden-input" placeholder="Mô tả dự án..."></textarea>';
			// Thêm trường nhập liệu vào đầu danh sách
			document.getElementById("projectSection").insertBefore(section,
					document.querySelector("#projectSection button"));
		}

		function addHobbiesField() {
			var section = document.createElement("div");
			section.classList.add("input-group");
			section.innerHTML = '<input class="hidden-input" type="text" placeholder="Sở Thích">';
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
