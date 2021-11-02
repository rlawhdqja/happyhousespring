
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="container">
    <h1>회원 목록</h1>
    <%@ include file="/WEB-INF/views/include/search.jsp" %>
    <br>
    <table class="table table-striped">
        <thead>
            <tr><th>번호</th><th>아이디</th><th>이름</th><th>비밀번호</th><th>이메일</th></tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}" varStatus="vs">
            <tr><td>${vs.count}</td><td>${user.id}</td><td>${user.name}</td><td>${user.pass}</td><td>${user.email}</td></tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <%@ include file="/WEB-INF/views/include/paging.jsp" %>
    <a href="${root}/user/regist">회원 등록</a>
</div>
</body>
</html>
