<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Registration Form</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="dangky.css">
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
      <section class="vh-100" style="background-color: #f8f9fa;">
        <div class="container-fluid h-custom">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
              <div class="form-container">
                <form>
                  <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
                    <h1 class="lead fw-normal mb-0 me-3">Đăng Ký</h1>
                  </div>

                  <!-- <!-- User ID input -->
                  <!-- <div data-mdb-input-init class="">
                    <label class="form-label" for="userID">User ID</label>
                    <input type="text" id="userID" class="form-control" placeholder="Enter a valid user ID" />
                  </div> -->
                        
                <div class="row">
  					<div class="col">
  					 <label class="form-label" for="fullName">Họ và Tên</label>
    				<input type="text" id="fullName" class="form-control " placeholder="Nhập họ và tên" />
  				</div>
  				<div class="col">
  					<label class="form-label" for="userName">Tên Tài Khoảng</label>
                    <input type="text" id="userName" class="form-control " placeholder="Nhập tên tài khoảng" />
  				</div>
				</div>
				
				<div class="row">
  					<div class="col">
  					 <label class="form-label" for="email">Email</label>
                    <input type="email" id="email" class="form-control " placeholder="Nhập email" />
  				</div>
  				<div class="col">
  					<label class="form-label" for="numberPhone">Số Điện Thoại</label>
                    <input type="text" id="numberPhone" class="form-control" placeholder="Nhập số điện thoại" />
  				</div>
				</div>


                  <!-- Password input -->
                  <div data-mdb-input-init class="">
                    <label class="form-label" for="password">Password</label>
                    <input type="password" id="password" class="form-control" placeholder="Nhập Password" />
                  </div>
                  <!-- User Type input -->
                  <div data-mdb-input-init class="mb-4">
                    <label class="form-label">Đăng ký tài khoảng</label>
                    <div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="userType" id="applicant" value="applicant">
                        <label class="form-check-label" for="applicant">Người Xin Việc</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="userType" id="employer" value="employer">
                        <label class="form-check-label" for="employer">Nhà Tuyển Dụng</label>
                      </div>
                    </div>
                  </div>
				<div id="employerDetails" style="display: none;">
					<div class="row">
  						<div class="col">
  					 		<label for="companyWebsite" class="form-label">Tên Công Ty</label> 
							<input type="url" class="form-control" id="contactPerson" name=contactPerson>
  						</div>
  						<div class="col">
  							<label for="contactPerson" class="form-label">WebsiteCông Ty</label> 
							<input type="text" class="form-control" id="companyWebsite" name="companyWebsite">
  						</div>
					</div>
					<div class="row">
  						<div class="col">
  					 		<label for="companyWebsite" class="form-label">Địa chỉ</label> 
							<input type="url" class="form-control" id="contactPerson" name=contactPerson>
  						</div>
  						<div class="col">
  							<label for="contactPerson" class="form-label">Ngành Công Nghiệp</label> 
							<input type="text" class="form-control" id="companyWebsite" name="companyWebsite">
  						</div>
					</div>
					<div class="row">
  						<div class="col">
  					 		<label for="companyWebsite" class="form-label">Người Liên Hệ</label> 
							<input type="url" class="form-control" id="contactPerson" name=contactPerson>
  						</div>
  						<div class="col">
  							<label for="contactPerson" class="form-label">Logo công ty</label> 
  							<input type="file" class="form-control" id="inputGroupFile02">
  						</div>
					</div>
					<div class="mb-3">
  						<label for="exampleFormControlTextarea1" class="form-label">Mô tả về công ty</label>
  						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
				</div>

				<div class="text-center text-lg-start mt-4 pt-2">
                    <button type="submit" class="btn btn-primary btn-lg">Đăng Ký</button>
                    <p class="small fw-bold mt-2 pt-1 mb-0">Bạn đã có tài khoảng? <a href="#!" class="link-danger">Đăng Nhập</a></p>
                 </div>

                </form>
              </div>
            </div>
          </div>
        </div>
        <br>
        <%@ include file="/views/footer.jsp"%>
      </section>
    </footer>
    
    <script>
    document.addEventListener('DOMContentLoaded', function () {
    	  const applicantRadio = document.getElementById('applicant');
    	  const employerRadio = document.getElementById('employer');
    	  const employerDetails = document.getElementById('employerDetails');

    	  employerRadio.addEventListener('change', function () {
    	    if (this.checked) {
    	      employerDetails.style.display = 'block';
    	    }
    	  });

    	  applicantRadio.addEventListener('change', function () {
    	    if (this.checked) {
    	      employerDetails.style.display = 'none';
    	    }
    	  });
    	});
    </script>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
  </body>
</html>
