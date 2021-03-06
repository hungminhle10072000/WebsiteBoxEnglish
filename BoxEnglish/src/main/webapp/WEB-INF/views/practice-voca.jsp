<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value="/api/review/update" var="APIurl"></c:url>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <style>
        html {
            overflow-y: scroll;
        }
    </style>
</head>

<body onload="onStart()">
<div class="row">
    <div class="col-sm-10 p-3 bg-info text-black">
        <h1>Practice Vocabulary</h1>
    </div>
    <div class="col-sm-2 p-3 bg-info text-black">
        <button onclick="show_alert()" type="button" class="btn btn-info" style="font-size: 40px; font-weight: bold; color: rgba(14, 53, 224, 0.808);">X</button>
    </div>

</div>
<br />
<div class="row">
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
        <div class="container mt-3">
            <div class="progress" style="height: 30px; border-radius: 25px;">
                <div id="progress" class="progress-bar bg-warning" style="width:5%;height:30px"></div>
            </div>
        </div>
            <br/>
        <div id="form_practice" style="display: none;">
            <img id="imgVoca" width="200px" height="250px" class="mx-auto d-block" src='<c:url value="/resources/img/paris.jpeg" />' alt="not display"  style="width:35%">
            <br/>
            <p id="question" style="text-align: center; font-size: 35px;"></p>
            <br/>
            <input class="mx-auto d-block" id="inputVoca"
                   style="width: 40%; height: 50px; text-align: center; font-size: 150%; border: 3px solid rgb(153, 146, 146);
     border-radius: 20px;">
            <br/>
            <br/>
            <div class="mx-auto d-block" style="width: fit-content;">
                <button class="btn btn-secondary" onclick="checkVocabulary()">Submit</button>
                <button class="btn btn-secondary" style="margin-left: 20px;" onclick="hideOrShowSuggestions()">Show hint</button>
            </div>
            <br/>
            <br/>
        </div>

        <div id="suggestion" style="display: none; text-align: center;">
            <label style="text-align: left;">
                <p><b>Gi???i th??ch:</b> <span id="explain_vocabulary_suggestion">to accept and act according to a law, an agreement</span> </p>
                <p><b>V?? d???:</b> <span id="example_vocabulary_suggestion">The two parties agreed to abide by the judge's decision</span> </p>
                <p><b> <span id="mean_example_vocabulary_suggestion">Hai b??n ???? ?????ng ?? tu??n theo quy???t ?????nh c???a t??a ??n.</span> </b></p>
                <div id="voiceSuggestion">
                    <!-- <source src="audio/abide_by.mp3" type="audio/mp3">
                    Your browser does not support the audio element. -->
                </div>
            </label>
        </div>
        <div id="formResult" style="display: none; text-align: center;">
            <label style="text-align: left;">
                <img id="imgFormResult" class="mx-auto d-block" src='<c:url value="/resources/img/paris.jpeg" />' alt="not display"  style="width:35%">
                <p><b>T??? v???ng:</b> <span id="vocabulary_result">to accept and act according to a law, an agreement</span> </p>
                <p><b>?? ngh??a:</b> <span id="mean_vocabulary_result">to accept and act according to a law, an agreement</span> </p>
                <p><b>Gi???i th??ch:</b> <span id="explain_vocabulary_result">to accept and act according to a law, an agreement</span> </p>
                <p><b>V?? d???:</b> <span id="example_vocabulary_result">The two parties agreed to abide by the judge's decision</span> </p>
                <p><b> <span id="mean_example_vocabulary_result" >Hai b??n ???? ?????ng ?? tu??n theo quy???t ?????nh c???a t??a ??n.</span> </b></p>
                <div id="voiceResult">
                    <!-- <source src="audio/abide_by.mp3" type="audio/mp3">
                    Your browser does not support the audio element. -->
                </div>
            </label>
        </div>

    </div>

    <div class="col-sm-2">
        <br/>
        <br/>
        <br/>
        <br/>
        <button id="btnIdontKnow" class="btn btn-secondary" onclick="hideOrShowFormResult()">I<br/> don't <br/>know</button>
    </div>`
</div>

<script>
    //Variable
    var jsonVocaList = ${lstVoca};
    var jsonReviewList = [];
    const size = jsonVocaList.length;
    var i =0;
    console.log(jsonVocaList)
    //Form
    const form_practice =document.getElementById("form_practice");
    const form_result = document.getElementById("formResult");
    const form_suggestion =document.getElementById("suggestion");
    //Button
    const btnIdontKnow = document.getElementById("btnIdontKnow");
    //Input
    const voca = document.getElementById("inputVoca");
    const question = document.getElementById("question");
    //Element
    const suggestion =document.getElementById("suggestion");
    const progress = document.getElementById("progress");
    const imgImageVoca = document.getElementById("imgVoca");
    const imgFormResult = document.getElementById("imgFormResult");
    const voiceSuggestion = document.getElementById("voiceSuggestion")
    const voiceResult = document.getElementById("voiceResult")
    // -----------------------------------------------------------------------------//
    function hideOrShowPractice() {
        form_practice.style.display == "none" ? showFormPractice():hideFormPractice()
    }
    function hideOrShowSuggestions() {
        form_suggestion.style.display == "none" ? showSuggestions():hideSuggestions()
    }
    function hideOrShowFormResult() {
        form_result.style.display == "none" ? showFormResult():hideFormResult()
    }

    function hideFormPractice() {
        form_practice.style.display = "none";
    }
    function hideSuggestions() {
        form_suggestion.style.display = "none";
    }
    function hideFormResult() {
        var review = {
            "id":jsonVocaList[i].reviewId,
            "vocabulary_id": jsonVocaList[i].id,
            "status":0
        }
        updateReview(review);
        i++;
        if (i <size) {
            imgImageVoca.src = "${pageContext.request.contextPath}"+"/resources/img/"+jsonVocaList[i].image_vocabulary;
            question.innerText=jsonVocaList[i].mean_vocabulary;
            btnIdontKnow.innerHTML="I<br/> don't <br/>know";
            form_result.style.display="none";
            form_practice.style.display="block";
            voca.value='';

            calculateProgress();
        } else {
            //Update data

            //
            window.location.href = "${pageContext.request.contextPath}/client/donepractice";
        }
    }
    function showFormPractice() {
        voca.value='';
        if (i < size) {
            hideSuggestions();
            hideFormResult();
            form_practice.style.display = "block";
            voca.value='';
            question.innerText=jsonVocaList[i].mean_vocabulary;
            btnIdontKnow.innerHTML="I<br/> don't <br/>know";
            imgImageVoca.src = "${pageContext.request.contextPath}"+"/resources/img/"+jsonVocaList[i].image_vocabulary;
        } else {
            //Update data

            // Chuy???n sang form ho??n th??nh
            window.location.href = "${pageContext.request.contextPath}/client/donepractice";

        }
    }
    function showSuggestions() {
        if (i < size) {
            form_suggestion.style.display = "block";
            document.getElementById("explain_vocabulary_suggestion").innerText=jsonVocaList[i].explain_vocabulary.trim()
            document.getElementById("example_vocabulary_suggestion").innerText=jsonVocaList[i].example_vocabulary.trim()
            document.getElementById("mean_example_vocabulary_suggestion").innerText=jsonVocaList[i].mean_example_vocabulary.trim()
            voiceSuggestion.innerHTML='<audio controls><source src="${pageContext.request.contextPath}/resources/audio/' + jsonVocaList[i].audio_vocabulary + '" type="audio/mp3"></audio>'
        }
    }

    function showFormResult() {
        hideFormPractice();
        hideSuggestions();
        btnIdontKnow.innerText="Next"
        form_result.style.display="block";
        imgFormResult.src = "${pageContext.request.contextPath}"+"/resources/img/"+jsonVocaList[i].image_vocabulary;
        voiceResult.innerHTML='<audio controls><source src="${pageContext.request.contextPath}/resources/audio/' + jsonVocaList[i].audio_vocabulary + '" type="audio/mp3"></audio>'
        document.getElementById("vocabulary_result").innerText=jsonVocaList[i].vocabulary.trim()
        document.getElementById("mean_vocabulary_result").innerText=jsonVocaList[i].mean_vocabulary.trim()
        document.getElementById("explain_vocabulary_result").innerText=jsonVocaList[i].explain_vocabulary.trim()
        document.getElementById("example_vocabulary_result").innerText=jsonVocaList[i].example_vocabulary.trim()
        document.getElementById("mean_example_vocabulary_result").innerText=jsonVocaList[i].mean_example_vocabulary.trim()

    }
    function checkVocabulary() {
        console.log('Input: ',voca.value.trim())
        console.log('List : ',jsonVocaList[i].vocabulary.trim())
        if ( voca.value == undefined || voca.value.trim() =="" || voca.value.trim().length < 1) {
            alert("Vui l??ng ??i???n t??? v???ng")
        } else if (voca.value.trim().toUpperCase() == jsonVocaList[i].vocabulary.trim().toUpperCase()) {
            var review = {
                "id":jsonVocaList[i].reviewId,
                "vocabulary_id": jsonVocaList[i].id,
                "status":1
            }
            updateReview(review);
            // jsonVocaList.push(review);
            voca.style.background="#74d56a";

            setTimeout(()=>{
                i++;
                if (i < size) {
                    calculateProgress();
                    voca.value='';
                    voca.style.background="#ffffff";
                    question.innerText=jsonVocaList[i].mean_vocabulary;
                    imgImageVoca.src = "${pageContext.request.contextPath}"+"/resources/img/"+jsonVocaList[i].image_vocabulary;
                    hideSuggestions();
                } else {
                    //UpdateData
                    window.location.href = "${pageContext.request.contextPath}/client/donepractice";
                }
            },1000);


        } else {
            var review = {
                "id":jsonVocaList[i].reviewId,
                "vocabulary_id": jsonVocaList[i].id,
                "status":0
            }
            updateReview(review);
            // jsonVocaList.push(review);
            voca.style.background="#fd5656";
            // showFormResult();

            setTimeout(()=>{
                console.log("Delay 1s")
                voca.style.background="#ffffff";
                showFormResult();
                question.innerText=jsonVocaList[i+1].mean_vocabulary;
                imgImageVoca.src = "${pageContext.request.contextPath}"+"/resources/img/"+jsonVocaList[i].image_vocabulary;
            },1000);

        }
    }
    function calculateProgress() {
        progress.style.width= (i/size)*100+'%'
    }
    function onStart() {
        form_practice.style.display = "block";
        voca.value='';
        question.innerText=jsonVocaList[i].mean_vocabulary;
        imgImageVoca.src = "${pageContext.request.contextPath}"+"/resources/img/"+jsonVocaList[i].image_vocabulary;
    }
    function show_alert() {
        if(!confirm("Do you really want to do this?")) {
            return false;
        }
        //update
        window.location.href = "${pageContext.request.contextPath}/list-box";
    }

    function updateReview(data){
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            enctype: 'multipart/form-data',
            processData:false,
            contentType: 'application/json',
            data:JSON.stringify(data),
            dataType: 'json',
            success: function (result){
                console.log("Success");
                <%--window.location.href = "${PCurl}?type=list&message=insert_success";--%>
            },
            errMode: function (error){
                console.log("Error");
            }
        })
    }

</script>
</body>

</html>