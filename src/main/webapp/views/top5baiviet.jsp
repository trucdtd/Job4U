<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà Tuyển Dụng Hàng Đầu</title>
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- Bootstrap CSS v5.3.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.image-container {
	width: 100%;
	height: 50vh;
	overflow: hidden;
	position: relative;
}

.image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	top: 0;
	left: 0;
}

</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2
					class="h4 mb-4 mt-2 text-uppercase text-center font-weight-bold blue-hover">
					Bài Tuyển Dụng Hàng Đầu</h2>
			</div>
		</div>
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<c:forEach var="job" items="${latestJobs}" varStatus="status">
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="${status.index / 4}"
						class="${status.index == 0 ? 'active' : ''}"
						aria-current="${status.index == 0 ? 'true' : 'false'}"
						aria-label="Slide ${status.index / 4 + 1}"></button>
				</c:forEach>
			</div>
			<div class="carousel-inner">
				<c:forEach var="job" items="${latestJobs}" varStatus="status">
					<c:if test="${status.index % 4 == 0}">
						<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
							<div class="row">
					</c:if>
					<div class="col-md-3">
						<div class="card shadow-sm rounded-3">
                            <div class="card-body d-flex align-items-start">
                                <div class="flex-grow-1">

                                    <h5 class="card-title text-center">${job.jobtitle}</h5>
                                    <p class="text-muted text-center">${job.employer.companyname}</p>
                                    
                                </div>
                            </div>
                            <div class="card-footer">
                                <span class="text-success font-weight-bold">${job.salary}</span>
                                <a href="/chiTiet/${job.jobid}" class="btn btn-outline-success btn-sm">Thông tin chi tiết</a>
                            </div>
                        </div>
					</div>

					<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
	</div>
	</div>
	<!-- Bootstrap JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-sTzI3U4kso4ZzRDv0A0qYVkAAB0iOSc11vj8D7wJ9z8OmQW0KvU4y2F2IZ5jIV30"
		crossorigin="anonymous"></script>
</body>
</html>
