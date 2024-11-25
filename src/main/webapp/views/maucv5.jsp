<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!-- html2pdf Library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
 <style>
    /* Reset body */
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f7f7f7;
  display: flex;
  flex-direction: column;
  min-height: 100vh; /* Đảm bảo chiều cao tối thiểu chiếm toàn màn hình */
}

/* Container chung */
.cv-container {
  width: 800px;
  background: white;
  display: flex;
  overflow: hidden;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  font-size: 16px;
  margin: 20px auto; /* Đảm bảo căn giữa nội dung */
}

/* Header */
header {
  width: 100%;
  background-color: #198754;
  color: #f8f9fa;
 
}

/* Left Panel */
.left-panel {
  width: 30%;
  background: #d9cbc7;
  padding: 30px;
  color: #333;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.left-panel img {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 20px;
}

.left-panel h3 {
  border-bottom: 2px solid #000000;
}

.contact-info {
  width: 100%;
  margin-top: 20px;
}

.contact-info p {
  display: flex;
  align-items: center;
  margin: 12px 0;
  font-size: 14px;
}

.contact-info p span {
  font-size: 20px;
  margin-right: 10px;
}

.skill,
.language {
  margin-top: 20px;
  width: 100%;
}

/* Right Panel */
.right-panel {
  padding: 30px 40px;
}

.personal-info {
  background-color: #f0e9e6;
  padding: 12px;
  margin-bottom: 20px;
}

.personal-info h2 {
  font-size: 28px;
  font-weight: bold;
  margin: 0 0 10px 0;
}

.personal-info h4 {
  font-size: 18px;
  margin: 0 0 15px 0;
  color: #555;
}

.personal-info p {
  font-size: 14px;
  line-height: 1.6;
}

.right-panel h3 {
  font-size: 20px;
  margin: 25px 0 15px 0;
  color: #333;
  text-transform: uppercase;
  letter-spacing: 1px;
  border-bottom: 2px solid #ccc;
  padding-bottom: 5px;
}

.section {
  margin-bottom: 25px;
}

.section p {
  font-size: 16px;
  margin: 6px 0;
  line-height: 1.8;
}

.section p strong {
  font-weight: bold;
}

/* Footer */
.footer {
  background-color: #198754;
  color: #f8f9fa;
  width: 100%;
  padding: 20px 0;
  text-align: center;
  margin-top: auto; /* Đảm bảo footer luôn ở cuối */
  font-size: 14px;
}

  </style>
</head>
<body>
<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	
	<%@ include file="/views/chat.jsp"%>
	<!-- header -->
 <div class="cv-container">
    <!-- Left Panel -->
    <div class="left-panel">
      <img src="https://via.placeholder.com/150" alt="Profile Picture">
      <div class="contact-info">
        <h3>Contact</h3>
        <p><span>📞</span> +1-234-567-890</p>
        <p><span>📧</span> donna@example.com</p>
        <p><span>📍</span> 123 Avenue St, ABC City, ST 12345</p>
      </div>
      <div class="language">
        <h3>Language</h3>
        <p>Native English</p>
        <p>Advanced Spanish</p>
      </div>
      <div class="skill">
        <h3>Computer Skills</h3>
        <p>- Text Processor</p>
        <p>- Spreadsheet</p>
        <p>- Slide Presentation</p>
      </div>
    </div>

    <!-- Right Panel -->
    <div class="right-panel">
      <div class="personal-info">
        <h2>Donna Stroupe</h2>
        <h4>Student</h4>
        <p>
          Business Administration student, I consider myself a responsible and
          orderly person. I am looking forward to my first work experience.
        </p>
      </div>
      <div class="section">
        <h3>Education</h3>
        <p><strong>Borcellu University</strong><br> Business Administration career (in progress)</p>
        <p><strong>Fauget College</strong><br> 2018–2022</p>
      </div>
      <div class="section">
        <h3>Volunteer Experience</h3>
        <p><strong>InGuide Company</strong><br> Participation in collections to distribute in low-income schools.</p>
      </div>
      <div class="section">
        <h3>Hobbies</h3>
        <p>Reading</p>
        <p>Traveling</p>
        <p>Painting</p>
      </div>
    </div>
  </div>
  <!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
</body>
</html>