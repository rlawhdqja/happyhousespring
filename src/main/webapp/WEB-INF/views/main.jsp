<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 REST</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function printResult(msg){
	$("#id").val("");
	$("#name").val("");
	$("#pass").val("");
	$("#email").val("");
	
	$("#result").html(msg);
}
function getFormData(){
	let user={};
	user.id=$("#id").val();
	user.name=$("#name").val();
	user.pass=$("#pass").val();
	user.email=$("#email").val();
	return user;
}
function updateList(users){
	$("#list").empty();
	$.each(users, function(idx, user){
		$("#list").append("<li>"+user.id+" "+user.name+" "+user.pass+" "+user.email+"</li>");
	});
}
$(function(){
	$("#blst").click(function(){
		$.ajax({
			url : "${root}/userapi/user",
			type : "get",
			success : function(data) {
				updateList(data);
				//printResult("검색 성공");
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	});
	$("#list").on("click", "li", function() {
		$.ajax({
			url : "${root}/userapi/user/" + this.innerText.split(" ")[0],
			type : "get",
			success : function(user) {
				$("#id").val(user.id);
				$("#name").val(user.name);
				$("#pass").val(user.pass);
				$("#email").val(user.email);
				
				$("#result").html("조회 성공");
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	});
	$("#badd").click(function(){
 		$.ajax({
			url : "${root}/userapi/user",
			type : "post",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(getFormData()),
			success : function(data) {
				$("#blst").trigger("click");
				printResult("추가 성공");
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	});	
	$("#bupd").click(function() {
		$.ajax({
			url : "${root}/userapi/user",
			type : "put",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(getFormData()),
			success : function(data) {
				$("#blst").trigger("click");
				printResult("수정 성공");
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	});	
	$("#bdel").click(function() {
		$.ajax({
			url : "${root}/userapi/user/" + $("#id").val(),
			type : "delete",
			success : function(data) {
				$("#blst").trigger("click");
				printResult("삭제 성공");
			},
			error : function(xhr,status,msg) {
				alert("요청 실패");
			}
		});
	});
	$("#bcle").click(function(){
		printResult("");
	});
	
	$("#blst").trigger("click");
});
</script>
</head>
<body>
<!--
<c:if test="${not empty userinfo}">
<h4 align="right">[${userinfo.name}] <a href="${root}/logout">로그아웃</a></h4>
</c:if>
-->
<h1>유저 REST</h1>

<button id="blst">목록조회</button> (상세 내용을 조회하기 위해서 목록의 아이템을 클릭하세요.)
<ul id="list"></ul>
<button id="badd">추가</button>
<button id="bupd">수정</button>
<button id="bdel">삭제</button>
<button id="bcle">초기화</button><br>
<br>

<form>
유저id : <input type="text" id="id" name="id" value="spring"><br>
유저name : <input type="text" id="name" name="name" value="스프링"><br>
유저pass : <input type="text" id="pass" name="pass" value="1234"><br>
유저email : <input type="text" id="email" name="email" value="sasa@ssafy.com"><br>
</form>
<br>

<div id="result"></div>
</body>
</html>