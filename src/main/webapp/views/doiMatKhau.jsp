<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Change Password</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/c5fd529f32.js" crossorigin="anonymous"></script>
    <style>
      body {
        background-color: #f8f9fa;
      }

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
    <header>
      <!-- place navbar here -->
    </header>
    <main></main>
    <footer>
      <section class="vh-100">
        <div class="container-fluid h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-5">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                class="img-fluid" alt="Sample image">
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
              <div class="form-container">
                <form>
                  <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start mb-4">
                    <p class="lead fw-normal mb-0 me-3">Change Password</p>
                  </div>

                  <!-- Old Password input -->
                  <div data-mdb-input-init class="form-outline">
                    <label class="form-label" for="oldPassword">Old Password</label>
                    <input type="password" id="oldPassword" class="form-control form-control-lg" placeholder="Enter old password" />
                  </div>

                  <!-- New Password input -->
                  <div data-mdb-input-init class="form-outline">
                    <label class="form-label" for="newPassword">New Password</label>
                    <input type="password" id="newPassword" class="form-control form-control-lg" placeholder="Enter new password" />
                  </div>

                  <!-- Confirm New Password input -->
                  <div data-mdb-input-init class="form-outline">
                    <label class="form-label" for="confirmNewPassword">Confirm New Password</label>
                    <input type="password" id="confirmNewPassword" class="form-control form-control-lg" placeholder="Confirm new password" />
                  </div>

                  <div class="text-center text-lg-start mt-4 pt-2">
                    <button type="submit" class="btn btn-primary btn-lg">Change Password</button>
                    <p class="small fw-bold mt-2 pt-1 mb-0">Forgot your password? <a href="#!" class="link-danger">Reset</a></p>
                  </div>

                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
          <div class="text-white mb-3 mb-md-0">
            Copyright © 2020. All rights reserved.
          </div>
          <div>
            <a href="#!" class="text-white me-4">
              <i class="fab fa-linkedin-in"></i>
            </a>
          </div>
        </div> -->
        <%@ include file="/views/footer.jsp"%>
      </section>
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
  </body>
</html>
