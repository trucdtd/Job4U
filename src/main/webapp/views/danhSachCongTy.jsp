<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Công ty</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.pagination-container {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 20px 0;
}

.pagination-btn {
	background: none;
	border: none;
	color: #007bff;
	font-size: 16px;
	margin: 0 10px;
	cursor: pointer;
}

.pagination-btn:disabled {
	color: #cccccc;
	cursor: not-allowed;
}

.pagination-btn:hover:not(:disabled) {
	text-decoration: underline;
}

.pagination-number {
	background: none;
	border: none;
	color: #007bff;
	font-size: 16px;
	margin: 0 5px;
	cursor: pointer;
}

.pagination-number.active {
	background-color: #007bff;
	color: white;
	border-radius: 50%;
	padding: 5px 10px;
}

.pagination-number:hover {
	text-decoration: underline;
}

.navfind {
    display: flex;
    flex-direction: column; /* Đặt chiều dọc */
    align-items: center; /* Căn giữa */
}

.search-form {
    width: 100vw;
    background-color: #24b874;
    padding: 5px;
    border-radius: 5px;
    box-sizing: border-box;
    height: 100px;
    margin-bottom: 5px; /* Thêm khoảng cách dưới thanh tìm kiếm */
}

</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- /header -->
	<!-- Thanh tìm kiếm chính -->
	<div class="container-fluid navfind">
		<nav class="search-form">
			<div class="container">
				<!-- Chỉnh sửa mt-4 thành mt-0 -->
				<form action="/job4u/findJob" method="GET" class="col-md-12">
					<div class="d-flex align-items-center gap-3">
						<!-- Tiêu đề công việc -->
						<div class="flex-fill mb-3">
							<label class="form-label" for="jobtitle">Vị trí tuyển
								dụng</label> <input type="text" class="form-control rounded-3"
								id="jobtitle" name="jobtitle" placeholder="Tất cả">
						</div>

						<!-- Ngành nghề -->
						<div class="flex-fill mb-3">
							<label class="form-label" for="industry">Ngành nghề</label> <select
								class="form-select rounded-3" id="industry" name="industry">
								<option value="" selected>Chọn ngành nghề</option>
								<option value="Nông nghiệp">Nông nghiệp</option>
								<option value="Công nghiệp">Công nghiệp</option>
								<option value="Dịch vụ">Dịch vụ</option>
								<option value="Công nghệ thông tin">Công nghệ thông tin</option>
								<option value="Công nghệ ô tô">Công nghệ ô tô</option>
								<option value="Xây dựng">Xây dựng</option>
								<option value="Giao thông vận tải">Giao thông vận tải</option>
								<option value="Ngân hàng và Tài chính">Ngân hàng và Tài
									chính</option>
								<option value="Giáo dục">Giáo dục</option>
								<option value="Y tế">Y tế</option>
								<option value="Truyền thông">Truyền thông</option>
								<option value="Du lịch">Du lịch</option>
								<option value="Hành chính văn phòng">Hành chính văn
									phòng</option>
								<option value="Khác">Khác...</option>
							</select>
						</div>

						<!-- Tỉnh/Thành phố -->
						<div class="flex-fill mb-3">
							<label class="form-label" for="joblocation">Tỉnh/Thành
								phố</label> <select class="form-select rounded-3" id="joblocation"
								name="joblocation">
								<option value="All" selected>Tất cả</option>
								<option value="An Giang">An Giang</option>
								<option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
								<option value="Bạc Liêu">Bạc Liêu</option>
								<option value="Bắc Giang">Bắc Giang</option>
								<option value="Bắc Kạn">Bắc Kạn</option>
								<option value="Bắc Ninh">Bắc Ninh</option>
								<option value="Bến Tre">Bến Tre</option>
								<option value="Bình Định">Bình Định</option>
								<option value="Bình Dương">Bình Dương</option>
								<option value="Bình Phước">Bình Phước</option>
								<option value="Bình Thuận">Bình Thuận</option>
								<option value="Cà Mau">Cà Mau</option>
								<option value="Cao Bằng">Cao Bằng</option>
								<option value="Cần Thơ">Cần Thơ</option>
								<option value="Đà Nẵng">Đà Nẵng</option>
								<option value="Đắk Lắk">Đắk Lắk</option>
								<option value="Đắk Nông">Đắk Nông</option>
								<option value="Điện Biên">Điện Biên</option>
								<option value="Đồng Nai">Đồng Nai</option>
								<option value="Đồng Tháp">Đồng Tháp</option>
								<option value="Gia Lai">Gia Lai</option>
								<option value="Hà Giang">Hà Giang</option>
								<option value="Hà Nam">Hà Nam</option>
								<option value="Hà Nội">Hà Nội</option>
								<option value="Hà Tĩnh">Hà Tĩnh</option>
								<option value="Hải Dương">Hải Dương</option>
								<option value="Hải Phòng">Hải Phòng</option>
								<option value="Hậu Giang">Hậu Giang</option>
								<option value="Hòa Bình">Hòa Bình</option>
								<option value="Hưng Yên">Hưng Yên</option>
								<option value="Khánh Hòa">Khánh Hòa</option>
								<option value="Kiên Giang">Kiên Giang</option>
								<option value="Kon Tum">Kon Tum</option>
								<option value="Lai Châu">Lai Châu</option>
								<option value="Lâm Đồng">Lâm Đồng</option>
								<option value="Lạng Sơn">Lạng Sơn</option>
								<option value="Lào Cai">Lào Cai</option>
								<option value="Long An">Long An</option>
								<option value="Nam Định">Nam Định</option>
								<option value="Nghệ An">Nghệ An</option>
								<option value="Ninh Bình">Ninh Bình</option>
								<option value="Ninh Thuận">Ninh Thuận</option>
								<option value="Phú Thọ">Phú Thọ</option>
								<option value="Phú Yên">Phú Yên</option>
								<option value="Quảng Bình">Quảng Bình</option>
								<option value="Quảng Nam">Quảng Nam</option>
								<option value="Quảng Ngãi">Quảng Ngãi</option>
								<option value="Quảng Ninh">Quảng Ninh</option>
								<option value="Quảng Trị">Quảng Trị</option>
								<option value="Sóc Trăng">Sóc Trăng</option>
								<option value="Sơn La">Sơn La</option>
								<option value="Tây Ninh">Tây Ninh</option>
								<option value="Thái Bình">Thái Bình</option>
								<option value="Thái Nguyên">Thái Nguyên</option>
								<option value="Thanh Hóa">Thanh Hóa</option>
								<option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
								<option value="Tiền Giang">Tiền Giang</option>
								<option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
								<option value="Trà Vinh">Trà Vinh</option>
								<option value="Tuyên Quang">Tuyên Quang</option>
								<option value="Vĩnh Long">Vĩnh Long</option>
								<option value="Vĩnh Phúc">Vĩnh Phúc</option>
								<option value="Yên Bái">Yên Bái</option>
							</select>
						</div>

						<!-- Nút tìm kiếm -->
						<div class="mt-3">
							<button type="submit" class="btn btn-success rounded-3">
								<i class="bi bi-search"></i> Tìm kiếm
							</button>
						</div>
					</div>
				</form>
			</div>
		</nav>
		<div class="container mt-4">
			<div class="row">
				<c:forEach var="emp" items="${dsCTy.content}">
					<div class="col-4 mb-4">
						<!-- Mỗi hàng sẽ có 3 card -->
						<div class="card shadow-sm rounded-3 h-100">
							<!-- Sử dụng h-100 để card có chiều cao cố định -->
							<div class="bg-image">
								<img
									src="${pageContext.request.contextPath}/uploads/${emp.logo}"
									alt="logo" class="img-fluid"
									style="object-fit: cover; height: 150px; width: 100%;">
							</div>
							<div class="card-body d-flex flex-column align-items-start">
								<h5 class="card-title">${emp.companyname}</h5>
								<p class="text-muted">${emp.companywebsite}</p>
								<p class="card-text">${emp.companydescription}</p>
								<p class="card-text">${emp.address}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<c:if test="${dsCTy.totalPages > 0}">
			<div class="pagination-container">
				<button class="pagination-btn"
					onclick="paging(${dsCTy.pageable.pageNumber - 1})"
					${dsCTy.pageable.pageNumber == 0 ? 'disabled' : ''}>←
					Trước</button>
				<div class="page-numbers">
					<c:forEach begin="0" end="${dsCTy.totalPages - 1}" var="i">
						<button
							class="pagination-number ${i == dsCTy.pageable.pageNumber ? 'active bg-success text-white' : ''}"
							onclick="paging(${i})">${i + 1}</button>
					</c:forEach>
				</div>
				<button class="pagination-btn"
					onclick="paging(${dsCTy.pageable.pageNumber + 1})"
					${dsCTy.pageable.pageNumber == dsCTy.totalPages - 1 ? 'disabled' : ''}>Sau
					→</button>
			</div>
		</c:if>

		<div class="mt-4">
			<!-- footer -->
			<%@ include file="/views/footer.jsp"%>
			<!-- /footer -->
		</div>

		<script>
        function paging(page) {
            var url = new URL(window.location.href);
            url.searchParams.set('page', page);
            window.location.href = url;
        }
    </script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>