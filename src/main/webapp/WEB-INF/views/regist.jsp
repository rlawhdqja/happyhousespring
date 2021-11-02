
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


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
    <form method="post" action="${root}/user/regist">
        <!-- front-controller pattern에서 요청을 구분하기 위한 parameter -->
        <div class="form-group">
            <label for="isbn">아이디</label>
            <input type="text" id="id" name="id" class="form-control-sm" value="이싸피">
        </div>
        <div class="form-group">
            <label for="title">이름</label>
            <input type="text" id="name" name="name" class="form-control-sm" value="이싸피">
        </div>
        <div class="form-group">
            <label for="author">비밀번호</label>
            <input type="password" id="pass" name="pass" class="form-control-sm" value="12345">
        </div>
        <div class="form-group">
            <label for="price">이메일</label>
            <div id="email" class="custom-control-inline">
	            <input type="text" id="emailid" name="emailid" class="form-control-sm" value="ssafy" size="25">@
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
            <input type="submit" value="등록">
            <input type="reset" value="취소">
        </div>
    </form>
    <br>
    <a href="${root}/list">도서 목록</a>
</div>
</body>
</html>
