<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="util.SoNgauNhien"%>
<%@page import="model.KhachHang"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi đổi ảnh</title>
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
	margin-bottom: 10px;
}

h1 {
	text-align: center;
	margin-top: 50px;
}
h3{
text-align: center;
	margin-top: 10px;
	width: 200px;
}

/*   form {
	position: absolute;
	margin-top:20px;
	width: 300px; top : 35%;
	left: 55%;
	transform: translate(-50%, -50%);
	
}  */ 
img{ 
align-items: center;

}
#tr{
text-align: center;

}
.haha{
margin-top: 100px;

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
	if (obj != null)
		khachHang = (KhachHang) obj;
	if (khachHang == null) {
	%>
	<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
	<script>
		setTimeout(function() {
			window.location.href = 'index.jsp';
		}, 5000);
	</script>
	<%
	} else {
	%>
	<%
	String baoLoi = request.getAttribute("baoLoi") + "";
	baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

	String hoVaTen = khachHang.getHoVaTen();

	String gioiTinh = khachHang.getGioiTinh();

	String ngaySinh = khachHang.getNgaySinh().toString();

	String diaChiKhachHang = khachHang.getDiaChi();

	String soDienThoai = khachHang.getSoDienThoai();

	String email = khachHang.getEmail();

	String duongDanAnh = khachHang.getDuongDanAnh();
	
	 DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	%>
	<div class="container mt-3">

		<div class="text-center">
			<%
			String url1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();
			%>
			<h1>TRANG CÁ NHÂN</h1>
			<div class="red" id="baoLoi"><%=baoLoi%></div>
		</div>
		<form action="<%=url1%>/khach-hang-thay-doi-anh" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="hanhDong" value="thay-doi-anh" />
			<div class="row">
				<div class="col-sm-6">
					<img alt="anh" src="<%=url1%>/avatar/<%=duongDanAnh%>"
						width="100px">
					<div class="mb-3">
						<label for="duongDanAnh" class="form-label">Đường dẫn ảnh</label>
						<input type="file" class="form-control" id="duongDanAnh"
							name="duongDanAnh" style="width: 200px;"> <input
							class="btn btn-outline-primary form-control mt-1" type="submit"
							value="Cập Nhật" name="submit" id="submit"
							style="color: black; width: 100px; height: 40px" />
					</div>
				</div>
			</div>
		</form>
		<div class="row" id="tr">
		<div class="col-sm-6">
		<div class="mb-3">
		<span>HỌ VÀ TÊN :</span><br>
		<label  class="form-label"><%=hoVaTen%><span
							class="red">*</span></label>
		</div>
		<div class="mb-3">
		<span>GIỚI TÍNH:</span><br>
		<label  class="form-label"><%=gioiTinh%><span
							class="red">*</span></label>
		</div>
		<div class="mb-3">
		<span>NGÀY SINH:</span><br>
		<label  class="form-label"><%=ngaySinh%><span
							class="red">*</span></label>
		</div>
		</div>
		<div class="col-sm-6">
		<div class="mb-3">
		<span>ĐỊA CHỈ:</span><br>
		<label  class="form-label"><%=diaChiKhachHang%><span
							class="red">*</span></label>
		</div>
		<div class="mb-3">
		<span>SỐ ĐIỆN THOẠI:</span><br>
		<label  class="form-label"><%=soDienThoai%><span
							class="red">*</span></label>
		</div>
		<div class="mb-3">
		<span>Email:</span><br>
		<label class="form-label"><%=email%><span
							class="red">*</span></label>
		</div>
		</div>
		</div>
		<a class=" w-100 btn btn-outline-danger mt-1"
					href="<%=url1%>/index.jsp" role="button" style="margin-top: 200px; width: 200px;">Quay lại</a>
		</div>
		
	
	<%
	}
	%>
</body>
</html>