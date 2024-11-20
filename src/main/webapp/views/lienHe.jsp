<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liên hệ</title>
<link rel="stylesheet" href="assets/css/styles.css">
    <link rel="shortcut icon" href="https://gv.poly.edu.vn/images/favicon.ico">
    <!-- Bootstrap CSS v5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link rel="stylesheet" href="/css/lienHe.css">
</head>
<body>
	<%@ include file="/views/headerNoPanner.jsp"%>
    <div class="contaiiner">
        <div class="contact-info">
            <h3>Thông tin liên hệ</h3>
            <!-- <div style="display: flex; flex-direction: row;">
                <div style="margin-right: 20px; margin-left: 5px;">
                    <p><span><i class="fa-solid fa-mobile-screen-button"></i> Nhà tuyển dụng:</span></p>
                    <p><span><i class="fa-solid fa-mobile-button"></i> Ứng viên:</span></p>
                    <p><span><i class="fas fa-phone"></i> Phone:</span></p>
                    <p><span><i class="fas fa-envelope"></i> Email:</span></p>
                    <p><span><i class="fas fa-building"></i> Đơn vị chủ quản:</span></p>
                    <p><span><i class="fas fa-id-card"></i> Giấy phép ĐKKD:</span></p>
                    <p><span><i class="fas fa-map-marker-alt"></i> Địa chỉ:</span></p>
                </div>
                <div style="margin-left: 50px;">
                    <p>09777.850.32</p>
                    <p>0977.785.032</p>
                    <p>02926.282.383</p>
                    <p>cantho@vietnamhr.vn</p>
                    <p>Công Ty Cổ Phần Giải Pháp Công Nghệ Vietcore</p>
                    <p>1801316399</p>
                    <p>Đ.Số 22, Thường Thạnh, Cái Răng, Cần Thơ 900000, Can Tho, Vietnam</p>
                </div>
            </div> -->
            <div class="info-wrapper">
                <p><span><i class="fa-solid fa-mobile-screen-button"></i>Nhà tuyển dụng:</span>0949414109</p>
                <p><span><i class="fa-solid fa-mobile-button"></i>Ứng viên:</span>0834341699</p>
                <p><i class="fas fa-phone"></i><span>Phone:</span>0939826844</p>
                <p><i class="fas fa-envelope"></i><span>Email:</span>job4yousine2024@gmail.com</p>
                <p><i class="fas fa-building"></i><span>Đơn vị chủ quản:</span>Công Ty job4u</p>
                <p><i class="fas fa-id-card"></i><span>Giấy phép ĐKKD:</span>1801170680</p>
                <p><i class="fas fa-map-marker-alt"></i><span>Địa chỉ:</span>Đ.Số 22, Thường Thạnh, Cái Răng, Cần Thơ 900000, Vietnam</p>
            </div>
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4729.9223467382235!2d105.75506452688276!3d9.98209871086737!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a08906415c355f%3A0x416815a99ebd841e!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIEZQVCBQb2x5dGVjaG5pYw!5e0!3m2!1svi!2s!4v1724593237240!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
           
        </div>
        <div class="contact-form">
            <c:if test="${not empty success}">
        <p style="color: green;">${success}</p>
    </c:if>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
            <h3 style="color: #00688b;">Gửi yêu cầu liên hệ </h3>
            <form id="contactForm" method="POST" action="/lienhe/sendEmail">
                <input type="text" name="fullname" placeholder="* Họ & tên" required>
                <input type="text" name="phonenumber" placeholder="* Điện thoại" required>
                <input type="email" name="email" placeholder="* Email" required>
                <textarea placeholder="Nội dung liên hệ" name="content" ></textarea>
                <button style="background-color: #00688b;" type="submit">Liên hệ</button>
            </form>
        </div>
    </div>
    <%@ include file="/views/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>