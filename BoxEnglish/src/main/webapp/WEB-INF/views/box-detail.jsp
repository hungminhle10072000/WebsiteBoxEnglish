<%--
  Created by IntelliJ IDEA.
  User: Nghia
  Date: 11/26/2021
  Time: 2:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Box</title>
    <jsp:include page="header.jsp"></jsp:include>
    <meta charset="utf-8">
    <!-- Favicon -->
    <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
    <!-- Box icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <style>
        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .styled-table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
        }
        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }
        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }
        .styled-table tbody tr.active-row {
            font-weight: normal;
            color: #009879;
        }
    </style>
</head>
<body>
<jsp:include page="header-general.jsp" />


<div class="row">
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
        <table class="styled-table">
            <thead>
            <tr>
                <th width="250px">Từ vựng</th>
                <th width="250px">Ý nghĩa</th>
                <th >Ví dụ</th>
            </tr>
            </thead>
            <tbody>
                <c:set var ="flag" value="${1}" ></c:set>
                <c:forEach var="voca" items="${lstVoca}">
                    <c:if test="${flag%2!=0}">
                        <tr>
                            <td>${voca.vocabulary}</td>
                            <td>${voca.mean_vocabulary}</td>
                            <td>${voca.example_vocabulary}</td>
                        </tr>
                    </c:if>
                    <c:if test="${flag%2==0}">
                        <tr class="active-row">
                            <td>${voca.vocabulary}</td>
                            <td>${voca.mean_vocabulary}</td>
                            <td>${voca.example_vocabulary}</td>
                        </tr>
                    </c:if>
                    <c:set var ="flag" value="${flag+1}"></c:set>
                </c:forEach>
            <!-- and so on... -->
            </tbody>
        </table>

    </div>

    <div class="col-sm-2"></div>`
</div>
</body>
</html>
