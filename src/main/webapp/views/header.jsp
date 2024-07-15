<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/header.css">
</head>
<body>
    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a href="/job4u" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                <img src="/img/logo.png" alt="" width="40" height="32" class="me-2">
                <span class="fs-4">Job4U</span>
            </a>

            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/job4u" class="nav-link px-2 link-dark">Trang Chủ</a></li>
                <li><a href="#" class="nav-link px-2 link-dark">Hỏi Đáp</a></li>
                <li><a href="#" class="nav-link px-2 link-dark">Top Công Việc</a></li>
                <li><a href="/employers" class="nav-link px-2 link-dark">Nhà Tuyển Dụng</a></li>
                <li><a href="#" class="nav-link px-2 link-dark">Ứng Tuyển</a></li>
            </ul>

            <div class="col-md-3 text-end">
                <button type="button" class="btn btn-outline-primary me-2">Đăng Nhập</button>
                <button type="button" class="btn btn-primary">Đăng Ký</button>
            </div>
        </header>

        <!-- Banner Section -->
        <section class="banner mb-4">
            <img src="/img/poster2.png" alt="" class="img-fluid">
        </section>
        <!-- /Banner Section -->

    </div>
</body>
</html>