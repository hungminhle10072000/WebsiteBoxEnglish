<%--
  Created by IntelliJ IDEA.
  User: Nghia
  Date: 11/7/2021
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Bạn đã hoàn thành bài tập</h1>
    <div class="container"><form method="get" action="${pageContext.request.contextPath }/list-box"><button type="submit">Practice</button></form></div>
<%--    onclick=${window.location.href = "${pageContext.request.contextPath}"}--%>
</body>
</html>
