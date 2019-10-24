<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>My Articles</title>
    <link rel="stylesheet" href="./css/site.css">
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

</head>
<body>

<div class="container">

    <h1>New Article</h1>
    <hr>

    <form action="./newArticle" method="post" enctype="multipart/form-data">

        <div>
            <label for="new-article-title">Title:</label><br>
            <input type="text" name="title" id="new-article-title" placeholder="Your title here" required>
        </div>
        <div>
            <label for="new-article-image">Image:</label><br>
            <input type="file" name="image" id="new-article-image" >
        </div>
        <div>
            <label for="new-article-body">Content:</label><br>
            <textarea name="content" id="new-article-body" placeholder="Your content here" rows="10"
                      required></textarea>
        </div>
        <div>
            <button type="submit">Submit</button>
        </div>

    </form>

</div>

</body>
</html>
