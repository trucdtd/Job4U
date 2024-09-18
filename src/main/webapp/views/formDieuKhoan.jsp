<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Điều Khoản</title>
<style>
    .card {
        border: 2px solid #198754; /* Đường viền của thẻ card */
        border-radius: 5px; /* Bo góc của thẻ card */
        padding: 10px; /* Khoảng cách bên trong thẻ card */
        width: 80%; /* Chiều rộng của thẻ card */
        max-width: 900px; /* Chiều rộng tối đa của thẻ card */
        margin: auto; /* Căn giữa thẻ card */
    }
    .card-body {
        border: 2px solid #198754; /* Đường viền của vùng nội dung */
        border-radius: 5px; /* Bo góc của vùng nội dung */
        padding: 10px; /* Khoảng cách bên trong vùng nội dung */
    }
    .card-title {
        color: #198754; /* Màu chữ của tiêu đề thẻ card */
    }
    .card-subtitle h5 {
        color: #198754; /* Màu chữ của tiêu đề phụ */
    }
    .form-check {
        margin-top: 10px; /* Khoảng cách phía trên của phần checkbox */
    }
    .card-body span {
        display: block; /* Hiển thị các phần tử span dưới dạng khối */
        margin-bottom: 10px; /* Khoảng cách giữa các phần tử span */
    }
</style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h4 class="card-title" style="color: #198754;">JOB4U</h4>
            <br>
            <div class="card-body">
                <h6 class="card-subtitle mb-2 text-muted">
                    <h5>Chính Sách</h5>
                    <span>Để đảm bảo chất lượng dịch vụ, Job4U <span style="color: red;">không cho phép một người dùng tạo nhiều tài khoản khác nhau.</span></span>
                    <span>Job4U yêu cầu người dùng:</span>
                    <br>
                    <span>
                        1. Tuân thủ quy tắc cộng đồng. Vi phạm có thể dẫn đến khóa tài khoản.
                        <br>2. Không spam. Tài khoản có thể bị khóa nếu vi phạm.
                        <br>3. Cung cấp thông tin tuyển dụng đúng sự thật. Nội dung không phù hợp sẽ bị xóa và tài khoản có thể bị khóa.
                        <br>4. Cung cấp thông tin chính xác. Thông tin sai lệch sẽ dẫn đến việc khóa tài khoản.
                    </span>
                    <h5>Quy Định</h5>
                    <span>Đây là nội dung chính sách và điều khoản của chúng tôi. Bạn cần đồng ý với các điều khoản sau để tiếp tục sử dụng dịch vụ của chúng tôi:
                    <br> 1. Bạn đồng ý cung cấp thông tin chính xác và đầy đủ.
                    <br> 2. Bạn đồng ý không sử dụng dịch vụ của chúng tôi cho các mục đích trái pháp luật.
                    <br> 3. Chúng tôi có quyền thay đổi các điều khoản và chính sách này mà không cần thông báo trước.
                    </span>
                </h6>
                <br>
                <span>Mọi thắc mắc xin liên hệ với Hotline CSKH:</span>
                <h6 style="color: #198754;">0292 3434 1600</h6>
            </div>
            <hr>
            <h5>Tài Khoản</h5>
            <div class="form-check">
                <input type="checkbox" id="termsAgreed" name="termsAgreed">
                <label for="termsAgreed"> Tôi đã đọc và đồng ý với các <span style="color: #198754;">Điều khoản dịch vụ</span> và <span style="color: #198754;">Chính sách bảo mật</span> của Job4U.</label>
            </div>
        </div>
    </div>
</body>
</html>
