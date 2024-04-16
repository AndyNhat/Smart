<%@page import="model.KhachHang"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi thông tin</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<style>
body {
	background-color: #FFF5EE;
}

.red {
	color: red;
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
</style>
<%
		 String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
	<script>
         setTimeout(function(){
            window.location.href = 'index.jsp';
         }, 5000);
      </script>
	<%
			}else {
				
	%>
	<%
		String baoLoi = request.getAttribute("baoLoi")+"";
		baoLoi = (baoLoi.equals("null"))?"":baoLoi;
		
		String hoVaTen= khachHang.getHoVaTen();
		
		String gioiTinh= khachHang.getGioiTinh();
		
		String ngaySinh= khachHang.getNgaySinh().toString();
		
		String diaChiKhachHang = khachHang.getDiaChi();
		
		String soDienThoai= khachHang.getSoDienThoai();
		
		String email= khachHang.getEmail();
		
	%>
	<div class="container mt-3">
	
		<div class="text-center">
		<%
		 String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
		 %>
			<h1>THAY ĐỔI THÔNG TIN</h1>
		</div>
		<div class="red" id="baoLoi"><%=baoLoi%></div>
		<form action="<%=url1%>/khach-hang" method="post">
			<input type="hidden" name="hanhDong" value="thayDoiThongTin" />
			<div class="row">
				<div class="col-sm-6">	
					<h3>Thông tin khách hàng</h3>
					<div class="mb-3">
						<label for="hoVaTen" class="form-label">Họ và tên</label> <input
							type="text" class="form-control" id="hoVaTen" name="hoVaTen"
							value="<%=hoVaTen%>" placeholder="Nhập họ và tên">
					</div>
					<div class="mb-3">
						<label for="gioiTinh" class="form-label">Giới tính</label> <select
							class="form-control" id="gioiTinh" name="gioiTinh">
							<option value="Chọn"></option>
							<option value="Nam"
								<%=(gioiTinh.equals("Nam")) ? "selected='selected'" : ""%>>Nam</option>
							<option value="Nữ"
								<%=(gioiTinh.equals("Nữ")) ? "selected='selected'" : ""%>>Nữ</option>
							<option value="Khác"
								<%=(gioiTinh.equals("Khác")) ? "selected='selected'" : ""%>>Khác</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="ngaySinh" class="form-label">Ngày sinh</label> <input
							type="date" class="form-control" id="ngaySinh" name="ngaySinh"
							value="<%=ngaySinh%>">
					</div>
				</div>
				<div class="col-sm-6">
					<h3>Địa chỉ</h3>
					<div class="mb-3">
						<label for="diaChiKhachHang" class="form-label">Địa chỉ
							khách hàng</label> <input type="text" class="form-control"
							id="diaChiKhachHang" name="diaChiKhachHang"
							value="<%=diaChiKhachHang%>">
					</div>
					<div class="mb-3">
						<label for="soDienThoai" class="form-label">Điện thoại</label> <input
							type="tel" class="form-control" id="soDienThoai"
							name="soDienThoai" value=" <%=soDienThoai%>">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email" name="email"
							value="<%=email%>">
					</div>
					<hr>
					
					</div>
					<input class="btn btn-outline-primary form-control" type="submit"
						value="Cập Nhật" name="submit" id="submit"
						style=" color: black;" /> <a
						class="btn btn-outline-danger mt-1"
						href="<%=url1%>/index.jsp" role="button"
						style="width: 100%;">Quay lại đăng nhập</a>
				</div>
			</form>
			</div>
	<%} %>
</body>
</html>