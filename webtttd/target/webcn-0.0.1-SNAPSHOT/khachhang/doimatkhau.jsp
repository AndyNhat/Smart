<%@page import="model.KhachHang"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>
</head>
<style type="text/css">
body {
	background-color: #FFF8DC;
}

form {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	padding: 30px;
	background-color: #F0FFFF;
}

h1 {
	text-align: center;
	margin-top: 90px;
}
.center-link{
position: absolute;
    top: 30%;
    left: 50%;
    transform: translate(-50%, -50%);
}
#red{
color: red;
text-align:  center;
}
</style>
<%
String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();

%>
<body>
	<%
		Object obj = session.getAttribute("khachHang");
		KhachHang khachHang = null;
		if (obj!=null)
			khachHang = (KhachHang)obj;		
			if(khachHang==null){		
	%>
	<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
	<a class=" center-link btn btn-outline-danger mt-1"
		href="<%=url1%>/index.jsp" role="button" >Trở lại trang chủ!</a>
	<%
			}else {
				String baoLoi = request.getAttribute("baoLoi")+"";
				if(baoLoi.equals("null")){
					baoLoi = "";
				}
	%>

	<div class="container ">
		<h1>Đổi mật khẩu</h1>
		<form action="<%=url1%>/khach-hang" method="post">
			<input type="hidden" name="hanhDong" value="doiMatKhau" /> <span
				id="red"> <%=baoLoi%></span>
			<div class="mb-3">
				<label for="matKhauHienTai" class="form-label">Mật khẩu hiện
					tại</label> <input type="password" class="form-control" id="matKhauHienTai"
					name="matKhauHienTai" placeholder="Nhập mật khẩu hiện tại!"
					style="width: 100%;">
			</div>
			<div class="mb-3">
				<label for="matKhauMoi" class="form-label">Mật khẩu mới</label> <input
					type="password" class="form-control" id="matKhauMoi"
					name="matKhauMoi" placeholder="Nhập mật khẩu mới! "
					style="width: 100%;">
			</div>
			<div class="mb-3">
				<label for="matKhauMoiNhapLai" class="form-label">Mật khẩu
					mới</label> <input type="password" class="form-control"
					id="matKhauMoiNhapLai" name="matKhauMoiNhapLai"
					placeholder="Nhập lại mật khẩu mới!" style="width: 100%;">
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit"
				style="width: 50%;">Đổi mật khẩu</button>
			<a class=" w-100 btn btn-outline-danger mt-1"
				href="<%=url1%>/index.jsp" role="button">Quay lại</a>
		</form>
	</div>
	<%} %>
</body>
</html>