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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!-- html2pdf Library -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.containerr {
	width: 750px;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 30px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-bottom: 30px;
	border-bottom: 2px solid #ddd;
	margin-bottom: 30px;
}

.header .profile-pic {
	border-radius: 50%;
	width: 120px;
	height: 120px;
	background-color: #b3acac;
	margin-left: 55px;
}

.header .name {
	font-size: 36px;
	font-weight: bold;
	color: #333;
}

.header .title {
	font-size: 18px;
	color: #777;
}

.header .contact {
	font-size: 14px;
	color: #555;
}

.header .contact a {
	text-decoration: none;
	color: #555;
	margin-right: 15px;
}

.header .contact a:hover {
	text-decoration: underline;
}

/* Flexbox for the left and right columns */
.content {
	display: flex;
	justify-content: space-between;
}

.left-column {
	width: 30%; /* Set width for left column */
	padding-right: 30px;
	border-right: 2px solid #ddd;
	/* Add border to right side of left column */
}

.right-column {
	width: 65%; /* Set width for right column */
	padding-left: 30px;
}

.section {
	margin-bottom: 30px;
}

.section h3 {
	font-size: 22px;
	color: #333;
	border-bottom: 2px solid #ddd;
	padding-bottom: 5px;
	margin-bottom: 15px;
}

.section ul {
	list-style-type: none;
	padding-left: 0;
	margin: 0;
}

.section ul li {
	margin-bottom: 10px;
	color: #555;
	font-size: 14px;
}

.section ul li span {
	font-weight: bold;
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/views/headerNoPanner.jsp"%>
	<!-- header -->
	<div class="containerr">
		<div class="header">
			<img src="profile.jpg" alt="" class="profile-pic">
			<div>
				<div class="name">Olivia Wilson</div>
				<div class="title">Graphics Designer</div>
				<div class="contact">
					<a href="tel:+1234567890">+123 456 7890</a> <a
						href="mailto:olivia@email.com">olivia@email.com</a> <a
						href="https://www.oliviaportfolio.com" target="_blank">www.oliviaportfolio.com</a>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="left-column">
				<div class="section">
					<h3>Education</h3>
					<ul>
						<li><span>Bachelor of Design</span>, Design University - 2016
							- 2018</li>
						<li><span>Bachelor of Design</span>, Design University - 2018
							- 2020</li>
					</ul>
				</div>

				<div class="section">
					<h3>Languages</h3>
					<ul>
						<li>English</li>
						<li>Spanish</li>
						<li>French</li>
					</ul>
				</div>
			</div>

			<div class="right-column">
				<div class="section">
					<h3>Profile</h3>
					<p>Creative and results-driven graphic designer with over 5
						years of experience. Skilled in Adobe Creative Suite, branding,
						and visual communication. Passionate about creating innovative
						design solutions that capture brand identity and engage audiences.</p>
				</div>

				<div class="section">
					<h3>Work Experience</h3>
					<ul>
						<li><span>Graphic Designer</span>, Ghyarid International Co.
							- 2019 - 2020</li>
						<li><span>Senior Graphic Designer</span>, Arwen Industries -
							2020 - 2021</li>
						<li><span>Lead Graphic Designer</span>, Ghyarid International
							Co. - 2021 - Present</li>
					</ul>
				</div>

				<div class="section">
					<h3>Expertise</h3>
					<ul>
						<li>Management Skills</li>
						<li>Digital Marketing</li>
						<li>Critical Thinking</li>
						<li>Graphic Design</li>
						<li>UI/UX Design</li>
					</ul>
				</div>

				<div class="section">
					<h3>References</h3>
					<ul>
						<li><span>Bailey Dupont</span>, Ghyarid International Co. -
							CCO</li>
						<li><span>Hamuri Kobayashi</span>, Arwen Industries - CEO</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>
	<!-- footer -->
</body>
</html>