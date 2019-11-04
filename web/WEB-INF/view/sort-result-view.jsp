<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Liu_Shi
  Date: 10/31/19
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="search-article-view.jsp"/>
    <jsp:include page="sort-article-view.jsp"/>

</head>
<body>

<div id="display-sorted-article">
    <c:forEach var="articles" items="${articlesSorted}">

        <p><strong>articles.id: ${articles.id}</strong></p>
        <a href="./ArticleContent?id=${articles.id}">
            <p class="card-title">${articles.title}</p></a>
        <p>${articles.username}</p>
        <p>${articles.date}</p>
    </c:forEach>

</div>

</body>
</html>
