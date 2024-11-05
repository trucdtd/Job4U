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

.btn:hover {
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

@media (min-width: 768px) {
    .pricing-card {
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
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
                        <li>Lên Top những công tin hàng đầu</li>
                    </ul>
                    <a class="btn btn-danger" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Candidate Package 1 -->
        <div class="col-md-3">
            <div class="pricing-card candidate-basic">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Ứng Viên 1 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>69.000 VNĐ / Tháng</strong></p>
                    <ul class="features">
                        <li>Tạo CV và nộp ứng tuyển 20 lần / Tháng</li>
                    </ul>
                    <a class="btn btn-danger" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Candidate Package 2 -->
        <div class="col-md-3">
            <div class="pricing-card candidate-standard">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Ứng Viên 6 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>345.000 VNĐ / 6 Tháng</strong></p>
                    <ul class="features">
                        <li>Tạo CV và nộp ứng tuyển 30 lần / Tháng</li>
                    </ul>
                    <a class="btn btn-danger" href="#">MUA</a>
                </div>
            </div>
        </div>
        <!-- Candidate Package 3 -->
        <div class="col-md-3">
            <div class="pricing-card candidate-premium">
                <div class="pricing-header">
                    <h4 class="text-center">Gói Ứng Viên 12 Tháng</h4>
                </div>
                <div class="pricing-body text-center">
                    <p class="price"><strong>690.000 VNĐ / 12 Tháng</strong></p>
                    <ul class="features">
                        <li>Tạo CV và nộp ứng tuyển 50 lần / Tháng</li>
                    </ul>
                    <a class="btn btn-danger" href="#">MUA</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>