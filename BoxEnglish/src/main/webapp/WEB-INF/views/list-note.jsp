<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="header.jsp"></jsp:include>
	<meta charset="utf-8">
	<!-- Favicon -->
 	<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
 	<!-- Box icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
	<title>Danh sách ghi chú</title>
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
				             <a href="/BoxEnglish/" class="nav-link scroll-link">Trang chủ</a>
			            </li>
			            <li class="nav-item">
			              <a href="#" class="nav-link">Khóa học của tôi</a>
			            </li>
			            <li class="nav-item">
			              <a href="#" class="nav-link scroll-link">Danh sách khóa học</a>
			            </li>
		             	<li class="nav-item">
			              	<a href="" class="nav-link scroll-link">Ghi chú</a>
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
	<main class="container-main">
		<div class="container-fluid">			
			<div class="row">
				<div class="col-md-4">
					<h3>Danh sách ghi chú</h3>
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Tạo ghi chú mới</button>
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  
					  <!-- start modal  -->
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Thêm ghi chú</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
						      <form:form action="add"
										method="post" enctype="multipart/form-data" modelAttribute="noteEntity">
						          <div class="form-group">
						            <label for="title" class="col-form-label">Tên ghi chú:</label>
						            <form:input class="form-control" path="title" type="text" required="required"/>
						          </div>
						          <div class="form-group">
						            <label for="description" class="col-form-label">Mô tả:</label>
						            <form:textarea class="form-control" path="description" rows="3" cols="40" required="required"/>
	
						          </div>
						          <div class="form-group">
						            <label for="message-text" class="col-form-label">Ảnh mô tả:</label> <br />
						             <form:input accept="image/*" path="fileImage" type="file" required="required"/>
						          </div>
						          <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
						          <button type="submit" class="btn btn-primary">Thêm</button>
						        </form:form>
					      </div>
					    </div>
					  </div>
					  <!--end modal  -->
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Footer -->
	<footer class="page-footer font-small special-color-dark pt-4 footer-design">
	
	  <!-- Footer Elements -->
	  <div class="container">
	  		<div class="row">
	  			<div class="col-12">
	  					<!-- Social buttons -->
					    <ul class="list-unstyled list-inline text-center">
					      <li class="list-inline-item">
					        <a class="btn-floating btn-fb mx-1">
					          <i class="fab fa-facebook-f"> </i>
					        </a>
					      </li>
					      <li class="list-inline-item">
					        <a class="btn-floating btn-tw mx-1">
					          <i class="fab fa-twitter"> </i>
					        </a>
					      </li>
					      <li class="list-inline-item">
					        <a class="btn-floating btn-gplus mx-1">
					          <i class="fab fa-google-plus-g"> </i>
					        </a>
					      </li>
					      <li class="list-inline-item">
					        <a class="btn-floating btn-li mx-1">
					          <i class="fab fa-linkedin-in"> </i>
					        </a>
					      </li>
					      <li class="list-inline-item">
					        <a class="btn-floating btn-dribbble mx-1">
					          <i class="fab fa-dribbble"> </i>
					        </a>
					      </li>
					    </ul>
					    <!-- Social buttons -->
	  			</div>
	  		</div>
	  </div>
	  <!-- Footer Elements -->	
	</footer>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>