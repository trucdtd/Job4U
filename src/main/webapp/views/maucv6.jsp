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
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.containerr {
	width: 750px;
	margin: 30px auto;
	background-color: #ffffff;
	padding: 30px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-bottom: 15px;
	border-bottom: 2px solid #ddd;
	margin-bottom: 15px;
}

.header h1 {
	font-size: 20px; /* Giảm kích thước font */
	margin: 0;
	color: #333;
}

.header h5 {
	font-size: 14px; /* Giảm kích thước font */
	margin: 5px 0;
	color: #777;
}

.header input[type="tel"], .header input[type="email"], .header input[type="url"],
	.header input[type="text"] {
	font-size: 12px; /* Giảm kích thước font */
	width: 46%; /* Giảm chiều rộng */
	padding: 6px; /* Giảm padding */
	border-radius: 5px;
}

.profile-pic {
  border-radius: 50%;
  width: 100px;
  height: 100px;
  background-color: #b3acac;
  margin-right: 100px;
  margin-left: 55px;
  cursor: pointer;
}

#profile-pic-preview {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border-radius: 50%;
}

.header div {
	flex: 1;
}

.content {
	display: flex;
	justify-content: space-between;
}

.left-column, .right-column {
	padding: 10px;
}

.left-column {
	width: 30%;
	border-right: 2px solid #ddd;
}

.right-column {
	width: 65%;
}

.section {
	margin-bottom: 30px;
}

.section h3 {
	font-size: 22px;
	color: #333;
	border-bottom: 2px solid #ddd;
	padding-bottom: 5px;
}

.section ul {
	list-style-type: none;
	padding-left: 0;
}

.section ul li {
	position: relative;
}

.section ul li input {
	font-size: 14px;
	width: 100%;
	padding: 8px;
	border-radius: 5px;
}
.section textarea {
	font-size: 14px;
	width: 100%;
	padding: 8px;
	border-radius: 5px;
}

.add-button {
	background-color: #28a745; /* Màu xanh lá */
	color: white;
	border: none;
	padding: 5px 15px;
	border-radius: 5px;
	cursor: pointer;
	display: none; /* Ẩn nút thêm mặc định */
}

.add-button:hover {
	background-color: #218838; /* Màu xanh lá đậm hơn khi hover */
}

/* Hiện nút thêm khi người dùng hover vào ô nhập liệu */
.section ul li:hover .add-button {
	display: inline-block;
}

.hidden-input {
  border: none;
  outline: none;
  background: none;
  color: inherit;

  /* Khi hover vào */
  &:hover {
    border: 1px dashed #45a049; /* Thay đổi màu và độ dày viền theo ý muốn */
  }
}

}
textarea {
	width: 100%;
	padding: 10px;
	overflow: hidden; /* Ẩn thanh cuộn */
	resize: none; /* Tắt tính năng thay đổi kích thước */
}

.project-name {
	font-size: 18px; /* Kích thước chữ lớn hơn */
	font-weight: bold; /* Chữ đậm hơn */
	color: #333; /* Tùy chỉnh màu sắc (tùy chọn) */
}

.button-container {
	display: flex; /* Aligns buttons horizontally */
	justify-content: center; /* Centers buttons */
	gap: 10px; /* Adds space between buttons */
	margin-top: 20px;
}

.download-button {
	background-color: #4CAF50; /* Green background */
	color: white; /* White text */
	border: none; /* Remove border */
	padding: 10px 20px; /* Add padding */
	font-size: 14px; /* Adjust font size */
	cursor: pointer; /* Pointer cursor on hover */
	border-radius: 4px; /* Rounded corners */
	transition: background-color 0.3s; /* Smooth transition on hover */
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->

	<div class="containerr" id="cv-content">
		<div class="header">
			<input type="file" id="profile-pic-input" class="profile-pic"
				title="Upload profile picture" /> <img id="profile-pic-preview"
				class="profile-pic" style="display: none;" />

			<div>
				<h1 contenteditable="true">NGUYỄN VĂN A</h1>
				<h5 contenteditable="true">Quản Lý Tiếp Thị</h5>
				<div>
					<input class="hidden-input" type="tel"
						placeholder="Enter Phone Number" value="+123 456 7890"> <input
						class="hidden-input" type="email" placeholder="Enter Email"
						value="olivia@email.com"> <input class="hidden-input"
						type="url" placeholder="Enter Portfolio URL"
						value="https://www.oliviaportfolio.com"> <input
						class="hidden-input" type="text" placeholder="Enter Gender"
						value="Female">
				</div>
			</div>
		</div>

		<div class="content">
			<div class="left-column" id="sortable-left">
				<div class="section">
					<h3 class="section-title">Education</h3>
					<ul id="education-list">
						<li><input class="hidden-input" type="text"
							placeholder="Degree">
							<button class="add-button" id="add-education">Thêm
								Trường</button></li>
					</ul>
				</div>

				<div class="section">
					<h3 class="section-title">Languages</h3>
					<ul id="languages-list">
						<li><input class="hidden-input" type="text"
							placeholder="Language">
							<button class="add-button" id="add-language">Thêm Trường</button>
						</li>
					</ul>
				</div>

				<!-- Sở Thích -->
				<div class="section">
					<h3 class="section-title">Sở Thích</h3>
					<ul id="hobbies-list">
						<li><input class="hidden-input" type="text"
							placeholder="Sở thích">
							<button class="add-button" id="add-hobby">Thêm Trường</button></li>
					</ul>
				</div>
			</div>

			<div class="right-column" id="sortable-right">
				<div class="section">
					<h3 class="section-title">Profile</h3>
					<textarea class="hidden-input"
						placeholder="Enter Profile Description" rows="4"
						style="width: 100%;"></textarea>
				</div>

				<div class="section">
					<h3 class="section-title">Work Experience</h3>
					<ul id="experience-list">
						<li><input class="hidden-input project-name" type="text"
							placeholder="Job Title"> <input class="hidden-input"
							type="text" placeholder="Year Range"> <textarea
								class="hidden-input" placeholder="Company" rows="4" style="width: 100%;"></textarea>
							<!-- Thay đổi từ input thành textarea -->
							<button class="add-button" id="add-experience">Thêm
								Trường</button></li>
					</ul>
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

	<script>
	$(document).ready(function() {
	    // Thêm trường Education
	    $('#add-education').click(function() {
	        $('#education-list').children('li').last().before('<li><input class="hidden-input" type="text" placeholder="Degree"></li>');
	    });

	    // Thêm trường Language
	    $('#add-language').click(function() {
	        $('#languages-list').children('li').last().before('<li><input class="hidden-input" type="text" placeholder="Language"></li>');
	    });

	    // Thêm trường Sở Thích
	    $('#add-hobby').click(function() {
	        $('#hobbies-list').children('li').last().before('<li><input class="hidden-input" type="text" placeholder="Sở thích"></li>');
	    });

	    // Thêm trường Work Experience
	    $('#add-experience').click(function() {
	        $('#experience-list').children('li').last().before('<li><input class="hidden-input project-name" type="text" placeholder="Job Title"><input class="hidden-input" type="text" placeholder="Company"><input class="hidden-input" type="text" placeholder="Year Range"></li>');
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
		document.getElementById('profile-pic-input').addEventListener('change', function(event) {
    const file = event.target.files[0];
    const preview = document.getElementById('profile-pic-preview');
    const input = document.getElementById('profile-pic-input');

    if (file) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            preview.style.display = 'block'; // Hiển thị ảnh preview
            preview.src = e.target.result; // Đặt nguồn cho ảnh preview
            input.style.display = 'none'; // Ẩn nút chọn ảnh
        }

        reader.readAsDataURL(file); // Đọc ảnh đã chọn
    }
});
		</script>
</body>
</html>