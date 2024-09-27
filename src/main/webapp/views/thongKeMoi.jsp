<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống Kê Hệ Thống</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <!-- Header Section -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Thống Kê Hệ Thống</h1>
            <div>
                <select class="form-select" aria-label="Thống kê theo thời gian">
                    <option selected>Trong ngày</option>
                    <option value="1">1 tháng</option>
                    <option value="2">6 tháng</option>
                    <option value="3">12 tháng</option>
                </select>
            </div>
        </div>

        <!-- Row 1: Thống kê Người dùng & Bài đăng -->
        <div class="row">
            <!-- Thống kê Người dùng -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">Thống kê Người dùng</div>
                    <div class="card-body">
                        <h5 class="card-title">500 Người dùng đăng ký</h5>
                        <canvas id="userChart"></canvas>
                    </div>
                </div>
            </div>
            <!-- Thống kê Bài đăng -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header bg-success text-white">Thống kê Bài đăng</div>
                    <div class="card-body">
                        <h5 class="card-title">300 Bài đăng</h5>
                        <canvas id="postChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Row 2: Thống kê Ứng viên & Nhà tuyển dụng -->
        <div class="row">
            <!-- Thống kê Ứng viên -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header bg-warning text-white">Thống kê Ứng viên</div>
                    <div class="card-body">
                        <h5 class="card-title">1500 Hồ sơ ứng viên</h5>
                        <canvas id="applicantChart"></canvas>
                    </div>
                </div>
            </div>
            <!-- Thống kê Nhà tuyển dụng -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header bg-info text-white">Thống kê Nhà tuyển dụng</div>
                    <div class="card-body">
                        <h5 class="card-title">100 Nhà tuyển dụng đăng tuyển</h5>
                        <canvas id="employerChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Row 3: Thống kê Doanh thu -->
        <div class="row">
            <!-- Thống kê Doanh thu -->
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-header bg-danger text-white">Thống kê Doanh thu</div>
                    <div class="card-body">
                        <h5 class="card-title">Tổng Doanh thu: 50,000,000 VND</h5>
                        <canvas id="revenueChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS & Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Example chart data for user registration statistics
        const userChart = document.getElementById('userChart');
        new Chart(userChart, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Người dùng đăng ký',
                    data: [120, 150, 180, 170, 200, 220],
                    borderColor: 'rgba(54, 162, 235, 1)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                }]
            },
        });

        // Example chart data for job posts
        const postChart = document.getElementById('postChart');
        new Chart(postChart, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Bài đăng',
                    data: [50, 80, 70, 60, 90, 110],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                }]
            },
        });

        // Example chart data for applicant statistics
        const applicantChart = document.getElementById('applicantChart');
        new Chart(applicantChart, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Hồ sơ ứng viên',
                    data: [300, 400, 500, 450, 600, 700],
                    borderColor: 'rgba(255, 206, 86, 1)',
                    backgroundColor: 'rgba(255, 206, 86, 0.2)',
                }]
            },
        });

        // Example chart data for employer statistics
        const employerChart = document.getElementById('employerChart');
        new Chart(employerChart, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Nhà tuyển dụng',
                    data: [10, 20, 15, 25, 30, 35],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                }]
            },
        });

        // Example chart data for revenue statistics
        const revenueChart = document.getElementById('revenueChart');
        new Chart(revenueChart, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Doanh thu (VND)',
                    data: [5000000, 6000000, 7000000, 8000000, 9000000, 10000000],
                    borderColor: 'rgba(255, 99, 132, 1)',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                }]
            },
        });
    </script>
</body>

</html>
