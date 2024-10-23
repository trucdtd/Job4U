<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
 /* CSS cho toàn trang */
 * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    padding: 20px;
}

.cv-container {
    display: flex;
    width: 100%;
    max-width: 900px;
    margin: 0 auto;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.left-column {
    background-color: #f8e1e6;
    width: 35%;
    padding: 20px;
    text-align: center;
}

.profile-pic {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    margin-bottom: 20px;
}

.left-column h2 {
    font-size: 24px;
    margin-bottom: 5px;
}

.left-column p {
    font-size: 14px;
    color: #666;
}

.info h3 {
    margin-top: 20px;
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
}

.right-column {
    width: 65%;
    padding: 30px;
}

.right-column h3 {
    font-size: 20px;
    color: #333;
    margin-bottom: 10px;
}

.right-column p {
    font-size: 14px;
    line-height: 1.6;
    margin-bottom: 15px;
}

.right-column ul {
    list-style-type: disc;
    margin-left: 20px;
}

.photo-frame {
    margin-left: 60px;
    width: 150px; /* Chiều rộng theo tỷ lệ 3x4 */
    height: 200px; /* Chiều cao theo tỷ lệ 3x4 */
    border: 2px solid #ccc; /* Khung viền */
    padding: 5px; /* Khoảng cách giữa ảnh và khung viền */
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f8f8f8; /* Màu nền cho khung */
}

.profile-photo {
    width: 100%;
    height: 100%;
    object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
}


</style>

</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<br>
    <div class="cv-container">
        <div class="left-column">
            <div class="photo-frame">
                <img src="profile.jpg" alt="Ảnh thẻ" class="profile-photo">
            </div>
            
            <div class="info">
                <h3>Thông tin cá nhân</h3>
                <p>Địa chỉ: <br>123 Đường ABC, Quận 1, TP.HCM</p>
                <p>Số điện thoại: <br>0123 456 789</p>
                <p>Email: <br>vuongminhtam@gmail.com</p>
            </div>
        </div>

        <div class="right-column">
            <h2>Vương Minh Tâm</h2>
            <p>Chuyên viên dịch vụ khách hàng</p>
            <h3>Kinh nghiệm làm việc</h3>
            <p><strong>Chuyên viên dịch vụ khách hàng</strong> <br> Công ty XYZ <br> 2019 - Hiện tại</p>
            <p>- Hỗ trợ khách hàng qua điện thoại, email</p>
            <p>- Giải quyết các vấn đề liên quan đến đơn hàng và dịch vụ</p>

            <h3>Học vấn</h3>
            <p><strong>Cử nhân Quản trị Kinh doanh</strong> <br> Đại học ABC <br> 2014 - 2018</p>
            
            <h3>Kỹ năng</h3>
            <ul>
                <li>Kỹ năng giao tiếp</li>
                <li>Giải quyết vấn đề</li>
                <li>Tiếng Anh (B2)</li>
            </ul>
        </div>
    </div>
    <br>
    <!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
</body>
</html>