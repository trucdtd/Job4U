<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.inf-content {
	border: 1px solid #DDDDDD;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
}
</style>
<body>
	<%@ include file="/views/header.jsp"%>
	<div class="container">
		<br>
		<div class="container bootstrap snippets bootdey">
			<div class="panel-body inf-content">
				<div class="row">
					<div class="col-md-4">
						<img alt="" style="width: 600px;" title=""
							class="img-circle img-thumbnail isTooltip"
							src="https://bootdey.com/img/Content/avatar/avatar7.png"
							data-original-title="Usuario">
						<ul title="Ratings" class="list-inline ratings text-center">
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
						</ul>
					</div>
					<div class="col-md-6">
						<strong>THÔNG TIN CÁ NHÂN</strong><br>
						<div class="table-responsive">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-asterisk text-primary"></span> Họ
												và Tên
										</strong></td>
										<td class="text-primary">${user.fullname}</td>
									</tr>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-user text-primary"></span>
												Username
										</strong></td>
										<td class="text-primary">${user.username}</td>
									</tr>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-envelope text-primary"></span>
												Email
										</strong></td>
										<td class="text-primary">${user.email}</td>
									</tr>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-eye-open text-primary"></span>
												Role
										</strong></td>
										<td class="text-primary">${user.role}</td>
									</tr>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-calendar text-primary"></span>
												Created
										</strong></td>
										<td class="text-primary">${formattedCreatedAt}</td>
									</tr>
									<tr>
										<td><strong> <span
												class="glyphicon glyphicon-calendar text-primary"></span>
												Modified
										</strong></td>
										<td class="text-primary">${formattedUpdatedAt}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<%@ include file="/views/footer.jsp"%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						// Nếu bạn có dữ liệu ngày giờ trong biến JavaScript, sử dụng nó để định dạng.
						// Ví dụ:
						var postedDate = '${job.posteddate}';
						var applicationDeadline = '${job.applicationdeadline}';

						if (postedDate && applicationDeadline) {
							var formattedPostedDate = moment(postedDate)
									.format('DD/MM/YYYY HH:mm');
							var formattedApplicationDeadline = moment(
									applicationDeadline).format(
									'DD/MM/YYYY HH:mm');

							document.querySelector('.form-group #ngaybd + p').textContent = formattedPostedDate;
							document.querySelector('.form-group #ngaykt + p').textContent = formattedApplicationDeadline;
						}
					});
</script>
</html>