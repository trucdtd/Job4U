<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
html, body {
    height: 100%;
    margin: 0;
}

/* Wrapper để bao bọc toàn bộ nội dung và footer */
.wrapper {
    min-height: 100%; /* Chiều cao tối thiểu là 100% của trang */
    display: flex;
    flex-direction: column;
}

/* Content chính sẽ chiếm hết không gian còn lại */
.content {
    flex: 1; /* Chiếm không gian còn lại phía trên footer */
}


/* Hình ảnh thành viên */
.img-container {
    text-align: center;
    margin-bottom: 15px;
}

.img-container img {
    border-radius: 50%; /* Hình tròn */
    width: 100%; /* Chiều rộng đầy đủ của container */
    max-width: 150px; /* Giới hạn chiều rộng tối đa */
    height: auto;
    border: 3px solid #007bff; /* Đường viền xanh */
}

/* Phần mô tả thành viên */
.member_designation h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

.member_designation span {
    font-size: 16px;
    color: blue;
    text-decoration: underline;
}

.member_desc h6 {
    margin-top: 10px;
    margin-bottom: 5px;
}

.member_desc p {
    margin: 0;
    padding: 0;
    color: #555;
}

/* Định dạng lương */
#salary {
    color: #28a745; /* Màu xanh lá cho lương */
    font-weight: bold;
}

/* Tiêu đề phần mô tả công việc và yêu cầu công việc */
.member_desc h4 {
    font-size: 18px;
    margin-top: 20px;
    font-weight: bold;
    color: #007bff;
}

/* Định dạng các nút */
.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    font-size: 16px;
    padding: 10px 20px;
    margin-left: 10px;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

.btn-secondary {
    background-color: #6c757d;
    border-color: #6c757d;
    font-size: 16px;
    padding: 10px 20px;
}

.btn-secondary:hover {
    background-color: #5a6268;
    border-color: #545b62;
}

/* Căn chỉnh các phần tử trong row */
.row {
    margin-bottom: 15px;
}

.member_desc {
    margin-bottom: 15px;
}

.member_desc p {
    margin-left: 10px;
    color: #555;
}

/* Phần liên kết chân trang */
.text-right {
    text-align: right;
    margin-top: 20px;
}

/* Responsive */
@media (max-width: 768px) {
    .img-container img {
        max-width: 120px;
    }

    .member_designation h2 {
        font-size: 20px;
    }

    .member_desc h6 {
        font-size: 12px;
    }

    .member_desc p {
        font-size: 12px;
    }

    .btn-primary, .btn-secondary {
        font-size: 14px;
        padding: 8px 16px;
    }
</style>
</head>

<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<!-- /header -->
	<div class="container">
		<div class="row">
			<article class="col-md">
				<div class="container">
					<section class="member-details">
						<div class="container">
							<div class="row">
								<div class="col-lg-3 col-md-4">
									<div class="img-container">
										<img src="https://bootdey.com/img/Content/avatar/avatar6.png"
											alt="team member" class="img-full">
									</div>
								</div>
								<div class="col-lg-9 col-md-8">
									<div class="member_designation">
										<h2>${job.employer.companyname}</h2>
										<span style="color: blue; text-decoration: underline;">${job.employer.companywebsite}</span>
									</div>
									<div class="member_desc">
										<p>${job.employer.companydescription}</p>
										<div class="row">
											<div class="col-lg-6 member_desc">
												<h6>
													Ngành Nghề :
													<p>${job.employer.industry}</p>
												</h6>
												<h6 for="eMail">
													Địa Chỉ :
													<p>${job.employer.address}</p>
												</h6>
												<h6 for="phone">
													Vị trí :
													<p>${job.jobtitle}</p>
												</h6>
												<h6 for="zIp">
													Địa Điểm Làm Việc :
													<p>${job.joblocation}</p>
												</h6>
											</div>
											<div class="col-lg-6 member_desc">
												<h6 for="ciTy">
													Lương :
													<p id="salary">${job.salary}VNĐ</p>
												</h6>
												<h6 for="phone">
													Người Liên Hệ:
													<p>${job.employer.contactperson}</p>
												</h6>
												<h6 for="Street">
													Loại Công Việc :
													<p>${job.jobtype}</p>
												</h6>
											</div>
										</div>
									</div>
									<div class="member_desc">
										<h4>Yêu cầu công việc</h4>
										<p>${job.jobrequirements}</p>
										<h4>Mô tả về công việc</h4>
										<p>${job.jobdescription}</p>
									</div>
									<div class="row ">
										<div class="col-lg-6 member_desc">
											<h4>Ngày Đăng</h4>
											<p>${formattedPostedDate}</p>
										</div>
										<div class="col-lg-6 member_desc">
											<h4>Hạn nộp</h4>
											<p>${formattedApplicationDeadline}</p>
										</div>
									</div>
									<br>
									<div class="row gutters">
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="text-right">
												<a href="/job4u" type="button" id="submit" name="submit"
													class="btn btn-secondary">Quay lại</a>
												<button type="button" id="submit" name="submit"
													class="btn btn-primary">Ứng Tuyển</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</article>
		</div>
</div>
	<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
	<!-- /footer -->

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Lấy phần tử có id "salary"
            var salaryElement = document.getElementById("salary");

            // Lấy nội dung văn bản của phần tử
            var salaryText = salaryElement.textContent || salaryElement.innerText;

            // Xóa chữ VNĐ và khoảng trắng
            salaryText = salaryText.replace('VNĐ', '').trim();

            // Chuyển đổi số tiền thành số nguyên
            var salaryNumber = parseFloat(salaryText.replace(/\./g, '').replace(/,/g, ''));

            // Định dạng số tiền với dấu phẩy và dấu chấm theo yêu cầu
            var formattedSalary = salaryNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

            // Thay đổi định dạng từ dấu phẩy thành dấu chấm cho phân cách triệu
            var parts = formattedSalary.split(',');
            if (parts.length > 1) {
                var integerPart = parts.slice(0, -1).join(','); // Phần nguyên
                var decimalPart = parts[parts.length - 1]; // Phần thập phân
                formattedSalary = integerPart + '.' + decimalPart;
            }

            // Cập nhật nội dung của phần tử với giá trị đã thay đổi
            salaryElement.innerHTML = formattedSalary + ' VNĐ';
        });
    </script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>