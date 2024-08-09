<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>Registration Form</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.3.2 -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />
    <link rel="stylesheet" href="dangky.css">
    <script src="https://kit.fontawesome.com/c5fd529f32.js" crossorigin="anonymous"></script>
    <style>
        .text-danger {
            color: red;
            display: block;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container img {
            max-width: 100%;
            height: auto;
        }

        .form-container .form-label {
            margin-top: 0.5rem;
            margin-bottom: 0.25rem;
        }

        .form-form-outline {
            margin-bottom: 1rem;
        }

        .form-container .btn {
            width: 100%;
        }
    </style>
</head>

<body>
    <%@ include file="/views/headerNoPanner.jsp"%>
    <br>
    <footer>
        <section class="vh-90">
            <div class="container h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img
                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                            class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <div class="form-container">
                            <form action="/DangKy/submit" method="post" enctype="multipart/form-data" id="registerForm">
    <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
        <h1 class="lead fw-normal mb-0 me-3">Đăng Ký</h1>
    </div>
    <div class="row">
        <div class="col">
            <label class="form-label" for="fullname">Họ và Tên</label>
            <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Nhập họ và tên" value="${fullname}" />
            <span class="text-danger">${fullnameError}</span>
        </div>
        <div class="col">
            <label class="form-label" for="username">Tên Tài Khoản</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Nhập tên tài khoản" value="${username}" />
            <span class="text-danger">${usernameError}</span>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <label class="form-label" for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Nhập email" value="${email}" />
            <span class="text-danger">${emailError}</span>
        </div>
        <div class="col">
            <label class="form-label" for="numberphone">Số Điện Thoại</label>
            <input type="text" id="numberphone" name="numberphone" class="form-control" placeholder="Nhập số điện thoại" value="${numberphone}" />
            <span class="text-danger">${numberphoneError}</span>
        </div>
    </div>

    <div class="mb-4">
        <label class="form-label" for="password">Mật Khẩu</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu" value="${password}" />
        <span class="text-danger">${passwordError}</span>
    </div>

    <div class="mb-4">
        <label class="form-label">Đăng ký tài khoản</label>
        <div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="usertype" id="applicant" value="applicant" ${usertype == 'applicant' ? 'checked' : ''}>
                <label class="form-check-label" for="applicant">Người Xin Việc</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="usertype" id="employer" value="employer" ${usertype == 'employer' ? 'checked' : ''}>
                <label class="form-check-label" for="employer">Nhà Tuyển Dụng</label>
            </div>
        </div>
        <span class="text-danger">${usertypeError}</span>
    </div>

    <div id="employerDetails" style="display: none;">
        <div class="row">
            <div class="col">
                <label for="companyName" class="form-label">Tên Công Ty</label>
                <input type="text" class="form-control" id="companyName" name="companyName" value="${companyName}">
                <span class="text-danger">${companyNameError}</span>
            </div>
            <div class="col">
                <label for="companyWebsite" class="form-label">Website Công Ty</label>
                <input type="text" class="form-control" id="companyWebsite" name="companyWebsite" value="${companyWebsite}">
                <span class="text-danger">${companyWebsiteError}</span>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <label for="companyAddress" class="form-label">Địa Chỉ</label>
                <input type="text" class="form-control" id="companyAddress" name="companyAddress" value="${companyAddress}">
                <span class="text-danger">${companyAddressError}</span>
            </div>
            <div class="col">
                <label for="industry" class="form-label">Ngành nghề</label>
                <select class="form-control" id="industry" name="industry">
													<option value="" disabled selected>Chọn ngành nghề</option>
													<option value="Nông nghiệp">Nông nghiệp</option>
													<option value="Công nghiệp">Công nghiệp</option>
													<option value="Dịch vụ">Dịch vụ</option>
													<option value="construction">Xây dựng</option>
													<option value="Giao thông vận tải">Giao thông vận
														tải</option>
													<option value="Công nghệ thông tin<">Công nghệ
														thông tin</option>
													<option value="Tài chính">Tài chính</option>
													<option value="Giáo dục">Giáo dục</option>
													<option value="Y tế">Y tế</option>
													<option value="Truyền thông">Truyền thông</option>
													<option value="Công nghệ ô tô">Công nghệ ô tô</option>
													<option value="Du lịch">Du lịch</option>
													<option value="Hành chính văn phòng">Hành chính
														văn phòng</option>
													<option value="Khác">Khác...</option>
												</select>
                <span class="text-danger">${industryError}</span>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <label for="contactPerson" class="form-label">Người Liên Hệ</label>
                <input type="text" class="form-control" id="contactPerson" name="contactPerson" value="${contactPerson}">
                <span class="text-danger">${contactPersonError}</span>
            </div>
            <div class="col">
                <label for="companyLogo" class="form-label">Logo Công Ty</label>
                <input type="file" class="form-control" id="companyLogo" name="companyLogo">
            </div>
        </div>
        <div class="mb-3">
            <label for="companyDescription" class="form-label">Mô Tả Về Công Ty</label>
            <textarea class="form-control" id="companyDescription" name="companyDescription" rows="3">${companyDescription}</textarea>
            <span class="text-danger">${companyDescriptionError}</span>
        </div>
    </div>

    <div class="text-center text-lg-start mt-4 pt-2">
        <button type="submit" class="btn btn-primary">Đăng Ký</button>
        <p class="small fw-bold mt-2 pt-1 mb-0">
            Bạn đã có tài khoản? <a href="/Login" class="link-danger">Đăng Nhập</a>
        </p>
    </div>
</form>
                            <%-- Hiển thị modal khi có thông báo thành công --%>
    <c:if test="${not empty successMessage}">
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                if (${not empty successMessage}) {
                    const successModal = new bootstrap.Modal(document.getElementById('successModal'));
                    successModal.show();
                }
            });
        </script>
        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Thông báo</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ${successMessage}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="window.location.href='/Login'">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
                        </div>
                    </div>
                                            <br>
    <%@ include file="/views/footer.jsp"%>
                </div>
                
            </div>
        </section>
    </footer>
    
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const applicantRadio = document.getElementById("applicant");
        const employerRadio = document.getElementById("employer");
        const employerDetails = document.getElementById("employerDetails");

        function toggleEmployerDetails() {
            if (employerRadio.checked) {
                employerDetails.style.display = "block";
            } else {
                employerDetails.style.display = "none";
            }
        }

        applicantRadio.addEventListener("change", toggleEmployerDetails);
        employerRadio.addEventListener("change", toggleEmployerDetails);

        // Initial check in case of pre-filled data
        toggleEmployerDetails();
    });
</script>
    <!-- JavaScript to toggle employer details -->
    <script>
        function toggleEmployerDetails() {
            var employerDetails = document.getElementById('employerDetails');
            var employerRadio = document.getElementById('employer');
            employerDetails.style.display = employerRadio.checked ? 'block' : 'none';
        }
    </script>
</body>
</html>
