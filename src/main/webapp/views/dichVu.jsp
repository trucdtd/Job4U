<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<strong> <fmt:formatNumber value="${service.price}"
										type="currency" currencySymbol="" maxFractionDigits="0" />
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
				<form th:action="@{/pay}" class="payment-form">
					<h3>Thanh Toán</h3>
					<div class="payment-methods">
						<!-- <button class="momo1-btn" id="momo1-button"
							onclick="showQRCode('momo1')">
							<img
								src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png"
								alt="Momo1">
						</button> -->
						<button class="momo2-btn" id="momo2-button"
							>
							<img
								src="data:image/jpeg;base64,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"
								>
						</button>
					</div>
					<!-- <div class="qr-code" id="qr-code-momo1" style="display: none;">
						<img src="/img/momo.jpg" alt="QR Code Momo1">
					</div> -->
					<!-- <div class="qr-code" id="qr-code-momo2" style="display: none;">
						<img src="/img/QR TP.jpg" alt="QR Code Momo2">
					</div> -->
					<button class="submit-btn" style="background: #198754"
						type="button">Xác Nhận</button>
				</form>
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
