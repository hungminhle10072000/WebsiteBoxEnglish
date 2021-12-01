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
<title>Chỉnh sửa từ</title>
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
						<h2>Chỉnh sửa từ</h2>
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
										<form:form role="form" action="" method="post" enctype="multipart/form-data" modelAttribute="vocabularyEditEntity">
											<form:hidden path = "id" />
											<form:hidden path = "image_vocabulary"/>
											<form:hidden path = "audio_vocabulary"/>
											<div class="form-group">
									            <label for="fileImage" class="col-form-label">Ảnh mô tả:</label>
									            <form:input onchange="setFileImage(event)" path="fileImage" type="file" accept="image/*" value="null"/>
									         </div>
									         <div class="form-group group-file-image">
    											<img alt="Ảnh mô tả" src="<c:url value="/resources/img/${vocabularyEditEntity.image_vocabulary }" />" style="width: 200px; height: 200px">					            
									         </div>
									         <div class="form-group">
									            <label for="fileAudio" class="col-form-label">File nghe:</label>
									            <form:input onchange="setFileAudio(event)" path="fileAudio" type="file" accept="audio/*"  value="null"/>
									         </div>
									         <div class="form-group group-file-audio">
    											<audio controls>
											      	<source src='<c:url value="/resources/audio/${vocabularyEditEntity.audio_vocabulary }" />' type="audio/mp3">
												</audio>         
									         </div>
											<div class="form-group">
									            <label for="vocabulary" class="col-form-label">Từ vựng:</label>
									            <form:input class="form-control" path="vocabulary" type="text" required="required"/>
									         </div>
									         <div class="form-group">
									            <label for="explain_vocabulary" class="col-form-label">Giải thích:</label>
									            <form:textarea rows = "5" cols = "30" class="form-control" path="explain_vocabulary" type="text" required="required"/>
									         </div>
									          <div class="form-group">
									            <label for="mean_vocabulary" class="col-form-label">Từ loại:</label>
									            <form:input class="form-control" path="mean_vocabulary" type="text" required="required"/>
									         </div>
									          <div class="form-group">
									            <label for="example_vocabulary" class="col-form-label">Ví dụ:</label>
									            <form:textarea rows = "5" cols = "30" path="example_vocabulary" class="form-control" name="example_vocabulary" type="text" required="required"/>
									         </div>
									         <div class="form-group">
									            <label for="mean_example_vocabulary" class="col-form-label">Nghĩa ví dụ:</label>
									            <form:textarea class="form-control" rows = "5" cols = "30" path="mean_example_vocabulary" type="text" required="required"/>
									         </div>
											<div>
												<button class="btn btn-success" type="submit">Cập nhật</button>
												<button class="btn btn-warning" type="button"><a href="${pageContext.request.contextPath }/admin/course/detail/edit/${idCourse}/${vocabularyEditEntity.id}" style=" text-decoration: none; color: white;">Reset</a></button>
												<button class="btn btn-danger ml-2" type="button"><a href="${pageContext.request.contextPath }/admin/course/detail/${idCourse}" style=" text-decoration: none; color: white;">Quay lại</a></button>
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
	<script type="text/javascript">
		function setFileImage(event) {
			$('.group-file-image').css('display', 'none');
		}
		function setFileAudio(event) {
			$('.group-file-audio').css('display', 'none');
		} 
	</script>
</body>
</html>