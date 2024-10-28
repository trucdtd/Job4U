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
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    width: 50%;
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
    <div class="container pricing">
        <div class="row justify-content-center">
            <!-- Loop qua các gói dịch vụ -->
            <c:forEach items="${service}" var="service">
                <div class="col-md-4">
                    <div class="pricing-card special">
                        <div class="pricing-header">
                            <h4 class="text-center">${service.servicename}</h4>
                        </div>
                        <div class="pricing-body text-center">
                            <p class="price">
                                <strong><fmt:formatNumber value="${service.price}" type="currency" currencySymbol="" maxFractionDigits="0" /></strong>
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

    <!-- Modal chọn công việc -->
    <div id="jobSelectionModal" class="modal">
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
                                        jobdescription: "${job.jobdescription}"
                                    })'>Chọn</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal thanh toán -->
   <!-- Modal Thanh Toán -->
	<div id="paymentModal" class="modal" style="display: none;">
		<div class="modal-content">
			<span class="close" onclick="closePaymentModal()">&times;</span>
			<div class="payment-container">
				<div class="payment-summary">
					<h3>Tóm tắt thanh toán</h3>
					<ul>
						<li><span>Gói đã chọn:</span> <span id="serviceName"></span></li>
						<li><span>ID Bài Viết:</span> <span id="jobIdSelected"></span></li>
						<!-- Hiển thị jobid ở đây -->
					</ul>
					<div class="total-price">
						<h2>Tổng Tiền</h2>
						<h1 id="servicePrice"></h1>
						<p id="serviceDescription"></p>
					</div>
				</div>
				<form action="/employers/pay" method="post" class="payment-form">
					<h3>Thanh Toán</h3>
					<input type="hidden" name="servicePrice" id="servicePrice" value="${servicePrice}"> <!-- Giá dịch vụ -->
					<input type="hidden" name="serviceId" id="serviceId"
						value="4">
					<!-- ID dịch vụ -->
					<input type="hidden" name="jobId" id="jobId" value="${jobId}">
					<!-- ID bài viết -->
					<input type="hidden" name="userId" value="${userId}">
					<!-- ID người dùng -->

					<div class="payment-methods">
						<button class="momo2-btn" id="momo2-button" type="button"
							onclick="submitPayment()">
							<img src="/img/vnpay.png">
						</button>
					</div>
					<button class="submit-btn" style="background: #198754"
						type="button" onclick="submitPayment()">Thanh Toán</button>
				</form>


			</div>
		</div>
	</div>

    <script>
        let selectedService = {};

        function openJobSelectionModal(serviceName, servicePrice, serviceDescription) {
            selectedService = { serviceName, servicePrice, serviceDescription };
            document.getElementById('jobSelectionModal').style.display = 'flex';
        }

        function closeJobSelectionModal() {
            document.getElementById('jobSelectionModal').style.display = 'none';
        }

        function selectJobPost(job) {
            closeJobSelectionModal();
            document.getElementById('paymentModal').style.display = 'flex';
            document.getElementById('serviceName').innerText = selectedService.serviceName;
            document.getElementById('servicePrice').innerText = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(selectedService.servicePrice);
            document.getElementById('serviceDescription').innerText = selectedService.serviceDescription;
        }

        function closePaymentModal() {
            document.getElementById('paymentModal').style.display = 'none';
        }

        function confirmPayment() {
            alert('Thanh toán thành công!');
            closePaymentModal();
        }
    </script>
</body>
</html>
