<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="col-lg-3 col-md-4 col-12 mb-3">
					<div class="d-flex flex-column flex-shrink-0  text-white "
						style="width: 100%; background: #00688B">
						<a href="#"
							class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
							<svg class="bi me-2" width="25" height="25">
                            <use xlink:href="#bootstrap"></use>
                        </svg> <span class="card-title p-2">Menu Quản Lý Người Dùng</span>
						</a>
						<hr>
						<ul class="nav nav-pills flex-column mb-auto">
							<li><a href="" class="nav-link text-white active"
								onclick="showTable(event, 'userManagement')"> <svg
										class="bi me-1" width="16" height="16">
                                <use xlink:href="#speedometer2"></use>
                            </svg> Quản Lý Tài Khoản
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'postManagement')"> <svg
										class="bi me-1" width="16" height="16">
                                <use xlink:href="#table"></use>
                            </svg> Quản Lý Bài Viết
							</a></li>
							<li><a href="#" class="nav-link text-white"
								onclick="showTable(event, 'cvManagement')"> <svg
										class="bi me-1" width="16" height="16">
                            <use xlink:href="#grid"></use>
                            </svg> Quản Lý CV
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link text-white"
								aria-current="page"
								onclick="showTable(event, 'statisticalManagement')"> <svg
										class="bi me-1" width="16" height="16">
                                <use xlink:href="#home"></use>
                            </svg> Quản Lý Thống Kê
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link text-white"
								aria-current="page" onclick="showTable(event, 'postService')">
									<svg class="bi me-1" width="16" height="16">

                                    <use xlink:href="#service"></use>
                                </svg> Dịch Vụ Bài Đăng
							</a></li>
						</ul>
						<hr>
						<div class="dropdown">
							<a href="#"
								class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
								id="dropdownUser1" data-bs-toggle="dropdown"
								aria-expanded="false"> <img src="https://github.com/mdo.png"
								alt="" width="30" height="30" class="rounded-circle me-2">
								<strong>mdo</strong>
							</a>
						</div>
					</div>
				</div>
<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>
</html>