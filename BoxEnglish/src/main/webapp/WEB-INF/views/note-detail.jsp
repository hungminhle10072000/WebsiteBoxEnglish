<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="header.jsp"></jsp:include>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
	<!-- Favicon -->
 	<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
 	<!-- Box icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
	<title>Danh sách chi tiết</title>
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
		<div class="container-fluid">			
			<div class="row">
				<div class="col-md-12 d-flex justify-content-center">
					<h2>Danh sách chi tiết</h2>
				</div>
			</div>
			<hr style="width: 100%; border: 1px solid #cdbbbb;">
			<div class="row">
				<div class="col-md-12 table-responsive" style="overflow: hidden;">
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">Nội dung</th>
					      <th scope="col">Dịch nghĩa</th>
					      <th scope="col">File nghe</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="f" items="${listVocanote }">
					  		 <tr class="row-item-word">
							  <td><i class="fas fa-minus" id-note-detail="${f.id }"></i></td>	
						      <td>${f.vocabulary }</td>
						      <td>${f.mean_vocabulary }</td>
						      <td>${f.audio_vocabulary }</td>
						    </tr>
					  	</c:forEach>
					    <tr class="row-add-word">
					    	<td style="width: 115px"><i class="fas fa-plus"></i></td>
					    	<td><input type="text"></td>
					    	<td><input type="text"></td>
					    	<td>
					    		<button class="btn btn-secondary"><label for="upload-audio" class="label-upload-audio">Upload</label></button>
					    		<span id="labelNameFile"></span>
					    		<input type="file" id="upload-audio" accept="audio/*" onchange="setNameFile(event)"/>
					    	</td>
					    </tr>
					  </tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="group-button-note-detail col-md-2 offset-10">
					<button class="btn btn-success" onclick="window.location.reload()">Làm mới</button>
					<button class="btn btn-warning"><a href="${pageContext.request.contextPath }/note/" style=" text-decoration: none; color: white;">Quay lại</a></button>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		function setNameFile(event) {
			var filename = event.target.files[0].name;
			$( document ).ready(function() {
				var labelName = document.getElementById('labelNameFile');
				$(labelName).text(filename);
			});
		}
	</script>
</body>
</html>