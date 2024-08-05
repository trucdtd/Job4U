<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
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
	<main></main>
	<footer>
		<section class="vh-100">
			<div class="container-fluid h-custom">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-md-9 col-lg-6 col-xl-5">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
							class="img-fluid" alt="Sample image">
					</div>
					<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
						<form>
							<div
								class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
								<p class="lead fw-normal mb-0 me-3">Sign in with</p>
								<div class="g-signin2" data-onsuccess="onSignIn"></div>
							</div>

							<div class="divider d-flex align-items-center my-4">
								<p class="text-center fw-bold mx-3 mb-0">Or</p>
							</div>

							<!-- Email input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<label class="form-label" for="form3Example3">Email
									address</label> <input type="email" id="form3Example3"
									class="form-control form-control-lg"
									placeholder="Enter a valid email address" />
							</div>

							<!-- Password input -->
							<div data-mdb-input-init class="form-outline mb-3">
								<label class="form-label" for="form3Example4">Password</label> <input
									type="password" id="form3Example4"
									class="form-control form-control-lg"
									placeholder="Enter password" />
							</div>

							<div class="d-flex justify-content-between align-items-center">
								<!-- Checkbox -->
								<div class="form-check mb-0">
									<input class="form-check-input me-2" type="checkbox" value=""
										id="form2Example3" /> <label class="form-check-label"
										for="form2Example3"> Remember me </label>
								</div>
								<a href="#!" class="text-body">Forgot password?</a>
							</div>

							<div class="text-center text-lg-start mt-4 pt-2">
								<button type="button" data-mdb-button-init data-mdb-ripple-init
									class="btn btn-primary btn-lg"
									style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
								<p class="small fw-bold mt-2 pt-1 mb-0">
									Don't have an account? <a href="#!" class="link-danger">Register</a>
								</p>
							</div>

						</form>
					</div>
				</div>
			</div>
			<!-- <div
				class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
				Copyright
				<div class="text-white mb-3 mb-md-0">Copyright © 2020. All
					rights reserved.</div>
				Copyright

				Right
				<div>
					<a href="#!" class="text-white me-4"> <i
						class="fab fa-linkedin-in"></i>
					</a>
				</div>
				Right
			</div> -->
			<%@ include file="/views/footer.jsp"%>
		</section>
	</footer>
	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<link rel="stylesheet" href="styles.css">

	<!-- <script>
      function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        console.log('Name: ' + profile.getName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
      }
    </script> -->
</body>
</html>
