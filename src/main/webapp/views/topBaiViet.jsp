<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhà Tuyển Dụng Hàng Đầu</title>
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- Bootstrap CSS v5.3.2 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.carousel-control-prev,
.carousel-control-next,
.carousel-indicators {
	display: block; /* Hiển thị các nút điều hướng và chỉ báo */
}

.card-title {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.card-body {
	height: 100px; /* Đặt chiều cao cố định cho phần nội dung */
}

.card-footer {
	display: flex;
	justify-content: space-between; /* Căn giữa phần tử trong footer */
}

.card:hover {
	transform: scale(1.05);
	transition: all 0.3s ease-in-out; /* Thêm hiệu ứng khi hover */
}
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2 class="h4 mb-4 mt-2 text-uppercase text-center font-weight-bold blue-hover">
					Bài Tuyển Dụng Hàng Đầu</h2>
			</div>
		</div>
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000"> <!-- Chuyển đổi mỗi 5 giây -->
			<div class="carousel-inner">
				<c:forEach var="job" items="${latestJobs}" varStatus="status">
					<c:if test="${status.index % 4 == 0}"> <!-- Mỗi slide có 4 thẻ card -->
						<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
							<div class="row">
					</c:if>
					<div class="col-md-3"> <!-- 4 card trong một slide -->
						<div class="card shadow-sm rounded-3">
                            <div class="card-body d-flex align-items-start">
                                <div class="bg-image">
									<img src="${pageContext.request.contextPath}/uploads/${job.employer.logo}"
										alt="logo" class="img-fluid"
										style="width: 70px; height: 70px; object-fit: cover;">
								</div>
								<i class="bi bi-star-fill text-warning"></i>
                                <div class="flex-grow-1">
                                    <h6 class="text-center">${job.jobtitle}</h6> 
                                    <p class="text-center">${job.employer.companyname}</p>
                                </div>
                            </div>
                            <div class="card-footer">
                                <span class="text-success font-weight-bold">${job.salary}</span>
                                <a href="${pageContext.request.contextPath}/chiTiet/${job.jobid}" class="btn btn-outline-success btn-sm">
									Thông tin chi tiết
								</a>
                            </div>
                        </div>
					</div>

					<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<!-- Các nút điều hướng cho carousel -->
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<!-- Bootstrap JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-sTzI3U4kso4ZzRDv0A0qYVkAAB0iOSc11vj8D7wJ9z8OmQW0KvU4y2F2IZ5jIV30" crossorigin="anonymous"></script>
</body>
</html>
