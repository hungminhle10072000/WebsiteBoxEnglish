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
						      <form:form action="${pageContext.request.contextPath }/note/add"
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
			
			<!--display note-->
			<div class="row mt-3 pb-3">
				<c:forEach var="f" items="${noteList }">				
						<div class="col-md-3 mt-3">
							<div class="card" style="width: 100%;">
							  <img class="card-img-top img-fluid" src='<c:url value="/resources/img/${f.image }" />' alt="Ảnh ghi chú" style="height: 250px">
							  <div class="card-body">
							    <h4 class="card-title">${f.title }</h4>
							    <p class="card-text">${f.description }</p>
						        <p class="card-text"><span style="color: #f70000">Ngày tạo:</span>  <fmt:formatDate pattern = "dd/MM/yyyy" value = "${f.createDate }" /></p>
							    <a href="#" class="btn btn-primary">Chi tiết</a>
							    <a href="${pageContext.request.contextPath }/note/edit/${f.id }" class="btn btn-warning">Chỉnh sửa</a>
							    <a href="${pageContext.request.contextPath }/note/delete/${f.id }" class="btn btn-danger">Xóa</a>
							  </div>
							</div>
						</div>
					
				</c:forEach>
			</div>			
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>