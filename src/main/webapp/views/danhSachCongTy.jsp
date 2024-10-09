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
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- /header -->
	<div class="container mt-4">
		<div class="row">
			<c:forEach var="emp" items="${dsCTy.content}">
				<div class="col-4 mb-4">
					<!-- Mỗi hàng sẽ có 3 card -->
					<div class="card shadow-sm rounded-3 h-100">
						<!-- Sử dụng h-100 để card có chiều cao cố định -->
						<div class="bg-image">
							<img src="${pageContext.request.contextPath}/uploads/${emp.logo}"
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
				${dsCTy.pageable.pageNumber == 0 ? 'disabled' : ''}>← Trước</button>
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