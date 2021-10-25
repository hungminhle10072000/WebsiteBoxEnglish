<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
<div class="row">
    <div class="col-sm-10 p-3 bg-info text-black">
        <h1>Practice Vocabulary</h1>
    </div>
    <div class="col-sm-2 p-3 bg-info text-black">
        <button type="button" class="btn btn-info" style="font-size: 40px; font-weight: bold; color: rgba(14, 53, 224, 0.808);">X</button>
    </div>

</div>
<br />
<div class="row">
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
        <div class="container mt-3">
            <div class="progress" style="height: 30px; border-radius: 25px;">
                <div class="progress-bar bg-warning" style="width:10%;height:30px"></div>
            </div>
        </div>
        <br/>
        <img class="mx-auto d-block" src='<c:url value="/resources/img/paris.jpeg" />' alt="not display"  style="width:35%">
        <br/>
        <p style="text-align: center; font-size: 35px;">This is means of Vocabulary</p>
        <br/>
        <input class="mx-auto d-block"
               style="width: 40%; height: 50px; text-align: center; font-size: 150%; border: 3px solid rgb(153, 146, 146);
 border-radius: 20px;">
        <br/>
        <br/>
        <div class="mx-auto d-block" style="width: fit-content;">
            <button class="btn btn-secondary">Submit</button>
            <button class="btn btn-secondary" style="margin-left: 20px;">Show hint</button>
        </div>
        <br/>
        <br/>

        <div class="mx-auto d-block" style="width: fit-content;">
            <p><b>Giải thích:</b> to accept and act according to a law, an agreement</p>
            <p><b>Từ loại:</b> (v): tôn trọng, tuân theo, giữ (lời)</p>
            <p><b>Ví dụ:</b> The two parties agreed to abide by the judge's decision</p>
            <p><b>Hai bên đã đồng ý tuân theo quyết định của tòa án.</b></p>
            <audio controls="">
                <source src="audio/abide_by.mp3" type="audio/mpeg">
                Your browser does not support the audio element.
            </audio>
        </div>

    </div>

    <div class="col-sm-2">
        <br/>
        <br/>
        <br/>
        <br/>
        <button class="btn btn-secondary">I<br/> don't <br/>know</button>
    </div>`
</div>
</body>
</html>