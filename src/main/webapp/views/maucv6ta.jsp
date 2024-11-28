<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resume</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .header {
            text-align: center;
            padding: 40px 0;
            border-bottom: 2px solid #ddd;
            background-color: #e3f2fd;
        }

        .header h1 {
            font-size: 40px;
            margin: 0;
            color: #1e88e5;
        }

        .header p {
            font-size: 20px;
            color: #64b5f6;
            margin: 10px 0 0 0;
        }

        .content {
            display: flex;
            gap: 20px;
        }

        .left-column {
            flex: 3;
            border-right: 2px solid #ddd; /* Thêm đường gạch dọc */
            padding-right: 20px;
        }

        .right-column {
            flex: 7;
            padding-left: 20px; /* Thêm khoảng cách cho cột phải */
        }

        .section {
            margin-bottom: 20px;
        }

        .section h2 {
            font-size: 20px;
            color: #333;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin-bottom: 8px;
        }

        .profile-summary p {
            margin: 0;
            line-height: 1.6;
        }

        .work-experience .job {
            margin-bottom: 15px;
        }

        .job h3 {
            font-size: 16px;
            margin: 0 0 5px;
        }

        .job p {
            margin: 5px 0;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>RICHARD SANCHEZ</h1>
            <p>Marketing Manager</p>
        </div>

        <!-- Content -->
        <div class="content">
            <!-- Left Column -->
            <div class="left-column">
                <div class="section contact">
                    <h2>Contact</h2>
                    <ul>
                        <li>📞 +123-456-7890</li>
                        <li>✉️ richard@example.com</li>
                        <li>🏠 123 Anywhere St, Any City</li>
                        <li>🌐 www.richardsanchez.com</li>
                    </ul>
                </div>

                <div class="section education">
                    <h2>Education</h2>/-strong/-heart:>:o:-((:-h <p><strong>2021 - 2023:</strong> Bachelor of Business Management, Rockwell University</p>
                    <p><strong>2018 - 2021:</strong> Bachelor of Marketing, City College</p>
                </div>
            </div>

            <!-- Right Column -->
            <div class="right-column">
                <div class="section profile-summary">
                    <h2>Profile Summary</h2>
                    <p>Experienced and detail-driven Marketing Manager with a proven track record in delivering creative and successful marketing strategies. Skilled in project management, team leadership, and campaign optimization to drive brand growth.</p>
                </div>

                <div class="section work-experience">
                    <h2>Work Experience</h2>
                    <div class="job">
                        <h3>Boostle Studio | Marketing Manager & Specialist | 2020 - Present</h3>
                        <p>Successfully led branding projects for international corporations. Collaborated with teams to create marketing strategies that increased revenue by 25%.</p>
                    </div>
                    <div class="job">
                        <h3>Frugal Square | Marketing Manager | 2019 - 2020</h3>
                        <p>Developed multi-channel marketing strategies and executed campaigns that increased customer engagement by 30%.</p>
                    </div>
                    <div class="job">
                        <h3>Studio Shoreline | Marketing Specialist | 2017 - 2019</h3>
                        <p>Managed digital marketing initiatives and optimized social media presence to grow audience reach by 50%.</p>
                    </div>
                </div>

                <div class="section skills">
                    <h2>Skills</h2>
                    <ul>
                        <li>Project Management</li>
                        <li>Marketing Campaigns</li>
                        <li>Team Leadership</li>
                        <li>Data Analysis</li>
                        <li>Creative Thinking</li>
                    </ul>
                </div>

                <div class="section languages">
                    <h2>Languages</h2>
                    <ul>
                        <li>English - Fluent</li>
                        <li>Spanish - Intermediate</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>