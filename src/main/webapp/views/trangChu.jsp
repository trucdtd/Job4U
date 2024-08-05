<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<!--link icon gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</head>
<style>
#contact-widget {
	position: fixed;
	bottom: 20px;
	right: 20px;
	z-index: 1000;
}

.chat-button, .form-button {
	border: none;
	border-radius: 50%;
	width: 60px;
	height: 60px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
	cursor: pointer;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	position: absolute;
}

#contact-button {
	background-color: #007bff;
	border-radius: 50%;
	color: white;
	bottom: 0;
	right: 0;
}

#additional-button {
	background-color: #6c757d;
	border-radius: 50%;
	color: white;
	bottom: 70px; /* Đặt cách nút chat một khoảng */
	right: 0;
}

#contact-button-container {
	display: flex;
	align-items: center;
	position: relative;
	width: 200px;
}

.gy {
	display: flex;
	flex-wrap: wrap;
	gap: 10px; /* Khoảng cách giữa các phần tử */
}

.gy label {
	margin: 5px 0; /* Khoảng cách dọc giữa các nhãn */
}

.gy input {
	margin-right: 5px; /* Khoảng cách ngang giữa checkbox và nhãn */
}

.chat-content {
	display: flex;
	align-items: center;
	color: white;
	background-color: #007bff;
	border-radius: 50px;
	padding: 10px;
	margin-left: 10px;
}
        .chat-content {
            display: flex;
            align-items: center;
            color: white;
            background-color: #007bff;
            border-radius: 50px;
            padding: 10px;
            margin-left: 10px;
        }
        
         #message {
         display: none;
            position: absolute;
            bottom: 80px;
            right: 0;
            width: 320px;
            border-radius: 8px;
        }
        
        #message .btn-close {
            float: right;
            margin-left: 10px;
        }

        #popup-form {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
            z-index: 2000;
        }

#message {
	position: absolute;
	bottom: 80px;
	right: 0;
	width: 320px;
	border-radius: 8px;
}

#message .btn-close {
	float: right;
	margin-left: 10px;
}

#popup-form {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 700px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	padding: 20px;
	z-index: 2000;
}

#popup-form .btn-close {
	float: right;
	margin-left: 10px;
}
        .stars label {
            font-size: 2rem;
            cursor: pointer;
        }

.rating {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
}

.stars {
	display: flex;
	margin: 0 10px;
	justify-content: center;
	margin-bottom: 10px;
}

.stars input {
	display: none;
}

.stars label {
	font-size: 2rem;
	cursor: pointer;
	margin: 0 53px; /* Khoảng cách giữa các ngôi sao */
}

.stars input:checked ~ label {
	color: gold;
}

.stars label:hover, .stars label:hover ~ label {
	color: gold;
}

.star-labels {
	display: flex;
	justify-content: center;
	width: 100%;
}

.star-labels div {
	width: 20%;
	text-align: center;
	font-size: 1rem;
	margin-top: -10px;
}
</style>
<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->
		<div class="row">
			<aside class="col-md-3">
				<h3>Bộ lộc</h3>
				<div class="container mt-4">
					<form action="/job4u/findJob" method="GET">
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="form-label" id="industry" name="industry">Ngành
									nghề</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Nông nghiệp"> <label class="form-check-label">Nông
										nghiệp</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Công nghiệp"> <label class="form-check-label">Công nghiệp</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry" value="Dịch vụ">
									<label class="form-check-label">Dịch vụ</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Công nghệ thông tin"> <label
										class="form-check-label">Công nghệ thông tin</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Công nghệ ô tô"> <label class="form-check-label">Công
										nghệ ô tô</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Xây dựng"> <label class="form-check-label">Xây dựng</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Giao thông vận tải"> <label
										class="form-check-label">Giao
										thông vận tải</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry"
										value="Ngân hàng và Tài chính"> <label
										class="form-check-label" for="finance">Ngân hàng và
										Tài chính</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry" value="Giáo dục"> <label
										class="form-check-label">Giáo dục</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry" value="Y tế"> <label
										class="form-check-label" for="healthcare">Y tế</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry" value="Truyền thông"> <label
										class="form-check-label" for="media">Truyền thông</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry" value="Du lịch"> <label
										class="form-check-label">Du lịch</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry" value="Hành chính văn phòng"> <label class="form-check-label">Hành chính văn phòng</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="industry" value="Khác"> <label
										class="form-check-label" for="other">Khác....</label>
								</div>
							</div>
							<div class="col-md-12 mt-3">
								<label class="form-label">Tỉnh/Thành phố</label> <select
									class="form-select" id="joblocation" name="joblocation">
									<option value="All" selected>Tất cả</option>
									<option value="An Giang">An Giang</option>
									<option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
									<option value="Bạc Liêu">Bạc Liêu</option>
									<option value="Bắc Giang">Bắc Giang</option>
									<option value="Bắc Kạn">Bắc Kạn</option>
									<option value="Bắc Ninh">Bắc Ninh</option>
									<option value="Bến Tre">Bến Tre</option>
									<option value="Bình Định">Bình Định</option>
									<option value="Bình Dương">Bình Dương</option>
									<option value="Bình Phước">Bình Phước</option>
									<option value="Bình Thuận">Bình Thuận</option>
									<option value="Cà Mau">Cà Mau</option>
									<option value="Cao Bằng">Cao Bằng</option>
									<option value="Cần Thơ">Cần Thơ</option>
									<option value="Đà Nẵng">Đà Nẵng</option>
									<option value="Đắk Lắk">Đắk Lắk</option>
									<option value="Đắk Nông">Đắk Nông</option>
									<option value="Điện Biên">Điện Biên</option>
									<option value="Đồng Nai">Đồng Nai</option>
									<option value="Đồng Tháp">Đồng Tháp</option>
									<option value="Gia Lai">Gia Lai</option>
									<option value="Hà Giang">Hà Giang</option>
									<option value="Hà Nam">Hà Nam</option>
									<option value="Hà Nội">Hà Nội</option>
									<option value="Hà Tĩnh">Hà Tĩnh</option>
									<option value="Hải Dương">Hải Dương</option>
									<option value="Hải Phòng">Hải Phòng</option>
									<option value="Hậu Giang">Hậu Giang</option>
									<option value="Hòa Bình">Hòa Bình</option>
									<option value="Hưng Yên">Hưng Yên</option>
									<option value="Khánh Hòa">Khánh Hòa</option>
									<option value="Kiên Giang">Kiên Giang</option>
									<option value="Kon Tum">Kon Tum</option>
									<option value="Lai Châu">Lai Châu</option>
									<option value="Lâm Đồng">Lâm Đồng</option>
									<option value="Lạng Sơn">Lạng Sơn</option>
									<option value="Lào Cai">Lào Cai</option>
									<option value="Long An">Long An</option>
									<option value="Nam Định">Nam Định</option>
									<option value="Nghệ An">Nghệ An</option>
									<option value="Ninh Bình">Ninh Bình</option>
									<option value="Ninh Thuận">Ninh Thuận</option>
									<option value="Phú Thọ">Phú Thọ</option>
									<option value="Phú Yên">Phú Yên</option>
									<option value="Quảng Bình">Quảng Bình</option>
									<option value="Quảng Nam">Quảng Nam</option>
									<option value="Quảng Ngãi">Quảng Ngãi</option>
									<option value="Quảng Ninh">Quảng Ninh</option>
									<option value="Quảng Trị">Quảng Trị</option>
									<option value="Sóc Trăng">Sóc Trăng</option>
									<option value="Sơn La">Sơn La</option>
									<option value="Tây Ninh">Tây Ninh</option>
									<option value="Thái Bình">Thái Bình</option>
									<option value="Thái Nguyên">Thái Nguyên</option>
									<option value="Thanh Hóa">Thanh Hóa</option>
									<option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
									<option value="Tiền Giang">Tiền Giang</option>
									<option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
									<option value="Trà Vinh">Trà Vinh</option>
									<option value="Tuyên Quang">Tuyên Quang</option>
									<option value="Vĩnh Long">Vĩnh Long</option>
									<option value="Vĩnh Phúc">Vĩnh Phúc</option>
									<option value="Yên Bái">Yên Bái</option>
								</select>
							</div>
							<div class="col-md-auto mt-3">
								<button type="submit" class="btn text-light"
									style="background: #00688B">
									<i class="bi bi-search"></i> Tìm kiếm
								</button>
							</div>
						</div>
					</form>
				</div>
			</aside>

			<article class="col-md-9">
				<!-- danh sách việc làm -->
				<%@ include file="/views/danhSachViecLam.jsp"%>
				<!-- /danh sách việc làm -->
			</article>
		</div>

		<!-- Nút Chat và Nút Form -->
		<div id="contact-widget">
			<!-- Nút bổ sung nằm trên nút chat -->
			<button id="additional-button" class="form-button btn btn-secondary">
				<i class="fas fa-info"></i>
				<!-- Biểu tượng cho nút bổ sung -->
			</button>
			<button id="contact-button" class="chat-button btn btn-primary">
				<i class="fas fa-comments"></i>
				<!-- Biểu tượng chat -->
			</button>
			<div id="message">
				<button type="button" class="btn-close" aria-label="Close"></button>
				<div class="list-group">
					<a href="" class="list-group-item list-group-item-action active"
						aria-current="true">Trung tâm hỗ trợ</a> <a href="#"
						class="list-group-item list-group-item-action">Hướng dẫn quản
						lý tài khoản</a> <a href="#"
						class="list-group-item list-group-item-action">Yêu cầu hỗ trợ</a>
					<a href="#" class="list-group-item list-group-item-action disabled"
						aria-disabled="true">Liên Hệ Job4u</a>
				</div>
			</div>
		</div>

		<!-- Form Popup -->
		<div id="popup-form">
			<button type="button" class="btn-close" aria-label="Close"></button>
			<h4>
				<b>Góp Ý và Phản Hồi</b>
			</h4>
			<form>
				<a>Phản hồi của bạn rất quan trọng, Job4u mong nhận được nhiều
					góp ý từ bạn để cải thiện tốt hơn.</a> <br> <br>
				<h6>
					<b>Góp Ý</b>
				</h6>
				<div class="gy">
					<input type="checkbox" class="btn-check" id="btn-check-1"
						autocomplete="off"> <label class="btn btn-outline-success"
						for="btn-check-1">Công cụ tạo CV</label> <input type="checkbox"
						class="btn-check" id="btn-check-2" autocomplete="off"> <label
						class="btn btn-outline-success" for="btn-check-2">Công Cụ
						tìm kiếm</label> <input type="checkbox" class="btn-check" id="btn-check-3"
						autocomplete="off"> <label class="btn btn-outline-success"
						for="btn-check-3">Tính năng/giao diện Web</label> <input
						type="checkbox" class="btn-check" id="btn-check-4"
						autocomplete="off"> <label class="btn btn-outline-success"
						for="btn-check-4">Thông tin công ty</label> <input
						type="checkbox" class="btn-check" id="btn-check-5"
						autocomplete="off"> <label class="btn btn-outline-success"
						for="btn-check-5">Khác</label>
				</div>
				<br>
				<div class="mb-3">
					<h6 for="exampleFormControlTextarea1" class="form-label">
						<b>Mô tả Phản Hồi</b>
					</h6>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
				<br>
				<h6>
					<b>Đánh giá sản phẩm</b>
				</h6>
				<div class="rating">
					<div class="stars">
						<input type="radio" id="star5" name="rating" value="5" /> <label
							for="star5" title="5 stars">★</label> <input type="radio"
							id="star4" name="rating" value="4" /> <label for="star4"
							title="4 stars">★</label> <input type="radio" id="star3"
							name="rating" value="3" /> <label for="star3" title="3 stars">★</label>
						<input type="radio" id="star2" name="rating" value="2" /> <label
							for="star2" title="2 stars">★</label> <input type="radio"
							id="star1" name="rating" value="1" /> <label for="star1"
							title="1 star">★</label>
					</div>
					<div class="star-labels">
						<div>Tuyệt vời</div>
						<div>Tốt</div>
						<div>Bình thường</div>
						<div>Tệ</div>
						<div>Rất tệ</div>
					</div>
				</div>
				<hr>
				<button type="button" class="btn btn-secondary">Hủy</button>
				<button type="button" class="btn btn-primary">Gửi Phản Hồi</button>
			</form>
		</div>


			<!-- Nút Chat và Nút Form -->
    <div id="contact-widget">
        <!-- Nút bổ sung nằm trên nút chat -->
        <button id="additional-button" class="form-button btn btn-secondary">
            <i class="fas fa-info"></i> <!-- Biểu tượng cho nút bổ sung -->
        </button>
        <button id="contact-button" class="chat-button btn btn-primary">
            <i class="fas fa-comments"></i> <!-- Biểu tượng chat -->
        </button>
        <div id="message">
            <button type="button" class="btn-close" aria-label="Close"></button>
            <div class="list-group">
                <a href="" class="list-group-item list-group-item-action active" aria-current="true">Trung tâm hỗ trợ</a>
                <a href="#" class="list-group-item list-group-item-action">Hướng dẫn quản lý tài khoản</a>
                <a href="#" class="list-group-item list-group-item-action">Yêu cầu hỗ trợ</a>
                <a href="#" class="list-group-item list-group-item-action disabled" aria-disabled="true">Liên Hệ Job4u</a>
            </div>
        </div>
    </div>

    <!-- Form Popup -->
<div id="popup-form">
        <div class="row justify-content-center">
        	<!-- <div class="row justify-content-center"> -->
            <div style="float: right;">
                    <button type="button" class="btn-close" aria-label="Close"></button>
            </div>            
                    <h4 class="text-center"><b>Góp Ý và Phản Hồi</b></h4>
                    <br>
            <form>
                <div class="row mb-3">
                    <div class="col-12">
                        <p>Phản hồi của bạn rất quan trọng, Job4u mong nhận được nhiều góp ý từ bạn để cải thiện tốt hơn.</p>
                    </div>
                </div>
                    <div class="col-12">
                        <h6><b>Góp Ý</b></h6>
                    </div>
                    <div class="col-12">
                        <div class="form-check form-check-inline" style="margin: 5px">
                            <input type="checkbox" class="btn-check" id="btn-check-1" autocomplete="off">
                            <label class="btn btn-outline-success" for="btn-check-1">Công cụ tạo CV</label>
                        </div>
                        <div class="form-check form-check-inline" style="margin: 5px">
                            <input type="checkbox" class="btn-check" id="btn-check-2" autocomplete="off">
                            <label class="btn btn-outline-success" for="btn-check-2">Công Cụ tìm kiếm</label>
                        </div>
                        <div class="form-check form-check-inline" style="margin: 5px">
                            <input type="checkbox" class="btn-check" id="btn-check-3" autocomplete="off">
                            <label class="btn btn-outline-success" for="btn-check-3">Tính năng/giao diện Web</label>
                        </div>
                        <div class="form-check form-check-inline" style="margin: 5px">
                            <input type="checkbox" class="btn-check" id="btn-check-4" autocomplete="off">
                            <label class="btn btn-outline-success" for="btn-check-4">Thông tin công ty</label>
                        </div>
                        <div class="form-check form-check-inline" style="margin: 5px">
                            <input type="checkbox" class="btn-check" id="btn-check-5" autocomplete="off">
                            <label class="btn btn-outline-success" for="btn-check-5">Khác</label>
                        </div>
                    </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <h6 for="exampleFormControlTextarea1" class="form-label"><b>Mô tả Phản Hồi</b></h6>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <h6><b>Đánh giá sản phẩm</b></h6>
                        <div class="rating">
                            <div class="stars">
                                <input type="radio" id="star5" name="rating" value="5" />
                                <label for="star5" title="5 stars">★</label>
                                <input type="radio" id="star4" name="rating" value="4" />
                                <label for="star4" title="4 stars">★</label>
                                <input type="radio" id="star3" name="rating" value="3" />
                                <label for="star3" title="3 stars">★</label>
                                <input type="radio" id="star2" name="rating" value="2" />
                                <label for="star2" title="2 stars">★</label>
                                <input type="radio" id="star1" name="rating" value="1" />
                                <label for="star1" title="1 star">★</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <button type="button" class="btn btn-secondary w-50">Hủy</button>
                    </div>
                    <div class="col-6">
                        <button type="button" class="btn btn-primary w-100">Gửi Phản Hồi</button>
                    </div>
                </div>
            </form>
        <!-- </div> -->
    </div>
</div>
		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- /footer -->
	</div>
	<!-- Chat -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const contactButton = document.getElementById('contact-button');
			const message = document.getElementById('message');
			const closeButton = document.querySelector('#message .btn-close');
			const additionalButton = document
					.getElementById('additional-button');
			const popupForm = document.getElementById('popup-form');
			const formCloseButton = popupForm.querySelector('.btn-close');

			contactButton.addEventListener('click', function() {
				message.style.display = message.style.display === 'none'
						|| message.style.display === '' ? 'block' : 'none';
			});

			closeButton.addEventListener('click', function() {
				message.style.display = 'none';
			});

			additionalButton.addEventListener('click', function() {
				popupForm.style.display = 'block';
			});

			formCloseButton.addEventListener('click', function() {
				popupForm.style.display = 'none';
			});
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>