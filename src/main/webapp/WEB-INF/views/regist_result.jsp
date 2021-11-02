
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
td:nth-child(3) {
    width: 150px;
}
#cover {
    width: 150px;
}
</style>
<div class="container">
    <h1>회원 등록 결과</h1>
    <c:if test="${not empty book}">
        <table class="table">
            <thead>
                <tr><th>항목</th><th colspan="2">내용</th></tr>
            </thead>
            <tbody>
                <tr><td>도서번호</td><td>${user.id}</td><td rowspan="5"><img id="cover" src="${root}/upload/${book.img}"></td></tr>
                <tr><td>도서명</td><td>${user.name}</td></tr>
                <tr><td>저자</td><td>${user.pass}</td></tr>
                <tr><td>가격</td><td>${user.email}</td></tr>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty book}">
        <p>등록된 회원이 없습니다.</p>
    </c:if>
    <a href="${root}/regist">[추가등록]</a>
    <a href="${root}/list">[목록보기]</a>
</div>
</body>
</html>
