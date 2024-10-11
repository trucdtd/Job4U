<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách CV</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
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
                        <td>${cv.jobseeker.createdat}</td>
                        <td>
                            <c:choose>
                                <c:when test="${cv.status == 0}">Đang chờ</c:when>
                                <c:when test="${cv.status == 1}">Được chấp nhận</c:when>
                                <c:when test="${cv.status == 2}">Bị từ chối</c:when>
                                <c:otherwise>Không xác định</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
</div>
    <!-- JS scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    
</body>
</html>
