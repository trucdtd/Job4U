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
<style>
        body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f9;
    display: flex;
    justify-content: center;
    flex-direction: column; /* Cho phép header, container, và footer sắp xếp theo cột */
    min-height: 100vh; /* Chiều cao tối thiểu cho toàn bộ trang */
    
}

.containerr {
    width: 800px;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    flex-grow: 1; /* Đảm bảo container chiếm không gian còn lại giữa header và footer */
   
	margin-left: 357px;
    
}


/* Header Section Styling */
.header {
    display: flex;
    align-items: center;
    background-color: #e0e5ec;
    padding: 15px;
    justify-content: center;
    height: 120px;
    border-radius: 10px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    margin-left: 20px;
    margin-right: 20px;
    margin-top: 25px;
}

.profile-photo {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    margin-right: 15px;
    object-fit: cover;
}

.header-info {
    text-align: center;
    flex-grow: 1;
}

.header-info h1 {
    font-size: 24px;
    margin: 0;
    color: #333;
}

.header-info p {
    font-size: 16px;
    color: #555;
    margin: 5px 0 0;
}

/* Main Content Styling */
.main-content {
    display: flex;
    flex-direction: row;
    padding: 20px;
}

/* Left Column Styling */
.left-column {
    width: 30%;
    background-color: #e0e5ec;
    padding: 20px;
    box-sizing: border-box;
    border-radius: 10px;
}

.left-content h2 {
    font-size: 16px;
    color: #333;
    margin-bottom: 10px;
    text-transform: uppercase;
    letter-spacing: 1px;
    border-bottom: 1px solid #ccc;
    padding-bottom: 5px;
}

.left-content p,
.left-content ul {
    font-size: 14px;
    color: #555;
    list-style: none;
    padding: 0;
    margin: 5px 0;
}

.left-content ul {
    padding-left: 15px;
}

/* Skills Section Styling */
.skills {
    background-color: #ffffff;
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    margin-bottom: 10px;
}

/* Right Column Styling */
.right-column {
    width: 70%;
    padding: 20px;
    box-sizing: border-box;
}

.section {
    margin-top: 20px;
}

.section h2 {
    font-size: 18px;
    color: #333;
    border-bottom: 1px solid #ccc;
    padding-bottom: 5px;
    margin-bottom: 10px;
}

.experience h3,
.education p {
    font-size: 16px;
    font-weight: bold;
    margin: 5px 0;
    color: #333;
}

.experience p,
.education span,
.references ul li {
    font-size: 14px;
    color: #555;
}

.references ul {
    padding-left: 20px;
    list-style: none;
}
    </style>
</head>
<body>
<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<br>
    <div class="containerr">
        <!-- Header Section -->
        <div class="header">
            <img src="your-image-url.jpg" alt="Donna Stroupe" class="profile-photo">
            <div class="header-info">
                <h1>Donna Stroupe</h1>
                <p>Sales Representative</p>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Left Column -->
            <div class="left-column">
                <div class="left-content">
                    <!-- Contact Info -->
                    <h2>Contact Info</h2>
                    <p>Email: feelgready@quickrx.com</p>
                    <p>Phone: +123-456-7890</p>
                    <p>Address: 123 Anywhere St., Any City</p>
                    <p>Website: real.yourwebsite.com</p>

                    <!-- Skills -->
                    <div class="skill">
                        <h2>Skill</h2>
                        <ul>
                            <li>Sales & Marketing</li>
                            <li>Product Knowledge</li>
                            <li>Customer Relationship Building</li>
                        </ul>
                    </div>

                    <!-- Language -->
                    <h2>Language</h2>
                    <ul>
                        <li>English</li>
                        <li>French</li>
                    </ul>
                </div>
            </div>

            <!-- Right Column -->
            <div class="right-column">
                <!-- About Me Section -->
                <div class="section">
                    <h2>About Me</h2>
                    <p>I am a Sales Representative & a professional who initiates and manages relationships with
                        customers to promote and sell consumer products. I am highly skilled in thought the meeting of
                        all the latest goods for them to increase in their household.</p>
                </div>

                <!-- Work Experience Section -->
                <div class="section experience">
                    <h2>Work Experience</h2>
                    <h3>Consumer Goods Seller</h3>
                    <p>Aug 2018 - Present</p>
                    <p>Global Goods Inc.</p>
                    <p>Communicated with potential customers to explain the cost of their products and help them decide
                        whether to make a purchase.</p>

                    <h3>Insurance Agent</h3>
                    <p>Aug 2015 - 2018</p>
                    <p>ABC Insurance Agency</p>
                    <p>Assisted clients in understanding policies to make good personal and business decisions.</p>
                </div>

                <!-- Education Section -->
                <div class="section education">
                    <h2>Education</h2>
                    <p>BA Sales and Commerce, Westdale University</p>
                    <span>Graduated: 2015</span>
                </div>

                <!-- References Section -->
                <div class="section references">
                    <h2>References</h2>
                    <ul>
                        <li>Estelle Darcy, Workforce Inc. / CEO</li>
                        <li>Harper Russo, Workforce Inc. / COO</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
	<br>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
</body>
</html>