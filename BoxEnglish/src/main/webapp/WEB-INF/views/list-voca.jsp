<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nghia
  Date: 03/10/2021
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="header.jsp"></jsp:include>
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
                        <a href="#home" class="nav-link scroll-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">My Course</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link scroll-link">Course</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link scroll-link">Note</a>
                    </li>
                </ul>
            </div>

            <div class="container-user-setting">
                <a href="#" class="user-icon">
                    <i class='bx bx-user-circle'></i>
                </a>
                <div class="setting-user">
                    <div class="setting-user-item">
                        <i class='bx bxs-edit-alt'></i> <span>Edit profile</span>
                    </div>
                    <div class="setting-user-item">
                        <i class='bx bxs-log-out' ></i> <span>Logout</span>
                    </div>
                </div>
            </div>


            <div class="hamburger">
                <i class="bx bx-menu"></i>
            </div>

        </div>
    </nav>
</header>

    <div class="row">
        <div class="col-sm-2">
            <div style="margin: 60px;">
                <button class="btn btn-secondary" style="width: 150px;">Practice</button>
                <br/>
                <br/>
                <button class="btn btn-secondary" style="width: 150px;">Review</button>
                <br/>
                <br/>
                <button class="btn btn-secondary" style="width: 150px;">Delete</button>
                <br/>
                <br/>
                <button class="btn btn-secondary" style="width: 150px;">Close</button>
            </div>

        </div>
        <div class="col-sm-8">
            <ul style="list-style-type:none;">
                <li>
                    <div>

                        <div style="margin-top:20px;">
                            <img class="mx-auto d-block" src='<c:url value="/resources/img/paris.jpeg" />' alt="not display"  style="width:25%; float: left;">
                            <p><b>Giải thích:</b> to accept and act according to a law, an agreement</p>
                            <p><b>Từ loại:</b> (v): tôn trọng, tuân theo, giữ (lời)</p>
                            <p><b>Ví dụ:</b> The two parties agreed to abide by the judge's decision</p>
                            <p><b>Hai bên đã đồng ý tuân theo quyết định của tòa án.</b></p>
                            <audio controls="" class="mx-auto d-block">
                                <source src="audio/abide_by.mp3" type="audio/mpeg">
                                Your browser does not support the audio element.
                            </audio>
                        </div>

                    </div>
                </li>
                <li>
                    <div>

                        <div style="margin-top:20px;">
                            <img class="mx-auto d-block" src='<c:url value="/resources/img/paris.jpeg" />' alt="not display"  style="width:25%; float: left;">
                            <p><b>Giải thích:</b> to accept and act according to a law, an agreement</p>
                            <p><b>Từ loại:</b> (v): tôn trọng, tuân theo, giữ (lời)</p>
                            <p><b>Ví dụ:</b> The two parties agreed to abide by the judge's decision</p>
                            <p><b>Hai bên đã đồng ý tuân theo quyết định của tòa án.</b></p>
                            <audio controls="" class="mx-auto d-block">
                                <source src="audio/abide_by.mp3" type="audio/mpeg">
                                Your browser does not support the audio element.
                            </audio>
                        </div>

                    </div>
                </li>
                <li>
                    <div>

                        <div style="margin-top:20px;">
                            <img class="mx-auto d-block" src='<c:url value="/resources/img/paris.jpeg" />' alt="not display"  style="width:25%; float: left;">
                            <p><b>Giải thích:</b> to accept and act according to a law, an agreement</p>
                            <p><b>Từ loại:</b> (v): tôn trọng, tuân theo, giữ (lời)</p>
                            <p><b>Ví dụ:</b> The two parties agreed to abide by the judge's decision</p>
                            <p><b>Hai bên đã đồng ý tuân theo quyết định của tòa án.</b></p>
                            <audio controls="" class="mx-auto d-block">
                                <source src="audio/abide_by.mp3" type="audio/mpeg">
                                Your browser does not support the audio element.
                            </audio>
                        </div>

                    </div>
                </li>
                <li>
                    <div>

                        <div style="margin-top:20px;">
                            <img class="mx-auto d-block" src='<c:url value="/resources/img/paris.jpeg" />' alt="not display"  style="width:25%; float: left;">
                            <p><b>Giải thích:</b> to accept and act according to a law, an agreement</p>
                            <p><b>Từ loại:</b> (v): tôn trọng, tuân theo, giữ (lời)</p>
                            <p><b>Ví dụ:</b> The two parties agreed to abide by the judge's decision</p>
                            <p><b>Hai bên đã đồng ý tuân theo quyết định của tòa án.</b></p>
                            <audio controls="" class="mx-auto d-block">
                                <source src="audio/abide_by.mp3" type="audio/mpeg">
                                Your browser does not support the audio element.
                            </audio>
                        </div>

                    </div>
                </li>

            </ul>
        </div>
        <div class="col-sm-2"></div>
    </div>
</body>
</html>
