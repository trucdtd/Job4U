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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!-- html2pdf Library -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<link rel="stylesheet" href="/css/cv2.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
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
				<!-- Ẩn input file và bấm vào bất kỳ chỗ nào trong khung để chọn ảnh -->
				<input class="an" type="file" id="profile-image" accept="image/*"
					onchange="previewImage(event)"> <label for="profile-image"
					class="upload-label"> <img id="profile-img-preview"
					src="path/to/default-image.jpg" alt="Ảnh ứng viên">
				</label>
			</div>
			<div class="section">
				<div class="section-title">Liên Hệ</div>
				<div class="contact-info">
					<p>
						Điện Thoại: <input type="text" class="hidden-input" name="phone"
							placeholder="Nhập số điện thoại">

					</p>
					<p>
						Email: <input type="email" class="hidden-input" name="email"
							placeholder="alfredo@example.com">
					</p>
					<p>
						Ngày Sinh: <input class="hidden-input" type="date" name="dob">
					</p>
					<p>
						Ngôn Ngữ: <input class="hidden-input" type="text" name="language"
							placeholder="Tiếng Việt">
					</p>
					<p>
						Giới Tính: <select class="hidden-input" name="gender"><option
								value="male">Nam</option>
							<option value="female">Nữ</option></select>
					</p>
				</div>
			</div>

			<!-- Học Vấn -->
			<div class="section">
				<div class="section-title">Học Vấn</div>
				<div id="education-section" class="draggable-section">
					<input class="hidden-input" type="text" name="education[]"
						placeholder="FPT Polytechnic" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('education-section')">+ Thêm Học
						Vấn</button>
						
				</div>
			</div>

			<div class="section">
				<div class="section-title">Chứng Chỉ</div>
				<div id="certificates-section">
					<input class="hidden-input" type="text" name="certificates[]"
						placeholder="Nhập chứng chỉ" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('certificates-section')">+ Thêm
						Chứng Chỉ</button>
				</div>
			</div>
		</div>

		<div class="right-column" id="sortable-right">
			<h1 placeholder="Nhập mục tiêu nghề nghiệp" contenteditable="true">NGUYỄN VĂN A</h1>
			<h5 contenteditable="true">Quản Lý Tiếp Thị</h5>
			
			<!-- <h2><input type="text" name="title" placeholder="Vị Tí Ứng Tuyển"></h2> -->

			<div class="section">
				<div class="section-title">Mục Tiêu Nghề Nghiệp</div>
				<textarea class="hidden-input" name="careerGoal"
					placeholder="Tôi là một người sáng tạo vui vẻ, chăm chỉ và luôn phấn đấu để đạt được sự xuất sắc trong mọi việc mình làm. Tôi là một người ham học hỏi và luôn tìm cách nâng cao cuộc sống của mọi người xung quanh."></textarea>
			</div>

			<!-- Kỹ Năng -->
			<div class="section">
				<div class="section-title">Kỹ Năng</div>
				<div id="skills-section" class="draggable-section">
					<input class="hidden-input" type="text" name="skills[]"
						placeholder="Nhập kỹ năng" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('skills-section')">+ Thêm Kỹ
						Năng</button>
				</div>
			</div>

			<div class="section">
				<div class="section-title">Dự Án Đã Tham Gia</div>
				<div id="projects-section" class="draggable-section">
					<div class="work-experience-item">
						<input class="hidden-input project-name" type="text" name="projects[]"
							placeholder="Tên dự án - Công ty"> <input
							class="hidden-input" type="text" name="project-dates[]"
							placeholder="Thời gian">
						<textarea class="hidden-input" name="project-descriptions[]"
							placeholder="Mô tả"></textarea>
					</div>
				</div>
				<div class="add-button-container">
					<button onclick="addProjectField()">+ Thêm Dự Án</button>
				</div>
			</div>
			<div class="section">
				<div class="section-title">Sở Thích</div>
				<div id="hobbies-section" class="draggable-section">
					<input class="hidden-input" type="text" name="hobbies[]"
						placeholder="Nhập Sở Thích" draggable="true" class="draggable">
				</div>
				<div class="add-button-container">
					<button onclick="addField('hobbies-section')">+ Thêm Kỹ
						Năng</button>
				</div>
			</div>
		</div>
	</div>
	<div class="button-container">
		<!-- <button class="save-button" type="button">Lưu CV</button> -->
		<button class="download-button" type="button"
			onclick="downloadCVAsPDF()">Tải CV Dưới Dạng PDF</button>
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
		  input.placeholder = "Nhập thông tin";
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
			      <input type="text" name="projects[]" placeholder="Tên dự án - Công ty" class="hidden-input project-name" style="opacity: 0;">
			      <input type="text" name="project-dates[]" placeholder="Thời gian" class="hidden-input" style="opacity: 0;">
			      <textarea name="project-descriptions[]" placeholder="Mô tả" class="hidden-input" style="opacity: 0;"></textarea>
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
