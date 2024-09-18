<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông Tin CV</title>
</head>
<body>
	<!-- Begin Page Content -->
	<div class="container shadow bg-white mb-3">
		<h4 class="m-0 font-weight-bold text-center pt-2" style="color:#198754">
			HÌNH ẢNH</h4>
		<form:form class="d-flex justify-content-center" metthod="post"
			action="/job4u/profile/cv">
			<img alt="" src="/img/user-default.jpg" width=200px class="p-3">
			<div class="p-3">
				<input type="file" class="row mt-3 mb-4">
				<button class="btn row" type="submit" style="background:#198754">Cập nhật</button>
			</div>
		</form:form>
	</div>
	<div class="container shadow bg-white mb-3">
		<h4 class="m-0 font-weight-bold text-center pt-2"  style="color:#198754">
			THÔNG TIN CV</h4>
		<form:form action="/job4u/profile/cv" modelAttribute="entity">
			<div class="card border-0 row">
				<div class="card-body">
					<div class="">
						<label for="" class="form-label">Tóm tắt hồ sơ</label>
						<form:textarea path="profilesummary"
							class="form-control border-bottom-primary" name="" id="" rows="4"></form:textarea>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="card border-0 mb-0">
						<div class="card-body">
							<div>
								<label for="" class="form-label">Hồ sơ</label>
								<form:input path="resume" type="text"
									class="form-control border-left-primary" name="" id=""
									aria-describedby="helpId" placeholder="" />
							</div>
						</div>
					</div>
					<div class="card border-0">
						<div class="card-body">
							<div>
								<label for="" class="form-label">Kinh nghiệm</label>
								<form:input path="jobseekerid" type="text"
									class="form-control border-left-primary" name="" id=""
									aria-describedby="helpId" placeholder="" />
							</div>
						</div>
					</div>
					<div class="card border-0">
						<div class="card-body">
							<div>
								<label for="" class="form-label">Kinh nghiệm</label>
								<form:input path="experience" type="text"
									class="form-control border-left-primary" name="" id=""
									aria-describedby="helpId" placeholder="" />
							</div>
						</div>
					</div>

					<div class="card border-0">
						<div class="card-body">
							<div>
								<label for="" class="form-label">Học vấn</label>
								<form:input path="education" type="text"
									class="form-control border-left-primary" name="" id=""
									aria-describedby="helpId" placeholder="" />
							</div>
						</div>
					</div>
					<div class="card border-0">
						<div class="card-body">
							<div>
								<label for="" class="form-label">Kĩ năng</label>
								<form:input path="skills" type="text"
									class="form-control border-left-primary" name="" id=""
									aria-describedby="helpId" placeholder="" />
							</div>
						</div>
					</div>


				</div>

				<!-- Border Bottom Utilities -->
				<div class="col-lg-6">

					<div class="card border-0">
						<div class="card-body">
							<div>
								<label for="" class="form-label">Ngày sinh</label>
								<form:input path="dateOfbirth" type="Date"
									class="form-control border-left-primary" name="" id=""
									aria-describedby="helpId" placeholder="" />
							</div>
						</div>
					</div>

					<div class="card border-0">
						<div class="card-body">
							<label for="" class="form-label pt-2">Giới tính</label>
							<div class="d-flex">
								<div class="form-check m-1">
									<form:radiobutton path="gender" value="Nam" />
									Nam
								</div>
								<div class="form-check m-1">
									<form:radiobutton path="gender" value="Nữ" />
									Nữ

								</div>
							</div>
						</div>
					</div>
					<div class="card border-0">
						<div class="card-body">
							<div>
								<label for="" class="form-label">Ngôn ngữ</label>
								<form:input path="languages" type="text"
									class="form-control border-left-primary" name="" id=""
									aria-describedby="helpId" placeholder="" />
							</div>
						</div>
					</div>
					<div class="card border-0">
						<div class="card-body">
							<div>
								<div class="">
									<label for="" class="form-label">Sở thích</label>
									<form:textarea path="interests"
										class="form-control border-left-primary" name="" id=""
										rows="3"></form:textarea>
								</div>

							</div>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary m-3">Cập nhật</button>
		</form:form>
	</div>
	</div>
</body>
</html>