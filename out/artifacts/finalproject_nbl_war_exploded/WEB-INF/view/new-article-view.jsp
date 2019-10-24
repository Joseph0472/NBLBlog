<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>My Articles</title>
    <link rel="stylesheet" href="./css/site.css">
    <link href="./froala-editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./froala-editor/js/froala_editor.pkgd.min.js"></script>
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
                      ></textarea></div>
        <script>
            var editor = new FroalaEditor('#new-article-body');
        </script>


        <div>
            <button type="submit">Submit</button>
        </div>

    </form>

</div>

</body>
</html>
