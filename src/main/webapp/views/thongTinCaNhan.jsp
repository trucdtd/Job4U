<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .inf-content {
            border: 1px solid #DDDDDD;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background: #ffffff;
            padding: 20px;
            margin-top: 20px;
        }
        .profile-image {
            max-width: 150px;
            border-radius: 50%;
        }
        .table th {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <%@ include file="/views/header.jsp"%>
    <div class="container mb-5">
        <h2 class="text-center my-4">Thông tin cá nhân</h2>
        <div class="inf-content">
            <div class="row">
                <div class="col-md-4 text-center">
                    <img class="profile-image" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Avatar">
                    <ul class="list-inline ratings mt-2">
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                    </ul>
                </div>
                <div class="col-md-8">
                    <table class="table table-user-information">
                        <tbody>
                            <tr>
                                <th><span class="glyphicon glyphicon-asterisk text-primary"></span> Họ và Tên</th>
                                <td class="text-primary">${user.fullname}</td>
                            </tr>
                            <tr>
                                <th><span class="glyphicon glyphicon-user text-primary"></span> Username</th>
                                <td class="text-primary">${user.username}</td>
                            </tr>
                            <tr>
                                <th><span class="glyphicon glyphicon-envelope text-primary"></span> Email</th>
                                <td class="text-primary">${user.email}</td>
                            </tr>
                            <tr>
                                <th><span class="glyphicon glyphicon-eye-open text-primary"></span> Vai trò</th>
                                <td class="text-primary">
                                    <c:choose>
                                        <c:when test="${user.role == 0}">Admin</c:when>
                                        <c:when test="${user.role == 1}">Ứng viên</c:when>
                                        <c:when test="${user.role == 2}">Nhà tuyển dụng</c:when>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="glyphicon glyphicon-calendar text-primary"></span> Ngày tạo</th>
                                <td class="text-primary">${formattedCreatedAt}</td>
                            </tr>
                            <tr>
                                <th><span class="glyphicon glyphicon-calendar text-primary"></span> Ngày cập nhật</th>
                                <td class="text-primary">${formattedUpdatedAt}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
