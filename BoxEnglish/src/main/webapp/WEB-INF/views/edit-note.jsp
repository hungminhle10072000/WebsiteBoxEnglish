<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="header.jsp"></jsp:include>
	<meta charset="utf-8">
	<!-- Favicon -->
 	<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
 	<!-- Box icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
	<title>Chỉnh sửa ghi chú</title>
</head>
<body>
	<header id="home" class="header">
		<nav class="nav">
			<div class="navigation container">
				<div class="logo">
					<a href=""><img alt="anhlogo" src='<c:url value="/resources/img/logo.jpg" />'/></a>
				</div>
				
				<div class="menu">
					<div class="top-nav">
						<div class="logo">
							<a href=""><img alt="anhlogo" src='<c:url value="/resources/img/logo.jpg" />'/></a>
						</div>
						<div class="close">
							<i class="bx bx-x"></i>
						</div>
					</div> 
					<ul class="nav-list">
						<li class="nav-item">
				             <a href="${pageContext.request.contextPath }/" class="nav-link scroll-link">Trang chủ</a>
			            </li>
			            <li class="nav-item">
			              <a href="#" class="nav-link">Khóa học của tôi</a>
			            </li>
			            <li class="nav-item">
			              <a href="#" class="nav-link scroll-link">Danh sách khóa học</a>
			            </li>
		             	<li class="nav-item">
			              	<a href="${pageContext.request.contextPath }/note/" class="nav-link scroll-link">Ghi chú</a>
			            </li>
					</ul>
				</div>
				
				<div class="container-user-setting">
					<a href="#" class="user-icon">
       	        		<i class='bx bx-user-circle'></i>
		        	</a>
		        	<div class="setting-user">
		        		<div class="setting-user-item">
		        			<i class='bx bxs-edit-alt'></i> <span>Cập nhật thông tin</span>
		        		</div>
		        		<div class="setting-user-item">
		        			<i class='bx bxs-log-out' ></i> <span>Đăng xuất</span>
		        		</div>
		        	</div>
				</div>
				
		       
		        <div class="hamburger">
		          	<i class="bx bx-menu"></i>
		        </div>
	
			</div>
		</nav>
	</header>
	<main>
		<c:if test="${message != null}">
			<div id="alertPageSuccess" class="alert alert-success collapse alert-page">
				<a id="linkClose" href="#" class="close" style="margin-left: 10px; margin-right: 2px">&times;</a> 
				<strong>${message }</strong>
			</div>
		</c:if>
		<div class="container-fluid">			
			<div class="row">
				<div class="col-md-4">
					<h3>Chỉnh sửa ghi chú</h3>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<form:form action="" modelAttribute="noteEdit" method="post">
						<div style="margin-top: 5px">
							<label>Tên ghi chú:</label> <br >
							<form:input path="title"/>
						</div>
						<div style="margin-top: 5px; margin-bottom: 5px">
							<label>Mô tả:</label> <br />
							<form:textarea path="description" rows="3" cols="40"/>
						</div>
						<div style="margin-top: 5px; margin-bottom: 5px">
							<label>Ảnh mô tả:</label> <br />
							<form:input path="fileImage" type="file" accept="image/*"/>
						</div>
						<div>
							<c:if test="${noteEdit.image != null}">
								<img alt="Ảnh mô tả" src='<c:url value="/resources/img/${noteEdit.image }" />' style="height: 250px; width: 250px"/>
							</c:if>
						</div>
						<div style="margin-top: 10px; margin-bottom: 10px">
							<button class="btn btn-success">Cập nhật</button>
							<button class="btn btn-warning" type="reset">Reset</button>
						</div>	
					</form:form>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>