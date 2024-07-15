<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<!--link icon gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->
		<div class="row">
			<aside class="col-md-3">
				<h3>Bộ lộc</h3>
				<div class="container mt-4">
					<form>
						<div class="row mb-3">
							<div class="col-md-12">
								<label class="form-label">Công việc</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="developer"
										name="job" value="developer"> <label
										class="form-check-label" for="developer"> Developer </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="designer"
										name="job" value="designer"> <label
										class="form-check-label" for="designer"> Designer </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="manager"
										name="job" value="manager"> <label
										class="form-check-label" for="manager"> Manager </label>
								</div>
							</div>
							<div class="col-md-12">
								<label class="form-label">Mức lương</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="salary1"
										name="salary" value="500-1000"> <label
										class="form-check-label" for="salary1"> 500-1000 USD </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="salary2"
										name="salary" value="1000-2000"> <label
										class="form-check-label" for="salary2"> 1000-2000 USD
									</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="salary3"
										name="salary" value="2000+"> <label
										class="form-check-label" for="salary3"> 2000+ USD </label>
								</div>
							</div>
							<div class="col-md-12">
								<label class="form-label">Kinh nghiệm</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="exp1"
										name="experience" value="0-2"> <label
										class="form-check-label" for="exp1"> 0-2 năm </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="exp2"
										name="experience" value="2-5"> <label
										class="form-check-label" for="exp2"> 2-5 năm </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="exp3"
										name="experience" value="5+"> <label
										class="form-check-label" for="exp3"> 5+ năm </label>
								</div>
							</div>
						</div>
						<button type="submit" class="btn btn-primary">Tìm kiếm</button>
					</form>
				</div>
			</aside>

			<article class="col-md-9">
				<!-- danh sách việc làm -->
				<%@ include file="/views/danhSachViecLam.jsp"%>
				<!-- /danh sách việc làm -->
			</article>
		</div>

		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- /footer -->
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>