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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f4;
        }

        .cv-container {
            max-width: 750px;
            margin: 20px auto;
            display: flex;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Sidebar styling */
        .sidebar {
            width: 35%;
            background: #1d1c1c;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .sidebar img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .sidebar .section {
            width: 100%;
            margin-bottom: 20px;
        }

        .sidebar .section h3 {
            font-size: 16px;
            margin-bottom: 10px;
            text-transform: uppercase;
            border-bottom: 1px solid #444;
            padding-bottom: 5px;
        }

        .sidebar .section ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar .section ul li {
            font-size: 14px;
            margin: 5px 0;
        }

        /* Main content styling */
        .main-content {
            width: 65%;
            padding: 20px;
        }

        .main-header {
            text-align: left;
            margin-bottom: 20px;
        }

        .main-header h2 {
            font-size: 28px;
            color: #333;
            margin: 0;
        }

        .main-header h3 {
            font-size: 18px;
            color: #666;
            margin-top: 5px;
            font-weight: normal;
        }

        .main-content .section {
            margin-top: 20px;
        }

        .main-content .section h3 {
            font-size: 16px;
            color: #333;
            margin-bottom: 10px;
            text-transform: uppercase;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
        }

        .main-content .experience {
            margin-bottom: 20px;
        }

        .main-content .experience div {
            margin-bottom: 15px;
        }

        .main-content .experience h4 {
            font-size: 14px;
            color: #555;
            margin: 0;
        }

        .main-content .experience p {
            font-size: 12px;
            color: #777;
            margin: 5px 0;
        }

        .references div {
            margin-bottom: 10px;
        }

        .references h4 {
            font-size: 14px;
            color: #333;
            margin: 0;
        }

        .references p {
            font-size: 12px;
            color: #555;
        }
    </style>
</head>

<body>
<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
    <div class="cv-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <img src="https://via.placeholder.com/150" alt="Profile Photo">
            <div class="section">
                <h3>Contact</h3>
                <ul>
                    <li><strong>Email:</strong> olivia@example.com</li>
                    <li><strong>Phone:</strong> +123 456 789</li>
                    <li><strong>Website:</strong> www.olivia-consulting.com</li>
                    <li><strong>LinkedIn:</strong> linkedin.com/in/olivia</li>
                </ul>
            </div>

            <div class="section">
                <h3>Education</h3>
                <p>Bordeaux Business School</p>
                <p>Master's in Business Administration</p>
                <p>2005-2008</p>
            </div>

            <div class="section">
                <h3>Skills</h3>
                <ul>
                    <li>Management Skills</li>
                    <li>Digital Marketing</li>
                    <li>Negotiation</li>
                    <li>Critical Thinking</li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Main Header -->

            <div class="main-header">
                <h2>Olivia Schumacher</h2>
                <h3>Business Consultant</h3>
            </div>

            <div class="section">
                <h3>About Me</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget nisi nunc.</p>
            </div>

            <div class="section">
                <h3>Experience</h3>
                <div class="experience">
                    <div>
                        <h4>Business Consultant - Gloyard International Co.</h4>
                        <p>2020 - Present</p>
                        <p>Provided business strategies and managed consulting projects for global clients.</p>
                    </div>
                    <div>
                        <h4>Junior Business Consultant - Ingosud Company</h4>
                        <p>2015 - 2020</p>
                        <p>Developed operational workflows and improved client satisfaction.</p>
                    </div>
                    <div>
                        <h4>Junior Business Consultant - Ingosud Company</h4>
                        <p>2010 - 2015</p>
                        <p>Assisted in project planning and coordinated team efforts for successful outcomes.</p>
                    </div>
                </div>
            </div>

            <div class="section references">
                <h3>References</h3>
                <div>
                    <h4>Bailey Dupont</h4>
                    <p>Wardline Inc. CEO</p>
                </div>
                <div>
                    <h4>Harumi Kabayashi</h4>
                    <p>Wardline Inc. CEO</p>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
</body>
</html>