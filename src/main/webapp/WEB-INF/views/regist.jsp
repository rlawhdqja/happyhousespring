
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script type="text/javascript">
$("#registerBtn").click(function () {
    if (!$("#id").val()) {
        alert("아이디 입력!!!");
        return;
    } else if (!$("#name").val()) {
        alert("이름 확인!!!");
        return;
    } else if (!$("#pass").val()) {
        alert("비밀번호 입력!!!");
        return;
    } else {
    	$("#email").val($("#emailid").val() + "@" + $("#emaildomain").val());
        $("#userform").attr("action", "${root}/user/regist").submit();
    }
});
</script>
<div class="container">
<style>
label {
    display: inline-block;
    width: 80px;
}
textarea {
    width: 100%;
}
</style>
<div class="container">
    <h1>회원 등록</h1>
    <form id="userform" method="post" action="${root}/user/regist">
    <input type="hidden" id="email" name="email">
        <!-- front-controller pattern에서 요청을 구분하기 위한 parameter -->
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" class="form-control-sm" value="이싸피">
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" class="form-control-sm" value="이싸피">
        </div>
        <div class="form-group">
            <label for="pass">비밀번호</label>
            <input type="password" id="pass" name="pass" class="form-control-sm" value="12345">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <div type="text"  class="custom-control-inline">
	            <input id="emailid" name="emailid" class="form-control-sm" value="ssafy" size="25">@
	            <select class="form-control" id="emaildomain" name="emaildomain">
	                   <option value="ssafy.com">싸피</option>
	                   <option value="naver.com">네이버</option>
	                   <option value="kakao.com">카카오</option>
	                   <option value="google.com">구글</option>
	           </select>
           	</div>
        </div>
 
</div>
        <div class="form-group">
            <input type="submit" id="registerBtn" value="등록">
            <input type="reset" value="취소">
        </div>
    </form>
    <br>
    <a href="${root}">홈으로</a>
</div>
</body>
</html>
