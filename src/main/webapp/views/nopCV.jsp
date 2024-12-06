<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Thông Tin và Nộp CV</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<style type="text/css">
.file-upload {
	border: 2px dashed #007bff;
	padding: 15px;
	text-align: center;
	color: #007bff;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 5px;
}

.file-upload:hover {
	background-color: #e6f0ff;
}
</style>
</head>
<body>
	<%@ include file="/views/header.jsp"%>
	
	<%@ include file="/views/chat.jsp"%>
	<div class="container mt-5">
		<div class="card shadow">
			<div class="card-header">
				<h5 class="mb-0">Nộp CV của bạn</h5>
			</div>
			<div class="card-body">
				<form id="cvUploadForm" action="/applyCV/${job.jobid}" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label for="cvOptions" class="form-label">Lựa chọn:</label> <select
							id="cvOptions" name="cvOptions" class="form-select" required>
							<option value="null">Chọn một tùy chọn</option>
							<option value="upload">Tải lên file CV mới</option>
							<option value="choose">Chọn CV có sẵn</option>
						</select>
					</div>

					<div class="mb-3" id="uploadFileDiv" style="display: none;">
						<label for="cvFile" class="form-label">Tải lên file CV:</label>
						<div class="file-upload mb-2"
							onclick="document.getElementById('cvFile').click();">
							<i class="bi bi-cloud-arrow-up"></i>
							<p>Kéo thả hoặc chọn file CV</p>
						</div>
						<input type="file" class="form-control d-none" id="cvFile"
							name="cvFile" onchange="displayFileName()">
						<p id="fileName" class="mt-2"></p>
					</div>

					<div class="mb-3" id="existingCvDiv" style="display: none;">
						<label for="existingCv" class="form-label">Chọn CV có sẵn:</label>
						<select id="existingCv" name="id" class="form-select">
							<option value="">Chọn CV</option>
							<c:forEach var="list" items="${listCV}">
								<option value="${list.jobseekerid}">${list.resume}</option>
							</c:forEach>
						</select>
					</div>

					<div class="d-flex justify-content-between">
						<button type="button" class="btn btn-secondary"
							onclick="window.history.back()">Hủy</button>
						<button type="submit" class="btn btn-success">Nộp CV</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
	${script}
	<script>
		document.getElementById('cvOptions').addEventListener(
				'change',
				function() {
					const option = this.value;
					const uploadFileDiv = document
							.getElementById('uploadFileDiv');
					const existingCvDiv = document
							.getElementById('existingCvDiv');

					if (option === 'upload') {
						uploadFileDiv.style.display = 'block';
						existingCvDiv.style.display = 'none';
					} else if (option === 'choose') {
						uploadFileDiv.style.display = 'none';
						existingCvDiv.style.display = 'block';
					} else {
						uploadFileDiv.style.display = 'none';
						existingCvDiv.style.display = 'none';
					}
				});
	</script>
	<script>
		function displayFileName() {
			var fileInput = document.getElementById('cvFile');
			var fileName = document.getElementById('fileName');

			if (fileInput.files.length > 0) {
				fileName.textContent = "File đã chọn: "
						+ fileInput.files[0].name;
			} else {
				fileName.textContent = ""; // Nếu không có file nào được chọn, để trống
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
