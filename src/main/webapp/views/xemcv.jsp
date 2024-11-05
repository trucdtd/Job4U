<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách ứng tuyển</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css">
</head>

<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->

	<br>
	<div class="container">
		<h1>Danh sách ứng tuyển</h1>

		<!-- Hiển thị thông báo nếu có -->
		<c:if test="${not empty message}">
			<div class="alert alert-info">${message}</div>
		</c:if>

		<!-- Bảng danh sách CV -->
		<table id="myTable" class="display">
			<thead>
				<tr>
					<th>Email ứng viên</th>
					<th>Ngày Ứng Tuyển</th>
					<th>Trạng thái</th>
					<th>Xem cv</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dsCV}" var="application">
					<tr>
						<td>${application.jobseeker.emailcv}</td>
						<!-- Định dạng ngày tháng từ trường createdat -->
						<td class="formatted-date" data-date="${application.createdat}"></td>
						<td><c:choose>
								<c:when test="${application.status == 0}">Đang chờ</c:when>
								<c:when test="${application.status == 1}">Được chấp nhận</c:when>
								<c:when test="${application.status == 2}">Bị từ chối</c:when>
								<c:otherwise>Không xác định</c:otherwise>
							</c:choose></td>
						<td>

							<form action="/employers/jobseekerDetails/${application.jobseeker.jobseekerid}" method="get" style="display: inline;">
								<button type="submit" class="btn btn-success text-white p-2">Xem</button>
								</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
	</div>

	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
	<script>
$(document).ready(function() {
    $('#myTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });

    $('#cvTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "language": {
            "paginate": {
                "next": "Tiếp theo",
                "previous": "Trước đó"
            },
            "lengthMenu": "Hiển thị _MENU_ mục",
            "info": "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
            "zeroRecords": "Không tìm thấy kết quả nào", // Thông báo khi không có dữ liệu
            "infoEmpty": "Không có dữ liệu", // Thông báo khi không có hàng
            "infoFiltered": "(lọc từ _MAX_ mục)", // Thông báo về số lượng mục đã lọc
            "search": "Tìm kiếm:", // Nhãn cho ô tìm kiếm
        }
    });
});
</script>

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
    
    function acceptApplication(applicationId) {
 	    fetch(`/cvDetails/${applicationId}/accept`, {
 	        method: 'POST',
 	        headers: {
 	            'Content-Type': 'application/json',
 	            'X-Requested-With': 'XMLHttpRequest'
 	        }
 	    })
 	    .then(response => {
 	        if (response.ok) {
 	            alert('Chấp nhận đơn ứng tuyển thành công!');
 	            window.location.reload();
 	        } else {
 	            alert('Có lỗi xảy ra khi chấp nhận đơn ứng tuyển!');
 	        }
 	    })
 	    .catch(error => {
 	        console.error('Error:', error);
 	        alert('Có lỗi xảy ra khi chấp nhận đơn ứng tuyển!');
 	    });
 	}

    function rejectApplication(applicationId) {
 	    fetch(`/cvDetails/${applicationId}/reject`, {
 	        method: 'POST',
 	        headers: {
 	            'Content-Type': 'application/json',
 	            'X-Requested-With': 'XMLHttpRequest'
 	        }
 	    })
 	    .then(response => {
 	        if (response.ok) {
 	            alert('Đã từ chối đơn ứng tuyển!');
 	            window.location.reload();
 	        } else {
 	            alert('Có lỗi xảy ra khi từ chối đơn ứng tuyển!');
 	        }
 	    })
 	    .catch(error => {
 	        console.error('Error:', error);
 	        alert('Có lỗi xảy ra khi từ chối đơn ứng tuyển!');
 	    });
 	}
     </script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
