<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Việc Làm</title>
    
    <!-- Bootstrap Icons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    
    <!-- Bootstrap CSS v5.3.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
        /* Pagination */
        .pagination-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px 0;
        }

        .pagination-btn {
            background: none;
            border: none;
            color: #1ea264;
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
            color: #1ea264;
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

        /* Card Styling */
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
            flex-shrink: 0; /* Ngăn logo bị thu nhỏ */
        }

        .bg-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            white-space: nowrap; /* Ngăn tràn dòng */
            overflow: hidden; /* Ẩn văn bản tràn */
            text-overflow: ellipsis; /* Hiển thị dấu ... khi văn bản dài */
        }

        .card-body {
            display: flex;
            align-items: flex-start;
        }

        .flex-grow-1 {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            max-width: calc(100% - 100px); /* Giới hạn chiều rộng cho nội dung */
        }

        .card-text {
            overflow: hidden;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2; /* Giới hạn số dòng hiển thị */
            text-overflow: ellipsis;
            max-height: 60px; /* Chiều cao tối đa */
        }

        .text-muted {
            overflow: hidden;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1; /* Giới hạn số dòng hiển thị */
            text-overflow: ellipsis;
            max-height: 60px; /* Chiều cao tối đa */
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem 1.25rem;
            border-top: 1px solid #e9ecef;
            background-color: transparent;
        }

        /* Responsive Design */
        @media (max-width: 768px) { /* iPad Mini và các thiết bị có màn hình nhỏ hơn 768px */
            .card {
                height: auto; /* Điều chỉnh chiều cao card */
            }

            .carousel-inner {
                display: block; /* Đảm bảo carousel hiển thị hợp lý trên màn hình nhỏ */
            }

            .carousel-item {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .col-md-3 {
                width: 100%; /* Thẻ card chiếm 100% chiều rộng trên màn hình nhỏ */
                margin-bottom: 20px; /* Thêm khoảng cách giữa các thẻ */
            }

            .card-title {
                font-size: 1.1rem; /* Kích thước tiêu đề nhỏ hơn trên màn hình nhỏ */
            }

            .bg-image {
                width: 60px; /* Logo nhỏ hơn trên màn hình nhỏ */
                height: 60px;
            }

            .flex-grow-1 {
                max-width: calc(100% - 80px); /* Điều chỉnh không gian */
            }
        }

        @media (max-width: 576px) {
            .card-title {
                font-size: 1rem; /* Giảm kích thước tiêu đề trên màn hình rất nhỏ */
            }

            .carousel-control-prev, .carousel-control-next {
                width: 25px; /* Thu nhỏ các nút điều hướng carousel */
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2 class="h4 mb-4 mt-2 text-uppercase text-center font-weight-bold blue-hover">
                    Bài Tuyển Dụng Hàng Đầu</h2>
            </div>
        </div>
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
            <div class="carousel-inner">
                <c:forEach var="i" begin="0" end="${fn:length(latestJobs) / 4}" step="1">
                    <div class="carousel-item ${i == 0 ? 'active' : ''}">
                        <div class="row">
                            <c:forEach var="job" items="${latestJobs}" varStatus="status">
                                <c:if test="${status.index >= i * 4 && status.index < (i + 1) * 4}">
                                    <div class="col-12 col-sm-6 col-md-3">
                                        <div class="card shadow-sm rounded-3">
                                            <div class="card-body d-flex align-items-start">
                                                <div class="bg-image">
                                                    <img src="${pageContext.request.contextPath}/uploads/${job.employer.logo}" alt="logo" class="img-fluid">
                                                </div>
                                                <i class="bi bi-star-fill text-warning"></i>
                                                <div class="flex-grow-1">
                                                    <h6 class="text-center">${job.jobtitle}</h6>
                                                    <p class="text-center">${job.employer.companyname}</p>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <span class="text-success font-weight-bold">${job.salary}</span>
                                                <a href="${pageContext.request.contextPath}/chiTiet/${job.jobid}" class="btn btn-outline-success btn-sm">Thông tin chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-sTzI3U4kso4ZzRDv0A0qYVkAAB0iOSc11vj8D7wJ9z8OmQW0KvU4y2F2IZ5jIV30" 
            crossorigin="anonymous"></script>
</body>
</html>
