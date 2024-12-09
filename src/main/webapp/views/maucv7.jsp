<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mẫu CV 7</title>
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
			<h3 class="section-title">Liên Hệ</h3>
			<ul id="contact-list">
				<li><input class="hidden-input" type="text" placeholder="Email"></li>
				<li><input class="hidden-input" type="text"
					placeholder="Số Điện Thoại"></li>
				<li><input class="hidden-input" type="text"
					placeholder="Giới Tính"></li>
				<li><input class="hidden-input" type="date"
					placeholder="Ngày Sinh"></li>
				<li><input class="hidden-input" type="text"
					placeholder="Địa Chỉ"></li>
				<li><input class="hidden-input" type="text"
					placeholder="Ngôn Ngữ"></li>
			</ul>
		</div>

		<div class="section">
			<h3 class="section-title">Kỹ Năng</h3>
			<ul id="skills-list">
				<li><input class="hidden-input" type="text"
					placeholder="Kỹ Năng"></li>
			</ul>
			<button class="add-button" onclick="addSkill()">Thêm</button>
		</div>
		<div class="section">
			<h3 class="section-title">Chứng Chỉ</h3>
			<ul id="certificates-list">
				<li><input class="hidden-input" type="text"
					placeholder="Tên Chứng Chỉ"></li>
			</ul>
			<button class="add-button" onclick="addCertificate()">Thêm</button>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main-content" id="sortable-right">
		<div class="main-header">
			<h1 contenteditable="true">NGUYỄN VĂN A</h1>
			<h4 contenteditable="true">Quản Lý Tiếp Thị</h4>
		</div>

		<div class="section">
			<h3 class="section-title">Mục Tiêu Nghề Nghiệp</h3>
			<textarea class="hidden-input"
				placeholder="Tôi là một người sáng tạo vui vẻ, chăm chỉ và luôn phấn đấu để đạt được sự xuất sắc trong mọi việc mình làm. Tôi là một người ham học hỏi và luôn tìm cách nâng cao cuộc sống của mọi người xung quanh.""></textarea>
		</div>
		<div class="section">
			<h3 class="section-title">Học Vấn</h3>
			<div class="education">
				<ul id="education-list">
					<li><input class="hidden-input project-name" type="text"
						placeholder="Tên Trường"> <input class="hidden-input"
						type="text" placeholder="Thời Gian"> <textarea
							class="hidden-input" style="width: 100%;" placeholder="Mô Tả"></textarea>
					</li>
				</ul>
				<button class="add-button" onclick="addEducation()">Thêm</button>
			</div>
		</div>

		<div class="section">
			<h3 class="section-title">Dự Án Đã Tham Gia</h3>
			<div class="experience">
				<ul id="projects-list">
					<li><input class="hidden-input project-name" type="text"
						placeholder="Tên Dự Án"> <input class="hidden-input"
						type="text" placeholder="Thời Gian"> <textarea
							class="hidden-input" placeholder="Mô Tả"></textarea></li>
				</ul>
				<button class="add-button" onclick="addProject()">Thêm</button>
			</div>
		</div>

		<div class="section references">
			<h3 class="section-title">Sở Thích</h3>
			<ul id="hobbies-list">
				<li><input class="hidden-input" type="text"
					placeholder="Sở Thích"></li>
			</ul>
			<button class="add-button" onclick="addHobby()">Thêm</button>
		</div>
	</div>
</div>
<div class="button-container">
	<button class="download-button" type="button"
		onclick="downloadCVAsPDF()">Tải CV Dưới Dạng PDF</button>
</div>
<!-- footer -->
<%@ include file="/views/footer.jsp"%>
<!-- footer -->
<script>
function addSkill() {
    const skillsList = document.getElementById("skills-list");
    const newSkill = document.createElement("li");
    newSkill.innerHTML = `<input class="hidden-input" type="text" placeholder="Kỹ Năng">`;
    skillsList.appendChild(newSkill);
}
function addCertificate() {
    const certificatesList = document.getElementById("certificates-list");
    const newCertificate = document.createElement("li");
    newCertificate.innerHTML = `<input class="hidden-input" type="text" placeholder="Tên Chứng Chỉ">`;
    certificatesList.appendChild(newCertificate);
}
function addEducation() {
    const educationList = document.getElementById("education-list");
    const newEducation = document.createElement("li");
    newEducation.innerHTML = `
        <input class="hidden-input project-name" style="width: 100%;" type="text" placeholder="Tên Trường">
        <input class="hidden-input" type="text" style="width: 100%;" placeholder="Thời Gian">
        <textarea class="hidden-input" style="width: 100%;" placeholder="Mô Tả"></textarea>
    `;
    educationList.appendChild(newEducation);
}

function addProject() {
    const projectsList = document.getElementById("projects-list");
    const newProject = document.createElement("li");
    newProject.innerHTML = `
        <input class="hidden-input project-name" type="text" placeholder="Tên Dự Án">
        <input class="hidden-input" type="text" placeholder="Thời Gian">
        <textarea class="hidden-input" style="width: 100%;" placeholder="Mô Tả"></textarea>
    `;
    projectsList.appendChild(newProject);
}

function addHobby() {
    const hobbiesList = document.getElementById("hobbies-list");
    const newHobby = document.createElement("li");
    newHobby.innerHTML = `<input class="hidden-input" type="text" placeholder="Sở Thích">`;
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
        output.src = reader.result;  // Cập nhật ảnh sau khi chọn
    };
    reader.readAsDataURL(event.target.files[0]);  // Đọc ảnh đã chọn
}
document.addEventListener("DOMContentLoaded", function () {
	  function adjustInputSize() {
	    // Lấy tất cả các input trong cv-container
	    const inputs = document.querySelectorAll(".cv-container .hidden-input");
	    inputs.forEach((input) => {
	      input.style.width = "100%"; // Đặt chiều rộng cố định
	      input.style.boxSizing = "border-box"; // Đảm bảo padding không ảnh hưởng kích thước
	    });
	  }

	  new Sortable(document.getElementById("sortable-left"), {
	    animation: 150,
	    group: "shared",
	    draggable: ".section",
	    handle: ".section-title",
	    ghostClass: "sortable-ghost",
	    onEnd: adjustInputSize, // Gọi hàm khi kết thúc kéo thả
	  });

	  new Sortable(document.getElementById("sortable-right"), {
	    animation: 150,
	    group: "shared",
	    draggable: ".section",
	    handle: ".section-title",
	    ghostClass: "sortable-ghost",
	    onEnd: adjustInputSize, // Gọi hàm khi kết thúc kéo thả
	  });

	  // Điều chỉnh kích thước ngay khi tải trang
	  adjustInputSize();
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
</body>
</html>