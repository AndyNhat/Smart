<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Trang Đăng Nhập</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>

<style type="text/css">
html, body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #FFEFD5;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}
.red{ 
color: red;
}
</style>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();

String baoLoi = request.getAttribute("baoLoi") + "";
baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
%>
</head>
<body>

	<div class="container" style="text-align: center;">
		<main class="form-signin w-100 m-auto">
			<form class="text-center" action="<%=url%>/khach-hang" method="POST">
			<input type="hidden" name="hanhDong" value="dangNhap" />
				<img class="mb-4" src="<%=url%>/img/logo/logoc.png" alt=""
					width="72">
				<h1 class="h3 mb-3 fw-normal">ĐĂNG NHẬP</h1>

				<div class="text-center">
					<span class="red"><%=baoLoi%></span>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" id="tenDangNhap"
						placeholder="Tên đăng nhập" name="tenDangNhap" required="required">
					<label for="tenDangNhap">Tên đăng nhập</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="matKhau"
						placeholder="Mật khẩu" name="matKhau"> <label
						for="matKhau">Mật khẩu</label>
				</div>

				<div class="checkbox mb-3">
					<label> <input type="checkbox" value="remember-me">
						Ghi nhớ tài khoản này
					</label>
				</div>
				<button class="w-100 btn btn-lg btn-primary" type="submit">Đăng
					nhập</button>
				<a class=" w-100 btn btn-outline-danger mt-1"
					href="<%=url%>/index.jsp" role="button">Quay lại</a> <a
					href="dangky.jsp">Đăng ký tài khoản mới</a>
				<p class="mt-5 mb-3 text-muted">&copy; 2018-2025</p>
			</form>
		</main>
	</div>
</body>
</html>