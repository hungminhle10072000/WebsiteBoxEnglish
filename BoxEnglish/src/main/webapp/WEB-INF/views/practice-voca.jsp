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
                <div id="progress" class="progress-bar bg-warning" style="width:10%;height:30px"></div>
            </div>
        </div>
            <br/>
        <div id="form_practice">
            <img class="mx-auto d-block" src='<c:url value="/resources/img/paris.jpeg" />' alt="not display"  style="width:35%">
            <br/>
            <p style="text-align: center; font-size: 35px;">${category.title}</p>
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

        <div id="suggestion" style="text-align: center;">
            <label style="text-align: left;">
                <div id="question" style="display: none">
                    <p><b>Từ vựng:</b> <span id="vocabulary">to accept and act according to a law, an agreement</span> </p>
                    <p><b>Ý nghĩa:</b> <span id="mean_vocabulary">to accept and act according to a law, an agreement</span> </p>
                </div>
                <p><b>Giải thích:</b> <span id="explain_vocabulary">to accept and act according to a law, an agreement</span> </p>
                <p><b>Từ loại:</b> <span id="part_of_speech">(v): tôn trọng, tuân theo, giữ (lời)</span> </p>
                <p><b>Ví dụ:</b> <span id="example_vocabulary">The two parties agreed to abide by the judge's decision</span> </p>
                <p><b> <span >Hai bên đã đồng ý tuân theo quyết định của tòa án.</span> </b></p>
                <audio controls="">
                    <source src="audio/abide_by.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </label>
        </div>

    </div>

    <div class="col-sm-2">
        <br/>
        <br/>
        <br/>
        <br/>
        <button id="btnIdontKnow" class="btn btn-secondary" onclick="hideOrPractice()">I<br/> don't <br/>know</button>
    </div>`
</div>

<script>
    var jsonVocaList = ${lstVoca};
    const size = jsonVocaList.length;
    var i =0;
    console.log(jsonVocaList)
    const voca = document.getElementById("inputVoca");
    const suggestion =document.getElementById("suggestion");
    const form_practice =document.getElementById("form_practice");
    const question = document.getElementById("question");
    const progress = document.getElementById("progress");
    const btnIdontKnow = document.getElementById("btnIdontKnow");

    function checkVocabulary() {
        console.log('Input: ',voca.value.trim())
        console.log('List : ',jsonVocaList[i].vocabulary.trim())
        if (voca.value.trim().toUpperCase() == jsonVocaList[i].vocabulary.trim().toUpperCase()) {
            alert("Success")
        } else {
            alert("Error")
        }

        i++;
        progress.style.width= (i/size)*100+'%'
        voca.value='';
        hideSuggestions();
    }

    function hideOrShowSuggestions() {
        suggestion.style.display == "none" ? showSuggestions():hideSuggestions()
    }

    function showSuggestions() {
        if (i < size) {
            question.style.display = "none";

            document.getElementById("explain_vocabulary").innerText=jsonVocaList[i].explain_vocabulary.trim()
            document.getElementById("part_of_speech").innerText=jsonVocaList[i].partOfSpeech.trim()
            document.getElementById("example_vocabulary").innerText=jsonVocaList[i].example_vocabulary.trim()
        }
        suggestion.style.display = "block";
    }
    function hideSuggestions() {
        console.log(suggestion.style.display)
        suggestion.style.display = "none";
    }

    function hideOrPractice() {
        form_practice.style.display == "none" ? showFormPractice():hideFormPractice()
    }

    function showFormPractice() {
        form_practice.style.display = "block";
        question.style.display = "none";
        btnIdontKnow.innerHTML="I<br/> don't <br/>know";
        hideSuggestions();
    }
    function hideFormPractice() {
        if (i <size) {

            document.getElementById("vocabulary").innerText=jsonVocaList[i].vocabulary;
            document.getElementById("vocabulary").innerText=jsonVocaList[i].mean_vocabulary;
        }
        question.style.display = "block";
        btnIdontKnow.innerText="Next"
        form_practice.style.display = "none";
        showSuggestions();
    }

</script>
</body>

</html>