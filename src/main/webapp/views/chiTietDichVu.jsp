<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết Dịch Vụ</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<%@ include file="/views/chat.jsp"%>
	<!-- /header -->
	<div class="container">
		<br>
		<article>
			<div class="card">
				<div class="card-body p-4">
					<form action="/admin/updateDV/${dv.serviceid}" method="post">
						<!-- Job ID and Deadline -->
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="jobid">ID:</label> <input class="form-control"
									type="text" id="serviceid" name="serviceid"
									value="${dv.serviceid}" readonly required>
							</div>
							<div class="col-md-6">
								<label for="applicationdeadline">Tên Dịch Vụ:</label> <input
									class="form-control" type="text" id="servicename"
									name="servicename" value="${dv.servicename}">
							</div>
						</div>
						<!-- Contact Person and Salary -->
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="jobtype">Ngày Tạo:</label> <input
									class="form-control" type="text" id="createdat"
									name="createdat" value="${dv.createdat}" readonly required>
							</div>

							<div class="col-md-6">
								<label for="salary">Giá:</label> <input class="form-control"
									type="text" id="price" name="price" value="${dv.price}">
							</div>
						</div>

						<!-- Job Type and Description -->
						<div class="row mb-3">
							<div class="col-md-6">
										<label for="">Số lượng bài viết</label> <input class="form-control"
											type="text" id="numberofjobsallowed" name="numberofjobsallowed"
											value="${dv.numberofjobsallowed}" >
									</div>
							<div class="col-md-6">
								<label for="contactperson">Ngày chạy dịch vụ</label> <input
									class="form-control" type="text" id="durationindays"
									name="durationindays" value="${dv.durationindays}">
							</div>
						</div>
						
						<div class="row mb-3">
							<div class="col-md-12">
								<label for="contactperson">Mô Tả:</label> <input
									class="form-control" type="text" id="description"
									name="description" value="${dv.description}">
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12 d-flex justify-content-start">
								<button type="submit" class="btn btn-success">Cập Nhật</button>
							</div>
						</div>
						
					</form>
				</div>
			</div>
		</article>
		<br>
		</div>
		<!-- footer-->
		<%@ include file="/views/footer.jsp"%>
		<!-- /footer -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script>
	// Giả sử giá trị salary ban đầu là một số
	const salaryInput = document.getElementById('salary');
	let salaryValue = parseFloat(salaryInput.value.replace(/,/g, '')); // Chuyển đổi thành số, bỏ dấu phẩy

	// Hàm định dạng số
	function formatSalary(value) {
		return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

	// Gán giá trị đã định dạng vào input
	salaryInput.value = formatSalary(salaryValue);
</script>
<script>
	window.onload = function() {
		let deadlineInput = document.getElementById('applicationdeadline');
		let deadlineValue = deadlineInput.value;

		// Chuyển giá trị deadline từ chuỗi sang đối tượng Date
		let deadlineDate = new Date(deadlineValue);

		// Kiểm tra xem giá trị deadline có hợp lệ không
		if (!isNaN(deadlineDate.getTime())) {
			// Định dạng ngày theo format dd/mm/yyyy
			let formattedDate = deadlineDate.toLocaleDateString('vi-VN');
			deadlineInput.value = formattedDate;
		}
	};
</script>
</html>
