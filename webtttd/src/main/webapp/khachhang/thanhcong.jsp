<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thành Công</title>
</head>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<style>
body {
	margin-top: 100px;
	text-align: center;
}

img {
	width:150px;
}
h1{
font-family: monospace;
}
</style>
<body>

	<img alt="bootstrap" src="<%=url%>/img/logo/tich-xanh.png">
	<h1>Thành Công rồi nhé!</h1>
	<h1>Chờ trong giây lát chúng tôi sẽ đưa bạn trở lại và trải nghiệm tiếp nào!</h1>
	<script>
         setTimeout(function(){
            window.location.href = 'index.jsp';
         }, 3000);
      </script>
</body>
</html>