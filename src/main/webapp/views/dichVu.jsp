<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* General Pricing Styles */
.container.pricing {
    display: flex;
    justify-content: center; /* Canh giữa các thẻ */
    flex-wrap: wrap; /* Đảm bảo responsive cho thiết bị di động */
    gap: 20px; /* Khoảng cách giữa các thẻ */
    margin-top: 20px; /* Tạo khoảng cách từ phần tử trên */
}

.pricing-card {
    background-color: #f8f9fa; /* Nền sáng hơn */
    border-radius: 8px;
    color: #000000;
    margin-bottom: 30px;
    padding: 20px;
    text-align: center;
    transition: transform 0.3s, box-shadow 0.3s;
    position: relative;
    width: 100%; /* Đảm bảo thẻ chiếm toàn bộ chiều rộng của cột */
    max-width: 300px; /* Chiều rộng tối đa của mỗi thẻ */
}

.pricing-card:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.pricing-header h4 {
    font-size: 20px;
    margin-bottom: 20px;
}

.price {
    font-size: 26px;
    color: #000000; /* Màu chữ */
    margin-bottom: 20px;
}

.features {
    list-style-type: none;
    padding: 0;
    margin-bottom: 20px;
    font-size: 14px;
}

.features li {
    margin-bottom: 10px;
}

.btn-danger {
    background-color: #e50914; /* Màu đỏ của Netflix */
    border: none;
    border-radius: 50px;
    color: #fff; /* Màu chữ trắng */
    padding: 10px 30px;
    text-transform: uppercase;
    transition: background-color 0.3s;
}

.a:hover {
    background-color: #3b841d; /* Màu xanh khi hover */
    color: #fff; /* Đổi màu chữ thành trắng khi hover */
}

.special .pricing-header h4 {
    background-color: #e50914;
    color: #fff;
    padding: 10px;
    border-radius: 8px 8px 0 0;
    margin: -20px -20px 20px -20px;
}

@media (min-width: 760px) {
    .pricing-card {
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
}

/* Modal Background */
.modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Dark background */
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Modal Content */
.modal-content {
    background-color: white;
    border-radius: 10px;
    overflow: hidden;
    width: 90%;
    max-width: 900px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    position: relative;
    display: flex; /* Align children horizontally */
}

/* Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 20px;
    font-size: 24px;
    color: #555;
    cursor: pointer;
}

/* Payment Container */
.payment-container {
    display: flex;
    width: 100%;
    box-sizing: border-box;
}

/* Payment Summary */
.payment-summary {
    background-color: #333;
    color: white;
    padding: 20px;
    width: 40%;
    box-sizing: border-box;
    overflow-y: auto; /* Scroll if content overflows */
}

/* Payment Summary Header */
.payment-summary h3 {
    font-size: 20px;
    margin-bottom: 15px;
}

/* Payment Summary List */
.payment-summary ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.payment-summary li {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid #555;
}

.payment-summary .total-price h1 {
    color: red;
    font-size: 28px;
    margin-bottom: 5px;
}

/* Payment Form */
.payment-form {
    padding: 20px;
    width: 60%;
    box-sizing: border-box;
}

/* Payment Form Header */
.payment-form h3 {
    font-size: 22px;
    margin-bottom: 20px;
}

/* Payment Methods */
.payment-methods {
    display: flex;
    justify-content: center; /* Center buttons horizontally */
    gap: 15px; /* Space between buttons */
    margin-bottom: 20px;
}

.payment-methods button {
    border: none;
    background: none;
    padding: 10px;
    cursor: pointer;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.payment-methods button:hover {
    transform: scale(1.05); /* Slightly enlarges the button on hover */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Adds shadow for a lifting effect */
}

.payment-methods .momo1-btn img,
.payment-methods .momo2-btn img {
    max-width: 120px; /* Adjust size for consistency */
    height: auto;
}

/* QR Code */
.qr-code {
    display: none; /* Initially hide QR code */
    text-align: center;
    margin: 20px 0;
}

.qr-code img {
    max-width: 100%;
    max-height: 300px; /* Adjust as needed */
    border: 1px solid #ddd; /* Optional border for better visibility */
}

/* Submit Button */
.submit-btn {
    width: 100%;
    padding: 12px;
    background-color: #00aaff;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    cursor: pointer;
    margin-top: 10px;
    transition: background-color 0.3s;
}

.submit-btn:hover {
    background-color: #007acc;
}

/* Form Styling */
.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold; /* Better label visibility */
}

.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}

/* Hide Elements */
.hidden {
    display: none;
}
</style>
<body>
	<div class="container pricing">
    <div class="row justify-content-center">
        <!-- Special Package -->
        <div class="col-md-3">
            <div class="pricing-card special">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Đặc Biệt Lên Top</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>299.000 VNĐ / Tháng</strong></p>
                    <ul class="features">
                        <li>Lên Top những thông tin hàng đầu</li>
                    </ul>
                    <button class="btn btn-danger openModalButton">MUA</button>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="pricing-card candidate-premium">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Cho Nhà Tuyển Dụng 1 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>149.000 VNĐ / Tháng</strong></p>
                    <ul class="features">
                        <li>Đăng 10 bài / Tháng</li>
                    </ul>
                    <button class="btn btn-danger openModalButton">MUA</button>
                </div>
            </div>
        </div>
        <!-- Package 2 -->
        <div class="col-md-3">
            <div class="pricing-card candidate-premium">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Cho Nhà Tuyển Dụng 6 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>745.000 VNĐ / 6 Tháng</strong></p>
                    <ul class="features">
                        <li>Đăng 30 bài / Tháng</li>
                    </ul>
                    <button class="btn btn-danger openModalButton">MUA</button>
                </div>
            </div>
        </div>
        <!-- Package 3 -->
        <div class="col-md-3">
            <div class="pricing-card candidate-premium">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Cho Nhà Tuyển Dụng 12 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>1,490.000 VNĐ / 12 Tháng</strong></p>
                    <ul class="features">
                        <li>Đăng 50 bài / Tháng</li>
                    </ul>
                    <button class="btn btn-danger openModalButton">MUA</button>
                </div>
            </div>
        </div>
    </div>
   <!-- Modal -->
<div id="paymentModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="payment-container">
            <!-- Payment Summary -->
            <div class="payment-summary">
                <h3>Tóm tắt thanh toán</h3>
                <ul>
                    <li>
                        <span>Gói đã chọn</span>
                        <span>12 tháng</span>
                    </li>
                </ul>
                <div class="total-price">
                    <h2>Tổng Tiền</h2>
                    <h1>1,490.000 VNĐ</h1>
                    <p>50 bài / Tháng</p>
                </div>
            </div>

            <!-- Payment Form -->
            <div class="payment-form">
                <h3>Thanh Toán</h3>
                <div class="payment-methods">
                    <button class="momo1-btn" id="momo1-button">
                        <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" alt="Momo1">
                    </button>
                    <button class="momo2-btn" id="momo2-button">
                        <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" alt="Momo1">
                    </button>
                </div>

                <div class="qr-code" id="qr-code-momo1" style="display: none;">
                    <img src="/img/QR.png">
                </div>
                
                <div class="qr-code" id="qr-code-momo2" style="display: none;">
                    <img src="/img/QR.png">
                </div>
                
                <button class="submit-btn" type="submit">Xác Nhận</button>
            </div>
        </div>
    </div>
</div>
        </div>

<script>
    // Get modal, close button, and buttons for showing QR codes
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
    var buyButtons = document.getElementsByClassName("openModalButton"); // Replace with your actual button class
    for (let i = 0; i < buyButtons.length; i++) {
        buyButtons[i].addEventListener('click', function() {
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