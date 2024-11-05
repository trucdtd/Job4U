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
								<strong><fmt:formatNumber value="${service.price}"
										type="currency" currencySymbol="" maxFractionDigits="0" /></strong>
							</p>
							<ul class="features">
								<li>${service.description}</li>
							</ul>
							<input type="hidden" id="serviceid-${service.serviceid}"
								value="${service.serviceid}" />
							<button type="button" class="btn btn-danger"
								onclick="openJobSelectionModal('${service.servicename}', ${service.price}, '${service.description}', ${service.serviceid})">MUA</button>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<%-- <div class="container pricing">
		<div class="row justify-content-center">
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
		</div>
	</div> --%>

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
                                     jobid: ${job.jobid},
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
					</ul>
					<div class="total-price">
						<h2>Tổng Tiền</h2>
						<h1 id="servicePrice"></h1>
						<p id="serviceDescription"></p>
					</div>
				</div>
				<!-- Form để gửi dữ liệu thanh toán -->
				<form action="/employers/pay" method="post" class="payment-form">
					<input type="hidden" name="servicePrice" id="servicePriceInput"
						value=""> <input type="hidden" name="serviceId"
						id="serviceId" value="${serviceId}"> <input type="hidden"
						name="jobId" id="jobId" value="${jobId}"> <input
						type="hidden" name="userId" id="userId" value="${userId}">

					<div class="payment-methods">
						<button class="momo2-btn" type="submit">
							<img src="/img/vnpay.png">
						</button>
					</div>
					<button class="submit-btn" style="background: #198754"
						type="submit">Thanh Toán</button>
				</form>

			</div>
		</div>
	</div>

	<script>
let selectedService = {};
let jobIdSelected = null;

function openJobSelectionModal(serviceName, servicePrice, serviceDescription, serviceId) {
    selectedService = { serviceName, servicePrice, serviceDescription, serviceId };
    
    if (serviceId === 4) {
        // Nếu là gói "Lên Top" (serviceId = 4), yêu cầu chọn bài viết
        document.getElementById('jobSelectionModal').style.display = 'flex';
    } else {
        // Nếu không phải là gói "Lên Top", hiện modal thanh toán trực tiếp
        document.getElementById('paymentModal').style.display = 'flex';
        
        // Cập nhật thông tin dịch vụ trong modal thanh toán
        document.getElementById('serviceName').innerText = selectedService.serviceName;
        document.getElementById('serviceId').value = parseInt(selectedService.serviceId);
        document.getElementById('servicePrice').innerText = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(selectedService.servicePrice);
        document.getElementById('serviceDescription').innerText = selectedService.serviceDescription;
        
        // Đặt jobId là trống vì không cần chọn bài viết
        document.getElementById('jobId').value = ""; 
        document.getElementById('servicePriceInput').value = selectedService.servicePrice;
        jobIdSelected = null; // Đặt jobIdSelected là null để không yêu cầu bài viết khi thanh toán
    }
}


function closeJobSelectionModal() {
    document.getElementById('jobSelectionModal').style.display = 'none';
}

function selectJobPost(job) {
    closeJobSelectionModal();
    document.getElementById('paymentModal').style.display = 'flex';

    document.getElementById('serviceName').innerText = selectedService.serviceName;
    document.getElementById('serviceId').value = parseInt(selectedService.serviceId);
    document.getElementById('servicePrice').innerText = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(selectedService.servicePrice);
    document.getElementById('serviceDescription').innerText = selectedService.serviceDescription;
    document.getElementById('jobIdSelected').innerText = job.jobid;

    // Cập nhật giá trị cho hidden input
    document.getElementById('jobId').value = job.jobid;
    document.getElementById('servicePriceInput').value = selectedService.servicePrice;
    jobIdSelected = job.jobid; // Cập nhật jobIdSelected để kiểm tra khi submit
}

function closePaymentModal() {
    document.getElementById('paymentModal').style.display = 'none';
}

function submitPayment() {
    // Lấy giá trị từ element servicePrice và chuyển đổi thành số
    const servicePriceFormatted = document.getElementById("servicePrice").innerText.replace(/[^\d.-]/g, ''); // loại bỏ ký tự không phải số
    document.getElementById("servicePriceInput").value = parseFloat(servicePriceFormatted); // Chuyển đổi sang số thực

    // Chỉ cần lấy giá trị từ các hidden input mà không cần sử dụng getAttribute
    document.getElementById("serviceId").value = selectedService.serviceId;
    document.getElementById("jobId").value = jobIdSelected; // jobId đã được cập nhật trong selectJobPost
    document.getElementById("userId").value = document.getElementById("userId").value; // userId đã được thiết lập trước đó

    // Submit the form after setting values
    document.querySelector(".payment-form").submit();
}
</script>
</body>
</html>
