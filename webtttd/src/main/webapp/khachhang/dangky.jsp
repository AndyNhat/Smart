<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký</title>
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
</style>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();

String baoLoi = request.getAttribute("baoLoi") + "";
baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

String tenDangNhap = request.getAttribute("tenDangNhap") + "";
tenDangNhap = (tenDangNhap.equals("null")) ? "" : tenDangNhap;

String hoVaTen = request.getAttribute("hoVaTen") + "";
hoVaTen = (hoVaTen.equals("null")) ? "" : hoVaTen;

String gioiTinh = request.getAttribute("gioiTinh") + "";
gioiTinh = (gioiTinh.equals("null")) ? "" : gioiTinh;

String ngaySinh = request.getAttribute("ngaySinh") + "";
ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;

String diaChiKhachHang = request.getAttribute("diaChiKhachHang") + "";
diaChiKhachHang = (diaChiKhachHang.equals("null")) ? "" : diaChiKhachHang;

String soDienThoai = request.getAttribute("soDienThoai") + "";
soDienThoai = (soDienThoai.equals("null")) ? "" : soDienThoai;

String email = request.getAttribute("email") + "";
email = (email.equals("null")) ? "" : email;
%>

<body>
	<div class="container mt-3">
		<div class="text-center">
			<h1>ĐĂNG KÝ TÀI KHOẢN</h1>
		</div>
		<div class="red" id="baoLoi"><%=baoLoi%></div>
		<form action="<%=url%>/khach-hang" method="post">
			<input type="hidden" name="hanhDong" value="dangKy" />
			<div class="row">
				<div class="col-sm-6">
					<h3>Tài Khoản</h3>
					<div class="mb-3">
						<label for="tenDangNhap" class="form-label">Tên đăng nhập<span
							class="red">*</span></label> <input type="text" class="form-control"
							id="tenDangNhap" name="tenDangNhap" required="required"
							value="<%=tenDangNhap%>" placeholder="Nhập tên đăng nhập">
					</div>
					<div class="mb-3">
						<label for="matKhau" class="form-label">Mật khẩu<span
							class="red">*</span></label> <input type="password" class="form-control"
							id="matKhau" name="matKhau" required="required"
							placeholder="Nhập mật khẩu" onkeyup="kiemTraMatKhau()">
					</div>
					<div class="mb-3">
						<label for="matKhauNhapLai" class="form-label">Nhập lại
							mật khẩu<span class="red">*</span> <span id="msg" class="red"></span>
						</label> <input type="password" class="form-control" id="matKhauNhapLai"
							name="matKhauNhapLai" required="required"
							placeholder="Nhập mật khẩu nhập lại" onkeyup="kiemTraMatKhau()">
					</div>
					<hr />
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
					<div class="mb-3">
						<label for="dongYDieuKhoan" class="form-label">Đồng ý với
							<a>điều khoản của công ty </a><span id="red">*</span>
						</label> <input type="checkbox" class="form-check-input"
							id="dongYDieuKhoan" name="dongYDieuKhoan"
							data-bs-toggle="tooltip" data-bs-placement="top"
							title="Bạn đã đọc hết diều khoản!" required="required"
							onchange="xuLyChonDongY()">
					</div>
					<input class="btn btn-outline-primary form-control" type="submit"
						value="Đăng ký" name="submit" id="submit"
						style="visibility: hidden; color: black;" /> <a
						class="btn btn-outline-danger mt-1"
						href="<%=url%>/khachhang/dangnhap.jsp" role="button"
						style="width: 100%;">Quay lại đăng nhập</a>
				</div>
			</div>
	</div>
	</form>
	</div>
</body>
<script>
	function kiemTraMatKhau() {
		matKhau = document.getElementById("matKhau").value;
		matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
		if (matKhau != matKhauNhapLai) {
			document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
			return false;
		} else {
			document.getElementById("msg").innerHTML = "";
			return true;
		}
	}

	function xuLyChonDongY() {
		dongYDeuKhoan = document.getElementById("dongYDieuKhoan");
		if (dongYDeuKhoan.checked == true) {
			document.getElementById("submit").style.visibility = "visible";
		} else {
			document.getElementById("submit").style.visibility = "hidden";
		}
	}
</script>
</html>