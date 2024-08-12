<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Forgot Password</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/c5fd529f32.js" crossorigin="anonymous"></script>
    <style>
      .form-container {
        max-width: 500px;
        margin: auto;
        padding: 2rem;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      .form-container .form-label {
        margin-top: 0.5rem;
        margin-bottom: 0.25rem;
      }

      .form-container .form-outline {
        margin-bottom: 1rem;
      }

      .form-container .btn {
        width: 100%;
      }
    </style>
  </head>

  <body>
  <%@ include file="/views/headerNoPanner.jsp"%>
    <footer>
      <section class="vh-100" style="background-color: #f8f9fa;">
        <div class="container-fluid h-custom">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
              <div class="form-container">
                <form method="POST" action="/QuenMatKhau/submit">
    <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
        <h1 class="lead fw-normal mb-0 me-3">LẤY LẠI MẬT KHẨU</h1>
    </div>

    <!-- Email input -->
    <div class="form-outline">
        <label class="form-label" for="email">Nhập email của bạn!</label>
        <input type="email" id="email" name="email" class="form-control form-control-lg" placeholder="Vui lòng nhập email của bạn!" required />
    </div>

    <div class="text-center text-lg-start mt-4 pt-2">
        <button type="submit" class="btn btn-primary btn-lg">Xác Nhận</button>
        <p class="small fw-bold mt-2 pt-1 mb-0">Bạn đã nhớ mật khẩu? <a href="/Login" class="link-danger">Đăng Nhập</a></p>
    </div>
</form>
              </div>
            </div>
          </div>
        </div>
        <%@ include file="/views/footer.jsp"%>
      </section>
    </footer>
    <script>
    document.querySelector('form').addEventListener('submit', function(e) {
        var emailInput = document.getElementById('email').value;
        if (!emailInput) {
            alert('Vui lòng nhập địa chỉ email.');
            e.preventDefault(); // Ngăn form không gửi nếu email trống
        }
    });
    </script>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
  </body>
</html>
