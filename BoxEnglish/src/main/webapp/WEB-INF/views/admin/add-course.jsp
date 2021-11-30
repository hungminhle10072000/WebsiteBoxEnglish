<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url value="/resources/admin" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Thêm khóa học</title>
<!-- BOOTSTRAP STYLES-->
<link href="${url}/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="${url}/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="${url}/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<jsp:include page="nav-bar.jsp"></jsp:include>
		<!-- /. NAV TOP  -->
		<jsp:include page="slide-bar.jsp"></jsp:include>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Thêm khóa học</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<c:if test="${message != null }">
					<div class="alert alert-danger" role="alert">${message }</div>
				</c:if>
				<c:if test="${messageSuccess != null }">
					<div class="alert alert-success" role="alert">${messageSuccess }</div>
				</c:if>
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading"></div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form:form role="form" action="" method="post" enctype="multipart/form-data" modelAttribute="courseAddEntity">
											<div class="form-group">
									            <label for=fileImage class="col-form-label">Ảnh mô tả:</label>
									            <form:input path="fileImage" type="file" accept="image/*" required="required"/>
									         </div>
											<div class="form-group">
									            <label for="title" class="col-form-label">Tiêu đề:</label>
									            <form:textarea class="form-control" path="title" rows = "5" cols = "30" required="required"/>
									         </div>    
											<div>
												<button class="btn btn-success" type="submit">Thêm</button>
												<button class="btn btn-warning ml-2" type="reset">Reset</button>
												<button class="btn btn-danger ml-2" type="button"><a href="${pageContext.request.contextPath }/admin/course/" style=" text-decoration: none; color: white;">Quay lại</a></button>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
						<!-- End Form Elements -->
					</div>
				</div>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="${url}/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="${url}/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="${url}/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>

</body>
</html>