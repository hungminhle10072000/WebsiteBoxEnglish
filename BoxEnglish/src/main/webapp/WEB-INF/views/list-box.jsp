<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Title</title>
<jsp:include page="header.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" href="./images/favicon.ico"
	type="image/x-icon">
<!-- Box icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<title>Trang chủ</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Inconsolata);
/* body{
    margin: 0;
    padding:0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    font-family: 'Poppins',sans-serif;


} */
.container1 {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.container1 .box {
	position: relative;
	width: 300px;
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
.container1 .box:before {
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
.container1 .box .icon {
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
.container1 .box:nth-child(1) .icon {
	box-shadow: 0 0 0 0 #e91e63;
	background: #e91e63;
}

.container1 .box:nth-child(1):hover .icon {
	box-shadow: 0 0 0 400px #e91e63;
}

.container1 .box:nth-child(2) .icon {
	box-shadow: 0 0 0 0 #23e629;
	background: #23e629;
}

.container1 .box:nth-child(2):hover .icon {
	box-shadow: 0 0 0 400px #23e629;
}

.container1 .box:nth-child(3) .icon {
	box-shadow: 0 0 0 0 #2196f3;
	background: #2196f3;
}

.container1 .box:nth-child(3):hover .icon {
	box-shadow: 0 0 0 400px #2196f3;
}

/* oooooooooooooooooooo nhan doi cach biet */
.container1 .box:nth-child(4) .icon {
	box-shadow: 0 0 0 0 #b5c5ff;
	background: #b5c5ff;
}

.container1 .box:nth-child(4):hover .icon {
	box-shadow: 0 0 0 400px #b5c5ff;
}

.container1 .box:nth-child(5) .icon {
	box-shadow: 0 0 0 0 #f1c232;
	background: #f1c232;
}

.container1 .box:nth-child(5):hover .icon {
	box-shadow: 0 0 0 400px #f1c232;
}

.container1 .box:nth-child(6) .icon {
	box-shadow: 0 0 0 0 #b45f06;
	background: #b45f06;
}

.container1 .box:nth-child(6):hover .icon {
	box-shadow: 0 0 0 400px #b45f06;
}

/* đến đay là đã hoàn thành box và đưa chuột vô thì màu trên toàn bộ box */
/* /////////////////////////////////////////////////////// */
.container1 .box .content {
	position: relative;
	z-index: 1;
	transition: 0.5s;
}

/* dua chuot vao thi chu chuyen mau trang */
.container1 .box:hover .content {
	color: #fff;
}

.container1 .box .content h3 {
	font-size: 20px;
	margin: 10px 0;
	padding: 0;
}

.container1 .box .content p {
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

</head>
<body>
	<jsp:include page="header-general.jsp" />
	<main>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3">
					<div class="card avatar-card" style="width:100%">
						<h4 class="card-title style-card-title">${user.fullname}</h4>
						<img class="card-img-top card-img-left" src='<c:url value="/resources/img/${user.avatar}" />' alt="Avartar">
						<div class="card-body container-wordlearned">
							<span>${numOfBox6}</span>
							<span>từ đã học.</span>
						</div>
					</div>
					<br/>
					<br/>
					<div class="container">
						<form method="get" action="${pageContext.request.contextPath }/api/practice/getVocaForPractice">
							<button type="submit" style="border-radius: 12px; background-color: #e7e7e7; width: 300px; height: 80px; font-size: 24px;">Luyện Tập Từ Vựng</button>
						</form>
					</div>
				</div>
				<div class="col-sm-9">
					<div class="container1">
						<div class="box">
							<div class="icon">01</div>
							<div class="content">
								<h3>(${numOfBox1})</h3>
								<a href="${pageContext.request.contextPath }/getVocaInBox/1">Chi tiết</a>
							</div>
						</div>

						<div class="box">
							<div class="icon">02</div>
							<div class="content">
								<h3>(${numOfBox2})</h3>
								<a href="${pageContext.request.contextPath }/getVocaInBox/2">Chi tiết</a>
							</div>
						</div>

						<div class="box">
							<div class="icon">03</div>
							<div class="content">
								<h3>(${numOfBox3})</h3>
								<a href="${pageContext.request.contextPath }/getVocaInBox/3">Chi tiết</a>
							</div>
						</div>

						<div class="box">
							<div class="icon">04</div>
							<div class="content">
								<h3>(${numOfBox4})</h3>
								<a href="${pageContext.request.contextPath }/getVocaInBox/4">Chi tiết</a>
							</div>
						</div>

						<div class="box">
							<div class="icon">05</div>
							<div class="content">
								<h3>(${numOfBox5})</h3>
								<a href="${pageContext.request.contextPath }/getVocaInBox/5">Chi tiết</a>
							</div>
						</div>

						<div class="box">
							<div class="icon">06</div>
							<div class="content">
								<h3>(${numOfBox6})</h3>
								<a href="${pageContext.request.contextPath }/getVocaInBox/6">Chi tiết</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<div class="container"></div>

</body>
</html>