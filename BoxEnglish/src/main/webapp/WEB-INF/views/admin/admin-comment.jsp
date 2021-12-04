<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/resources/admin" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản lí bình luận</title>
<!-- BOOTSTRAP STYLES-->
<link href="${url}/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="${url}/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->

<!-- CUSTOM STYLES-->
<link href="${url}/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- TABLE STYLES-->
<link href="${url}/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">

		<jsp:include page="nav-bar.jsp"></jsp:include>

		<!-- /. NAV TOP  -->
		<jsp:include page="slide-bar.jsp"></jsp:include>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row" style="margin-bottom: 5px">
					<div class="col-md-12">
						<h2>Quản lý bình luận</h2>
						<button class="btn btn-info"><a href="${pageContext.request.contextPath }/admin/comment/" style=" text-decoration: none; color: white;">Làm mới</a></button>
					</div>	
				</div>
				<c:if test="${message != null }">
					<div class="alert alert-danger" role="alert">${message }</div>
				</c:if>
				<c:if test="${messageSuccess != null }">
					<div class="alert alert-success" role="alert">${messageSuccess }</div>
				</c:if>	
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">Danh sách bình luận</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Họ tên</th>
												<th>Nội dung</th>
												<th>Khóa học</th>
												<th>Ngày</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listAllComment}" var="comment">
												<tr>
											      <td scope="row">${comment.user.fullname }</td>
											      <td>${comment.content }</td>
											      <td>${comment.cate.title }</td>
											      <td>${comment.createDate }</td>
											      <td>
											      	<button class="btn btn-danger btn-delete-admin-acount" id-course="${course.id }" style="margin-bottom: 5px"><a href="${pageContext.request.contextPath }/admin/comment/delete/${comment.id }" style=" text-decoration: none; color: white;">Xóa</a></button>
											      </td>
									    		</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
						</div>
						<!--End Advanced Tables -->
					</div>
				</div>
				<!-- /. ROW  -->
			</div>
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="${url}/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="${url}/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="${url}/js/jquery.metisMenu.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="${url}/js/dataTables/jquery.dataTables.js"></script>
	<script src="${url}/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>
</body>
</html>
