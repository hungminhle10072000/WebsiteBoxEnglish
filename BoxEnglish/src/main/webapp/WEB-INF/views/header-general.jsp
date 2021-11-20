<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src='<c:url value = "/resources/JS/jquery-3.6.0.js" />'></script>
<!DOCTYPE html>
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
	        		<div class="setting-user-item setting-edit-info">
	        			<i class='bx bxs-edit-alt'></i> <span>Cập nhật thông tin</span>
	        		</div>
	        		<div class="setting-user-item setting-logout">
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
<script type="text/javascript">
	$( ".setting-edit-info" ).on( "click", function() {
		 let editInfoPage = "${pageContext.request.contextPath }/edit-info-user";
	     window.location.href = editInfoPage;
	});
	$( ".setting-logout" ).on( "click", function() {
		let urlLogout = "${pageContext.request.contextPath }/user/logout";
	    window.location.href = urlLogout;
	});
</script>