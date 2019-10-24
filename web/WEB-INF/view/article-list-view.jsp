<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>My Post</title>
    <link rel="stylesheet" href="./css/site.css">
</head>
<body>
<header>
    <p>articles</p>
    <jsp:include page="/view/nav.jsp"/>
</header>
<div class="container">

    <h1>All post</h1>
    <hr>

    <div class="grid">

        <div class="card">
            <a href="./newArticle"><img class="card-header card-img" src="./assets/images/plus.png"></a>
            <div class="card-body">
                <h1 class="card-title">New Post</h1>
                <p>Click the image above to add a new article.</p>
            </div>
        </div>

        <c:forEach items="${articles}" var="article">
            <div class="card">
<%--                <img class="card-header card-img" src="./assets/images/${article.imageFilename}">--%>
                <div class="card-body">
                    <a href="./ArticleContent?id=${article.id}">
                        <h1 class="card-title">${article.title}</h1></a>
<%--                    <p>${article.content}</p>--%>
                </div>

                <form action="deleteArticle">
                    <button type="submit" name="id" value="${article.id}">delete!</button>
                </form>

                <form action="editArticle">
                    <button type="submit" name="id" value="${article.id}">edit</button>
                </form>
            </div>


        </c:forEach>

    </div>

</div>

</body>
</html>
