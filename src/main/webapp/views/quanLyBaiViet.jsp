<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="/css/thongke.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<%@ include file="/views/chat.jsp"%>
	<!-- header -->
	<div id="postManagement" class="card p-2" style="display: none;">
		<div class="card-header">
			<div class="card-title">Quản Lý Bài Viết</div>
		</div>
		<div class="card-body p-0">
			<form id="deleteForm" action="/admin/deletePost" method="POST"
				style="display: none;">
				<input type="hidden" name="id" id="deleteId">
			</form>

			<div class="table-responsive">
				<table id="postTable" class="table align-items-center mb-0">
					<thead class="thead-light">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Tên Công Ty</th>
							<th scope="col">Tiêu Đề</th>
							<th scope="col">Tên Ngành</th>
							<th scope="col">Lương</th>
							<th scope="col">Trạng Thái</th>
							<th scope="col">Hành Động</th>


						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qlBV}" var="bv">
							<tr>
								<th scope="row">${bv.jobid}</th>
								<td>${bv.employer.companyname}</td>
								<td>${bv.jobtitle}</td>
								<%-- <td>${bv.joblocation}</td> --%>
								<td>${bv.jobdescription}</td>
								<td><c:choose>
										<c:when test="${bv.salary != null}">
											<span style="display: inline-flex; align-items: center;">
												${bv.salary.toString().replaceAll("(\\d)(?=(\\d{3})+(?!\\d))", "$1,")}
												VND </span>
										</c:when>
									</c:choose></td>

								<td>${bv.active ? 'Đang hoạt động' : 'Đang ẩn'}</td>

								<td>
									<div style="display: flex; align-items: center; gap: 10px;">
										<a href="/admin/detailPost/${bv.jobid}" class="btn"
											type="button" title="Xem Chi Tiết"> <img
											src="/img/detail-icon.png" style="padding-bottom: 7px;"
											width="25px" height="30px" alt="Detail">
										</a> <a href="#" onclick="return confirmDelete(${bv.jobid});"
											title="Xóa"> <img src="/img/delete-icon.png"
											style="padding-bottom: 7px;" width="25px" height="30px"
											alt="Delete">
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
</body>
</html>