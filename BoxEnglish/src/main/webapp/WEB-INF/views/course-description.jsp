<%--
  Created by IntelliJ IDEA.
  User: Nghia
  Date: 11/29/2021
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .div {
            display: block;
        }
    </style>
    <jsp:include page="header.jsp"></jsp:include>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
    <!-- Box icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <title>Khoá Học</title>

</head>
<body>
<jsp:include page="header-general.jsp" />

<div class="row">
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
    	<div class="row">
    		<div class="alert-page-list-all-course">

			</div>
    	</div>
        <div class="row">
            <div class="col-sm-3">
                <img width="100%" height="100%" src='<c:url value="/resources/img/${category.image}"/>'/>
            </div>
            <div class="col-sm-6">
                <h3>${category.title}</h3>
                <span>${category.description}</span>
            </div>
        </div>
        <div>
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <button><a href="${pageContext.request.contextPath }/course/${category.id }" style=" text-decoration: none; color: #000000;" onclick="addCourse(event, ${category.id})">Thêm khóa học</a></button>
                    <button style="color: #000000" ><a href="${pageContext.request.contextPath }/voca/getVocaByCourseIdAllCourse/${category.id }" style=" text-decoration: none; color: #000000;">Xem chi tiết</a> </button>
                </div>
            </div>
        </div>

        <input id="course_id" type="hidden" value=${category.id}>
        <input id="parent" type="hidden" value=0 >
        <br/>
        <jsp:include page="comment.jsp" />
    </div>
    <div class="col-sm-2"></div>


</div>

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
