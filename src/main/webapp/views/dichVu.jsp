<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/css/dichvu.css">
<body>
	<div class="container pricing">
		<br>
		<div class="row justify-content-center">
			<!-- Row 1: Gói Đặc Biệt và Gói Bổ Sung -->
			<div class="col-md-6">
				<div class="pricing-card special">
					<div class="pricing-header">
						<h4 class="text-center">Gói Đặc Biệt Lên Top</h4>
					</div>
					<div class="pricing-body text-center">
						<p class="price">
							<strong>75.000 VNĐ</strong>
						</p>
						<p class="price">3 Ngày</p>
						<ul class="features">
							<li>Lên Top những công việc hàng đầu</li>
						</ul>
						<button class="btn btn-danger" onclick="showPaymentForm()">MUA</button>
					</div>
				</div>
			</div>
			<div class="col-md-6">
					<div class="pricing-card">
						<div class="pricing-header">
							<h1 class="text-center">Gói Bổ Sung</h1>
						</div>
						<div class="pricing-body text-center">
							<p class="price">
								<strong>75.000 VNĐ</strong>
							</p>
							<p class="price">Thêm 5 bài đăng</p>

							<button type="button" class="btn btn-danger openModalButton" data-service-id="5" onclick="openPaymentModal(5)">MUA</button>

						</div>
					</div>
			</div>
		</div>

		<!-- Row 2: Các Gói Cho Nhà Tuyển Dụng -->
		<div class="row justify-content-center">
			<div class="col-md-4">
					<div class="pricing-card">
						<div class="pricing-header">
							<h4 class="text-center">Gói 1 Tháng</h4>
						</div>
						<div class="pricing-body text-center">
							<p class="price">
								<strong>149.000 VNĐ</strong>
							</p>
							<p class="price">1 Tháng</p>
							<ul class="features">
								<li>Đăng 10 bài / Tháng</li>
							</ul>
							<button type="button" class="btn btn-danger openModalButton" data-service-id="1" onclick="openPaymentModal(1)">MUA</button>
						</div>
					</div>
			</div>

			<div class="col-md-4">
				
					<div class="pricing-card">
						<div class="pricing-header">
							<h4 class="text-center">Gói 6 Tháng</h4>
						</div>
						<div class="pricing-body text-center">
							<p class="price">
								<strong>745.000 VNĐ</strong>
							</p>
							<p class="price">6 Tháng</p>
							<ul class="features">
								<li>Đăng 30 bài / Tháng</li>
							</ul>
							<button type="button" class="btn btn-danger openModalButton" data-service-id="2" onclick="openPaymentModal(2)">MUA</button>
						</div>
					</div>
			</div>

			<div class="col-md-4">
				
					<div class="pricing-card">
						<div class="pricing-header">
							<h4 class="text-center">Gói 12 Tháng</h4>
						</div>
						<div class="pricing-body text-center">
							<p class="price">
								<strong>1,490.000 VNĐ</strong>
							</p>
							<p class="price">12 Tháng</p>
							<ul class="features">
								<li>Đăng 50 bài / Tháng</li>
							</ul>
							<button type="button" class="btn btn-danger openModalButton" data-service-id="3" onclick="openPaymentModal(3)">MUA</button>
						</div>
					</div>

			</div>
		</div>
	</div>
	<!-- Modal -->
<div id="paymentModal" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close">&times;</span>
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
                    <button class="momo1-btn" id="momo1-button">
                        <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" alt="Momo1">
                    </button>
                    <button class="momo2-btn" id="momo2-button">
                        <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" alt="Momo2">
                    </button>
                </div>

                <div class="qr-code" id="qr-code-momo1" style="display: none;">
                    <img src="/img/QR.png" alt="QR Code Momo1">
                </div>

                <div class="qr-code" id="qr-code-momo2" style="display: none;">
                    <img src="/img/QR.png" alt="QR Code Momo2">
                </div>

                <button class="submit-btn" type="button">Xác Nhận</button>
            </div>
        </div>
    </div>
</div>
	<!-- Hidden form initially -->
	<div id="paymentForm" class="col-md-6" style="display: none;">
		<div class="pricing-card">
			<div class="pricing-header">
				<h4 class="text-center">Thanh Toán</h4>
			</div>
			<div class="pricing-body text-center">
				<!-- Empty form content for payment -->
				<p>Thanh toán gói Đặc Biệt Lên Top</p>
				<button type="submit" class="btn btn-success openModalButton" data-service-id="4" onclick="openPaymentModal(4)">Thanh Toán</button>
			</div>
		</div>
	</div>


	<script>
	function openPaymentModal(serviceId) {
	    // Fetch service data from the server using the serviceId
	    fetch(`/service/${serviceId}`)
	        .then(response => response.json())
	        .then(data => {
	            // Check if data is valid
	            if (data) {
	                // Populate the modal with the service data
	                document.getElementById('serviceName').innerText = data.serviceName;
	                document.getElementById('servicePrice').innerText = data.price.toLocaleString() + ' VND';
	                document.getElementById('serviceDescription').innerText = data.description;

	                // Show the modal
	                document.getElementById('paymentModal').style.display = 'block';
	            } else {
	                alert('Service not found!');
	            }
	        })
	        .catch(error => {
	            console.error('Error fetching service data:', error);
	        });
	}

	// Close the modal
	document.querySelector('.close').onclick = function() {
	    document.getElementById('paymentModal').style.display = 'none';
	};

    </script>


	<script>
		function showPaymentForm() {
			// Show the hidden payment form
			document.getElementById('paymentForm').style.display = 'block';
		}
	</script>
	<script>
		//Get modal, close button, and buttons for showing QR codes
		var modal = document.getElementById("paymentModal");
		var closeModal = document.getElementsByClassName("close")[0];
		var momo1Button = document.getElementById("momo1-button");
		var momo2Button = document.getElementById("momo2-button");
		var qrCodeMomo1 = document.getElementById("qr-code-momo1");
		var qrCodeMomo2 = document.getElementById("qr-code-momo2");

		// Function to show QR code for Momo1
		function showMomo1QR() {
			qrCodeMomo1.style.display = "block";
			qrCodeMomo2.style.display = "none";
		}

		// Function to show QR code for Momo2
		function showMomo2QR() {
			qrCodeMomo2.style.display = "block";
			qrCodeMomo1.style.display = "none";
		}

		// Add event listeners to Momo buttons
		momo1Button.addEventListener('click', showMomo1QR);
		momo2Button.addEventListener('click', showMomo2QR);

		// Add click event to open modal
		var buyButtons = document.getElementsByClassName("openModalButton"); // Button class
		for (let i = 0; i < buyButtons.length; i++) {
			buyButtons[i].addEventListener('click', function() {
				console.log("MUA button clicked"); // Debug log
				modal.style.display = "flex"; // Show modal
			});
		}

		// Close modal when click on close button
		closeModal.onclick = function() {
			modal.style.display = "none";
		}

		// Close modal when clicking outside the modal
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>