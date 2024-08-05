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
                    <p class="lead fw-normal mb-0 me-3">Register</p>
                  </div>

                  <!-- User ID input -->
                  <div data-mdb-input-init class="">
                    <label class="form-label" for="userID">User ID</label>
                    <input type="text" id="userID" class="form-control" placeholder="Enter a valid user ID" />
                  </div>

                  <!-- User Name input -->
                  <div data-mdb-input-init class="">
                    <label class="form-label" for="userName">User Name</label>
                    <input type="text" id="userName" class="form-control " placeholder="Enter your username" />
                  </div>

                  <!-- Full Name input -->
                  <div data-mdb-input-init class="">
                    <label class="form-label" for="fullName">Full Name</label>
                    <input type="text" id="fullName" class="form-control " placeholder="Enter your full name" />
                  </div>

                  <!-- Email input -->
                  <div data-mdb-input-init class="">
                    <label class="form-label" for="email">Email address</label>
                    <input type="email" id="email" class="form-control " placeholder="Enter a valid email address" />
                  </div>

                  <!-- Number Phone input -->
                  <div data-mdb-input-init class="">
                    <label class="form-label" for="numberPhone">Number Phone</label>
                    <input type="text" id="numberPhone" class="form-control" placeholder="Enter your phone number" />
                  </div>

                  <!-- Password input -->
                  <div data-mdb-input-init class="">
                    <label class="form-label" for="password">Password</label>
                    <input type="password" id="password" class="form-control" placeholder="Enter password" />
                  </div>
                  <!-- User Type input -->
                  <div data-mdb-input-init class="mb-4">
                    <label class="form-label">Register as</label>
                    <div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="userType" id="applicant" value="applicant">
                        <label class="form-check-label" for="applicant">Applicant</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="userType" id="employer" value="employer">
                        <label class="form-check-label" for="employer">Employer</label>
                      </div>
                    </div>
                  </div>

                  <div class="text-center text-lg-start mt-4 pt-2">
                    <button type="submit" class="btn btn-primary btn-lg">Register</button>
                    <p class="small fw-bold mt-2 pt-1 mb-0">Already have an account? <a href="#!" class="link-danger">Login</a></p>
                  </div>

                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
          <!-- Copyright -->
          <div class="text-white mb-3 mb-md-0">
            Copyright © 2020. All rights reserved.
          </div>
          <!-- Copyright -->

          <!-- Right -->
          <div>
            <a href="#!" class="text-white me-4">
              <i class="fab fa-linkedin-in"></i>
            </a>
          </div>
          <!-- Right -->
        </div>
        <%@ include file="/views/footer.jsp"%>
      </section>
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
  </body>
</html>
