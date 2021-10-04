<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Inconsolata);

body {
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: 'Poppins', sans-serif;
}

.container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.container .box {
	position: relative;
	width: 200px;
	padding: 40px;
	background: #fff;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .1);
	border-radius: 4px;
	margin: 20px;
	box-sizing: border-box;
	overflow: hidden;
	text-align: center;
}

/* xong cai button khung link phia duoi ms qua lai viet cai nay */
.container .box:before {
	content: '';
	width: 50%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, .2);
	z-index: 2;
	pointer-events: none;
}
/* --------------------------- */
.container .box .icon {
	position: relative;
	width: 80px;
	height: 80px;
	color: #fff;
	background: #000;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
	border-radius: 50%;
	font-size: 40px;
	font-weight: 700;
	transition: 1s;
}
/* mau sac do khi kick vao */
.container .box:nth-child(1) .icon {
	box-shadow: 0 0 0 0 #e91e63;
	background: #e91e63;
}

.container .box:nth-child(1):hover .icon {
	box-shadow: 0 0 0 400px #e91e63;
}

.container .box:nth-child(2) .icon {
	box-shadow: 0 0 0 0 #23e629;
	background: #23e629;
}

.container .box:nth-child(2):hover .icon {
	box-shadow: 0 0 0 400px #23e629;
}

.container .box:nth-child(3) .icon {
	box-shadow: 0 0 0 0 #2196f3;
	background: #2196f3;
}

.container .box:nth-child(3):hover .icon {
	box-shadow: 0 0 0 400px #2196f3;
}

/* oooooooooooooooooooo nhan doi cach biet */
.container .box:nth-child(4) .icon {
	box-shadow: 0 0 0 0 #b5c5ff;
	background: #b5c5ff;
}

.container .box:nth-child(4):hover .icon {
	box-shadow: 0 0 0 400px #b5c5ff;
}

.container .box:nth-child(5) .icon {
	box-shadow: 0 0 0 0 #f1c232;
	background: #f1c232;
}

.container .box:nth-child(5):hover .icon {
	box-shadow: 0 0 0 400px #f1c232;
}

.container .box:nth-child(6) .icon {
	box-shadow: 0 0 0 0 #b45f06;
	background: #b45f06;
}

.container .box:nth-child(6):hover .icon {
	box-shadow: 0 0 0 400px #b45f06;
}

/* đến đay là đã hoàn thành box và đưa chuột vô thì màu trên toàn bộ box */
/* /////////////////////////////////////////////////////// */
.container .box .content {
	position: relative;
	z-index: 1;
	transition: 0.5s;
}

/* dua chuot vao thi chu chuyen mau trang */
.container .box:hover .content {
	color: #fff;
}

.container .box .content h3 {
	font-size: 20px;
	margin: 10px 0;
	padding: 0;
}

.container .box .content p {
	margin: 0;
	padding: 0;
}
/* hien thi the a nhu button */
a {
	display: inline-block;
	padding: 10px 20px;
	background: #fff;
	border-radius: 4px;
	/* --------------------- */
	text-decoration: none;
	color: #000;
	font-weight: 500;
	margin-top: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .2);
}
</style>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<header id="home" class="header">
		<nav class="nav">
			<div class="navigation container">
				<div class="logo">
					<a href=""><img alt="anhlogo"
						src='<c:url value="/resources/img/logo.jpg" />' /></a>
				</div>

				<div class="menu">
					<div class="top-nav">
						<div class="logo">
							<a href=""><img alt="anhlogo"
								src='<c:url value="/resources/img/logo.jpg" />' /></a>
						</div>
						<div class="close">
							<i class="bx bx-x"></i>
						</div>
					</div>
					<ul class="nav-list">
						<li class="nav-item"><a href="#home"
							class="nav-link scroll-link">Home</a></li>
						<li class="nav-item"><a href="#" class="nav-link">My
								Course</a></li>
						<li class="nav-item"><a href="#" class="nav-link scroll-link">Course</a>
						</li>
						<li class="nav-item"><a href="#" class="nav-link scroll-link">Note</a>
						</li>
					</ul>
				</div>

				<div class="container-user-setting">
					<a href="#" class="user-icon"> <i class='bx bx-user-circle'></i>
					</a>
					<div class="setting-user">
						<div class="setting-user-item">
							<i class='bx bxs-edit-alt'></i> <span>Edit profile</span>
						</div>
						<div class="setting-user-item">
							<i class='bx bxs-log-out'></i> <span>Logout</span>
						</div>
					</div>
				</div>


				<div class="hamburger">
					<i class="bx bx-menu"></i>
				</div>

			</div>
		</nav>
	</header>
	<div class="container">
		<div class="box">
			<div class="icon">01</div>
			<div class="content">
				<h3>BOX1</h3>
				<a href="#">Read more</a>
			</div>
		</div>

		<div class="box">
			<div class="icon">02</div>
			<div class="content">
				<h3>BOX2</h3>
				<a href="#">Read more</a>
			</div>
		</div>

		<div class="box">
			<div class="icon">03</div>
			<div class="content">
				<h3>BOX3</h3>
				<a href="#">Read more</a>
			</div>
		</div>

		<div class="box">
			<div class="icon">04</div>
			<div class="content">
				<h3>BOX4</h3>
				<a href="#">Read more</a>
			</div>
		</div>

		<div class="box">
			<div class="icon">05</div>
			<div class="content">
				<h3>BOX5</h3>
				<a href="#">Read more</a>
			</div>
		</div>

		<div class="box">
			<div class="icon">06</div>
			<div class="content">
				<h3>DONE</h3>
				<a href="#">Read more</a>
			</div>
		</div>
	</div>
	<div class="container"></div>


</body>
</html>