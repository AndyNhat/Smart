<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>


<nav class="navbar navbar-expand-lg navbar-light "
	style="background-color: #FFE4E1;">
	<div class="container-fluid">
		<img alt="logo" src="<%=url%>/img/logo/logoc.png" height="50">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link " aria-current="page"
					href="#">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Sản phẩm</a>
				</li>
				<li class="nav-item"><a class="nav-link " href="#">Yêu
						thích</a></li>
				<li class="nav-item"><a class="nav-link " href="#">Giỏ hàng</a></li>
			</ul>
			<form class="d-flex" style="margin-right: 20px;">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
			<%
			Object obj = session.getAttribute("khachHang");
			KhachHang khachHang = null;
			if (obj != null)
				khachHang = (KhachHang) obj;

			if (khachHang == null) {
			%>
			<a href="khachhang/dangnhap.jsp"><button type="button"
					class="btn btn-primary" style="margin-right: 10px;">Đăng
					Nhập</button></a>
			<%
			} else {
			%>

			<div class="dropdown">
				<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-bs-toggle="dropdown"
					aria-expanded="false">Xin chào <%=khachHang.getTenDangNhap()%>
				</a>

				<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<li><a class="dropdown-item" href="<%=url%>/khachhang/thaydoianh.jsp">Trang cá nhân</a></li>
					<li><a class="dropdown-item"
						href="<%=url%>/khachhang/thaydoithongtin.jsp">Thay đổi thông
							tin</a></li>
					<li><a class="dropdown-item"
						href="<%=url%>/khachhang/doimatkhau.jsp">Thay đổi mật khẩu</a></li>
					<li><a class="dropdown-item"
						href="<%=url%>/khach-hang?hanhDong=dangXuat">Đăng Xuất</a></li>
				</ul>
			</div>
			<%
			}
			%>
		</div>
	</div>