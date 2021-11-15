<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="header.jsp"></jsp:include>
	<meta charset="utf-8">
	<!-- Favicon -->
 	<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
 	<!-- Box icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
	<title>Trang chủ</title>
</head>
<body>
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
				             <a href="/BoxEnglish/" class="nav-link scroll-link">Trang chủ</a>
			            </li>
			            <li class="nav-item">
			              <a href="#" class="nav-link">Khóa học của tôi</a>
			            </li>
			            <li class="nav-item">
			              <a href="#" class="nav-link scroll-link">Danh sách khóa học</a>
			            </li>
		             	<li class="nav-item">
			              	<a href="list-note" class="nav-link scroll-link">Ghi chú</a>
			            </li>
					</ul>
				</div>
				
				<div class="container-user-setting">
					<a href="#" class="user-icon">
       	        		<i class='bx bx-user-circle'></i>
		        	</a>
		        	<div class="setting-user">
		        		<div class="setting-user-item">
		        			<i class='bx bxs-edit-alt'></i> <span>Cập nhật thông tin</span>
		        		</div>
		        		<div class="setting-user-item">
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

	<main>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3">
					<div class="card avatar-card" style="width:100%">
						<h4 class="card-title style-card-title">Hoàng Dương Hùng</h4>
					    <img class="card-img-top" src='<c:url value="/resources/img/avatarronaldo.jpg" />' alt="Avartar">
					    <div class="card-body container-wordlearned">
					      	<span>1575</span>
					      	<span>word learned</span>
					    </div>
				  </div>
				</div>
				<div class="col-sm-9">
					<div class="row item-category">
						<div class="col-sm-11 title-category">
							<div class="row">
								<div class="col-sm-3 col-chartfirst-title" style="margin-top: 20px;">
									<div class="chartfirst-title"><span>B</span></div>
								</div>
								<div class="col-sm-9" style="margin-top: 10px">
									<div class="row">
										<span class="detail-name-category">BANK</span>
									</div>
									<div class="row">
										<div class="progress" style="width: 80%">
										  <div class="progress-bar" role="progressbar" aria-valuenow="70"
										  		aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    70%
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row item-category">
						<div class="col-sm-11 title-category">
							<div class="row">
								<div class="col-sm-3 col-chartfirst-title" style="margin-top: 20px;">
									<div class="chartfirst-title"><span>C</span></div>
								</div>
								<div class="col-sm-9" style="margin-top: 10px">
									<div class="row">
										<span class="detail-name-category">COMPUTER</span>
									</div>
									<div class="row">
										<div class="progress" style="width: 80%">
										  <div class="progress-bar" role="progressbar" aria-valuenow="70"
										  		aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    70%
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row item-category">
						<div class="col-sm-11 title-category">
							<div class="row">
								<div class="col-sm-3 col-chartfirst-title" style="margin-top: 20px;">
									<div class="chartfirst-title"><span>I</span></div>
								</div>
								<div class="col-sm-9" style="margin-top: 10px">
									<div class="row">
										<span class="detail-name-category">INVOICES</span>
									</div>
									<div class="row">
										<div class="progress" style="width: 80%">
										  <div class="progress-bar" role="progressbar" aria-valuenow="70"
										  		aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    70%
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row item-category">
						<div class="col-sm-11 title-category">
							<div class="row">
								<div class="col-sm-3 col-chartfirst-title" style="margin-top: 20px;">
									<div class="chartfirst-title"><span>M</span></div>
								</div>
								<div class="col-sm-9" style="margin-top: 10px">
									<div class="row">
										<span class="detail-name-category">MARKETING</span>
									</div>
									<div class="row">
										<div class="progress" style="width: 80%">
										  <div class="progress-bar" role="progressbar" aria-valuenow="70"
										  		aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    70%
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row item-category">
						<div class="col-sm-11 title-category">
							<div class="row">
								<div class="col-sm-3 col-chartfirst-title" style="margin-top: 20px;">
									<div class="chartfirst-title"><span>C</span></div>
								</div>
								<div class="col-sm-9" style="margin-top: 10px">
									<div class="row">
										<span class="detail-name-category">CONTRACT</span>
									</div>
									<div class="row">
										<div class="progress" style="width: 80%">
										  <div class="progress-bar" role="progressbar" aria-valuenow="70"
										  		aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    70%
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row item-category">
						<div class="col-sm-11 title-category">
							<div class="row">
								<div class="col-sm-3 col-chartfirst-title" style="margin-top: 20px;">
									<div class="chartfirst-title"><span>B</span></div>
								</div>
								<div class="col-sm-9" style="margin-top: 10px">
									<div class="row">
										<span class="detail-name-category">BOTTLE</span>
									</div>
									<div class="row">
										<div class="progress" style="width: 80%">
										  <div class="progress-bar" role="progressbar" aria-valuenow="70"
										  		aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    70%
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row item-category">
						<div class="col-sm-11 title-category">
							<div class="row">
								<div class="col-sm-3 col-chartfirst-title" style="margin-top: 20px;">
									<div class="chartfirst-title"><span>M</span></div>
								</div>
								<div class="col-sm-9" style="margin-top: 10px">
									<div class="row">
										<span class="detail-name-category">MOUSE</span>
									</div>
									<div class="row">
										<div class="progress" style="width: 80%">
										  <div class="progress-bar" role="progressbar" aria-valuenow="70"
										  		aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    70%
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row item-category">
						<div class="col-sm-11 title-category">
							<div class="row">
								<div class="col-sm-3 col-chartfirst-title" style="margin-top: 20px;">
									<div class="chartfirst-title"><span>T</span></div>
								</div>
								<div class="col-sm-9" style="margin-top: 10px">
									<div class="row">
										<span class="detail-name-category">TABLE</span>
									</div>
									<div class="row">
										<div class="progress" style="width: 80%">
										  <div class="progress-bar" role="progressbar" aria-valuenow="70"
										  		aria-valuemin="0" aria-valuemax="100" style="width:70%">
										    70%
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer -->
	<footer class="page-footer font-small special-color-dark pt-4 footer-design">
	
	  <!-- Footer Elements -->
	  <div class="container">
	  		<div class="row">
	  			<div class="col-12">
	  					<!-- Social buttons -->
					    <ul class="list-unstyled list-inline text-center">
					      <li class="list-inline-item">
					        <a class="btn-floating btn-fb mx-1">
					          <i class="fab fa-facebook-f"> </i>
					        </a>
					      </li>
					      <li class="list-inline-item">
					        <a class="btn-floating btn-tw mx-1">
					          <i class="fab fa-twitter"> </i>
					        </a>
					      </li>
					      <li class="list-inline-item">
					        <a class="btn-floating btn-gplus mx-1">
					          <i class="fab fa-google-plus-g"> </i>
					        </a>
					      </li>
					      <li class="list-inline-item">
					        <a class="btn-floating btn-li mx-1">
					          <i class="fab fa-linkedin-in"> </i>
					        </a>
					      </li>
					      <li class="list-inline-item">
					        <a class="btn-floating btn-dribbble mx-1">
					          <i class="fab fa-dribbble"> </i>
					        </a>
					      </li>
					    </ul>
					    <!-- Social buttons -->
	  			</div>
	  		</div>
	  </div>
	  <!-- Footer Elements -->
	</footer>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>