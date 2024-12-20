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
							<td>${job.jobtitle}<!-- Hiển thị ngôi sao vàng nếu là công việc top -->
												<c:if test="${job.isTop}">
													<i class="bi bi-star-fill text-warning"></i>
													<!-- Ngôi sao vàng -->
												</c:if></td>
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

	<div id="paymentModal" class="modal" style="display: none;">
		<div class="modal-content">
			<span class="close" onclick="closePaymentModal()">&times;</span>
			<div class="payment-container">
				<div class="payment-summary">
					<h3>Tóm tắt thanh toán</h3>
					<ul>
						<li><span>Gói đã chọn:</span> <span id="serviceName"></span></li>
						<li><span>Bài Viết:</span> <span id="jobIdSelected"></span></li>
					</ul>
					<div class="total-price">
						<h2>Tổng Tiền</h2>
						<h1 id="servicePrice"></h1>
						<p id="serviceDescription"></p>
					</div>
				</div>
				<form action="/employers/pay" method="post" class="payment-form">
					<input type="hidden" name="servicePrice" id="servicePriceInput"
						value=""> <input type="hidden" name="serviceId"
						id="serviceId" value="${serviceId}"> <input type="hidden"
						name="jobId" id="jobId" value="${jobId}"> <input
						type="hidden" name="userId" id="userId" value="${userId}">
					<div class="payment-methods">
						<a class="momo2-btn" type="submit"> <img src="/img/vnpay.png">
						</a>
					</div>
					<button class="submit-btn" style="background: #198754"
						type="submit">Thanh Toán</button>
				</form>
			</div>
		</div>
	</div>


	<!-- <script>
	let selectedService = {};
	let jobIdSelected = null;

	// Mở modal chọn công việc
	function openJobSelectionModal(serviceName, servicePrice, serviceDescription, serviceId) {
	    selectedService = { serviceName, servicePrice, serviceDescription, serviceId };

	    if (serviceId === 4) {
	        // Nếu là gói "Lên Top" (serviceId = 4), yêu cầu chọn bài viết
	        document.getElementById('jobSelectionModal').style.display = 'flex';
	    } else {
	        // Nếu không phải là gói "Lên Top", hiển thị modal thanh toán trực tiếp
	        openPaymentModal();
	    }
	}

	// Mở modal thanh toán
	function openPaymentModal() {
	    const paymentModal = document.getElementById('paymentModal');
	    if (paymentModal) {
	        paymentModal.style.display = 'flex';

	        // Cập nhật thông tin dịch vụ trong modal thanh toán
	        document.getElementById('serviceName').innerText = selectedService.serviceName || '';
	        document.getElementById('serviceId').value = parseInt(selectedService.serviceId || 0);
	        document.getElementById('servicePrice').innerText = new Intl.NumberFormat('vi-VN', {
	            style: 'currency',
	            currency: 'VND'
	        }).format(selectedService.servicePrice || 0);
	        document.getElementById('serviceDescription').innerText = selectedService.serviceDescription || '';
	        document.getElementById('jobId').value = jobIdSelected || ""; // Nếu không chọn bài viết, đặt jobId là trống
	        document.getElementById('servicePriceInput').value = selectedService.servicePrice || 0;
	    }
	}

	// Đóng modal chọn công việc
	function closeJobSelectionModal() {
	    const modal = document.getElementById('jobSelectionModal');
	    if (modal) {
	        modal.style.display = 'none';

	        // Reset trạng thái modal chọn công việc (nếu cần thiết)
	        jobIdSelected = null;
	        document.getElementById('jobId').value = "";
	        document.getElementById('jobIdSelected').innerText = "";
	    }
	}

	// Đóng modal thanh toán
	function closePaymentModal() {
	    const modal = document.getElementById('paymentModal');
	    if (modal) {
	        modal.style.display = 'none';

	        // Reset trạng thái modal thanh toán
	        jobIdSelected = null;
	        selectedService = {};
	        document.getElementById('jobId').value = "";
	        document.getElementById('jobIdSelected').innerText = "";
	        document.getElementById('serviceName').innerText = "";
	        document.getElementById('servicePrice').innerText = "";
	        document.getElementById('serviceDescription').innerText = "";
	        document.getElementById('servicePriceInput').value = "";
	    }
	}

	// Chọn bài viết và mở modal thanh toán
	function selectJobPost(job) {
	    closeJobSelectionModal();
	    jobIdSelected = job.jobid; // Cập nhật jobIdSelected từ bài viết được chọn

	    openPaymentModal();

	    // Hiển thị jobId đã chọn
	    document.getElementById('jobIdSelected').innerText = jobIdSelected;

	    // Cập nhật giá trị cho hidden input
	    document.getElementById('jobId').value = jobIdSelected;
	}

	// Submit form thanh toán
	function submitPayment() {
	    const servicePriceFormatted = document.getElementById("servicePrice").innerText.replace(/[^\d.-]/g, '');
	    document.getElementById("servicePriceInput").value = parseFloat(servicePriceFormatted);

	    // Đảm bảo các hidden input có giá trị chính xác trước khi submit
	    document.getElementById("serviceId").value = selectedService.serviceId || "";
	    document.getElementById("jobId").value = jobIdSelected || "";
	    document.querySelector(".payment-form").submit();
	}

</script> -->
</body>
</html>
