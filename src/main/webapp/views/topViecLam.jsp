<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top Việc Làm</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.top-jobs-container {
	background-color: #f8f9fa;
	padding: 15px;
	border-radius: 5px;
	margin-bottom: 20px;
}

.top-job-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #007bff;
}

.top-job-item {
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}

.top-job-item:last-child {
	border-bottom: none;
}

.top-job-item h5 {
	margin: 0;
}

.top-job-item p {
	margin: 5px 0;
	color: #555;
}

.pagination-container {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 20px;
}

.pagination-btn, .pagination-number {
	background: none;
	border: none;
	color: #007bff;
	font-size: 16px;
	margin: 0 5px;
	cursor: pointer;
}

.pagination-btn:disabled {
	color: #cccccc;
	cursor: not-allowed;
}

.pagination-number.active {
	background-color: #007bff;
	color: white;
	border-radius: 50%;
	padding: 5px 10px;
}

.pagination-number:hover:not(.active) {
	text-decoration: underline;
}
</style>
</head>
<body>
	<!-- Include header -->
	<%@ include file="/views/header.jsp"%>

	<!-- Include top employers -->
	<%-- <%@ include file="/views/nhaTuyenDungHangDau.jsp"%> --%>

	<!-- Top Jobs Section -->
	<c:if test="${not empty topJobs}">
		<div class="container">
			<div class="top-jobs-container">
				<div class="top-job-title">Top Công Việc</div>
				<c:forEach var="job" items="${topJobs}">
					<div class="top-job-item">
						<h5>${job.title}</h5>
						<p>Công ty: ${job.employer.companyname}</p>
						<p>Địa điểm: ${job.location}</p>
						<a href="/job4u/chiTiet/${job.jobid}"
							class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>

	<!-- Main Job List Section -->
	<section style="background-color: #eee;">
		<div class="container py-4">
			<div class="row justify-content-center">
				<h4 class="mb-4">Danh Sách Việc Làm</h4>
				<c:forEach var="job" items="${list}">
					<div class="col-md-12 col-xl-10 mb-4">
						<div class="card shadow-0 border rounded-3">
							<div class="card-body">
								<div class="row">
									<div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
										<div class="bg-image hover-zoom ripple rounded ripple-surface">
											<img src="${jobemployer.logo}" class="w-100"
												alt="${job.employer.companyname}" />
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-6">
										<h5>${job.employer.companyname}</h5>
										<p class="text-truncate mb-4 mb-md-0">Mô tả:
											${job.jobdescription}</p>
									</div>
									<div
										class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
										<div class="d-flex flex-column mt-4">
											<a href="/applyCV" class="btn btn-primary btn-sm">Ứng
												tuyển</a> <a href="/job4u/chiTiet/${job.jobid}"
												class="btn btn-outline-primary btn-sm mt-2">Thông tin
												chi tiết</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- Pagination -->
	<c:if test="${dsSP.totalPages > 1}">
		<div class="pagination-container">
			<button class="pagination-btn"
				onclick="paging(${dsSP.pageable.pageNumber - 1})"
				${dsSP.pageable.pageNumber == 0 ? 'disabled' : ''}>← Trước</button>
			<div class="page-numbers">
				<c:forEach begin="0" end="${dsSP.totalPages - 1}" var="i">
					<button
						class="pagination-number ${i == dsSP.pageable.pageNumber ? 'active' : ''}"
						onclick="paging(${i})">${i + 1}</button>
				</c:forEach>
			</div>
			<button class="pagination-btn"
				onclick="paging(${dsSP.pageable.pageNumber + 1})"
				${dsSP.pageable.pageNumber == dsSP.totalPages - 1 ? 'disabled' : ''}>Sau
				→</button>
		</div>
	</c:if>

	<!-- Include footer -->
	<%@ include file="/views/footer.jsp"%>

	<script>
        function paging(page) {
            var url = new URL(window.location.href);
            url.searchParams.set('page', page);
            window.location.href = url;
        }
    </script>
</body>
</html>
