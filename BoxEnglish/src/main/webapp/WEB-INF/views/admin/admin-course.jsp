<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/resources/admin" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản lí khóa học</title>
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
				<div class="row">
					<div class="col-md-12">
						<h2>Quản lý khóa học</h2>
						<button class="btn btn-success" type="button"><a href="${pageContext.request.contextPath }/admin/course/addCourse" style=" text-decoration: none; color: white;">Thêm khóa học</a></button>
					</div>	
				</div>
				<div class="alert-page-admin-course" style="margin-top: 10px">
				
				</div>	
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">Danh sách khóa học</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID</th>
												<th>Ảnh mô tả</th>
												<th>Tiêu đề</th>
												<th>Ngày tạo</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listAllCourse}" var="course">
												<tr>
											      <td scope="row">${course.id }</td>
											      <td>
											      	<img alt="Ảnh đại diện" src='<c:url value="/resources/img/${course.image }"/>' style="width: 150px; height: 150px"/>
											      </td>
											      <td>${course.title }</td>
											      <td>${course.createDate }</td>
											      <td>
											      	<button class="btn btn-warning" type="button" style="margin-bottom: 5px"><a href="${pageContext.request.contextPath }/admin/course/editCourse/${course.id}" style=" text-decoration: none; color: white;">Chỉnh sửa</a></button>
											      	<button class="btn btn-danger btn-delete-admin-acount" id-course="${course.id }" style="margin-bottom: 5px">Xóa</button>
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
			
			$(".btn-delete-admin-acount").click(function() {
				var currentRow= $(this).closest("tr");
				 var checkConfirm = confirm("Bạn chắc chắn muốn xóa !!!!");
				    if (checkConfirm == true){
				    	let idCourse = $(this).attr("id-course")
				    	$.ajax({
			                type: "DELETE",
			                url: '${pageContext.request.contextPath }/admin/course/delete/' + idCourse,
			                success: function (data) {
			                	$(".alert-page-admin-course").html('<div class="alert alert-warning" role="alert"> Xóa thành công !!! </div>')
								window.scrollTo({ top: 0, behavior: 'smooth' });
			                    currentRow.remove();
			                },
			                error: function (data) {
			                	$(".alert-page-admin-course").html('<div class="alert alert-danger" role="alert"> Xóa thất bại !!! </div>')
								window.scrollTo({ top: 0, behavior: 'smooth' });
			                }
			        	});
				    }
				    else {
						
					}
			})
		});
	</script>
	<!-- CUSTOM SCRIPTS -->
	<script src="${url}/js/custom.js"></script>

</body>
</html>