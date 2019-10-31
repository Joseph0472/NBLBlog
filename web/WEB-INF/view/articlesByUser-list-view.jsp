<%@ page import="java.util.Date" %>
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
    <jsp:include page="/WEB-INF/view/nav.jsp"/>
</header>
<%--<c:if test = "${UserIdBySession >0}">--%>
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
            <% Long nowDate = new Date().getTime();
                System.out.println(nowDate);%>
            <c:forEach items="${articlesByUser}" var="articles">
<%--                <c:set var="currentTime" value="<%= System.currentTimeMillis()%>"></c:set>--%>
<%--                <c:if test = "${articles.date.getTime()-currentTime <= 0}">--%>

                <div class="card">
                        <%--                <img class="card-header card-img" src="./assets/images/${article.imageFilename}">--%>
                    <div class="card-body">

                        <h2>date ${nowDate}</h2>
                        <h2>articles.id ${articles.id}</h2>
                        <a href="./ArticleContent?id=${articles.id}">
                            <h1 class="card-title">${articles.title}</h1></a>
                        <h2>${articles.userId}</h2>
                            <%--                    <p>${article.content}</p>--%>
                    </div>

                    <form action="deleteArticle">
                        <button type="submit" name="id" value="${articles.id}">delete!</button>
                    </form>

                    <form action="editArticle">
                        <button type="submit" name="id" value="${articles.id}">edit</button>
                    </form>
                </div>

<%--            </c:if>--%>
            </c:forEach>

        </div>

    </div>
<%--</c:if>--%>

<%--<c:if test = "${UserIdBySession == null}">--%>
<%--    <a href="/userlogin"><h3>please log in</h3></a>--%>
<%--</c:if>--%>
</body>
</html>
