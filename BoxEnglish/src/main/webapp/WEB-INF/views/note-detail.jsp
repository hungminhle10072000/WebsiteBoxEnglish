<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="header.jsp"></jsp:include>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
	<!-- Favicon -->
 	<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
 	<!-- Box icons -->
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
	<title>Danh sách chi tiết</title>
</head>
<body>
	<jsp:include page="header-general.jsp" />
	<main>
		<div class="container-fluid">			
			<div class="row">
				<div class="col-md-12 d-flex justify-content-center">
					<h2>Danh sách chi tiết</h2>
				</div>
			</div>
			<hr style="width: 100%; border: 1px solid #cdbbbb;">
			<div class="row">
				<div class="col-md-12 table-responsive" style="overflow: hidden;">
					<table class="table table-hover" id="table-word-note">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">Nội dung</th>
					      <th scope="col">Dịch nghĩa</th>
					      <th scope="col">File nghe</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="f" items="${listVocanote }">
					  		 <tr class="row-item-word">
							  <td class="group-action-word">
							  	<i class="fas fa-minus action-delete-word" id-note-detail="${f.id }"></i>
							  	<i class="far fa-save action-update-word" id-note-detail="${f.id }"></i>	
							  </td>	
 						      <td><input type="text" value="${f.vocabulary }"></td>
						      <td><input type="text" value="${f.mean_vocabulary }"></td>
						      <td class="td-upload-audio">
						      	<audio controls>
						      		<source src='<c:url value="/resources/audio/${f.audio_vocabulary }" />' type="audio/mp3">
								</audio>
								<div>
  									<input type="file" name="update-file" class="btn-update-file" accept="audio/mp3">
								</div>
							  </td>
						    </tr>
					  	</c:forEach>
					    <tr class="row-add-word">
					    	<input hidden id="value_idNote" value="${idNote }"/>
					    	<td style="width: 115px"><i class="fas fa-plus action-add-word"></i></td>
					    	<td class="input_vocabulary"><input type="text"></td>
					    	<td class="input_mean_vocabulary"><input type="text"></td>
					    	<td>
					    		<button class="btn btn-secondary"><label for="upload-audio" class="label-upload-audio">Upload</label></button>
					    		<span id="labelNameFile"></span>
					    		<input type="file" id="upload-audio" accept="audio/*" class="file_audio" onchange="setNameFile(event)"/>
					    	</td>
					    </tr>
					  </tbody>
					</table>
				</div>
			</div>
			<div class="row pb-5">
				<div class="group-button-note-detail col-md-2 offset-10">
					<button class="btn btn-success" onclick="window.location.reload()">Làm mới</button>
					<button class="btn btn-warning"><a href="${pageContext.request.contextPath }/note/" style=" text-decoration: none; color: white;">Quay lại</a></button>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		let file_audio = null;
		function setNameFile(event) {
			file_audio = event.target.files[0];
			$(document ).ready(function() {
				var labelName = document.getElementById('labelNameFile');
				$(labelName).text(file_audio.name);
			});
		} 
	
		$(document).ready(function() {
			
			$("#table-word-note").on('click', '.action-delete-word', function() {
				var currentRow= $(this).closest("tr");
			    var checkConfirm = confirm("Bạn chắc chắn muốn xóa !!!!");
			    if (checkConfirm == true){
			    	var idWordDelete = $(this).attr("id-note-detail")
			    	$.ajax({
		                type: "DELETE",
		                url: '${pageContext.request.contextPath }/note/detail/delete/' + idWordDelete,
		                contentType: false,
		                success: function (data) {
		                    alert("Xóa thành công !!!");
		                    currentRow.remove();
		                },
		                error: function (data) {
		                	console.log(data);
		                	alert("Xóa thất bại !!!");
		                }
		        	});		
			    } else {
			    	
			    }		
			})
			
			$("#table-word-note").on('click', '.action-update-word', function() {
				alert("Update thôi nào");
			})
			
			$("i.fas.fa-plus.action-add-word").click(function() {
				var currentRow=$(this).closest("tr");
				var value_idNote = document.getElementById("value_idNote").value;
				var vocabulary = currentRow.find("td:eq(1) input[type='text']").val();
				var mean_vocabulary = currentRow.find("td:eq(2) input[type='text']").val();
				if(vocabulary === '' || mean_vocabulary === '' ||file_audio === null){
					alert("Bạn chưa nhập đầy đủ !!!!!!")
					return;
				}
				let formData = new FormData();
				formData.append("idNote",value_idNote);
				formData.append("vocabulary", vocabulary);
				formData.append("mean_vocabulary", mean_vocabulary);
				formData.append("file_audio", file_audio);
				$.ajax({
					type: "POST",
					enctype: 'multipart/form-data',
					url: "${pageContext.request.contextPath }/note/detail/addWord",
					data: formData,
					processData: false,
			        contentType: false,
			        cache: false,
		            timeout: 600000,
		            success: function (data) {
		            	alert("Thêm thành công !!!")
		            	var table = document.getElementById("table-word-note");
		                var index = table.rows.length - 1
		                
		                row = table.insertRow(index);
		                $(row).addClass("row-item-word");
		                cell0 = row.insertCell(0);
		                $(cell0).addClass("group-action-word");
		                cell1 = row.insertCell(1);
		                cell2 = row.insertCell(2);
		                cell3 = row.insertCell(3);
		                $(cell0).addClass("td-upload-audio");
		                
		                
		                cell0.innerHTML = '<i class="fas fa-minus action-delete-word" id-note-detail="' + data.id  + '"></i>'
		                				  + '<i class="far fa-save action-update-word" id-note-detail=' + data.id  + '"></i>';
		                cell1.innerHTML = '<input type="text" value="'+ data.vocabulary  + '">';
		                cell2.innerHTML = '<input type="text" value="'+ data.mean_vocabulary + '">';
		                cell3.innerHTML = '<audio controls><source src="/BoxEnglish/resources/audio/' + data.audio_vocabulary + '" type="audio/mp3"></audio>'
		                				  + '<div><input type="file" name="update-file" class="btn-update-file" accept="audio/mp3"></div>';
		            	
		                $( ".input_vocabulary" )[0].innerHTML = '<input type="text">'
		            	$( ".input_mean_vocabulary" )[0].innerHTML = '<input type="text">'
		        		$( ".file_audio" ).val("")
		       			file_audio = null
		       			var labelName = document.getElementById('labelNameFile');
						$(labelName).text("");
		            },
		            error: function (res) {
		               	alert("Thêm thất bại !!!")
		            }
				})
			})
		})
	</script>
</body>
</html>