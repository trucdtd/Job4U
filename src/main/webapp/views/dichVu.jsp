<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* Container settings */
.container.pricing {
    margin-top: 30px;
}

/* Pricing card styles */
.pricing-card {
    border-radius: 8px;
    border: 1px solid #ddd;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    text-align: center;
}

/* Centering the last pricing card */
.container.pricing .row {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; /* Center the cards */
}

.pricing-card {
    width: 100%; /* Ensure cards take full width in smaller viewports */
    max-width: 350px; /* Set a max-width for responsiveness */
}

/* Pricing card individual styling */
.pricing-header {
    background-color: #f8f9fa;
    padding: 20px;
    border-bottom: 1px solid #ddd;
}

.pricing-body {
    padding: 20px;
}

.price {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

.features {
    list-style: none;
    padding: 0;
    margin: 0;
    font-size: 16px;
}

.features li {
    margin-bottom: 10px;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    color: #fff;
    font-size: 16px;
    padding: 10px 20px;
    margin-top: 20px;
    text-decoration: none;
    border-radius: 5px;
    display: inline-block;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

/* Different card styles */
.basic {
    background-color: #f9f9f9;
}

.standard {
    background-color: #e9ecef;
}

.premium {
    background-color: #d4edda;
}

.special {
    background-color: #fff3cd;
}

.candidate-basic {
    background-color: #e7f0ff;
}

.candidate-standard {
    background-color: #d1ecf1;
}

.candidate-premium {
    background-color: #cce5ff;
}

/* Responsive settings */
@media (max-width: 768px) {
    .pricing-card {
        margin-bottom: 15px;
        max-width: 100%;
    }
}
</style>
<body>
	<div class="container pricing">
    <div class="row">
        <!-- Package 1 -->
        <div class="col-md-4">
            <div class="pricing-card basic">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Cho Nhà Tuyển Dụng 1 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>149.000 VNĐ / Tháng</strong></p>
                    <ul class="features">
                        <li>Đăng 10 bài / Tháng</li>
                    </ul>
                    <a class="btn btn-primary" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Package 2 -->
        <div class="col-md-4">
            <div class="pricing-card standard">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Cho Nhà Tuyển Dụng 6 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>745.000 VNĐ / 6 Tháng</strong></p>
                    <ul class="features">
                        <li>Đăng 30 bài / Tháng</li>
                    </ul>
                    <a class="btn btn-primary" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Package 3 -->
        <div class="col-md-4">
            <div class="pricing-card premium">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Cho Nhà Tuyển Dụng 12 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>1,490.000 VNĐ / 12 Tháng</strong></p>
                    <ul class="features">
                        <li>Đăng 50 bài / Tháng</li>
                    </ul>
                    <a class="btn btn-primary" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Special Package -->
        <div class="col-md-4">
            <div class="pricing-card special">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Đặc Biệt Lên Top</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>299.000 VNĐ / Tháng</strong></p>
                    <ul class="features">
                        <li>Lên Top những công tin hàng đầu</li>
                    </ul>
                    <a class="btn btn-primary" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Candidate Package 1 -->
        <div class="col-md-4">
            <div class="pricing-card candidate-basic">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Ứng Viên 1 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>69.000 VNĐ / Tháng</strong></p>
                    <ul class="features">
                        <li>Tạo CV và nộp ứng tuyển 20 lần / Tháng</li>
                    </ul>
                    <a class="btn btn-primary" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Candidate Package 2 -->
        <div class="col-md-4">
            <div class="pricing-card candidate-standard">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Ứng Viên 6 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>345.000 VNĐ / 6 Tháng</strong></p>
                    <ul class="features">
                        <li>Tạo CV và nộp ứng tuyển 30 lần / Tháng</li>
                    </ul>
                    <a class="btn btn-primary" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Candidate Package 3 -->
        <div class="col-md-4">
            <div class="pricing-card candidate-premium">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Ứng Viên 12 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>690.000 VNĐ / 12 Tháng</strong></p>
                    <ul class="features">
                        <li>Tạo CV và nộp ứng tuyển 50 lần / Tháng</li>
                    </ul>
                    <a class="btn btn-primary" href="#">MUA</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>