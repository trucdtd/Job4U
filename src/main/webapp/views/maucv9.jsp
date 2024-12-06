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
		<!-- Tiêu đề -->
		<div class="header">
			<h1 contenteditable="true">NGUYỄN VĂN A</h1>
			<h5 contenteditable="true">Quản Lý Tiếp Thị</h5>
		</div>

		<!-- Nội dung -->
		<div class="content">
			<!-- Cột trái -->
			<div class="left-column" id="sortable-left">
				<!-- Phần Liên Hệ -->
				<div class="section contact">
					<h2 class="section-title">Liên Hệ</h2>
					<input class="hidden-input" type="text" value="+123-456-7890" /> <input
						class="hidden-input" type="text" value="richard@example.com" /> <input
						class="hidden-input" type="text" value="123 Anywhere St, Any City" />
					<input class="hidden-input" type="text" value="Nam" />
				</div>

				<!-- Phần Học Vấn -->
				<div class="section">
					<h2 class="section-title">Học Vấn</h2>
					<div class="education-container">
						<div class="education-item">
							<input class="hidden-input project-name" type="text"
								placeholder="Tên Trường Đại Học" value="Rockwell University" />
							<input class="hidden-input" type="text" placeholder="Bằng Cấp"
								value="Cử Nhân Quản Trị Kinh Doanh" /> <input
								class="hidden-input" type="text" placeholder="Thời Gian"
								value="2021 - 2023" />
						</div>
						<button class="add-button" onclick="addEducation()">Thêm</button>
					</div>
				</div>

				<!-- Phần Ngôn Ngữ -->
				<div class="section">
					<h2 class="section-title">Ngôn Ngữ</h2>
					<div class="language-container">
						<div class="language-item">
							<input class="hidden-input" type="text" value="Tiếng Anh" />
						</div>
						<button class="add-button" onclick="addLanguage()">Thêm</button>
					</div>
				</div>
			</div>

			<!-- Cột phải -->
			<div class="right-column" id="sortable-right">
				<div class="section profile-summary">
					<h2 class="section-title">Tóm Tắt Hồ Sơ</h2>
					<textarea class="hidden-input">Là một Quản Lý Tiếp Thị giàu kinh nghiệm và chi tiết, tôi có một lịch sử thành công trong việc triển khai các chiến lược marketing sáng tạo. Tôi có kỹ năng trong quản lý dự án, lãnh đạo nhóm và tối ưu hóa chiến dịch để thúc đẩy sự phát triển của thương hiệu.</textarea>
				</div>

				<div class="section">
					<h2 class="section-title">Kinh Nghiệm Làm Việc</h2>
					<div class="work-experience-container">
						<input class="hidden-input project-name" type="text"
							placeholder="Tên Dự Án" value="Boostle Studio" /> <input
							class="hidden-input" type="text" placeholder="Thời Gian"
							value="2020 - Hiện tại" />
						<textarea class="hidden-input" placeholder="Mô Tả"></textarea>
					</div>
					<button class="add-button" onclick="addWorkExperience()">Thêm</button>
				</div>

				<!-- Phần Kỹ Năng -->
				<div class="section">
					<h2 class="section-title">Kỹ Năng</h2>
					<div class="skills-container">
						<input class="hidden-input" type="text" value="Quản Lý Dự Án" />
					</div>
					<button class="add-button" onclick="addSkill()">Thêm</button>
				</div>

				<!-- Phần Sở Thích -->
				<div class="section">
					<h2 class="section-title">Sở Thích</h2>
					<div class="hobbies-container">
						<input class="hidden-input" type="text" value="Sở Thích" />
					</div>
					<button class="add-button" onclick="addHobby()">Thêm</button>
				</div>
			</div>
		</div>
	</div>

	<div class="button-container">
		<!-- <button class="save-button" type="button">Lưu CV</button> -->
		<button class="download-button" type="button"
			onclick="downloadCVAsPDF()">Tải CV Dưới Dạng PDF</button>
	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script>
    function addWorkExperience() {
        const section = document.querySelector('.work-experience-container');
        
        const inputProject = document.createElement('input');
        inputProject.type = 'text';
        inputProject.placeholder = 'Tên Dự Án';
        inputProject.classList.add('hidden-input', 'project-name'); // Thêm lớp hidden-input

        const inputPeriod = document.createElement('input');
        inputPeriod.type = 'text';
        inputPeriod.placeholder = 'Thời Gian';
        inputPeriod.classList.add('hidden-input'); // Thêm lớp hidden-input

        const textarea = document.createElement('textarea');
        textarea.placeholder = 'Mô Tả';
        textarea.classList.add('hidden-input'); // Thêm lớp hidden-input

        section.appendChild(inputProject);
        section.appendChild(inputPeriod);
        section.appendChild(textarea);
    }

    // Hàm thêm mục Kỹ Năng
    function addSkill() {
        const section = document.querySelector('.skills-container');
        
        const inputSkill = document.createElement('input');
        inputSkill.type = 'text';
        inputSkill.placeholder = 'Kỹ Năng';
        inputSkill.classList.add('hidden-input'); // Thêm lớp hidden-input và project-name

        section.appendChild(inputSkill);
    }

    // Hàm thêm mục Sở Thích
    function addHobby() {
        const section = document.querySelector('.hobbies-container');
        
        const inputHobby = document.createElement('input');
        inputHobby.type = 'text';
        inputHobby.placeholder = 'Sở Thích';
        inputHobby.classList.add('hidden-input'); // Thêm lớp hidden-input

        section.appendChild(inputHobby);
    }

    // Hàm thêm mục Học Vấn
    function addEducation() {
        const section = document.querySelector('.education-container');
        const educationItem = document.createElement('div');
        educationItem.classList.add('education-item');

        const inputSchool = document.createElement('input');
        inputSchool.type = 'text';
        inputSchool.placeholder = 'Tên Trường Đại Học';
        inputSchool.classList.add('hidden-input', 'project-name'); // Thêm lớp hidden-input và project-name

        const inputDegree = document.createElement('input');
        inputDegree.type = 'text';
        inputDegree.placeholder = 'Bằng Cấp';
        inputDegree.classList.add('hidden-input'); // Thêm lớp hidden-input

        const inputPeriod = document.createElement('input');
        inputPeriod.type = 'text';
        inputPeriod.placeholder = 'Thời Gian';
        inputPeriod.classList.add('hidden-input'); // Thêm lớp hidden-input

        educationItem.appendChild(inputSchool);
        educationItem.appendChild(inputDegree);
        educationItem.appendChild(inputPeriod);
        section.insertBefore(educationItem, section.querySelector('.add-button'));
    }

    // Hàm thêm mục Ngôn Ngữ
    function addLanguage() {
        const section = document.querySelector('.language-container');
        const languageItem = document.createElement('div');
        languageItem.classList.add('language-item');

        const inputLanguage = document.createElement('input');
        inputLanguage.type = 'text';
        inputLanguage.placeholder = 'Ngôn Ngữ';
        inputLanguage.classList.add('hidden-input'); // Thêm lớp hidden-input

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
