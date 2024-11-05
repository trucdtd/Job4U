<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh Sách CV</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
</head>
<body>
	<div>
		<h3 class="mt-3 mb-3">Danh Sách CV Đã Nộp</h3>
		<table id="listCV" class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tóm tắt hồ sơ</th>
					<th>Tên Cty đã nộp</th>
					<th>Ngày cập nhật</th>
					<th>Trạng Thái</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cv" items="${cvList}">
					<tr>
						<td>${cv.jobseeker.jobseekerid}</td>
						<td>${cv.jobseeker.profilesummary}</td>
						<td>${cv.job.jobtitle}</td>
						<td class="formatted-date" data-date="${cv.jobseeker.createdat}"></td>
						<td><c:choose>
								<c:when test="${cv.status == 0}">Đang chờ</c:when>
								<c:when test="${cv.status == 1}">Được chấp nhận</c:when>
								<c:when test="${cv.status == 2}">Bị từ chối</c:when>
								<c:otherwise>Không xác định</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- JS scripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script>
    document.addEventListener("DOMContentLoaded", function() {
        const dateCells = document.querySelectorAll('.formatted-date');

        dateCells.forEach(cell => {
            const dateString = cell.getAttribute('data-date'); // Lấy giá trị ngày từ thuộc tính data-date
            const date = new Date(dateString); // Chuyển đổi chuỗi thành đối tượng Date

            // Kiểm tra xem ngày hợp lệ hay không
            if (!isNaN(date)) {
                // Định dạng ngày theo dd/MM/yyyy
                const options = { day: '2-digit', month: '2-digit', year: 'numeric' };
                const formattedDate = date.toLocaleDateString('vi-VN', options); // Định dạng theo ngôn ngữ Việt Nam

                cell.textContent = formattedDate; // Cập nhật nội dung của ô
            } else {
                cell.textContent = 'Ngày không hợp lệ'; // Hiển thị thông báo nếu ngày không hợp lệ
            }
        });
    });
</script>
</body>
</html>
