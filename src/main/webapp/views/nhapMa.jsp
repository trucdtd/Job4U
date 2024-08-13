<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        .alert {
            display: none; /* Ẩn thông báo lỗi khi trang được tải lần đầu */
        }
    </style>
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
             <form method="POST" action="/QuenMatKhau/validateToken">
    <input type="hidden" name="token" value="${token}" />

    <div class="form-outline mb-4">
        <label class="form-label" for="code">Nhập mã của bạn!</label>
        <input type="text" id="code" name="code" class="form-control form-control-lg" placeholder="Vui lòng nhập mã mà chúng tôi đã gửi" required />
    </div>

    <!-- Error message -->
    <c:if test="${not empty error && param.submit ne null}">
        <div class="alert alert-danger" role="alert">
            ${error}
        </div>
    </c:if>

    <div class="text-center text-lg-start mt-4 pt-2">
        <button type="submit" name="submit" class="btn btn-primary btn-lg">Xác Nhận</button>
        <p class="small fw-bold mt-2 pt-1 mb-0">
            <a href="/QuenMatKhau" class="link-danger">Bạn không nhận được mã?</a>
        </p>
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
        document.addEventListener("DOMContentLoaded", function() {
            // Kiểm tra xem có thông báo lỗi không
            var errorDiv = document.querySelector(".alert");
            if (errorDiv.textContent.trim() !== "") {
                errorDiv.style.display = "block"; // Hiển thị thông báo lỗi nếu có
            }
        });
    </script>
</body>
</html>