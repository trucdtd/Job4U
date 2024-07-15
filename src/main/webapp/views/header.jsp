<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/header.css">
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-expand-md navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/job4u">
                    <img src="/img/logo.png" alt="" width="40" height="32" class="me-2">
                    <span class="fs-4">Job4U</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/job4u">Trang Chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Hỏi Đáp</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Top Công Việc</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/employers">Nhà Tuyển Dụng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Ứng Tuyển</a>
                        </li>
                    </ul>
                </div>
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-outline-primary me-2">Đăng Nhập</button>
                    <button type="button" class="btn btn-primary">Đăng Ký</button>
                </div>
            </div>
        </nav>

        <!-- Banner Section -->
        <section class="banner mb-4">
            <img src="/img/poster2.png" alt="" class="img-fluid">
        </section>
        <!-- /Banner Section -->

    </div>
</body>
</html>
