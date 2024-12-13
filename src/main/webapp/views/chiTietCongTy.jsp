<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới thiệu công ty</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }
        .header {
            background-color: #008043;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
       
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .banner {
            background: linear-gradient(135deg, #0b4824, #008043);
            color: white;
            text-align: center;
            padding: 30px 20px;
            font-size: 26px;
            font-weight: bold;
        }
        .content {
            padding: 20px;
        }
        .content h2 {
            color: #008043;
            font-size: 22px;
            margin-bottom: 15px;
        }
        .info {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
            gap: 20px;
        }
        .info .section {
            flex: 1;
            padding: 15px;
            background: #f1f1f1;
            border-radius: 8px;
            min-width: 300px;
        }
        .info .section h3 {
            margin-bottom: 10px;
            color: #005f32;
            font-size: 18px;
        }
        .map {
            margin-top: 30px;
            text-align: center;
        }
        .map iframe {
            width: 100%;
            height: 400px;
            border: none;
            border-radius: 8px;
        }
        .footer {
            background: #008043;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
        }
        .job-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-top: 20px;
            background: #fafafa;
        }
        .job-card h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }
        .job-card p {
            margin: 5px 0;
            font-size: 16px;
        }
    </style>
</head>
<body>

<%@ include file="/views/headerNoPanner.jsp"%>
	
	<%@ include file="/views/chat.jsp"%>
<div class="container">
    <div class="banner text-uppercase">
        ${emp.companyname}
    </div>

    <div class="content">
        <h2>Thông tin công ty</h2>
        <p>${emp.companydescription}</p>

        <div class="info">
            <div class="section">
                <h3>Thông tin liên hệ</h3>
                <p><strong>Địa chỉ:</strong> ${emp.address }</p>
            </div>
            <div class="section">
                <h3>Địa chỉ website</h3>
                <a href="${companywebsite}">${emp.companywebsite}</a>
            </div>
        </div>

        <h2>Tuyển dụng</h2>
        <c:forEach var="entity" items="${list}">
        <div class="job-card shadow border-0 bg-light">
            <h3>${entity.jobtitle}</h3>
            <p><strong>Chi tiết:</strong> ${entity.jobdescription}</p>
            <p><strong>Thu nhập:</strong> ${entity.salary}</p>
            <p><strong>Thời gian:</strong> ${entity.posteddate} - ${entity.applicationdeadline}</p>
        </div>
        </c:forEach>

       <!--  <div class="map">
            <h3>Bản đồ</h3>
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.729323215614!2d106.61706667473178!3d10.833874358345846!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bfaa6d0f577%3A0x133e0247f83c79bc!2zMjA3LzYzRSBI4buTIETGsOG7o25nIEzhuqdtLCBBbiBM4bqhYywgQsOsbmggVMOibiwgSOG7kyBDaMOtbmggTWluaCwgVmnhu4d0IE5hbQ" 
                allowfullscreen="" 
                loading="lazy">
            </iframe>
        </div> -->
    </div>
</div>

<!--footer  -->
<%@ include file="/views/footer.jsp"%>
</body>
</html>
