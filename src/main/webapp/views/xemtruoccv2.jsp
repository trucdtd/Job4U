<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .cv-wrapper {
    display: flex;
    gap: 20px;
    padding: 20px;
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
}

/* Phần bên trái */
.cv-left {
    width: 70%;
    background-color: #fff;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.cv-header {
    text-align: center;
    margin-bottom: 20px;
}

.profile-photo {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 10px;
}

.cv-header h1 {
    font-size: 1.8em;
    color: #45a049;
    margin: 0;
}

.cv-header h2 {
    font-size: 1.2em;
    color: #333;
    margin: 10px 0;
}

.cv-header p {
    font-size: 1em;
    color: #666;
    line-height: 1.5;
}

.cv-section h3 {
    font-size: 1.2em;
    color: #45a049;
    margin-bottom: 10px;
    border-bottom: 2px solid #45a049;
    display: inline-block;
}

.cv-section ul {
    list-style: none;
    padding: 0;
}

.cv-section ul li {
    font-size: 1em;
    color: #333;
    margin-bottom: 5px;
}

/* Phần bên phải */
.cv-right-panel {
    width: 30%;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.cv-right-panel h3 {
    font-size: 1.4em;
    color: #45a049;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

.form-control {
    width: 100%;
    padding: 8px;
    font-size: 1em;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.color-options {
    display: flex;
    gap: 10px;
    margin-top: 10px;
}

.color-option {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    border: 2px solid transparent;
    cursor: pointer;
}

.btn {
    display: block;
    width: 100%;
    padding: 10px;
    font-size: 1em;
    margin: 10px 0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.btn-primary {
    background-color: #45a049;
    color: #fff;
}

.btn-secondary {
    background-color: #ccc;
    color: #333;
}
* {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            padding: 20px;
            background-color: #f4f4f9;
        }

        .resume-container {
            display: flex;
            width: 800px;
            border: 1px solid #e0e0e0;
            background-color: white;
        }

        .left-column {
            width: 35%;
            background-color: #d2e4d9;
            padding: 20px;
        }

        .right-column {
            width: 65%;
            padding: 20px;
        }

        .personal-info {
            text-align: center;
            margin-left: 80px;
        }

        .photo-background {
            /* background-color: #e0e0e0; */
            /* Màu nền riêng biệt cho khung ảnh */
            padding: 30px;
            /* Tăng khoảng cách giữa ảnh và nền bao quanh */
            display: flex;
            justify-content: center;
            align-items: center;
            margin: -20px auto 20px auto;
            /* Căn giữa và thêm khoảng cách bên dưới */
            width: 210px;
            /* Tăng chiều rộng */
            height: 260px;
            /* Tăng chiều cao */
            margin-right: 20px;
        }

        .photo-frame {
            width: 150px;
            /* Chiều rộng cố định của ảnh */
            height: 200px;
            /* Chiều cao cố định (tỷ lệ 3:4) */
            overflow: hidden;
            border: 2px solid #4d5c4b;
            /* Đường viền cho khung ảnh */
            border-radius: 8px;
            /* Bo tròn góc khung ảnh (tuỳ chọn) */
            background-color: #ffffff;
            /* Màu nền của khung ảnh */
        }

        .photo-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* Đảm bảo ảnh lấp đầy khung với tỷ lệ 3:4 */
        }

        h1 {
            font-size: 24px;
            color: #4d5c4b;
            text-align: center;
        }

        h2 {
            font-size: 15px;
            color: #4d5c4b;
            margin-bottom: 10px;
        }

        .section-title {
            font-size: 18px;
            margin-top: 20px;
            color: #4d5c4b;
            border-bottom: 2px solid #4d5c4b;
            padding-bottom: 5px;
        }

        p {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
        }

        .contact-info,
        .skills,
        .reference {
            margin-bottom: 20px;
        }

        .contact-info p,
        .skills p,
        .reference p {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="cv-wrapper">
        <!-- Phần CV -->
        <div class="resume-container">
            <!-- Left Column -->
            <div class="left-column">
                <div class="photo-background">
                    <div class="photo-frame">
                        <img src="profile.jpg" alt="Profile Image">
                    </div>
                </div>
                <div class="contact-info">
                    <h2 class="section-title" data-key="contact-title">Liên hệ</h2>
                    <p data-key="email">Email: hello@reallygreatsite.com</p>
                    <p data-key="phone">Điện thoại: +1 234 567 8910</p>
                    <p data-key="location">Địa chỉ: 43 Anywhere St., Any City</p>
                    <p data-key="website">Website: www.reallygreatsite.com</p>
                </div>

                <div class="skills">
                    <h2 class="section-title" data-key="skills-title">Kỹ năng</h2>
                    <p data-key="skill1">Thiết kế biểu tượng</p>
                    <p data-key="skill2">Nhiếp ảnh</p>
                    <p data-key="skill3">Tạo nội dung</p>
                    <p data-key="skill4">Mạng xã hội</p>
                </div>

                <div class="reference">
                    <h2 class="section-title" data-key="reference-title">Tham chiếu</h2>
                    <p data-key="reference1">Helene Paquet</p>
                    <p data-key="reference2">Holto Werner & Schomer</p>
                    <p data-key="reference-email">Email: helene@holto.com</p>
                    <p data-key="reference3">Lee Landra, Inc.</p>
                    <p data-key="reference4">Giám đốc Landra, Inc.</p>
                    <p data-key="reference-phone">Điện thoại: +1 555 234 5678</p>
                </div>
            </div>

            <!-- Right Column -->
            <div class="right-column">
                <div class="personal-info">
                    <h1 data-key="name">OLIVIA WILSON</h1>
                    <h2 data-key="job-title">Nhà thiết kế đồ họa</h2>
                    <p data-key="summary">
                        Tôi là một người sáng tạo chăm chỉ, luôn cố gắng đạt sự xuất sắc trong mọi việc tôi làm. Tôi
                        thích học hỏi và tìm cách cải thiện cuộc sống của những người xung quanh.
                    </p>
                </div>

                <h2 class="section-title" data-key="education-title">Học vấn</h2>
                <ul>
                    <li data-key="education1"><strong>Đại học Great</strong><br>Thạc sĩ Thiết kế Sản phẩm<br>2010 - 2013
                    </li>
                    <li data-key="education2"><strong>Đại học Great</strong><br>Cử nhân Phân tích Kỹ thuật số<br>2008 -
                        2010</li>
                    <li data-key="education3"><strong>Đại học Great</strong><br>Cử nhân Thiết kế Đồ họa<br>2006 - 2008
                    </li>
                </ul>

                <h2 class="section-title" data-key="experience-title">Kinh nghiệm</h2>
                <ul>
                    <li data-key="experience1"><strong>Quản lý Thời trang Cấp cao</strong><br>2007 - Hiện tại<br>Làm
                        việc với các thương hiệu thời trang hàng đầu</li>
                    <li data-key="experience2"><strong>Nhà báo Thời trang</strong><br>2007 - 2008<br>Phụ trách nội dung
                        xuất bản cho nhiều thương hiệu</li>
                </ul>
            </div>
        </div>

        <!-- Phần thay đổi ngôn ngữ -->
        <div class="cv-right-panel">
            <h3>Mẫu CV Thanh lịch</h3>
            <div class="form-group">
                <label for="language">Ngôn ngữ</label>
                <select id="language" class="form-control">
                    <option value="vi">Tiếng Việt</option>
                    <option value="en">English</option>
                </select>
            </div>
            <button class="btn btn-primary">Dùng mẫu này</button>
            <button class="btn btn-secondary">Đóng lại</button>
        </div>
    </div>

    <script>
        // Nội dung dịch
        const translations = {
            en: {
                "contact-title": "Contact",
                email: "Email: hello@reallygreatsite.com",
                phone: "Phone: +1 234 567 8910",
                location: "Location: 43 Anywhere St., Any City",
                website: "Website: www.reallygreatsite.com",
                "skills-title": "Skills",
                skill1: "Icon Design",
                skill2: "Photography",
                skill3: "Content Creation",
                skill4: "Social Media",
                "reference-title": "References",
                reference1: "Helene Paquet",
                reference2: "Holto Werner & Schomer",
                "reference-email": "Email: helene@holto.com",
                reference3: "Lee Landra, Inc.",
                reference4: "CEO Landra, Inc.",
                "reference-phone": "Phone: +1 555 234 5678",
                name: "OLIVIA WILSON",
                "job-title": "Graphic Designer",
                summary: "I am a fun, hard-working creative who strives for excellence in everything I do. I’m an avid learner and seek to enhance the lives of everyone around me.",
                "education-title": "Education",
                education1: "<strong>Great University</strong><br>Master in Product Design<br>2010 - 2013",
                education2: "<strong>Great University</strong><br>Bachelor Degree in Digital Analysis<br>2008 - 2010",
                education3: "<strong>Great University</strong><br>Bachelor in Graphic Design<br>2006 - 2008",
                "experience-title": "Experience",
                experience1: "<strong>Senior Fashion Manager</strong><br>2007 - Present<br>Worked on marketing for top fashion brands",
                experience2: "<strong>Fashion Journalist</strong><br>2007 - 2008<br>Responsible for content publishing to multiple brands",
            },
            vi: {
                "contact-title": "Liên hệ",
                email: "Email: hello@reallygreatsite.com",
                phone: "Điện thoại: +1 234 567 8910",
                location: "Địa chỉ: 43 Anywhere St., Any City",
                website: "Website: www.reallygreatsite.com",
                "skills-title": "Kỹ năng",
                skill1: "Thiết kế biểu tượng",
                skill2: "Nhiếp ảnh",
                skill3: "Tạo nội dung",
                skill4: "Mạng xã hội",
                "reference-title": "Tham chiếu",
                reference1: "Helene Paquet",
                reference2: "Holto Werner & Schomer",
                "reference-email": "Email: helene@holto.com",
                reference3: "Lee Landra, Inc.",
                reference4: "Giám đốc Landra, Inc.",
                "reference-phone": "Điện thoại: +1 555 234 5678",
                name: "OLIVIA WILSON",
                "job-title": "Nhà thiết kế đồ họa",
                summary: "Tôi là một người sáng tạo chăm chỉ, luôn cố gắng đạt sự xuất sắc trong mọi việc tôi làm. Tôi thích học hỏi và tìm cách cải thiện cuộc sống của những người xung quanh.",
                "education-title": "Học vấn",
                education1: "<strong>Đại học Great</strong><br>Thạc sĩ Thiết kế Sản phẩm<br>2010 - 2013",
                education2: "<strong>Đại học Great</strong><br>Cử nhân Phân tích Kỹ thuật số<br>2008 - 2010",
                education3: "<strong>Đại học Great</strong><br>Cử nhân Thiết kế Đồ họa<br>2006 - 2008",
                "experience-title": "Kinh nghiệm",
                experience1: "<strong>Quản lý Thời trang Cấp cao</strong><br>2007 - Hiện tại<br>Làm việc với các thương hiệu thời trang hàng đầu",
                experience2: "<strong>Nhà báo Thời trang</strong><br>2007 - 2008<br>Phụ trách nội dung xuất bản cho nhiều thương hiệu"
            }

        };

        // Hàm thay đổi ngôn ngữ
        document.getElementById('language').addEventListener('change', function () {
            const lang = this.value;
            document.querySelectorAll('[data-key]').forEach(el => {
                const key = el.getAttribute('data-key');
                el.innerHTML = translations[lang][key];
            });
        });
    </script>
</body>
</html>