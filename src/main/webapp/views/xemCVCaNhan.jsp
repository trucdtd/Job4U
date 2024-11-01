<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết CV</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa; /* Màu nền nhạt */
}

.card-header {
	background-color: #007bff; /* Màu xanh */
	color: white; /* Chữ màu trắng */
}

.label {
	font-weight: bold;
	color: #007bff; /* Màu xanh cho các nhãn */
}

.info {
	background-color: #e9ecef; /* Màu nền nhạt cho thông tin */
	padding: 10px;
	border-radius: 5px;
}

/* phần css cv */
.cv-container {
	width: 800px;
	background-color: #ffffff;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	overflow: hidden;
	display: flex;
	padding: 40px;
	gap: 30px;
}

.left-column {
	width: 35%;
	background-color: #f7f7f7;
	padding: 20px;
	border-radius: 15px;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.profile-photo {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	margin-bottom: 20px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

.profile-photo img {
	width: 100%;
	height: auto;
}

.section-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin: 15px 0 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
	border-bottom: 2px solid #333;
	padding-bottom: 5px;
	width: 100%; /* Đặt chiều rộng bằng với phần chứa */
	text-align: center; /* Căn giữa văn bản */
}

.about p, .contact p, .skills ul, .language p {
	font-size: 14px;
	color: #555;
	margin-bottom: 10px;
	line-height: 1.6;
}

.contact, .skills, .language {
	margin-bottom: 20px;
}

.skills ul, .language {
	list-style: none;
	padding-left: 0;
}

.right-column {
	width: 65%;
}

.right-column h1 {
	font-size: 36px;
	font-weight: 700;
	color: #444;
	margin-bottom: 5px;
}

.right-column h2 {
	font-size: 18px;
	font-weight: 500;
	color: #777;
	margin-bottom: 20px;
	letter-spacing: 1px;
}

.experience, .education, .references {
	margin-bottom: 30px;
}

.job, .education-item, .reference-item {
	margin-bottom: 20px;
	padding: 10px 0;
	border-left: 3px solid #888;
	padding-left: 15px;
}

.job h3, .education-item h3, .reference-item h3 {
	font-size: 16px;
	font-weight: 600;
	color: #333;
}

.job span, .education-item span, .reference-item span {
	display: block;
	font-size: 14px;
	color: #888;
	margin-top: 5px;
}

.description {
	font-size: 13px;
	color: #555;
	margin-top: 8px;
	line-height: 1.5;
}

.reference-item p {
	font-size: 13px;
	color: #555;
}

/* Container chính */
.cv-container {
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	padding: 30px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	font-family: 'Helvetica Neue', sans-serif;
	color: #444;
}

.cv-header {
	background-color: #1da868; /* Màu xanh lá nhạt hơn */
	color: #ffffff; /* Màu chữ trắng */
	padding: 20px 0; /* Khoảng cách bên trên và bên dưới */
	margin-bottom: 30px; /* Khoảng cách dưới tiêu đề */
}

.cv-header h2 {
	font-size: 36px;
	margin: 0;
}

.cv-header h4 {
	font-size: 18px;
	font-weight: 400;
	margin-top: 5px;
}
/* Body CV */
.cv-body {
	margin-top: 20px;
}

/* Phần thông tin cá nhân */
.info-grid {
	display: flex; /* Sử dụng flexbox để căn chỉnh */
	align-items: center; /* Căn giữa theo chiều dọc */
	gap: 20px; /* Khoảng cách giữa ảnh và thông tin */
}

.info-details {
	margin-left: 70px; /* Nhích sang bên phải 20px */
}

.photo-container {
	position: relative;
}

.cv-photo {
	width: 100px; /* Chiều rộng của ảnh */
	height: 133px; /* Chiều cao của ảnh */
	border-radius: 5px; /* Bo tròn góc */
	border: 2px solid #4CAF50; /* Đường viền màu xanh */
	object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
	width: 100px; /* Chiều rộng của ảnh */
	height: 133px; /* Chiều cao của ảnh */
	border-radius: 5px; /* Bo tròn góc */
	border: 2px solid #1da868; /* Đường viền màu xanh */
	object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
}

.placeholder-photo {
	width: 100px; /* Chiều rộng của khung placeholder */
	height: 133px; /* Chiều cao của khung placeholder */
	border-radius: 5px; /* Bo tròn góc */
	background-color: #f0f0f0; /* Màu nền cho khung */
	display: flex; /* Để căn giữa hình ảnh trong khung */
	justify-content: center; /* Căn giữa theo chiều ngang */
	align-items: center; /* Căn giữa theo chiều dọc */
	border: 2px solid #4CAF50; /* Đường viền màu xanh */
}

.placeholder {
	width: 50px; /* Kích thước hình ảnh placeholder */
	height: 50px; /* Kích thước hình ảnh placeholder */
	border-radius: 50%; /* Để tạo hình tròn cho placeholder */
	background-color: #a0a0a0; /* Màu nền cho placeholder */
}

/* Các phần khác */
.cv-section {
	margin-bottom: 25px;
}

.cv-section h3 {
	font-size: 20px;
	color: #1da868;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
	padding-bottom: 5px;
}

.info-details {
	flex: 1; /* Để thông tin chiếm toàn bộ không gian còn lại */
}

/* Văn bản trong các phần */
p {
	font-size: 16px;
	line-height: 1.6;
}

/*dùng để di chuyển các class  */
.sortable-ghost {
    opacity: 0.5;
    background-color: #f0f0f0;
}

/* Hiệu ứng khi in */
@media print {
	.cv-container {
		box-shadow: none;
	}
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<div class="container mt-4">
		<%-- <h2 class="text-center mb-4">Chi Tiết CV của ${cv.user.fullname}</h2> --%>
		<!-- <div class="card">
			<div class="card-header bg-success text-white text-center">
				<h5>Thông Tin Ứng Viên</h5>
			</div> -->

		<div class="cv-container" id="cv-content">
			<div class="left-column" id="sortable-left">
			<div class="profile-photo">
					<img src="${pageContext.request.contextPath}/uploads/${cv.image}"
						alt="Ảnh ứng viên" class="cv-photo"
						onerror="this.style.display='none'; document.querySelector('.placeholder-photo').style.display='block';">
					<div class="placeholder-photo" style="display: none;">
						<img src="path/to/placeholder-image.png" alt="Khung ảnh"
							class="placeholder">
					</div>
				</div>
				<div class="about section">
					<div class="section-title">Giới Thiệu</div>
					<p contenteditable="true">${cv.profilesummary}</p>
				</div>
				<div class="contact section">
					<div class="section-title">Liên Hệ</div>
					<p contenteditable="true">📞 ${cv.phonenumbercv}</p>
					<p contenteditable="true">✉️ ${cv.emailcv}</p>
					<p contenteditable="true">Ngày Sinh: ${cv.dateOfbirth}</p>
					<p contenteditable="true">Giới tính: ${cv.gender}</p>
				</div>
				<div class="skills section">
					<div class="section-title">Kỹ Năng</div>
					<ul>
						<li contenteditable="true">${cv.skills}</li>
					</ul>
				</div>
				<div class="language section">
					<div class="section-title">Ngôn Ngữ</div>
					<p contenteditable="true">${cv.languages}</p>
				</div>
			</div>

			<div class="right-column" id="sortable-right">
			<h1 contenteditable="true">${cv.fullnamecv}</h1>
				<div class="experience section">
					<div class="section-title">Kinh Nghiệm Làm Việc</div>
					<div class="job">
						<h3 contenteditable="true">Quản lý Marketing</h3>
						<span>Aerowell Industries | 2022 - 2023</span>
						<p class="description">Lãnh đạo các sáng kiến tiếp thị...</p>
					</div>
				</div>
				<div class="education section">
					<div class="section-title">Học Vấn</div>
					<div class="education-item">
						<h3 contenteditable="true">${cv.education}</h3>
						<span contenteditable="true">Cử nhân Quản trị Kinh doanh | 2019 - 2023</span>
					</div>
				</div>
				<div class="references section">
					<div  contenteditable="true" class="section-title">Người Tham Chiếu</div>
					<div contenteditable="true" class="reference-item">
						<h3 contenteditable="true" >Harumi Kobayashi</h3>
						<span>Saiford & Co. | CEO</span>
						<p>📞 123-456-7890</p>
						<p>✉️ hello@reallygreatsite.com</p>
					</div>
				</div>
			</div>
		</div>


	</div>

<!-- Trạng thái cv ứng tuyển -->
	<br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-3">
				<table id="listCV" class="table table-striped table-sm text-center">
					<thead>
						<tr>
							<th>Trạng Thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cv" items="${cvList}">
							<tr>
								<td><c:choose>
										<c:when test="${cv.status == 0}">Đang chờ</c:when>
										<c:when test="${cv.status == 1}">Được chấp nhận</c:when>
										<c:when test="${cv.status == 2}">Bị từ chối</c:when>
										<c:otherwise>Không xác định</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!-- </div> -->
	<div class="text-center mt-4 mb-4">
		<button class="btn btn-primary" onclick="downloadPDF()">Tải
			CV Dưới Dạng PDF</button>
		<button class="btn btn-success" >Cập nhật</button>
	</div>


	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>

	<script>
	
    function downloadPDF() {
        var element = document.getElementById('cv-content'); // Chọn nội dung form
        var opt = {
            margin: [0.1, 0.5, 0.5, 1], // Lề 1cm ở tất cả các cạnh: trên, phải, dưới, trái
            filename: 'chi-tiet-cv.pdf',
            image: {
                type: 'jpeg',
                quality: 0.98
            },
            html2canvas: {
                scale: 2 // Tăng độ phân giải cho ảnh chụp màn hình
            },
            jsPDF: {
                unit: 'cm', // Đặt đơn vị thành cm
                format: 'a4', // Đặt kích thước trang là A4
                orientation: 'portrait'
            }
        };
        html2pdf().set(opt).from(element).save();
    }						
</script>


	<!--di chuyển các class lớn của form -->
	<script>
	document.addEventListener("DOMContentLoaded", function() {
    // Kích hoạt SortableJS trên left-column
    Sortable.create(document.getElementById('sortable-left'), {
        animation: 150,
        ghostClass: 'sortable-ghost',
        handle: '.section-title' // Chỉ kéo bằng tiêu đề của từng mục
    });

    // Kích hoạt SortableJS trên right-column
    Sortable.create(document.getElementById('sortable-right'), {
        animation: 150,
        ghostClass: 'sortable-ghost',
        handle: '.section-title' // Chỉ kéo bằng tiêu đề của từng mục
    });
});
	
	
	// Tìm tất cả phần tử có thể chỉnh sửa
	document.querySelectorAll('[contenteditable="true"]').forEach(element => {
		element.addEventListener("blur", function() {
			// Khi mất tiêu điểm, lưu dữ liệu
			const updatedContent = this.innerHTML;
			const contentId = this.getAttribute('data-id'); // Tùy chọn, bạn có thể dùng id để nhận dạng phần tử
			console.log(`Nội dung mới của phần tử ${contentId}: ${updatedContent}`);

			// Có thể thực hiện thêm thao tác, ví dụ gửi dữ liệu qua AJAX
		});
	});
	
	
	/* chỉnh sửa dữ liệu của cv khi đã được hiện lên*/
	document.querySelectorAll('[contenteditable="true"]').forEach(element => {
	    element.addEventListener("blur", function() {
	        const updatedContent = this.innerHTML;
	        const contentId = this.getAttribute('data-id');

	        // Gửi dữ liệu qua AJAX hoặc lưu vào một biến
	        console.log(`Nội dung mới của phần tử ${contentId}: ${updatedContent}`);

	        // Ví dụ gửi AJAX (bạn cần cài đặt đường dẫn và method phù hợp)
	        fetch('/updateCv', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json',
	            },
	            body: JSON.stringify({ id: contentId, value: updatedContent }),
	        })
	        .then(response => response.json())
	        .then(data => {
	            console.log('Thành công:', data);
	        })
	        .catch((error) => {
	            console.error('Lỗi:', error);
	        });
	    });
	});

</script>


</body>
</html>
