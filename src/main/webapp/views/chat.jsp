<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<div class="container">
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
                        <button type="button" class="btn btn-secondary w-50">Quay Lại</button>
                    </div>
                    <div class="col-6">
                        <button type="button" class="btn btn-primary w-100">Gửi Phản Hồi</button>
                    </div>
                </div>
            </form>
        <!-- </div> -->
    </div>
</div>
	</div>
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
</body>
</html>