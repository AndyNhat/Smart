<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Trang Home</title>
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
.cavang {
	width: 650px;
	position: absolute;
	left: 50%;
	top: 38%;
	transform: translate(-50%, -50%);
	left: 50%;
	top: 38%;
	top: 38%;
}

</style>
</head>
<body>
	<%
	String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	%>
	<div><jsp:include page="header.jsp"></jsp:include></div>
	<div class="container mt-4">
		<div class="row">
			<div class="dropdown col-lg-3 mt-2">
				<jsp:include page="left.jsp"></jsp:include>
			</div>
			<div class="dropdown col-lg-9 mt-2">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=url%>/img/anhsl/anhdep.jpg" class="d-block w-100"
								alt="..." height="300">
						</div>
						<div class="carousel-item">
							<img src="<%=url%>/img/anhsl/anhdep3.jpg" class="d-block w-100"
								alt="..." height="300">
						</div>
						<div class="carousel-item">
							<img src="<%=url%>/img/anhsl/anhdep2.png" class="d-block w-100"
								alt="..." height="300">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<h1 class="mt-5">Một số sản phẩm đặc trưng</h1>
				<div class = "row">
				<c:forEach begin="1" end="3" >
				<div class="card" style="width: 18rem; margin-left: 35px; margin-top: 10px;">
					<img src="<%=url%>/img/anhsl/anhdep3.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">An item</li>
						<li class="list-group-item">A second item</li>
						<li class="list-group-item">A third item</li>
					</ul>
					<div class="card-body">
						<a href="#" class="btn btn-outline-danger">Card link</a> <a href="#"
							class=" btn btn-outline-danger">Another link</a>
					</div>
				</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
<div class="mt-4"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>