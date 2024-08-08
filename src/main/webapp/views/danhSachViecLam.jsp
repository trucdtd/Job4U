<%@ page language="java" contentType="text/html; charset=UTF-8">
	pageEncoding="UTF-8"%>
<!-- Prefix sử dụng JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Việc Làm</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="">
/* Đảm bảo hình ảnh luôn có chiều cao và chiều rộng cố định */
.card-body img {
	height: 150px;
	width: 100%;
	object-fit: cover; /* Đảm bảo ảnh bao phủ toàn bộ khung */
}
</style>
</head>
<body>
	<section style="background-color: #eee;">
		<div class="container py-4">
			<div class="row justify-content-center">
				<c:forEach var="job" items="${dsSP.content}">
					<div class="col-md-12 col-xl-10 mb-4">
						<div class="card shadow-0 border rounded-3">
							<div class="card-body">
								<div class="row">
									<div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
										<div class="bg-image hover-zoom ripple rounded ripple-surface">
											<img src="${job.employer.logo}" class="w-100" /> <a
												href="#!">
												<div class="hover-overlay">
													<div class="mask"
														style="background-color: rgba(253, 253, 253, 0.15);"></div>
												</div>
											</a>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-6">
										<h5>Tên công ty: ${job.employer.companyname}</h5>
										<div class="d-flex flex-row">
											<div class="text-danger mb-1 me-2">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i>
											</div>
										</div>
										<div class="mt-1 mb-0 text-muted small">
											<span><i class="bi bi-dot"></i> ${job.jobtitle}</span> <span><i
												class="bi bi-dot"></i> ${job.employer.industry}</span>
										</div>
										<p class="text-truncate mb-4 mb-md-0">Mô tả:
											${job.jobdescription}</p>
									</div>
									<div
										class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
										<div class="d-flex flex-row align-items-center mb-1">
											<h4 class="mb-1 me-1"><i class="fas fa-dollar-sign"></i> ${job.salary}
											</h4>
										</div>
										<div class="d-flex flex-column mt-4">
											<button data-mdb-button-init data-mdb-ripple-init
												class="btn btn-primary btn-sm" type="button">Ứng
												tuyển</button>
											<a href="/job4u/chiTiet/${job.jobid}"
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
	<div class="row col-12 justify-content-center">
		<div class="btn-group" role="group" aria-label="Basic example">
			<button type="button" class="btn m-4 text-light"
				style="background: #00688B" onclick="paging(0)">Đầu</button>
			<button type="button" class="btn m-4 text-light"
				style="background: #00688B"
				onclick="paging(${dsSP.pageable.pageNumber-1 >= 0 ? dsSP.pageable.pageNumber-1 : 0 })">Trước</button>
			<button type="button" class="btn m-4 text-light"
				style="background: #00688B"
				onclick="paging(${dsSP.pageable.pageNumber+1 < dsSP.totalPages ? dsSP.pageable.pageNumber+1 : dsSP.totalPages-1 })">Kế</button>
			<button type="button" class="btn m-4 text-light"
				style="background: #00688B" onclick="paging(${dsSP.totalPages-1 })">Cuối</button>
		</div>
	</div>
	<script>
        /* http://localhost:8080/sanpham?page=1 */
        var url = new URL(window.location.href);
        function paging(page){
            if(url.toString().includes("page")){
                url.searchParams.set('page', page);
            } else {
                url.searchParams.append('page', page);
            }
            window.location.href = url;
        }
    </script>
</body>
</html>
