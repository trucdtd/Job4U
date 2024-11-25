<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Thông Tin CV</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.image-upload {
	border: 2px dashed #198754;
	border-radius: 10px;
	padding: 20px;
	text-align: center;
	cursor: pointer;
}

.image-upload img {
	max-width: 100%;
	max-height: 200px;
}

.pdf-style {
	max-width: 800px;
	border: 2px solid #f0f0f0;
	padding: 30px;
	background-color: #fff;
	font-family: 'Times New Roman', Times, serif;
	line-height: 1.6;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.draggable-container {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
}

.draggable-item {
	flex: 1 1 45%;
	margin-bottom: 20px;
	padding: 10px;
	border: 2px dashed transparent;
	border-radius: 5px;
	background-color: #fff;
	cursor: move;
	transition: box-shadow 0.2s, border-color 0.2s;
}

.draggable-item:focus-within, .draggable-item:hover {
	border-color: #28a745;
}

input, textarea {
	background-color: #f9f9f9;
	border: 1px solid #ced4da;
	border-radius: 4px;
	padding: 8px;
	width: 100%;
	box-sizing: border-box;
	transition: border-color 0.2s;
}

input:focus, textarea:focus {
	background-color: #fff;
	border-color: #28a745;
	outline: none;
}
</style>
</head>
<body>

	<div class="container mt-5 pdf-style shadow p-4">
		<h4 class="text-center text-success">CẬP NHẬT HÌNH ẢNH & THÔNG
			TIN CV</h4>
		<form id="cvForm" method="post" action="/user/cv"
			enctype="multipart/form-data">
			<div class="text-center mb-4">
				<div class="image-upload position-relative"
					onclick="document.getElementById('imageInput').click();">
					<img alt="Hình đại diện" src="/img/user-default.jpg"
						id="profileImage" class="rounded-circle profile-image shadow">
					<p class="mt-2 text-muted">Nhấn để chọn ảnh (không bắt buộc)</p>
					<input type="file" id="imageInput" name="image" accept="image/*"
						style="display: none;" onchange="previewImage(event);">
				</div>
			</div>

			<div id="draggableFields" class="draggable-container">
				<div class="draggable-item" draggable="true">
					<label>Giới tính:</label>
					<div class="d-flex justify-content-center mb-3">
						<div class="form-check me-3">
							<input class="form-check-input" type="radio" name="gender"
								id="genderMale" value="Nam" required> <label
								class="form-check-label" for="genderMale">Nam</label>
						</div>
						<div class="form-check me-3">
							<input class="form-check-input" type="radio" name="gender"
								id="genderFemale" value="Nữ"> <label
								class="form-check-label" for="genderFemale">Nữ</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="genderOther" value="Khác"> <label
								class="form-check-label" for="genderOther">Khác</label>
						</div>
					</div>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="fullnamecv">Họ và tên:</label> <input type="text"
						class="form-control" id="fullnamecv" name="fullnamecv" required>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="dateOfbirth">Ngày sinh:</label> <input type="date"
						class="form-control" id="dateOfbirth" name="dateOfbirth" required>
					<span class="text-danger" id="dobError" style="display: none;"></span>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="emailcv">Email cá nhân:</label> <input type="email"
						class="form-control" id="emailcv" name="emailcv"
						placeholder="tencuaban@example.com" required> <span
						class="text-danger" id="emailError" style="display: none;"></span>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="phonenumbercv">Số điện thoại:</label> <input type="tel"
						class="form-control" id="phonenumbercv" name="phonenumbercv"
						placeholder="Số điện thoại" required> <span
						class="text-danger" id="phoneError" style="display: none;"></span>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="resume">Hồ sơ:</label>
					<textarea class="form-control" id="resume" name="resume" rows="4"
						placeholder="Vị trí ứng tuyển, mục tiêu nghề nghiệp" required></textarea>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="profilesummary">Tóm tắt hồ sơ:</label>
					<textarea class="form-control" id="profilesummary"
						name="profilesummary" rows="4"
						placeholder="Nêu các hoạt động & dự án đã tham gia"></textarea>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="experience">Kinh nghiệm:</label>
					<textarea class="form-control" id="experience" name="experience"
						rows="4" placeholder="Mô tả kinh nghiệm làm việc của bạn & Vị trí"></textarea>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="education">Học vấn:</label>
					<textarea class="form-control" id="education" name="education"
						rows="4"
						placeholder="Tên trường, ngành học & thời gian bắt đầu, kết thúc"></textarea>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="skills">Kỹ năng:</label>
					<textarea class="form-control" id="skills" name="skills" rows="5"
						placeholder="Tên kỹ năng & mô tả kỹ năng"></textarea>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="certifications">Chứng chỉ:</label>
					<textarea class="form-control" id="certifications"
						name="certifications" rows="4"
						placeholder="Tên chứng chỉ & thời gian"></textarea>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="languages">Ngôn ngữ:</label>
					<textarea class="form-control" id="languages" name="languages"
						rows="5" placeholder="Nêu trình độ ngôn ngữ của bạn"></textarea>
				</div>

				<div class="draggable-item" draggable="true">
					<label for="interests">Sở thích:</label>
					<textarea class="form-control" id="interests" name="interests"
						rows="4" placeholder="Điền các sở thích của bạn"></textarea>
				</div>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-success mb-3">Tạo CV</button>
			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
        const container = document.getElementById("draggableFields");
        let draggedItem = null;

        container.addEventListener("dragstart", (event) => {
            draggedItem = event.target;
            event.target.classList.add("dragging");
        });

        container.addEventListener("dragend", (event) => {
            event.target.classList.remove("dragging");
            draggedItem = null;
        });

        container.addEventListener("dragover", (event) => {
            event.preventDefault();
            const afterElement = getDragAfterElement(container, event.clientY);
            if (afterElement == null) {
                container.appendChild(draggedItem);
            } else {
                container.insertBefore(draggedItem, afterElement);
            }
        });

        function getDragAfterElement(container, y) {
            const draggableElements = [...container.querySelectorAll(".draggable-item:not(.dragging)")];

            return draggableElements.reduce((closest, child) => {
                const box = child.getBoundingClientRect();
                const offset = y - box.top - box.height / 2;
                if (offset < 0 && offset > closest.offset) {
                    return { offset: offset, element: child };
                } else {
                    return closest;
                }
            }, { offset: Number.NEGATIVE_INFINITY }).element;
        }

        $(function() {
            $(".draggable-item").resizable({
                minWidth: 150,
                minHeight: 50,
                handles: "n, e, s, w, ne, se, sw, nw"
            });
        });

        function previewImage(event) {
            const image = document.getElementById('profileImage');
            image.src = URL.createObjectURL(event.target.files[0]);
        }

     // Kiểm tra thông tin trước khi gửi
        document.getElementById('cvForm').addEventListener('submit', function(event) {
            const dateOfBirthInput = document.getElementById('dateOfbirth');
            const phoneInput = document.getElementById('phonenumbercv');
            const emailInput = document.getElementById('emailcv'); // Thêm biến cho email
            let hasError = false;

            // Reset thông báo lỗi
            document.getElementById('dobError').style.display = 'none';
            document.getElementById('phoneError').style.display = 'none';
            document.getElementById('emailError').style.display = 'none'; // Reset thông báo lỗi email

            // Kiểm tra tuổi
            const dob = new Date(dateOfBirthInput.value);
            const today = new Date();
            const age = today.getFullYear() - dob.getFullYear();
            const monthDifference = today.getMonth() - dob.getMonth();

            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < dob.getDate())) {
                age--;
            }

            if (age < 18) {
                document.getElementById('dobError').textContent = 'Bạn phải từ 18 tuổi trở lên.';
                document.getElementById('dobError').style.display = 'block';
                hasError = true;
            }

            // Kiểm tra số điện thoại
            const phoneRegex = /^0[1-9][0-9]{8}$/; 
            if (!phoneRegex.test(phoneInput.value)) {
                document.getElementById('phoneError').textContent = 'Số điện thoại phải bắt đầu bằng 0 và có đúng 10 chữ số.';
                document.getElementById('phoneError').style.display = 'block';
                hasError = true;
            }

            // Kiểm tra email
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Định dạng email
            if (!emailRegex.test(emailInput.value)) {
                document.getElementById('emailError').textContent = 'Email không hợp lệ.';
                document.getElementById('emailError').style.display = 'block';
                hasError = true;
            }

            if (hasError) {
                event.preventDefault(); // Ngăn không cho gửi form nếu có lỗi
            }
        });
    </script>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>
