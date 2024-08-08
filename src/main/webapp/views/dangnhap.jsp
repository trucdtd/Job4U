<%@ page language="java" contentType="text/html; charset=UTF-8">
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>Đăng nhập</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/c5fd529f32.js"
            crossorigin="anonymous"></script>
    <!-- Google Sign-In -->
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id"
          content="YOUR_CLIENT_ID.apps.googleusercontent.com">
</head>

<body>
    <%@ include file="/views/headerNoPanner.jsp"%>
    <header>
        <!-- place navbar here -->
    </header>
    <main>
    <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                             class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="/Login/submit" method="post">
                            <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                                <p class="lead fw-normal mb-0 me-3">đăng nhập bằng</p>
                                <div class="g-signin2" data-onsuccess="onSignIn"></div>
                            </div>

                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0">hoặc</p>
                            </div>

                            <!-- Username input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <label class="form-label" for="form3Example3">Tài khoản</label>
                                <input type="text" id="form3Example3"
                                       class="form-control form-control-lg"
                                       placeholder="Tài khoản" name="username" />
                            </div>

                            <!-- Password input -->
                            <div data-mdb-input-init class="form-outline mb-3">
                                <label class="form-label" for="form3Example4">Mật khẩu</label>
                                <input type="password" id="form3Example4"
                                       class="form-control form-control-lg"
                                       placeholder="Mật khẩu" name="password" />
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input class="form-check-input me-2" type="checkbox" value=""
                                           id="form2Example3" /> <label class="form-check-label"
                                           for="form2Example3"> ghi nhớ </label>
                                </div>
                                <a href="#!" class="text-body">Quên mật khẩu</a>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button type="submit" data-mdb-button-init data-mdb-ripple-init
                                        class="btn btn-primary btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng nhập</button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">
                                    Bạn chưa có tài khoản? <a href="#!" class="link-danger">Đăng ký</a>
                                </p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
            <%@ include file="/views/footer.jsp"%>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css">
</body>
</html>
		