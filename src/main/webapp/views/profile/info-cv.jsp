<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông Tin CV</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
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
    </style>
</head>
<body>
    <div class="container mt-5">
        <h4 class="text-center text-success">CẬP NHẬT HÌNH ẢNH & THÔNG TIN CV</h4>
        <form:form method="post" action="/user/cv" enctype="multipart/form-data">
            <div class="text-center mb-4">
                <div class="image-upload" onclick="document.getElementById('imageInput').click();">
                    <img alt="Hình đại diện" src="/img/user-default.jpg" id="profileImage" class="p-3 rounded-circle">
                    <p>Nhấn để chọn ảnh (không bắt buộc)</p>
                    <input type="file" id="imageInput" name="image" accept="image/*" style="display:none;" onchange="previewImage(event);">
                </div>
            </div>

            <div class="mb-3">
                <label>Giới tính:</label>
                <div class="d-flex justify-content-center">
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="gender" id="genderMale" value="Nam" required>
                        <label class="form-check-label" for="genderMale">Nam</label>
                    </div>
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="Nữ">
                        <label class="form-check-label" for="genderFemale">Nữ</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="genderOther" value="Khác">
                        <label class="form-check-label" for="genderOther">Khác</label>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="dateOfbirth">Ngày sinh:</label>
                <input type="date" class="form-control" id="dateOfbirth" name="dateOfbirth" required>
            </div>

            <div class="mb-3">
                <label for="resume">Hồ sơ:</label>
                <textarea class="form-control" id="resume" name="resume" rows="4" required></textarea>
            </div>

            <div class="mb-3">
                <label for="profilesummary">Tóm tắt hồ sơ:</label>
                <textarea class="form-control" id="profilesummary" name="profilesummary" rows="4"></textarea>
            </div>

            <div class="mb-3">
                <label for="experience">Kinh nghiệm:</label>
                <textarea class="form-control" id="experience" name="experience" rows="4"></textarea>
            </div>

            <div class="mb-3">
                <label for="education">Giáo dục:</label>
                <textarea class="form-control" id="education" name="education" rows="4"></textarea>
            </div>

            <div class="mb-3">
                <label for="skills">Kỹ năng:</label>
                <textarea class="form-control" id="skills" name="skills" rows="5"></textarea>
            </div>

            <div class="mb-3">
                <label for="certifications">Chứng chỉ:</label>
                <textarea class="form-control" id="certifications" name="certifications" rows="4"></textarea>
            </div>

            <div class="mb-3">
                <label for="languages">Ngôn ngữ:</label>
                <textarea class="form-control" id="languages" name="languages" rows="5"></textarea>
            </div>

            <div class="mb-3">
                <label for="interests">Sở thích:</label>
                <textarea class="form-control" id="interests" name="interests" rows="4"></textarea>
            </div>

            <input type="hidden" name="userId" value="1">
            <button type="submit" class="btn btn-success mb-3">Tạo CV</button>
        </form:form>
    </div>

    <script>
        function previewImage(event) {
            const image = document.getElementById('profileImage');
            image.src = URL.createObjectURL(event.target.files[0]);
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>
