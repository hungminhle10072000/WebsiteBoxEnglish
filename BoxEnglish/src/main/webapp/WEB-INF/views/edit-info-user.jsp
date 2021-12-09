<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="header.jsp"></jsp:include>
	<meta charset="UTF-8">
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
			<div class="row">
				<div class="col-md-12 d-flex justify-content-center">
					<h3>Cập nhật thông tin</h3>
				</div>
			</div>
			<hr style="width: 100%; border: 1px solid #cdbbbb;">
			<div class="alert-page-edit-info">
				
			</div>	
			<div class="row">
				<div class="col-md-12  d-flex justify-content-center">
					<form:form modelAttribute="user" enctype="multipart/form-data" id="form-edit-note">
						<div class="col-md-12">
							<img style="width: 150px; height: 150px" src='<c:url value="/resources/img/${user.avatar }" />' alt="Avartar" class="img-avatar-edit-info"/>
							<button type="button" class="btn btn-secondary"><label for="upload-update-image" class="label-upload-image_update">Upload</label></button>
				    		<span id="labelNameFile"></span>
				    		<input type="file" id="upload-update-image" accept="image/*" class="file_image_update" onchange="setNameFile(event)" />
						</div>
						<div style="margin-top: 10px">
							<label style="font-weight: 500">Họ tên:</label> <br >
							<form:input id="user-fullname" path="fullname" required="required" style="width:100%"/>
						</div>
						<div style="margin-top: 10px">
							<label style="font-weight: 500">Tên đăng nhập:</label> <br >
							<form:input id="user-username" path="username" required="required" style="width:100%"/>
						</div>
						<div style="margin-top: 10px; margin-bottom: 10px" class="group-button-editForm">
							<button class="btn btn-success" type="button" onclick="handleUpdateInfo(event)">Cập nhật</button>
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
		</div>	
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		
		let file_image = null;
		function setNameFile(event) {
			event.preventDefault()
			file_image = event.target.files[0];
			$(document ).ready(function() {
				var labelName = document.getElementById('labelNameFile');
				$(labelName).text(file_image.name);
				$('.img-avatar-edit-info').css('display', 'none');
			});
		} 
	
		function handleUpdateInfo(event){
			event.preventDefault()
			$(document ).ready(function() {
				let fullname = $("#user-fullname").val()
				if(fullname === ''){
					$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">Yêu cầu nhập họ và tên !!!</div>')
					window.scrollTo({ top: 0, behavior: 'smooth' });
					return;
				}
				let username = $("#user-username").val()
				if(username === ''){
					$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">Yêu cầu nhập tên đăng nhập !!!</div>')
					window.scrollTo({ top: 0, behavior: 'smooth' });
					return;
				}
				let formData = new FormData();
				formData.append("username",username);
				formData.append("fullname", fullname);
				formData.append("file_avatar", file_image);
				$.ajax({
					type: "POST",
					enctype: 'multipart/form-data',
					url: "${pageContext.request.contextPath }/user/update-info",
					data: formData,
					processData: false,
			        contentType: false,
			        cache: false,
		            timeout: 600000,
		            success: function (data) {
		            	file_image = null
		       			var labelName = document.getElementById('labelNameFile');
						$(labelName).text("");
						$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">' + data.success + '</div>')
						window.scrollTo({ top: 0, behavior: 'smooth' });
						let pathUrlImage = '${pageContext.request.contextPath }/resources/img/' + data.pathImgNew;
						$('.img-avatar-edit-info').attr('src', pathUrlImage); 
						$('.img-avatar-edit-info').css('display', 'inline');
		            },
		            error: function (res) {
		            	$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">' + res.responseJSON.error + '</div>')
						window.scrollTo({ top: 0, behavior: 'smooth' });
		            }
				})
			})
		}
	
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
				if(passwordNew === '' || passwordNew.length < 6){
					$(".alert-page-edit-info").html('<div class="alert alert-warning" role="alert">Yêu cầu nhập mật khẩu mới tối thiểu 6 kí tự !!!</div>')
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