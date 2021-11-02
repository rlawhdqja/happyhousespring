
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script type="text/javascript">
$("#registerBtn").click(function () {
	if (!$("#name").val()) {
        alert("이름 확인!!!");
        return;
    } else if (!$("#pass").val()) {
        alert("비밀번호 입력!!!");
        return;
    } else {
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
    <h1>회원 정보 수정</h1>
    <form id="userform" method="post" action="${root}/user/update">
        <!-- front-controller pattern에서 요청을 구분하기 위한 parameter -->
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" class="form-control-sm" value="${userinfo.id}" readonly>
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" class="form-control-sm" value="${userinfo.name}">
        </div>
        <div class="form-group">
            <label for="pass">비밀번호</label>
            <input type="password" id="pass" name="pass" class="form-control-sm" value="${userinfo.pass}">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="text" id="email" name = "email" class="custom-control-inline" value="${userinfo.email}">
        </div>
 
	</div>
        <div class="form-group">
            <input type="submit" id="registerBtn" value="수정">
            <input type="reset" value="취소">
        </div>
    </form>
    <br>
    <a href="${root}">홈으로</a>
</div>
</body>
</html>
