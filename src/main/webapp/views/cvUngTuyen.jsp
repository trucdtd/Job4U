<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<style>
.img {
	padding-top: 10px;
	height: 300px;
	width: 100%;
	object-fit: cover;
}
</style>
<body>
<form action="" method=post>
		<main class="container-fluid">
			<hr />
			<div class="d-flex justify-content-end">
				<div class="justify-content-end p-1">
					<button type="submit" class="btn btn-primary">Nộp CV</button>
					<button type="button" class="btn btn-success">Tải xuống</button>
				</div>
				<div class="p-1">
					<input type="text" class="form-control" name="" id=""
						aria-describedby="helpId" placeholder="Tên Cv" />
				</div>
			</div>
			<hr />
			<!-- <div class="d-flex">
        <div class="justify-content-start p-1">
          <button type="button" class="btn btn-primary">Lưu</button>
          <button type="button" class="btn btn-success">Tải xuống</button>
        </div>
          <div class="p-1">
            <input
              type="text"
              class="form-control"
              name=""
              id=""
              aria-describedby="helpId"
              placeholder="Tên Cv"
            />
          </div>
      </div>
      <hr /> -->
			<div class="container col-12 col-sm-9 mb-3">
				<div class="row bg-dark">
					<div class="col-4 text-warning">
						<img class="img" src="/img/le van doan.JPG"
							class="w-100 h-100 mb-1 p-3" alt="" />
						<div>
							<input type="text"
								class="form-control text-warning bg-dark border-0 text-lg mb-1"
								name="fullname" id="" aria-describedby="helpId" placeholder=""
								value="LÊ VĂN ĐOÀN" />
						</div>
						<div>
							<input type="text"
								class="form-control text-warning bg-dark border-0" name="major"
								id="" aria-describedby="helpId" placeholder=""
								value="JAVA BACKEND DEVELOPER" />
						</div>
						<hr />
						<div class="mt-2 mb-1 ms-2">
							<label for="" class="form-label">Thông tin cá nhân</label> <input
								type="text" class="form-control text-warning bg-dark border-0"
								name="phone" id="" aria-describedby="helpId" placeholder=""
								value="0989403071" />
						</div>
						<div class="mb-3 ms-2">
							<input type="text"
								class="form-control text-warning bg-dark border-0" name="email"
								id="" aria-describedby="helpId" placeholder=""
								value="levandoan2305@gmail.com" />
						</div>
						<hr />
						<div class="mb-3 ms-2">
							<label for="" class="form-label">Ngôn Ngữ lập trình</label> <input
								type="text" class="form-control text-warning bg-dark border-0"
								name="languages" id="" aria-describedby="helpId" placeholder=""
								value="Java, HTML, CSS, JavaScript" />
						</div>
						<hr />
						<div class="mb-3 ms-2">
							<label for="" class="form-label">Kỹ năng</label> <input
								type="text" class="form-control text-warning bg-dark border-0"
								name="skills" id="" aria-describedby="helpId" placeholder=""
								value="Kỹ năng thuyết trình, làm việc nhóm" />
						</div>
					</div>
					<div class="col-8 bg-light">
						<div class="mb-3">
							<label for="" class="form-label form-control-lg text-warning">Học
								vấn</label> <input type="text" class="form-control border-0"
								name="education" id="" aria-describedby="helpId" placeholder=""
								value="Từng học trường cao đăng FPT Polytechnic" />
						</div>
						<div class="mb-3">
							<label for="" class="form-label form-control-lg text-warning">Mục
								tiêu nghề nghiệp</label>
							<textarea class="form-control" name="" id="" rows="5" value="">
Được làm việc trong môi trường chuyên nghiệp, vận dụng tất cả những kĩ năng đã được học vào công việc góp sức giúp công ty đạt mục tiêu. Không ngừng trao dồi thêm những kĩ năng mềm và kiến thức cần thiết để hoàn thiện bản thân và có cơ hội thăng tiến trong công việc. Trở thành nhân viên cấp cao trong công ty.</textarea>
						</div>
						<div class="mb-3">
							<label for="" class="form-label form-control-lg text-warning">Danh
								hiệu và giải thưởng</label> <input type="text"
								class="form-control border-0" name="" id=""
								aria-describedby="helpId" placeholder=""
								value="Học bổng Ong vàng" />
						</div>
						<div class="mb-3">
							<label for="" class="form-label form-control-lg text-warning">Chứng
								chỉ</label> <input type="text" class="form-control border-0" name="certifications"
								id="" aria-describedby="helpId" placeholder=""
								value="Chứng chỉ dự án xưởng" />
						</div>
						<div class="mb-3">
							<label for="" class="form-label form-control-lg text-warning">Kinh
								nghiệm làm việc</label> <input type="text" class="form-control border-0"
								name="experience" id="" aria-describedby="helpId"
								placeholder="" value="Từng làm ở công ty Google" />
						</div>
					</div>
				</div>
			</div>
		</main>
	</form>
	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>
</html>