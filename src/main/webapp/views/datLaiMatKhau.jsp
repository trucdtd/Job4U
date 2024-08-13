<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <div class="form-container">
    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
            ${error}
        </div>
    </c:if>

    <form method="POST" action="/QuenMatKhau/DatLaiMatKhau">
        <!-- Token input -->
        <input type="hidden" name="token" value="${token}" />

        <!-- New Password input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="password">Nhập Mật Khẩu Mới</label>
            <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Vui lòng nhập mật khẩu mới" required />
        </div>

        <!-- Confirm Password input -->
        <div class="form-outline mb-4">
            <label class="form-label" for="confirmPassword">Nhập Lại Mật Khẩu Mới</label>
            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control form-control-lg" placeholder="Vui lòng nhập lại mật khẩu mới" required />
        </div>

        <!-- Submit button -->
        <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-primary btn-lg">Xác Nhận</button>
        </div>
    </form>
</div>
              </div>
            </div>
          </div>
        </div>
        <%@ include file="/views/footer.jsp"%>
      </section>
    </footer>
</body>
</html>