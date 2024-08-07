<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- header -->

		<div class="container">
			<div class="row">
				<%@ include file="/views/menuAdmin.jsp"%>
				<div class="col-lg-9 col-md-9 ">
					<div class="card" style="display: none;">
						<div class="card-header">
							<div class="card-title">Quản Lý Bài Viết</div>
						</div>
						<div class="card-body p-0">
							<form action="/user/detail" method="POST">
								<div class="table-responsive">
									<table class="table align-items-center mb-0">
										<thead class="thead-light">
											<tr>
												<th scope="col">EmployerID</th>
												<th scope="col">Company Name</th>
												<th scope="col">JobTitle</th>
												<th scope="col">Job Requirenments</th>
												<th scope="col">Job Location</th>
												<th scope="col">Industry</th>
												<th scope="col">Salary</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${qlBV}" var="bv">
												<tr>
													<th scope="row">${bv.jobid}</th>
													<td>${bv.employer.companyname}</td>
													<td>${bv.jobtitle}</td>
													<td>${bv.jobrequirements}</td>
													<td>${bv.joblocation}</td>
													<td>${bv.jobdescription}</td>
													<td>${bv.salary}</td>
													<td><a href="/user/detailPost/${bv.jobid}"
														class="btn btn-info" type="button"
														style="background-color: #00688B; color: white;">Chi
															tiết</a>
														<button type="button" class="btn btn-danger btn-sm"
															onclick="deletePost(1)">Xóa</button>
												</tr>
												<!-- Add more rows as needed -->
											</c:forEach>
										</tbody>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>