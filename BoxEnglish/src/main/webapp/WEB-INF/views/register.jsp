<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registation Form * Form Tutorial</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="register-form mt-3">
        <form:form class="panel-body" method="post" enctype="multipart/form-data" modelAttribute="userAddEntity">
            <div class="panel-heading">
                <h2 class="text-center">Đăng ký tài khoản</h2>
            </div>
            <c:if test="${message != null }">
				<div class="alert alert-danger" role="alert">${message }</div>
			</c:if>
			<c:if test="${messageSuccess != null }">
				<div class="alert alert-success" role="alert">${messageSuccess }</div>
			</c:if>
			<form:hidden path = "role" value="0"/>
			<div class="form-group">
	            <label for=fileAvatar class="col-form-label">Ảnh đại diện:</label> <br>
	            <form:input path="fileAvatar" type="file" accept="image/*" required="required"/>
	         </div>
			<div class="form-group">
	            <label for="fullname" class="col-form-label">Họ tên:</label>
	            <form:input class="form-control" path="fullname" type="text" required="required"/>
	         </div>
	         <div class="form-group">
	            <label for="username" class="col-form-label">Tên đăng nhập:</label>
	            <form:input class="form-control" path="username" type="text" required="required"/>
	         </div>
	          <div class="form-group">
	            <label for="password" class="col-form-label">Mật khẩu:</label>
	            <form:input class="form-control" path="password" type="password" required="required" minlength="6"/>
	         </div>
	          <div class="form-group">
	            <label for="repeat-password" class="col-form-label">Nhập lại mật khẩu:</label>
	            <input class="form-control" name="repeat-password" type="password" required="required" minlength="6"/>
	         </div>
	         <div class="form-group">
	            <label for="email" class="col-form-label">Email:</label>
	            <form:input class="form-control" path="email" type="email" required="required"/>
	         </div> 
            <button type="submit" class="btn btn-success" id="btnRegister" style="margin-bottom: 10px">Đăng ký</button>
            <button class="btn btn-danger" style="margin-bottom: 10px" type="button"><a href="${pageContext.request.contextPath }/register/" style=" text-decoration: none; color: white;">Reset</a></button>
            <button class="btn btn-warning" style="margin-bottom: 10px" onclick="document.location='${pageContext.request.contextPath}/'">Quay lại</button>
        </form:form>
    </div>
</div>
</body>
</html>
