<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>managerPage</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv"
	crossorigin="anonymous">
<!-- Icon사용 URL -->

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700'
	rel='stylesheet' type='text/css'>
<!--font-family: 'Roboto' 기본Font사용 URL -->

<link href="/css/main.css" rel="stylesheet" type="text/css">
<link href="/css/reset.css" rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function() {
	
	var list = new Array();
	<c:forEach var="j" begin="0" end="${fn:length(SavedBox)}">				
		list.push("${SavedBox[j] }");
	</c:forEach>
	var target1 = document.getElementById("studiocheck");
	var target2 = document.getElementById("rentalcheck");
	var target3 = document.getElementById("btn3check");
	var target4 = document.getElementById("btn4check");
	for (var i = 0; i < list.length; i++) {
		if(list[i]==target1.value) {
	        target1.checked = true;
	        document.getElementById('studio').disabled = true;
		} else if(list[i]==target2.value) {
	        target2.checked = true;
	        document.getElementById('rental').disabled = true;
		} else if(list[i]==target3.value) {
	        target3.checked = true;
	        document.getElementById('btn3').disabled = true;
		} else if(list[i]==target4.value) {
	        target4.checked = true;
	        document.getElementById('btn4').disabled = true;
		}
	}
	
	btnSettingDialog = $("#btnSetform").dialog({
		autoOpen : false,
		height : 850,
		width : 1200,
		modal : true,
		buttons : {
			"저장" : function() {
				btnSettingForm.trigger("submit");
			},
			"취소" : function() {
				btnSettingDialog.dialog("close");
			}
		},
		close : function() {
			
		}
	});
	btnSettingForm = btnSettingDialog.find("form").on("submit",
			function(event) {
				var valid = true;
				
				if (valid) {
					btnSettingDialog.dialog("close");
				}
				return valid;
			});
	
	$("#admin-icon").on("click", function() {
		btnSettingDialog.dialog("open");
	});
	
});
function check(box) {
	   if(box.checked == true && box.value == "studio") {
	      const target = document.getElementById('studio');
	        target.disabled = true;
	   } else if(box.checked == true && box.value == "rental") {
	      const target = document.getElementById('rental');
	        target.disabled = true;
	   } else if(box.checked == true && box.value == "btn3") {
	      const target = document.getElementById('btn3');
	        target.disabled = true;
	   } else if(box.checked == true && box.value == "btn4") {
	      const target = document.getElementById('btn4');
	        target.disabled = true;
	   }
	   
	   if (box.checked == false && box.value == "studio") {
	      const target = document.getElementById('studio');
	        target.disabled = false;
	   } else if (box.checked == false && box.value == "rental") {
	      const target = document.getElementById('rental');
	        target.disabled = false;
	   } else if (box.checked == false && box.value == "btn3") {
	      const target = document.getElementById('btn3');
	        target.disabled = false;
	   } else if (box.checked == false && box.value == "btn4") {
	      const target = document.getElementById('btn4');
	        target.disabled = false;
	   }
	}
</script>

<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv"
	crossorigin="anonymous">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link href="/css/main.css" rel="stylesheet" type="text/css">
<link href="/css/reset.css" rel="stylesheet" type="text/css">
<link href="/css/toggle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div>
		접속자 : ${name } <i class="fas fa-user-cog fa-3x" id="admin-icon"></i>
	</div>
	<h1 id="title">Schedule Management Platform</h1>

	<c:forEach var="i" begin="0" end="${fn:length(NewBox)}">
							${NewBox[i] }
	</c:forEach>
	<br>
	<c:forEach var="j" begin="0" end="${fn:length(SavedBox)}">
							${SavedBox[j] }
	</c:forEach>
	<br>
	<br>
	<br>
	<div style="text-align:center;">
			<input type="button" id="studio" value="studiorsv" name="btn1" onclick="location.href='/api/schedules?btn=1'" />
			<input type="button" id="rental" value="rentalrsv" name="btn2" onclick="location.href='/api/schedules?btn=2'" />
			<input type="button" id="btn3" value="btn3rsv" name="btn3" onclick="location.href='/api/schedules?btn=3'" />
			<input type="button" id="btn4" value="btn4rsv" name="btn4" onclick="location.href='/api/schedules?btn=4'" />
	</div>
	
	<input type = "button" id="rsvCheck" value="예약목록확인" name="rsvCheck" onclick="location.href='/studio/admin/rsvCheck'"/>
<!-- --------------------------------------------------------------------------------------------- -->
	<div id="btnSetform" class="dialog">
		<form method="POST" name="setting" action="/studio/admin">
			<fieldset>
				<div class="btnContainer" style="text-align : center;">
					<div>
						<input type="button" id="studio" value="studio" /> <label class="switch">
							<input type="checkbox" value="studio" name="checkTest"
							id="studiocheck" onClick="check(this)" /> <span
							class="slider round"></span>
						</label>
					</div>

					<div>
						<input type="button" id="rental" value="rental"/> <label class="switch">
							<input type="checkbox" value="rental" name="checkTest" id="rentalcheck" onClick="check(this)" /> 
							<span class="slider round"></span>
						</label>
					</div>

					<div>
						<input type="button" id="btn3" value="btn3" /> <label class="switch">
							<input type="checkbox" value="btn3" name="checkTest"
							id="btn3check" onClick="check(this)" /> <span
							class="slider round"></span>
						</label>
					</div>

					<div>
						<input type="button" id="btn4" value="btn4" /> <label class="switch">
							<input type="checkbox" value="btn4" name="checkTest"
							id="btn4check" onClick="check(this)" /> <span
							class="slider round"></span>
						</label>
					</div>
				</div>

				<br> <br> <!-- <input type="submit" name="setting" value="저장"> -->
				<input type="submit" name="setting" tabindex="-1"
							style="position: absolute; top: -1000px" />
				<!-- 돌아가기 버튼구현 <input type="button" value="이전으로 돌아가기" onclick="window.history.go(-1);"/> -->
			</fieldset>
		</form>
	</div>
</body>
</html>