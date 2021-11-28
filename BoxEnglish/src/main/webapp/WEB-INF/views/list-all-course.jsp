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
	<title>Danh sách khóa học</title>
</head>
<body>
	<jsp:include page="header-general.jsp" />
		<main>
			<div class="container-fluid">			
				<div class="row">
					<div class="col-md-12 d-flex justify-content-center">
						<h2>Tất cả khóa học</h2>
					</div>
				</div>
				<hr style="width: 100%; border: 1px solid #cdbbbb;">
				<div class="alert-page-list-all-course">
					
				</div>
				
				<!--display all course-->
				<div class="row mt-3 pb-3">
					<%-- <div class="col-md-3 mt-3">
						<div class="card" style="width: 100%;">
						  <img class="card-img-top img-fluid" src='<c:url value="/resources/img/${f.image }" />' alt="Ảnh ghi chú" style="height: 250px">
						  <div class="card-body">
						    <h4 class="card-title">Hello</h4>
						    <a href="${pageContext.request.contextPath }/note/detail/${f.id }" class="btn btn-success">Thêm khóa học</a>
						  </div>
						</div>
					</div> --%>
					<c:forEach var="f" items="${listAllCourse }">				
							<div class="col-md-3 mt-3">
								<div class="card" style="width: 100%;">
								  <img class="card-img-top img-fluid" src='<c:url value="/resources/img/${f.image }" />' alt="Ảnh ghi chú" style="height: 250px">
								  <div class="card-body">
								    <h4 class="card-title">${f.title }</h4>
							        <a href="${pageContext.request.contextPath }/note/detail/${f.id }" class="btn btn-success">Thêm khóa học</a>
								  </div>
								</div>
							</div>
					</c:forEach>
				</div>		
			</div>
		</main>	
	<jsp:include page="footer.jsp" />
</body>
</html>