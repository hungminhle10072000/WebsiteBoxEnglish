<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/resources/admin" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Danh sách từ vựng bài : ${courseDetail.title }</title>
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
						<h2>Danh sách từ vựng bài : ${courseDetail.title }</h2>
						<button class="btn btn-success" type="button"><a href="${pageContext.request.contextPath }/admin/course/detail/addVoca/${idCourse}" style=" text-decoration: none; color: white;">Thêm từ mới</a></button>
						<button class="btn btn-info"><a href="${pageContext.request.contextPath }/admin/course/detail/${idCourse}" style=" text-decoration: none; color: white;">Làm mới</a></button>
					</div>	
				</div>
				<div class="alert-page-admin-course-voca" style="margin-top: 10px">
				
				</div>	
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">Danh sách từ vựng</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID</th>
												<th>Ảnh mô tả</th>
												<th>File nghe</th>
												<th>Nội dung</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listAllVocaCourse}" var="voca">
												<tr>
											      <td scope="row">${voca.id }</td>
											      <td>
											      	<img alt="Ảnh mô tả" src='<c:url value="/resources/img/${voca.image_vocabulary }"/>' style="width: 150px; height: 150px"/>
											      </td>
											      <td>
											      	<audio controls>
											      		<source src='<c:url value="/resources/audio/${voca.audio_vocabulary }" />' type="audio/mp3">
													</audio>
											      </td>
											      <td>
										      		<div>
										      			<span style="color: #004FFB; font-weight: bold">${voca.vocabulary }</span> <br/>
										      			<span style="color: #000000; font-weight: bold">Giải thích: </span><span>${voca.explain_vocabulary }</span><br>
										      			<span style="color: #000000; font-weight: bold">Từ loại: </span><span>${voca.mean_vocabulary }</span><br>
										      			<span style="color: #000000; font-weight: bold">Ví dụ: </span><span>${voca.mean_vocabulary }</span><br>
										      			<span style="color: #000000; font-weight: bold">${voca.mean_example_vocabulary }</span>
										      		</div>
											      </td>
											      <td>
											      	<button class="btn btn-warning" type="button" style="margin-bottom: 5px"><a href="${pageContext.request.contextPath }/admin/course/detail/edit/${idCourse}/${voca.id}" style=" text-decoration: none; color: white;">Chỉnh sửa</a></button>
											      	<br><button class="btn btn-danger btn-delete-admin-course-voca" id-voca="${voca.id }" style="margin-bottom: 5px">Xóa</button>
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
			
			$(".btn-delete-admin-course-voca").click(function() {
				var currentRow= $(this).closest("tr");
				 var checkConfirm = confirm("Bạn chắc chắn muốn xóa !!!!");
				    if (checkConfirm == true){
				    	let idVoca = $(this).attr("id-voca")
				    	$.ajax({
			                type: "DELETE",
			                url: '${pageContext.request.contextPath }/admin/course/deleteVoca/' + idVoca,
			                success: function (data) {
			                	$(".alert-page-admin-course-voca").html('<div class="alert alert-warning" role="alert"> Xóa thành công !!! </div>')
								window.scrollTo({ top: 0, behavior: 'smooth' });
			                    currentRow.remove();
			                },
			                error: function (data) {
			                	$(".alert-page-admin-course-voca").html('<div class="alert alert-danger" role="alert"> Xóa thất bại !!! </div>')
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