<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<p>
<div class="container">
	<ul>
	<c:if test="${empty userinfo}">
		<a href="${root}/user/regist">회원가입</a><br>
	</c:if>
	<c:if test="${!empty userinfo}">
		<a href="${root}/aptlist">아파트 실거래가</a><br>
		<a href="${root}/list">회원 목록</a></li>
	</c:if>
	</ul>
</div>	
</body>
</html>