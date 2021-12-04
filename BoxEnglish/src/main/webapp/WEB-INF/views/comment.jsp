<%--
  Created by IntelliJ IDEA.
  User: Nghia
  Date: 11/29/2021
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%--<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>--%>
<c:url value="/api/comment/insert" var="APIcomment"></c:url>
<html>
<head>
    <style>
        *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        bodyc
        {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f6f6;
            font-family: arial;
        }
        .containercom
        {
            width: 100%;
            border: 2px solid #333;
            padding: 15px 10px;
        }
        .containercom h2
        {
            text-align: center;
            margin-bottom: 15px
        }
        textarea
        {
            height: 20px;
            width: 100%;
            border: none;
            border-bottom: 2px solid #aaa;
            background-color: transparent;
            margin-bottom: 10px;
            resize: none;
            outline: none;
            transition: .5s
        }

        input[type="submit"], button
        {
            padding: 10px 15px;
            border: none;
            outline: none;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]
        {
            color: #fff;
            background-color: #273c75
        }
        button
        {
            color: #333;
            background-color: transparent
        }
        .btn
        {
            display: none
        }
        p {
            margin-top: 0;
            margin-bottom: 0rem;
        }
    </style>
    <title>Title</title>
</head>
<body class="bodyc">
<div class="containercom">
    <h2>Leave Us a Comment</h2>
<%--    <form>--%>
        <textarea id="content" placeholder='Add Your Comment'></textarea>
        <div class="btn">
            <input id="btnSubmit" type="submit" value='Comment' onclick="sendComment()" >
            <button id='clear' href='#'>Cancel</button>
        </div>
<%--    </form>--%>

</div>
<span id="comment_message"></span>
<br />
<div id="display_comment">
    <c:forEach var="comment" items="${commentDtos}">
    <div class="row style_comment">
        <div class="col-md-1">
            <img width="100%" src="/BoxEnglish_war_exploded/resources/img/avatarronaldo.jpg" class="img img-responsive img-thumbnail">
        </div>
        <div class="col-md-10 panel-footer">
            <p style="color:green;"> ${comment.user.fullname}</p>
            <fmt:formatdate value="" var="parsedMyDate" datestyle="short" type="both" pattern="MM-dd-yyyy hh:mm:ss a">
                <p style="color: #000;">${comment.createDate}</p>								<p>${comment.content}</p>
            </fmt:formatdate></div>
        <div class="col-md-1 panel-footer" align="right">
            <p>.</p>
            <button type="button" class="btn-default reply" onclick="replyClicked('${comment.user.fullname}' ,${comment.id})">Reply</button>
        </div>
    </div>
    </c:forEach>

</div>
</body>


<script>
    var feild = document.querySelector('textarea');
    var backUp = feild.getAttribute('placeholder');
    var btn = document.querySelector('.btn');
    var btnSubmit = document.getElementById('btnSubmit');
    var clear = document.getElementById('clear')
    var new_comment = document.getElementById('display_comment')



    function sendComment(){

        var content =$('#content').val();
        if (content.charAt(0) != '@') {
            document.getElementById("parent").value = 0;
        }
        var course_id = parseInt($('#course_id').val());
        var parent_id = $('#parent').val();

        var data ={
            "category": {
                "id":course_id
            },
            "parent": {
                "id":parent_id
            },
            "content":content
        };
        let date = new Date().toLocaleString();

        $.ajax({
            url: '${APIcomment}',
            type: 'POST',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data:JSON.stringify(data),
            dataType: 'json',
            success: function (result){
                console.log(result)
                let imgLink = result.avatar;
                // console.log(imgLink);
                // var new_comment = document.querySelector('.comment');
                // var fullname =result;

                new_comment.innerHTML='<div class="row style_comment">\n' +
                    '\t\t\t\t\t\t\t<div class="col-md-1">\n' +
                    '\t\t\t\t\t\t\t\t<img width="100%" src="<c:url value="/resources/img/avatarronaldo.jpg" />"\n' +
                    '\t\t\t\t\t\t\t\t\t class="img img-responsive img-thumbnail">\n' +
                    '\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t<div class="col-md-10 panel-footer">\n' +
                    '\t\t\t\t\t\t\t\t<p style="color:green;"> '+ result.fullname +'</p>\n' +
                    '\t\t\t\t\t\t\t\t<fmt:formatDate  value = "${row_comment.getWriteDate()}" var = "parsedMyDate" dateStyle="short" type="both" pattern = "MM-dd-yyyy hh:mm:ss a"  />\n' +
                    '<p style="color: #000;">'+date+'</p>' +
                    '\t\t\t\t\t\t\t\t<p>'+content+'</p>\n'+
                    '\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t<div class="col-md-1 panel-footer" align="right">\n' +
                    '\t\t\t\t\t\t\t\t<p>.</p>\n' +
                    '\t\t\t\t\t\t\t\t<button type="button" class="btn-default reply" onclick="replyClicked(\''+ result.fullname + '\' ,'+parent_id+')" >Reply</button>\n' +
                    '\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t</div>' + new_comment.innerHTML

                console.log("Success");

                document.getElementById("content").value = "";
                // contenValue.setAttribute()
                // window.location.href="/client-product-list?type=detail_product";
            },
            error: function (error){
                alert("Vui lòng đăng nhập để bình luạn")
                console.log("Error");
            }
        })
    };

    feild.onfocus = function(){
        this.setAttribute('placeholder', '');
        this.style.borderColor = '#333';
        btn.style.display = 'block'
    }

    feild.onblur = function(){
        this.setAttribute('placeholder',backUp);
        this.style.borderColor = '#aaa'
    }

    clear.onclick = function(){
        btn.style.display = 'none';
        feild.value = '';
    }
</script>
<script>

    function checkReply() {

        const queryString = window.location.search;

        const urlParams = new URLSearchParams(queryString);

        const page_type = urlParams.get('page_type')
        const name =urlParams.get('name')
        const parent_id =urlParams.get('parent_id')

        if (page_type == 'adminReply') {
            replyClicked(name,parent_id);

        }
    }

    function replyClicked(name,parent_id) {

        console.log("Hlll");
        <%--console.log(typeof(${row_comment}));--%>

        // var comment_id = $(this).attr("id");
        // $('#comment_id').val(comment_id);
        console.log("ParentId: ",parent_id)
        document.getElementById("content").value = "@"+name+": ";
        $('#content').focus();
        document.getElementById("parent").value = parent_id;
    }

</script>
</html>
