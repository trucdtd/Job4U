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
<style type="">
/* .card-body img {
	height: 150px;
	width: 100%;
	object-fit: cover;
}

body {
	margin: 0;
	color: #2e323c;
	background: #f5f6fa;
	position: relative;
	height: 100%;
}

.account-settings .user-profile {
	margin: 0 0 1rem 0;
	padding-bottom: 1rem;
	text-align: center;
}

.account-settings .user-profile .user-avatar {
	margin: 0 0 1rem 0;
}

.account-settings .user-profile .user-avatar img {
	width: 90px;
	height: 90px;
	-webkit-border-radius: 100px;
	-moz-border-radius: 100px;
	border-radius: 100px;
}

.account-settings .user-profile h5.user-name {
	margin: 0 0 0.5rem 0;
}

.account-settings .user-profile h6.user-email {
	margin: 0;
	font-size: 0.8rem;
	font-weight: 400;
	color: #9fa8b9;
}

.account-settings .about {
	margin: 2rem 0 0 0;
	text-align: center;
}

.account-settings .about h5 {
	margin: 0 0 15px 0;
	color: #007ae1;
}

.account-settings .about p {
	font-size: 0.825rem;
}

.form-control {
	border: 1px solid #cfd1d8;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	font-size: .825rem;
	background: #ffffff;
	color: #2e323c;
}

.card {
	background: #ffffff;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	border: 0;
	margin-bottom: 1rem;
} */
body{margin-top:20px;}

.member-details {

    padding-bottom: 80px
}

@media (min-width:992px) {
    .member-details {

        padding-bottom: 100px
    }
}

.member-details .member_designation {
    margin-bottom: 30px
}

.member-details .member_designation h2 {
    margin-bottom: 5px;
    margin-top: 25px
}

@media (min-width:768px) {
    .member-details .member_designation h2 {
        margin-top: 0
    }
}

.member-details .member_designation span {
    font-style: italic
}

.member-details .member_desc li {
    display: block;
    float: unset;
    width: 100%
}

.member-details .member_desc li i {
    color: #0cc652;
    font-size: 14px
}

.member-details .member_desc h4 {
    margin-top: 40px
}

.member-details .member_desc p {
    margin-top: 10px
}

.member-details .member_desc .progress-holder {
    margin-top: 30px
}

.member-details .media-box {
    margin-bottom: 20px
}

@media (min-width:992px) {
    .member-details .media-box {
        margin-bottom: 0
    }
}

.member-details .member_contact {
    padding: 40px;
    position: relative;
    margin-top: 40px
}

.member-details .member_contact .media-icon {
    font-size: 32px;
    color: #dae0e6;
    position: relative;
    width: 30px;
    text-align: center;
    float: left;
    margin-right: 15px
}

.member-details .member_contact .media-content {
    padding-left: 0;
    float: left
}

.member-details .member_contact .media-content h5 {
    font-size: 15px
}

.member-details .member_contact .media-content h5,
.member-details .member_contact .media-content a {
    color: #dae0e6
}

@media (min-width:992px) {
    .member-details .member_contact .social-icons {
        text-align: right
    }
}

.member-details .member_contact .social-icons .btn-social {
    width: 40px;
    height: 40px;
    line-height: 40px
}

.member-details .member_contact .social-icons .btn {
    background-color: transparent;
    border: 1px solid;
    border-color: #999;
    color: #dae0e6
}

.member-details .member_contact .social-icons .btn:hover {
    background-color: #0cc652;
    border-color: #0cc652;
    opacity: 1
}

.bg-image-holder,
.bg-image {
    background-size: cover!important;
    background-position: 50% 0!important;
    transition: all .3s linear;
    background: #f5f5f6;
    position: relative
}

.bg-image:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0, 0, 0, .7)
}

.bg-fixed {
    background-attachment: fixed
}

.bg-image .overlay-content {
    position: relative;
    z-index: 5
}


.progress-holder {
    margin-top: 50px
}

.progress-holder .barWrapper .progressText {
    font-size: 15px;
    color: #222
}

.progress-holder .progress {
    margin-bottom: 25px;
    margin-top: 10px;
    overflow: visible;
    background-color: #f5f5f6
}

.progress-holder .progress .progress-bar {
    position: relative
}

.progress-holder .progress .progress-bar:after {
    position: absolute;
    content: '';
    width: 1px;
    height: 33px;
    background-color: #0cc652;
    top: -8px;
    right: 0;
    z-index: 55
}

.img-full {
    width: 100%;
}

p {
    color: #8b8e93;
    font-weight: 300;
    margin-bottom: 0;
    font-size: 14px;
    line-height: 26px;
}


.styled_list {
    margin-top: 15px;
    position: relative;
    display: inline-block
}

@media (min-width:768px) {
    .styled_list {
        margin-top: 15px
    }
}

.styled_list li {
    font-size: 14px;
    line-height: 30px
}

@media (min-width:768px) {
    .styled_list li {
        font-size: 14px;
        float: left;
        width: 50%
    }
}

.styled_list li i {
    margin-right: 10px;
    font-size: 12px
}

.styled_list li a {
    color: #8b8e93
}

@media (min-width:768px) {
    .styled_list li a {
        font-size: 12px
    }
}

@media (min-width:992px) {
    .styled_list li a {
        font-size: 14px
    }
}

ol.styled_list {
    margin-left: 15px
}

ol.styled_list li {
    padding-left: 10px
}
</style>
</head>

<body>
	<div class="container">
		<!-- header -->
		<%@ include file="/views/header.jsp"%>
		<!-- /header -->
		<div class="row mb-4">
			<article class="col-md-9">
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
													<p>${job.salary} VNĐ
													</p>
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
													class="btn btn-secondary">Hủy</a>
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
		

		<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
		<!-- /footer -->
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
</body>
</html>