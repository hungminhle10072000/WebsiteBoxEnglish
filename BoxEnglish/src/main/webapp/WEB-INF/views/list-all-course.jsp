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
					<c:forEach var="f" items="${listAllCourse }">				
							<div class="col-md-3 mt-3">
								<div class="card" style="width: 100%;">
								  <img class="card-img-top img-fluid" src='<c:url value="/resources/img/${f.image }" />' alt="Ảnh ghi chú" style="height: 250px">
								  <div class="card-body">
								    <h4 class="card-title">${f.title }</h4>
							        <a href="${pageContext.request.contextPath }/course/${f.id }" class="btn btn-success" onclick="addCourse(event, ${f.id})">Thêm khóa học</a>
								  </div>
								</div>
							</div>
					</c:forEach>
				</div>		
			</div>
		</main>	
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		function addCourse(event, idCourse) {
		    event.preventDefault()
		    $.ajax({
                type: "POST",
                url: '${pageContext.request.contextPath }/course/addCourse/' + idCourse,
                contentType: false,
                dataType:"text",
                success: function (data) {
                	$(".alert-page-list-all-course").html('<div class="alert alert-warning" role="alert">' +data+ '</div>')
					window.scrollTo({ top: 0, behavior: 'smooth' });
                },
                error: function (data) {
                	$(".alert-page-list-all-course").html('<div class="alert alert-danger" role="alert"> Thêm khóa học thất bại !!! </div>')
					window.scrollTo({ top: 0, behavior: 'smooth' });
                }
        	});		
		}
	</script>
</body>
</html>