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
			<div class="cv-header text-center">
				<h2>${cv.user.fullname}</h2>
				<h4>Curriculum Vitae</h4>
			</div>

			<div class="cv-body">
				<div class="cv-section">
					<h3>Thông Tin Cá Nhân</h3>
					<div class="info-grid">
						<div class="photo-container">
							<img src="" alt="Ảnh ứng viên" class="cv-photo"
								onerror="this.style.display='none'; document.querySelector('.placeholder-photo').style.display='block';">
							<div class="placeholder-photo" style="display: none;">
								<img src="path/to/placeholder-image.png" alt="Khung ảnh"
									class="placeholder">
							</div>
						</div>
						<div class="info-details">
							<%--  <div><strong>Tên:</strong> ${cv.user.fullname}</div> --%>
							<div>
								<strong>Giới Tính:</strong> ${cv.gender}
							</div>
							<div>
								<strong>Ngày Sinh:</strong> ${cv.dateOfbirth}
							</div>
							<div>
								<strong>Email:</strong> ${cv.user.email}
							</div>
						</div>
					</div>
				</div>

				<div class="cv-section">
					<h3>Tóm Tắt Hồ Sơ</h3>
					<p>${cv.profilesummary}</p>
				</div>

				<div class="cv-section">
					<h3>Kinh Nghiệm</h3>
					<p>${cv.experience}</p>
				</div>

				<div class="cv-section">
					<h3>Học Vấn</h3>
					<p>${cv.education}</p>
				</div>

				<div class="cv-section">
					<h3>Kỹ Năng</h3>
					<p>${cv.skills}</p>
				</div>

				<div class="cv-section">
					<h3>Chứng Chỉ</h3>
					<p>${cv.certifications}</p>
				</div>

				<div class="cv-section">
					<h3>Ngôn Ngữ</h3>
					<p>${cv.languages}</p>
				</div>

				<div class="cv-section">
					<h3>Sở Thích</h3>
					<p>${cv.interests}</p>
				</div>
			</div>

		</div>

		<!-- </div> -->
		<div class="text-center mt-4 mb-4">
		<button  class="btn btn-primary" onclick="acceptApplication(${application.applicationid})">Chấp nhận</button>
    	<button class="btn btn-danger" onclick="rejectApplication(${application.applicationid})">Từ Chối</button>
		<button class="btn btn-primary" onclick="downloadPDF()">Tải
				CV Dưới Dạng PDF</button>
		</div>

	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
	<script>
		function downloadPDF() {
			var element = document.getElementById('cv-content'); // Chọn nội dung form
			var opt = {
				margin : 1,
				filename : 'chi-tiet-cv.pdf',
				image : {
					type : 'jpeg',
					quality : 0.98
				},
				html2canvas : {
					scale : 1
				},
				jsPDF : {
					unit : 'in',
					format : 'letter',
					orientation : 'portrait'
				}
			};
			html2pdf().set(opt).from(element).save();
		}						
	</script>
	
   <script>
   function acceptApplication(applicationId) {
	    fetch(`/cvDetails/${applicationId}/accept`, {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	            'X-Requested-With': 'XMLHttpRequest'
	        }
	    })
	    .then(response => {
	        if (response.ok) {
	            alert('Chấp nhận đơn ứng tuyển thành công!');
	            window.location.reload();
	        } else {
	            alert('Có lỗi xảy ra khi chấp nhận đơn ứng tuyển!');
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('Có lỗi xảy ra khi chấp nhận đơn ứng tuyển!');
	    });
	}

   function rejectApplication(applicationId) {
	    fetch(`/cvDetails/${applicationId}/reject`, {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	            'X-Requested-With': 'XMLHttpRequest'
	        }
	    })
	    .then(response => {
	        if (response.ok) {
	            alert('Đã từ chối đơn ứng tuyển!');
	            window.location.reload();
	        } else {
	            alert('Có lỗi xảy ra khi từ chối đơn ứng tuyển!');
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('Có lỗi xảy ra khi từ chối đơn ứng tuyển!');
	    });
	}
    </script>


</body>
</html>
