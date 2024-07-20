<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà tuyển dụng</title>
<!--link icon gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	display: flex;
	min-height: 100vh;
	margin: 0;
}

.sidebar {
	min-width: 250px;
	max-width: 250px;
	background-color: #00688B;
	padding: 20px 0;
	color: white;
}

.sidebar a {
	color: white;
	text-decoration: none;
	padding: 10px 20px;
	display: block;
}

.sidebar a:hover {
	background-color: #0056b3; /* Màu xanh dương đậm hơn khi hover */
}

.content {
	flex-grow: 1;
	padding: 20px;
	background-color: #f8f9fa; /* Màu nền cho khu vực nội dung */
	display: none; /* Ẩn tất cả các phần nội dung */
}

.content.active {
	display: block; /* Hiển thị phần nội dung được chọn */
}
</style>
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->

		<div class="row">
			<aside class="col-md-3">
				<div class="sidebar">
					<a class="navbar-brand mb-3" href="#">Quản Lý Tuyển Dụng</a> <a
						href="javascript:void(0);" class="nav-link"
						onclick="showContent('page1')">Đăng bài tuyển dụng</a> <a
						href="javascript:void(0);" class="nav-link"
						onclick="showContent('page2')">CV ứng tuyển</a> <a
						href="javascript:void(0);" class="nav-link"
						onclick="showContent('page3')">Bài tuyển dụng</a> <a
						href="javascript:void(0);" class="nav-link"
						onclick="showContent('page4')">Dịch vụ bài đăng</a>
				</div>
			</aside>

			<article class="col-md-9">
				<!-- đăng bài tuyển dụng -->
				<div class="content" id="page1">
					<div class="container mt-5">
						<h1 class="text-center mb-3">Đăng bài tuyển dụng</h1>
						<form action="" method="post">
							<div class="mb-3">
								<label for="companyName" class="form-label">Tên công ty</label>
								<input type="text" class="form-control" id="companyName"
									name="companyName" required>
							</div>

							<div class="mb-3">
								<label for="CompanyWebsite" class="form-label">Tên web
									công ty</label> <input type="text" class="form-control"
									id="CompanyWebsite" name="CompanyWebsite">
							</div>

							<div class="mb-3">
								<label for="Address" class="form-label">Địa chỉ công ty
								</label> <input type="text" class="form-control" id="Address"
									name="Address">
							</div>

							<div class="mb-3">
								<label for="Industry" class="form-label">Ngành nghề</label> <select
									class="form-control" id="Industry" name="Industry" required>
									<option value="" disabled selected>Chọn ngành nghề</option>
									<option value="agriculture">Nông nghiệp</option>
									<option value="industry">Công nghiệp</option>
									<option value="services">Dịch vụ</option>
									<option value="construction">Xây dựng</option>
									<option value="transportation">Giao thông vận tải</option>
									<option value="it">Công nghệ thông tin</option>
									<option value="finance">Tài chính</option>
									<option value="education">Giáo dục</option>
									<option value="healthcare">Y tế</option>
									<option value="media">Truyền thông</option>
									<option value="automotive-technology">Công nghệ ô tô</option>
									<option value="tourism">Du lịch</option>
									<option value="office">Hành chính văn phòng</option>
									<option value="other">Khác...</option>
								</select>
							</div>

							<div class="mb-3">
								<label for="CompanyDescription" class="form-label">Mô tả
									công ty</label>
								<textarea class="form-control" id="CompanyDescription"
									name="CompanyDescription" rows="4"></textarea>
							</div>

							<div class="mb-3">
								<label for="jobTitle" class="form-label">Tiêu đề công
									việc</label> <input type="text" class="form-control" id="jobTitle"
									name="jobTitle" required>
							</div>

							<div class="mb-3">
								<label for="jobDescription" class="form-label">Mô tả
									công việc</label>
								<textarea class="form-control" id="jobDescription"
									name="jobDescription" rows="4" required></textarea>
							</div>

							<div class="mb-3">
								<label for="jobRequirements" class="form-label">Yêu cầu
									công việc</label>
								<textarea class="form-control" id="jobRequirements"
									name="jobRequirements" rows="4" required></textarea>
							</div>

							<div class="mb-3">
								<label for="jobLocation" class="form-label">Địa điểm làm
									việc</label> <input type="text" class="form-control" id="jobLocation"
									name="jobLocation" required>
							</div>

							<div class="mb-3">
								<label for="salary" class="form-label">Lương</label> <input
									type="number" class="form-control" id="salary" name="salary">
							</div>

							<div class="mb-3">
								<label for="jobType" class="form-label">Loại công việc</label> <input
									type="text" class="form-control" id="jobType" name="jobType"
									required>
							</div>

							<div class="mb-3">
								<label for="postedDate" class="form-label">Ngày đăng</label> <input
									type="datetime-local" class="form-control" id="postedDate"
									name="postedDate" required>
							</div>

							<div class="mb-3">
								<label for="applicationDeadline" class="form-label">Hạn
									nộp hồ sơ</label> <input type="datetime-local" class="form-control"
									id="applicationDeadline" name="applicationDeadline" required>
							</div>

							<button type="submit" class="btn text-light"
								style="background-color: #00688B">Đăng bài</button>
						</form>
					</div>
				</div>
				<!-- /đăng bài tuyển dụng -->

				<!-- cv -->
				<div class="content" id="page2">
					<div class="container mt-5">
						<h1>CV</h1>
						<!-- Nội dung cho phần CV -->
					</div>
				</div>
				<!-- /cv -->

				<!-- bài tuyển dụng -->
				<div class="content" id="page3">
					<div class="container mt-5">
						<h1>Bài tuyển dụng</h1>
						<!-- Nội dung cho phần Bài tuyển dụng -->
					</div>
				</div>
				<!-- /bài tuyển dụng -->

				<!-- dịch vụ bài đăng -->
				<div class="content" id="page4">
					<div class="container mt-5">
						<h1>Dịch vụ bài đăng</h1>
						<!-- Nội dung cho phần Dịch vụ bài đăng -->
					</div>
				</div>
				<!-- /dịch vụ bài đăng -->
			</article>
		</div>
		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- /footer -->
	</div>

	<script>
function showContent(pageId) {
    // Ẩn tất cả các phần nội dung
    const contents = document.querySelectorAll('.content');
    contents.forEach(content => {
        content.classList.remove('active');
    });

    // Hiển thị phần nội dung được chọn
    const selectedContent = document.getElementById(pageId);
    if (selectedContent) {
        selectedContent.classList.add('active');
    }
}

document.addEventListener('DOMContentLoaded', () => {
    // Hiển thị mặc định trang đầu tiên
    showContent('page1');
});
</script>
</body>
</html>
