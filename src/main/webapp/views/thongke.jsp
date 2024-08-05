<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!--link css gắn trực tiếp trên bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<link href="/css/style.css" rel="stylesheet">
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

		<div class="pagetitle">
			<h1>THONG KE</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/job4u/userManager">Home</a></li>
					<li class="breadcrumb-item active">Thống kê chi tiết</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										... <span>| Today</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>145</h6>
											<span class="text-success small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										... <span>| This Month</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>$3,264</h6>
											<span class="text-success small pt-1 fw-bold">8%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-12">

							<div class="card info-card customers-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										... <span>| This Year</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6>1244</h6>
											<span class="text-danger small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">decrease</span>

										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card -->

						<!-- Reports -->
						<div class="col-12">
							<div class="card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>	
								<div class="card-body">
									<h5 class="card-title">
										Biều Đồ <span>/Today</span>
									</h5>
									<div class="panel panel-default">
                                <!-- /.panel-heading -->
                                
                                <!-- /.panel-body -->
                            		</div>
								</div>

							</div>
						</div>
						<!-- End Reports -->

						<!-- Recent Sales -->
						<div class="col-12">
							<div class="card recent-sales overflow-auto">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Recent Sales <span>| Today</span>
									</h5>

									<table class="table table-borderless datatable">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Customer</th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row"><a href="#">#2457</a></th>
												<td>Brandon Jacob</td>
												<td><a href="#" class="text-primary">At praesentium
														minu</a></td>
												<td>$64</td>
												<td><span class="badge bg-success">Approved</span></td>
											</tr>
											<tr>
												<th scope="row"><a href="#">#2147</a></th>
												<td>Bridie Kessler</td>
												<td><a href="#" class="text-primary">Blanditiis
														dolor omnis similique</a></td>
												<td>$47</td>
												<td><span class="badge bg-warning">Pending</span></td>
											</tr>
											<tr>
												<th scope="row"><a href="#">#2049</a></th>
												<td>Ashleigh Langosh</td>
												<td><a href="#" class="text-primary">At recusandae
														consectetur</a></td>
												<td>$147</td>
												<td><span class="badge bg-success">Approved</span></td>
											</tr>
											<tr>
												<th scope="row"><a href="#">#2644</a></th>
												<td>Angus Grady</td>
												<td><a href="#" class="text-primar">Ut voluptatem
														id earum et</a></td>
												<td>$67</td>
												<td><span class="badge bg-danger">Rejected</span></td>
											</tr>
											<tr>
												<th scope="row"><a href="#">#2644</a></th>
												<td>Raheem Lehner</td>
												<td><a href="#" class="text-primary">Sunt similique
														distinctio</a></td>
												<td>$165</td>
												<td><span class="badge bg-success">Approved</span></td>
											</tr>
										</tbody>
									</table>

								</div>

							</div>
						</div>
						<!-- End Recent Sales -->

						<!-- Top Selling -->
						<div class="col-12">
							<div class="card top-selling overflow-auto">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body pb-0">
									<h5 class="card-title">
										Top Selling <span>| Today</span>
									</h5>

									<table class="table table-borderless">
										<thead>
											<tr>
												<th scope="col">Preview</th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Sold</th>
												<th scope="col">Revenue</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-1.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Ut
														inventore ipsa voluptas nulla</a></td>
												<td>$64</td>
												<td class="fw-bold">124</td>
												<td>$5,828</td>
											</tr>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-2.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Exercitationem
														similique doloremque</a></td>
												<td>$46</td>
												<td class="fw-bold">98</td>
												<td>$4,508</td>
											</tr>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-3.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Doloribus
														nisi exercitationem</a></td>
												<td>$59</td>
												<td class="fw-bold">74</td>
												<td>$4,366</td>
											</tr>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-4.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Officiis
														quaerat sint rerum error</a></td>
												<td>$32</td>
												<td class="fw-bold">63</td>
												<td>$2,016</td>
											</tr>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-5.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Sit
														unde debitis delectus repellendus</a></td>
												<td>$79</td>
												<td class="fw-bold">41</td>
												<td>$3,239</td>
											</tr>
										</tbody>
									</table>

								</div>

							</div>
						</div>
						<!-- End Top Selling -->

					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-4">

					<!-- Recent Activity -->
					<div class="card">
						<div class="filter">
							<a class="icon" href="#" data-bs-toggle="dropdown"><i
								class="bi bi-three-dots"></i></a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
								<li class="dropdown-header text-start">
									<h6>Filter</h6>
								</li>

								<li><a class="dropdown-item" href="#">Today</a></li>
								<li><a class="dropdown-item" href="#">This Month</a></li>
								<li><a class="dropdown-item" href="#">This Year</a></li>
							</ul>
						</div>

						<div class="card-body">
							<h5 class="card-title">
								Hoạt động gần đây <span>| Today</span>
							</h5>

							<div class="activity">

								<div class="activity-item d-flex">
									<div class="activite-label">32 min</div>
									<i
										class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
									<div class="activity-content">
										Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo
											officiis</a> beatae
									</div>
								</div>
								<!-- End activity item-->

								<div class="activity-item d-flex">
									<div class="activite-label">56 min</div>
									<i
										class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
									<div class="activity-content">Voluptatem blanditiis
										blanditiis eveniet</div>
								</div>
								<!-- End activity item-->

								<div class="activity-item d-flex">
									<div class="activite-label">2 hrs</div>
									<i
										class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
									<div class="activity-content">Voluptates corrupti
										molestias voluptatem</div>
								</div>
								<!-- End activity item-->

								<div class="activity-item d-flex">
									<div class="activite-label">1 day</div>
									<i
										class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
									<div class="activity-content">
										Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati
											voluptatem</a> tempore
									</div>
								</div>
								<!-- End activity item-->

								<div class="activity-item d-flex">
									<div class="activite-label">2 days</div>
									<i
										class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
									<div class="activity-content">Est sit eum reiciendis
										exercitationem</div>
								</div>
								<!-- End activity item-->

								<div class="activity-item d-flex">
									<div class="activite-label">4 weeks</div>
									<i
										class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
									<div class="activity-content">Dicta dolorem harum nulla
										eius. Ut quidem quidem sit quas</div>
								</div>
								<!-- End activity item-->

							</div>

						</div>
					</div>
					<!-- End Recent Activity -->

					<!-- Website Traffic -->
					<div class="card">
						<div class="filter">
							<a class="icon" href="#" data-bs-toggle="dropdown"><i
								class="bi bi-three-dots"></i></a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
								<li class="dropdown-header text-start">
									<h6>Filter</h6>
								</li>

								<li><a class="dropdown-item" href="#">Today</a></li>
								<li><a class="dropdown-item" href="#">This Month</a></li>
								<li><a class="dropdown-item" href="#">This Year</a></li>
							</ul>
						</div>

						<div class="card-body pb-0">
							<h5 class="card-title">
								Lượng Truy Cập Trang Web <span>| Today</span>
							</h5>

							<div id="trafficChart" style="min-height: 400px;" class="echart"></div>

							<script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: 1048,
                          name: 'Search Engine'
                        },
                        {
                          value: 735,
                          name: 'Direct'
                        },
                        {
                          value: 580,
                          name: 'Email'
                        },
                        {
                          value: 484,
                          name: 'Union Ads'
                        },
                        {
                          value: 300,
                          name: 'Video Ads'
                        }
                      ]
                    }]
                  });
                });
              </script>
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

						</div>
					</div>
					<!-- End Website Traffic -->

				</div>
		</section>
	</div>
	<!-- footer -->
		<%@ include file="/views/footer.jsp"%>
	<!-- /footer -->
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
</body>
</html>