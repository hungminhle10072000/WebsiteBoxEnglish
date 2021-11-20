<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="header.jsp"></jsp:include>
	<meta charset="utf-8">
	<!-- Favicon -->
 	<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
 	<!-- Box icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
	<title>Chỉnh sửa thông tin cá nhân</title>
</head>
<body>
	<jsp:include page="header-general.jsp" />
	<main>
		<div class="container-fluid">
			<h3>Cập nhật thông tin</h3>
			<div class="alert-page-edit-info">
				
			</div>	
			<div class="row">
				<form:form action="${pageContext.request.contextPath }/note/update/${noteEdit.id }" method="post" modelAttribute="user" enctype="multipart/form-data" id="form-edit-note">
					<div class="col-md-12">
						<img src='<c:url value="/resources/img/avatarronaldo.jpg" />' alt="Avartar" class="img-avatar-edit-info"/>
						<button type="button" class="btn btn-secondary"><label for="upload-update-image" class="label-upload-image_update">Upload</label></button>
			    		<span id="labelNameFile"></span>
			    		<input type="file" id="upload-update-image" accept="image/*" class="file_image_update" onchange="setNameFile(event)" />
					</div>
					<div style="margin-top: 10px">
						<label style="font-weight: 500">Họ tên:</label> <br >
						<form:input path="fullname" required="required" style="width:100%"/>
					</div>
					<div style="margin-top: 10px">
						<label style="font-weight: 500">Tên đăng nhập:</label> <br >
						<form:input path="username" required="required" style="width:100%"/>
					</div>
					<div style="margin-top: 10px; margin-bottom: 10px" class="group-button-editForm">
						<button class="btn btn-success" type="button">Cập nhật</button>
						<button class="btn btn-warning ml-2" type="reset" onclick="resetPage()">Reset</button>
						<button class="btn btn-danger ml-2" onclick="openFormChangePassWord(event)">Đổi mật khẩu</button>
					</div>
					<div style="margin-top: 20px; display: none" class="form-change-password">
						<label style="font-weight: 500;  margin-top: 10px">Mật khẩu hiện tại:</label> <br >
						<input id="passwordOld" required type="password" style="width:100%;"/> <br />
						
						<label style="font-weight: 500;  margin-top: 10px">Mật khẩu mới:</label> <br >
						<input id="passwordNew" type="password" required style="width:100%;"/> <br />
						
						<label style="font-weight: 500;  margin-top: 10px">Nhập lại mật khẩu mới:</label> <br >
						<input id="repeatPasswordNew" type="password" required style="width:100%;"/> <br />
						
						<div style="margin-top: 10px">
							<button class="btn btn-info" onclick="handleUpdatePassword(event)">Lưu mật khẩu mới</button>
							<button class="btn btn-secondary" onclick="closeFormChangePassWord(event)">Đóng</button>
						</div>
					</div>	
				</form:form>
			</div>
		</div>	
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		function handleUpdatePassword(event){
			event.preventDefault()
			$(document ).ready(function() {
				let passwordOld = $("#passwordOld").val()
				if(passwordOld === ''){
					$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">Yêu cầu nhập mật khẩu hiện tại !!!</div>')
					window.scrollTo({ top: 0, behavior: 'smooth' });
					return;
				}
				let passwordNew = $("#passwordNew").val()
				if(passwordNew === ''){
					$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">Yêu cầu nhập mật khẩu mới !!!</div>')
					window.scrollTo({ top: 0, behavior: 'smooth' });
					return;
				}
				let repeatPasswordNew = $("#repeatPasswordNew").val()
				if(repeatPasswordNew === ''){
					$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">Yêu cầu nhập lại mật khẩu mới !!!</div>')
					window.scrollTo({ top: 0, behavior: 'smooth' });
					return;
				}
				if(!(passwordNew === repeatPasswordNew)){
					$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">Mật khẩu nhập lại không khớp !!!</div>')
					window.scrollTo({ top: 0, behavior: 'smooth' });
					return;
				}
				$(".alert-page-edit-info").html('')	
				$.ajax({
					type: "POST",
		            url: "${pageContext.request.contextPath }/user/changePassword",
		            dataType:"text", // dữ liệu trả về dạng text
		            data : { 
		            	passwordOld : passwordOld,
		            	passwordNew: passwordNew
		            },
		            success: function (data) {
		            	$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">' + data + '</div>')
						window.scrollTo({ top: 0, behavior: 'smooth' });
		            },
		            error: function (res) {
		            	$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">' + res.responseText + '</div>')
						window.scrollTo({ top: 0, behavior: 'smooth' });
		            }
				})
			})	
		}
	
		function resetPage(){
			let editInfoPage = "${pageContext.request.contextPath }/edit-info-user";
		    window.location.href = editInfoPage;
		}	
		
		function setNameFile(event) {
			event.preventDefault()
			file_audio = event.target.files[0];
			$(document ).ready(function() {
				var labelName = document.getElementById('labelNameFile');
				$(labelName).text(file_audio.name);
				$('.img-avatar-edit-info').css('display', 'none');
			});
		} 
	
		function openFormChangePassWord(event) {
		    event.preventDefault()
			$(document).ready(function() {
				$('.form-change-password').css('display', 'block');
			})	
		}
		
		function closeFormChangePassWord(event) {
			event.preventDefault()
			$(document).ready(function() {
				$('.form-change-password').css('display', 'none');
			})	
		}
	</script>
</body>
</html>