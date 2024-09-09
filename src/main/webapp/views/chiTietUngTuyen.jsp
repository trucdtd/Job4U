<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--link icon gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/chitietungtuyen.css">
</head>
<body>
<!-- header -->
	<%@ include file="/views/header.jsp"%>
	<!-- header -->
	
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
</body>
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
</html>