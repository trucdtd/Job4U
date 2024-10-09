<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Việc Làm</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
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

        .card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
             height: 200px !important;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .bg-image {
            width: 100px;
            height: 100px;
            overflow: hidden; 
        }

        .card-title {
            font-size: 1.25rem; 
            font-weight: bold; 
        }

        .card-body {
            display: flex;
            align-items: flex-start; 
            flex-grow: 1; 
        }

        .flex-grow-1 {
            display: flex;
            flex-direction: column; 
            justify-content: space-between; 
        }

        .card-text {
            overflow: hidden; 
            display: -webkit-box; 
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2; 
            text-overflow: ellipsis; 
            max-height: 60px; 
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem 1.25rem;
            border-top: 1px solid #e9ecef;
            background-color: transparent;
        }
    </style>
</head>
<body>
    <!-- Kiểm tra và hiển thị thông báo -->
    <c:if test="${not empty message}">
        <div class="alert alert-info" role="alert">${message}</div>
    </c:if>
    <div class="container mt-4">
        <div class="row">
            <c:forEach var="job" items="${dsSP.content}">
                <c:if test="${job.active}">
                    <div class="col-6 mb-4">
                        <div class="card shadow-sm rounded-3">
                            <div class="card-body d-flex align-items-start">
                                <div class="bg-image me-3">
                                    <img src="${pageContext.request.contextPath}/uploads/${job.employer.logo}" alt="logo" class="img-fluid w-100 h-100" style="object-fit: cover;">
                                </div>
                                <div class="flex-grow-1">
                                    <h5 class="card-title">${job.jobtitle}</h5>
                                    <p class="text-muted">${job.employer.companyname}</p>
                                    <p class="card-text">${job.jobdescription}</p>
                                </div>
                            </div>
                            <div class="card-footer">
                                <span class="text-success font-weight-bold">${job.joblocation}</span>
                                <a href="/chiTiet/${job.jobid}" class="btn btn-outline-success btn-sm">Thông tin chi tiết</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <c:if test="${dsSP.totalPages > 0}">
        <div class="pagination-container">
            <button class="pagination-btn"
                    onclick="paging(${dsSP.pageable.pageNumber - 1})"
                    ${dsSP.pageable.pageNumber == 0 ? 'disabled' : ''}>← Trước</button>
            <div class="page-numbers">
                <c:forEach begin="0" end="${dsSP.totalPages - 1}" var="i">
                    <button
                        class="pagination-number ${i == dsSP.pageable.pageNumber ? 'active bg-success text-white' : ''}"
                        onclick="paging(${i})">${i + 1}</button>
                </c:forEach>
            </div>
            <button class="pagination-btn"
                    onclick="paging(${dsSP.pageable.pageNumber + 1})"
                    ${dsSP.pageable.pageNumber == dsSP.totalPages - 1 ? 'disabled' : ''}>Sau
                →</button>
        </div>
    </c:if>

    <script>
        function paging(page) {
            var url = new URL(window.location.href);
            url.searchParams.set('page', page);
            window.location.href = url;
        }
    </script>
</body>
</html>
