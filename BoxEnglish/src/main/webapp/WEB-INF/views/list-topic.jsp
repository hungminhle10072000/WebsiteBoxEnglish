<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Title</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<style type="text/css">
/* * {
	margin: 0px;
	padding: 0px;
}

body {
	font-family: arial;
}
 */
/* .main {
	margin: 2%;
} */
.card {
	width: 20%;
	display: inline-block;
	box-shadow: 2px 2px 20px black;
	/* border-radius: 0px; */
	margin: 2%;
}

.image img {
	width: 100%;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
}

.title {
	text-align: center;
	padding: 10px;
}

h1 {
	font-size: 5px;
}

.des {
	padding: 3px;
	text-align: center;
	padding-top: 10px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
}

button {
	margin-top: 40px;
	margin-bottom: 10px;
	background-color: white;
	border: 1px solid black;
	border-radius: 5px;
	padding: 10px;
}

button:hover {
	background-color: black;
	color: white;
	transition: .5s;
	cursor: pointer;
}
</style>

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
						<li class="nav-item"><a href="/BoxEnglish/"
							class="nav-link scroll-link">Trang chủ</a></li>
						<li class="nav-item"><a href="#" class="nav-link">Khóa
								học của tôi</a></li>
						<li class="nav-item"><a href="#" class="nav-link scroll-link">Danh
								sách khóa học</a></li>
						<li class="nav-item"><a href="list-note"
							class="nav-link scroll-link">Ghi chú</a></li>
					</ul>
				</div>

				<div class="container-user-setting">
					<a href="#" class="user-icon"> <i class='bx bx-user-circle'></i>
					</a>
					<div class="setting-user">
						<div class="setting-user-item">
							<i class='bx bxs-edit-alt'></i> <span>Cập nhật thông tin</span>
						</div>
						<div class="setting-user-item">
							<i class='bx bxs-log-out'></i> <span>Đăng xuất</span>
						</div>
					</div>
				</div>


				<div class="hamburger">
					<i class="bx bx-menu"></i>
				</div>

			</div>
		</nav>
	</header>

	<div class="main">

		<!--cards -->

		<div class="card">

			<div class="image">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Gfp-missouri-st-louis-clubhouse-pond-and-scenery.jpg/1199px-Gfp-missouri-st-louis-clubhouse-pond-and-scenery.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>
			</div>
		</div>
		<!--cards -->


		<div class="card">

			<div class="image">
				<img
					src="https://cdn.pixabay.com/photo/2018/01/09/03/49/the-natural-scenery-3070808_1280.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>
			</div>
		</div>
		<!--cards -->


		<div class="card">

			<div class="image">
				<img
					src="https://cdn.pixabay.com/photo/2015/11/07/11/41/lake-1031405_1280.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>
			</div>
		</div>
		<!--cards -->


		<div class="card">

			<div class="image">
				<img
					src="https://cdn.pixabay.com/photo/2018/01/09/03/49/the-natural-scenery-3070808_1280.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>
			</div>
		</div>
		<!--cards -->


		<div class="card">

			<div class="image">
				<img
					src="https://cdn.pixabay.com/photo/2018/01/09/03/49/the-natural-scenery-3070808_1280.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>
			</div>
		</div>
		<!--cards -->

		<div class="card">

			<div class="image">
				<img
					src="https://cdn.pixabay.com/photo/2018/01/09/03/49/the-natural-scenery-3070808_1280.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>
			</div>
		</div>
		<!--cards -->

		<div class="card">

			<div class="image">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Gfp-missouri-st-louis-clubhouse-pond-and-scenery.jpg/1199px-Gfp-missouri-st-louis-clubhouse-pond-and-scenery.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>

			</div>
		</div>
		<!--cards -->


		<div class="card">

			<div class="image">
				<img
					src="https://cdn.pixabay.com/photo/2018/01/09/03/49/the-natural-scenery-3070808_1280.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>
			</div>
		</div>
		<!--cards -->


		<div class="card">

			<div class="image">
				<img
					src="https://cdn.pixabay.com/photo/2015/11/07/11/41/lake-1031405_1280.jpg">
			</div>
			<div class="title">
				<h1>Write title Here</h1>
			</div>
			<div class="des">
				<p>You can Add Desccription Here...</p>
				<button>Read More...</button>
			</div>
		</div>
	</div>
</body>
</html>