<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Prefix sử dụng JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Việc Làm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .pagination-container {
            display: flex;
            align-items: center;
            justify-content: center;
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
    <section style="background-color: #eee;">
        <div class="container py-4">
            <div class="row justify-content-center">
                <c:forEach var="job" items="${dsSP.content}">
                    <div class="col-md-12 col-xl-10 mb-4">
                        <div class="card shadow-0 border rounded-3">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                        <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                            <img src="${job.employer.logo}" class="w-100" />
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <h5>Tên công ty: ${job.employer.companyname}</h5>
                                        <p class="text-truncate mb-4 mb-md-0">Mô tả: ${job.jobdescription}</p>
                                    </div>
                                    <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                        <div class="d-flex flex-column mt-4">
                                            <a href="/applyCV" class="btn btn-primary btn-sm" type="button">Ứng tuyển</a>
                                            <a href="/job4u/chiTiet/${job.jobid}" class="btn btn-outline-primary btn-sm mt-2">Thông tin chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    <div class="pagination-container">
        <button class="pagination-btn" onclick="paging(0)" ${dsSP.pageable.pageNumber == 0 ? 'disabled' : ''}>← Trước</button>
        <div class="page-numbers">
            <c:forEach begin="0" end="${dsSP.totalPages - 1}" var="i">
                <button class="pagination-number ${i == dsSP.pageable.pageNumber ? 'active' : ''}" onclick="paging(${i})">${i + 1}</button>
            </c:forEach>
        </div>
        <button class="pagination-btn" onclick="paging(${dsSP.totalPages - 1})" ${dsSP.pageable.pageNumber == dsSP.totalPages - 1 ? 'disabled' : ''}>Sau →</button>
    </div>

    <script>
        function paging(page) {
            var url = new URL(window.location.href);
            url.searchParams.set('page', page);
            window.location.href = url;
        }
    </script>
</body>
</html>
