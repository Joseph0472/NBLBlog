<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>My Articles</title>
    <link rel="stylesheet" href="./css/site.css">
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/view/nav.jsp"/>
</header>
<div class="container">

    <h1>New Article</h1>
    <hr>

    <form action="changeArticle"  method="post" enctype="multipart/form-data">

        <div>
            <label for="new-article-title">Title:${article.title}</label><br>
            <input type="text" name="title" id="new-article-title" placeholder="input new title" required>
        </div>
        <div>
            <label for="new-article-image">select new image:</label><br>
            <input type="file" name="image" id="new-article-image" >
        </div>
        <div>
            <label for="new-article-body">Content:</label><br>
            <textarea name="content" id="new-article-body"  placeholder="Your content here" rows="10"
                      required>${article.content}</textarea>
        </div>
        <div>
            <p>the id is: ${article.id}</p>
            <button type="submit" name="id" value="${article.id}" >Submit</button>
        </div>

    </form>

</div>

</body>
</html>
