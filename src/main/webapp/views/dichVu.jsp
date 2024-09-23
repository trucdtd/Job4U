<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chọn Gói Dịch Vụ</title>
    <link rel="stylesheet" type="text/css" href="/css/dichvu.css">
    <style>
        .modal-content {
            padding: 20px;
            border-radius: 8px;
        }
        .close {
            float: right;
            font-size: 24px;
            cursor: pointer;
        }
        .table {
            width: 100%;
            margin-top: 20px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .btn-success {
            width: 100%;
        }
    </style>
</head>
<body>
    <br>
    <div class="container pricing">
        <div class="row justify-content-center">
            <!-- Row 1: Gói Đặc Biệt và Gói Bổ Sung -->
            <c:forEach items="${service}" var="service">
                <div class="col-md-4">
                    <div class="pricing-card special">
                        <div class="pricing-header">
                            <h4 class="text-center">${service.servicename}</h4>
                        </div>
                        <div class="pricing-body text-center">
                            <p class="price">
                                <strong>
                                    <fmt:formatNumber value="${service.price}" type="currency" currencySymbol="" maxFractionDigits="0" />
                                </strong>
                            </p>
                            <ul class="features">
                                <li>${service.description}</li>
                            </ul>
                            <button type="button" class="btn btn-danger"
                                    onclick="openJobSelectionModal('${service.servicename}', ${service.price}, '${service.description}')">MUA</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Modal chọn công việc để thanh toán -->
    <div id="jobSelectionModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closeJobSelectionModal()">&times;</span>
            <h3>Chọn Công Việc</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>Tên Công Việc</th>
                        <th>Vị Trí</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${jobPostings}" var="job">
                        <tr>
                            <td>${job.jobtitle}</td>
                            <td>${job.joblocation}</td>
                            <td>
                                <button type="button" class="btn btn-success"
                                        onclick='selectJobPost({
                                            jobtitle: "${job.jobtitle}",
                                            joblocation: "${job.joblocation}",
                                            jobdescription: "${job.jobdescription}",
                                            jobrequirements: "${job.jobrequirements}",
                                            salary: ${job.salary},
                                            jobtype: "${job.jobtype}",
                                            posteddate: "${job.posteddate}",
                                            applicationdeadline: "${job.applicationdeadline}",
                                            active: ${job.active}
                                        })'>Chọn</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal Thanh Toán -->
    <div id="paymentModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closePaymentModal()">&times;</span>
            <div class="payment-container">
                <div class="payment-summary">
                    <h3>Tóm tắt thanh toán</h3>
                    <ul>
                        <li><span>Gói đã chọn:</span> <span id="serviceName"></span></li>
                    </ul>
                    <div class="total-price">
                        <h2>Tổng Tiền</h2>
                        <h1 id="servicePrice"></h1>
                        <p id="serviceDescription"></p>
                    </div>
                </div>
                <div class="payment-form">
                    <h3>Thanh Toán</h3>
                    <div class="payment-methods">
                        <button class="momo1-btn" id="momo1-button" onclick="showQRCode('momo1')">
                            <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" alt="Momo1">
                        </button>
                        <button class="momo2-btn" id="momo2-button" onclick="showQRCode('momo2')">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL9Cpp1nDLbzIrK_-ljQsqJOGbytIiiDAgmQ&s" alt="Momo2">
                        </button>
                    </div>
                    <div class="qr-code" id="qr-code-momo1" style="display: none;">
                        <img src="/img/momo.jpg" alt="QR Code Momo1">
                    </div>
                    <div class="qr-code" id="qr-code-momo2" style="display: none;">
                        <img src="/img/QR TP.jpg" alt="QR Code Momo2">
                    </div>
                    <button class="submit-btn" style="background: #198754" type="button" onclick="confirmPayment()">Xác Nhận</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        let selectedService = {};

        function openJobSelectionModal(serviceName, servicePrice, serviceDescription) {
            selectedService = { serviceName, servicePrice, serviceDescription }; // Lưu thông tin dịch vụ
            document.getElementById('jobSelectionModal').style.display = 'flex';
        }

        function closeJobSelectionModal() {
            document.getElementById('jobSelectionModal').style.display = 'none';
        }

        function selectJobPost(job) {
            closeJobSelectionModal(); // Đóng modal chọn công việc
            document.getElementById('paymentModal').style.display = 'flex'; // Hiển thị modal thanh toán
            
            // Cập nhật thông tin dịch vụ
            document.getElementById('serviceName').innerText = selectedService.serviceName; // Tên dịch vụ
            document.getElementById('servicePrice').innerText = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(selectedService.servicePrice); // Giá dịch vụ
            document.getElementById('serviceDescription').innerText = selectedService.serviceDescription; // Mô tả dịch vụ
        }

        function closePaymentModal() {
            document.getElementById('paymentModal').style.display = 'none';
        }

        function showQRCode(method) {
            document.getElementById('qr-code-momo1').style.display = 'none';
            document.getElementById('qr-code-momo2').style.display = 'none';

            if (method === 'momo1') {
                document.getElementById('qr-code-momo1').style.display = 'block';
            } else if (method === 'momo2') {
                document.getElementById('qr-code-momo2').style.display = 'block';
            }
        }

        function confirmPayment() {
            alert('Thanh toán thành công!');
            closePaymentModal();
        }
    </script>
</body>
</html>
