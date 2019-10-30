<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>My Post</title>
    <link rel="stylesheet" href="./css/site.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>


<div class="display-comments">

    <h2>Comments</h2>
    <c:forEach var="comment" items="${comments}">
        <c:if test="${comment.parentId == 0}">
            <p>User: ${comment.userId}</p>
            <p>${comment.content}</p>

            <form action="./new-nested-comment", method="get">
                <textarea name="content" id="new-nested-comment" placeholder="Write your comment here" rows="3"></textarea>
                <button type="submit" value="${comment.id}" name="parentId">New Comment</button>
            </form>
        </c:if>
    </c:forEach>

</div>

<script>

</script>

</body>
</html>
