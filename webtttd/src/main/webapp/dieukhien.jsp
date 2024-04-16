<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>dieukhien</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"></script>

<style>
.hidden {
	display: none;
}

button:focus, button:active {
	background-color: green; /* Màu nền khi nút được nhấn */
	color: white; /* Màu chữ khi nút được nhấn */
}
</style>
</head>
<body>

<a class="btn btn-danger" href="index.jsp" role="button">Quay lại Trang chủ</a>

	<div class="container mt-4">
		<div class="row">
			<div class="badge bg-warning text-wrap"
				style="width: 10rem; height: 2rem; text-align: center; font-size: medium;">
				Nhiệt độ : <span id="nhietdo"></span>°C
			</div>

			<div class="badge bg-info text-wrap"
				style="width: 10rem; height: 2rem; margin-left: 10px; text-align: center; font-size: medium;">
				Độ ẩm : <span id="doam"></span>°
			</div>

			<div class="badge bg-secondary text-wrap"
				style="width: 10rem; height: 2rem; margin-left: 10px; text-align: center; font-size: medium;">
				Độ ẩm đất : <span id="doamdat"></span>%
			</div>

			<div class="badge bg-primary text-wrap"
				style="width: 15rem; height: 2rem; margin-left: 10px; text-align: center; font-size: smaller;">
				Lượng mưa hôm nay : <span id="luongmuahn">7</span>mm
			</div>

			<div class="badge bg-primary text-wrap"
				style="width: 15rem; height: 2rem; margin-left: 10px; text-align: center; font-size: smaller;">
				Lượng mưa ngày mai : <span id="luongmuanm"></span>mm
			</div>
			<div class="badge bg-success text-wrap"
				style="width: 17rem; height: 2rem; margin-left: 10px; text-align: center; font-size: medium;">
				Trạng thái hiện tại : <span id="trangthai"></span>
			</div>

		</div>


		<div class="row">
			<div class="dropdown col-lg-4 mt-2">
				<h2>
					Chế độ: <span id="chedo"></span>
				</h2>
				<button id="tudong">Tự động</button>
				<button id="thucong">Thủ công</button>

				<div id="elementA" class="hidden" style="margin-top: 10px;">
					<h3>
						Loại cây trồng chọn: <span id="loaicay"></span>
					</h3>
					<button id="Raucai">Rau cải</button>
					<button id="Duahau" style="margin-left: 20px;">Dưa hấu</button>
					<button id="Catim" style="margin-left: 20px;">Cà tím</button>
				</div>
				<div id="elementB" class="hidden" style="margin-top: 10px;">
					<h4>
						Đèn : <span id="den"></span>
					</h4>
					<button id="batden">Bật</button>
					<button id="tatden" style="margin-left: 5px;">Tắt</button>

					<h4 style="margin-top: 10px;">
						Relay : <span id="relay"></span>
					</h4>
					<button id="batr">Bật</button>
					<button id="tatr" style="margin-left: 5px;">Tắt</button>

					<h4 style="margin-top: 10px;">
						Servo : <span id="servo"></span>
					</h4>
					<button id="bats">Bật</button>
					<button id="tats" style="margin-left: 5px;">Tắt</button>
				</div>
			</div>
			<div class="dropdown col-lg-8 mt-4">
				<div class="badge bg-danger text-wrap"
				style="width: 20rem; height: 4rem; text-align: center; font-size: medium;">
				Cảnh báo :<br>
				 <span id="canhBao" style="color: white;"></span>
			</div>
			</div>
		</div>
	</div>




	<script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.10.0/firebase-database.js"></script>
	<script>
		// Your web app's Firebase configuration
		const firebaseConfig = {
			apiKey : "AIzaSyBX9bpVC1MUy9weKUw6LG-SSoplD7s7V58",
			authDomain : "doantt-203e1.firebaseapp.com",
			databaseURL : "https://doantt-203e1-default-rtdb.asia-southeast1.firebasedatabase.app",
			projectId : "doantt-203e1",
			storageBucket : "doantt-203e1.appspot.com",
			messagingSenderId : "152806544758",
			appId : "1:152806544758:web:6649e7472afc81823fd657"
		};

		// Initialize Firebase
		const app = firebase.initializeApp(firebaseConfig);

		// Thêm biến global cho Firebase
		window.firebase = firebase;

		var database = firebase.database();

		//----Chế độ 
		var tudong = document.getElementById("tudong");
		var thucong = document.getElementById("thucong");
		var elementA = document.getElementById("elementA");
		var elementB = document.getElementById("elementB");

		tudong.onclick = function() {
			database.ref("/chedo").set(1);
			document.getElementById("chedo").innerHTML = "Tự động";
			elementA.style.display = "block";
			elementB.style.display = "none";
		};
		thucong.onclick = function() {
			database.ref("/chedo").set(0);
			document.getElementById("chedo").innerHTML = "Thủ công";
			elementA.style.display = "none";
			elementB.style.display = "block";
		};
		//Loại cây trồng
		var Raucai = document.getElementById("Raucai");
		var Duahau = document.getElementById("Duahau");
		var Catim = document.getElementById("Catim");
		Raucai.onclick = function() {
			database.ref("/Loaicaytrong").set(0);
			document.getElementById("loaicay").innerHTML = "Rau Cải";
		};
		Duahau.onclick = function() {
			database.ref("/Loaicaytrong").set(1);
			document.getElementById("loaicay").innerHTML = "Dưa hấu";
		};
		Catim.onclick = function() {
			database.ref("/Loaicaytrong").set(2);
			document.getElementById("loaicay").innerHTML = "Cà tím";
		};

		//Thủ công
		var batden = document.getElementById("batden");
		var tatden = document.getElementById("tatden");
		batden.onclick = function() {
			database.ref("/den").set(1);
			document.getElementById("den").innerHTML = "Bật đèn";
		};
		tatden.onclick = function() {
			database.ref("/den").set(0);
			document.getElementById("den").innerHTML = "Tắt đèn";
		};

		var batr = document.getElementById("batr");
		var tatr = document.getElementById("tatr");
		batr.onclick = function() {
			database.ref("/relay").set(1);
			document.getElementById("relay").innerHTML = "Bật relay";
		};
		tatr.onclick = function() {
			database.ref("/relay").set(0);
			document.getElementById("relay").innerHTML = "Tắt relay";
		};

		var bats = document.getElementById("bats");
		var tats = document.getElementById("tats");
		bats.onclick = function() {
			database.ref("/servo").set(1);
			document.getElementById("servo").innerHTML = "Bật servo";
		};
		tats.onclick = function() {
			database.ref("/servo").set(0);
			document.getElementById("servo").innerHTML = "Tắt servo";
		};
		//nhiệt độ

		database.ref("/Nhiet do").on("value", function(snapshot) {
			console.log("Snapshot:", snapshot.val());
			var nhietdo = snapshot.val();
			document.getElementById("nhietdo").innerHTML = nhietdo;
		});

		//độ ẩm
		database.ref("/Do am").on("value", function(snapshot) {
			console.log("Snapshot:", snapshot.val());
			var doam = snapshot.val();
			document.getElementById("doam").innerHTML = doam;
		});

		//độ ẩm đất
		database.ref("/Do am dat ").on("value", function(snapshot) {
			console.log("Snapshot:", snapshot.val());
			var doamdat = snapshot.val();
			document.getElementById("doamdat").innerHTML = doamdat;
		});
		//Lượng mưa hôm nay
		database.ref("/Luong mua").on("value", function(snapshot) {
			console.log("Snapshot:", snapshot.val());
			var luongMua = snapshot.val();
			document.getElementById("luongmuahn").innerHTML = luongMua;
		});

		//Lượng mưa ngày mai
		database.ref("/Luong mua ngay mai").on("value", function(snapshot) {
			console.log("Snapshot:", snapshot.val());
			var luongmuangaymai = snapshot.val();
			document.getElementById("luongmuanm").innerHTML = luongmuangaymai;
		});

		//Trạng thái 
		database.ref("/Trang thai").on("value", function(snapshot) {
			console.log("Snapshot:", snapshot.val());
			var trangthai = snapshot.val();
			document.getElementById("trangthai").innerHTML = trangthai;
		});
		//Trạng thái 
		database.ref("/canhBao").on("value", function(snapshot) {
			console.log("Snapshot:", snapshot.val());
			var trangthai = snapshot.val();
			document.getElementById("canhBao").innerHTML = trangthai;
		});
	</script>
</body>
</html>