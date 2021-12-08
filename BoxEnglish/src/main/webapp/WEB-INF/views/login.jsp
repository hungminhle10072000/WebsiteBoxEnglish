<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/views/web" var="login"></c:url>
<c:url value="/validationlogin" var="loginApi"></c:url>
<c:url value="/trang-chu" var="APIurl"></c:url>
<%--<c:url value="/trang-chu" var="HomeUrl"> </c:url>--%>
<html>
<head>
    <title>Title</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <style>
        h5 {
            padding: 10px 0px;
        }
    </style>
</head>
<body style="background-color: rgba(0,0,0,0.003)">
<div class="container" >
    <div class="row" style=" min-height: 100vh;">
        <div class="col-12">
            <div class="row">
                <div class="col-12 text-center" style="padding-top: 20px;">
                    <a href="#" class="mt2" style=" color:#696763;"><i class="fas fa-home fa-4x"></i></a>
                </div>
            </div>
            <div class="row" style=" margin-top: 100px;">
                <div class="col-1"></div>
                <div class="col-4">
                    <h4>Đăng nhập</h4>
                    <div class="login-form">
                        <form action="${pageContext.request.contextPath }/validationlogin" method="post" id="login-form" style="display: inline;">
                            <div class="form-group">
                                <h5>Tên đăng nhập</h5>
                                <input id="username" name="username" type="text" class="form-control" placeholder="Tên đăng nhập" required="">
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group">
                                <h5>Mật khẩu</h5>
                                <input id="password" name="password" type="password" class="form-control" placeholder="Mật khẩu" required="">
                                <span class="form-message"></span>
                            </div>
                            <label>${msg}</label><br>
                            <button type="submit" class="btn btn-success btn-primary" style="margin-top: 10px; color: white; background-color: #696763; border: none;">Đăng nhập</button>
                            <input type="hidden" name="action" value="login">
                        </form>                       
                        <button class="btn btn-secondary" style="display: inline; margin-top: 10px; background-color: #696763"><a href="${pageContext.request.contextPath }/register" style="text-decoration: none; color: white;">Đăng ký</a></button>
                    </div>
                </div>
                <div class="col-1" ></div>
                <div class="col-1" style="border-left: solid 1px #333 "></div>
                <div class="col-5" >
                    <div class="col-8">
                        <h4>Quên mật khẩu</h4>
                        <c:if test="${message != null }">
							<div class="alert alert-danger" role="alert">${message }</div>
						</c:if>
						<c:if test="${messageSuccess != null }">
							<div class="alert alert-success" role="alert">${messageSuccess }</div>
						</c:if>
                        <form action="${pageContext.request.contextPath }/user/sendVali" method="post" id="register-form">
                            <div class="form-group">
                                <h5>Tên đăng nhập</h5>
                                <input name="username" type="text" class="form-control" placeholder="Nhập tên đăng nhập" required>
                                <span class="form-message"></span>
                            </div>
                            <div class="form-group">
                                <h5>Nhập email</h5>
                                <input name="email" type="email" class="form-control" placeholder="Nhập email" required>
                                <span class="form-message"></span>
                            </div>
                        	<button type="submit" class="btn btn-success btn-primary " style="margin-top: 10px; color: white; background-color: #696763; border: none;" >Lấy mã xác thực </button>
                        </form>
                        <div class="form-reset-password">
                        	<c:if test="${message2 != null }">
							<div class="alert alert-danger" role="alert">${message2 }</div>
							</c:if>
							<c:if test="${messageSuccess2 != null }">
								<div class="alert alert-success" role="alert">${messageSuccess2 }</div>
							</c:if>
							<form action="${pageContext.request.contextPath }/user/resetPassWord" method="post">
	                        	 <div class="form-group">
		                            <h5>Nhập mật khẩu mới</h5>
		                            <input name="newpassword" type="password" value="${newpassword }" class="form-control" placeholder="Nhập mật khẩu mới" minlength="6" required>
	                       		 </div> 	
	                        	<div class="form-group">
		                            <h5>Nhập lại mật khẩu mới</h5>
		                            <input name="repeat_password" type="password" value="${repeat_password }" class="form-control" placeholder="Nhập lại mật khẩu mới" minlength="6" required> 
	                        	</div>
	                        	<div class="form-group">
		                            <h5>Tên đăng nhập</h5>
		                            <input name="username" type="text" value="${username }" class="form-control" placeholder="Nhập tên đăng nhập" required> 
	                        	</div>
	                        	<div class="form-group">
		                            <h5>Nhập mã xác thực</h5>
		                            <input name="code" type="text" value="${code }" class="form-control" placeholder="Nhập mã xác thực" required>        
	                       		</div>
	                       		<button type="submit" class="btn btn-success btn-primary " style="margin-top: 10px; color: white; background-color: #696763; border: none;" >Xác nhận</button>
                       		 </form>
                        </div>
                        <input type="hidden" name="action" value="login">
                        <div id="notification"></div>
                        <span class="form-message"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<script src='${pageContext.request.contextPath }/Validation.js'></script>
<script>

	/*new*/
	function closeFormResetPassWord(event) {
		event.preventDefault()
		$('.form-reset-password').css('display', 'none');
	}
	
	function openFormResetPassWord(event){
		event.preventDefault()
		$('.form-reset-password').css('display', 'block');			
	}
	
	/*end-new*/
	
    Validator({
        form: '#login-form',
        formGroupSelector: '.form-group',
        errorSelector : '.form-message',
        rules: [
            Validator.isRequired('#username', 'Vui lòng nhập đầy đủ tên tài khoản của bạn'),
            Validator.minLength('#password', '6')
        ]
    });
    
    Validator({
        form: '#register-form',
        formGroupSelector: '.form-group',
        errorSelector : '.form-message',
        rules: [
            Validator.isRequired('#username2', 'Vui lòng nhập đầy đủ tên đăng nhập của bạn'),
            Validator.isEmail('#email')
        ]
    });

    /*Reset password*/
    function resetPassword(){

        var username= $('#username2').val();
        var password= $('#newpassword').val();
        var email= $('#email').val();
        var code =$('#code').val();
        var data={
            "username":username,
            "passWord":password,
            "email":email,
        }
        var notify= document.querySelector('#notification')
        if (username =='' || password =='' ||email=='' ||code=='') {
            notify.innerHTML="<label style=\"color: red\">Vui lòng nhập thông tin đầy đủ</label>";
            return ;
        }
        if (password.length < 6) {
            notify.innerHTML="<label style=\"color: red\">Vui lòng nhập ít nhất 6 ký tự</label>";
            return ;
        }
        $.ajax({
            url: '${APIurl}'+'?code='+code,
            type: 'PUT',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data:JSON.stringify(data),
            dataType: 'json',
            success: function (result){
                console.log("Success");
                notify.innerHTML="<label style=\"color: green\">Đổi mật khẩu thành công</label>";
            },
            error: function (error){
                console.log("Error");
                notify.innerHTML="<label style=\"color: red\">Đổi mật khẩu thất bại</label>";
            }
        })
    }
</script>
</body>
</html>
