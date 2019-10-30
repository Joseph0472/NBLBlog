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
    <link href="./froala-editor/css/plugins/image.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./froala-editor/js/plugins/image.min.js"></script>
    <link href="./froala-editor/css/plugins/image_manager.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./froala-editor/js/plugins/image_manager.min.js"></script>
    <link href="./froala-editor/css/plugins/video.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./froala-editor/js/plugins/video.min.js"></script>
    <link href="./froala-editor/css/third_party/embedly.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./froala-editor/js/third_party/embedly.min.js"></script>
    <script type="text/javascript" src="./froala-editor/js/plugins/font_family.min.js"></script>
    <script type="text/javascript" src="./froala-editor/js/plugins/font_size.min.js"></script>
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
            <label for="time">publish time</label><br>
            <input type="date" id="date" name="time" value="">
        </div>
        <script>
            defaultDate = document.querySelector('#date');
            console.log(new Date())
            defaultDate.valueAsDate = new Date();
        </script>

        <div>
            <label for="new-article-image">select new image:</label><br>
            <input type="file" name="image" id="new-article-image" >
        </div>
        <div>
            <label for="new-article-body">Content:</label><br>
            <textarea name="content" id="new-article-body"  placeholder="Your content here" rows="10"
            >${article.content}</textarea>
            <script>
                new FroalaEditor('#new-article-body', {
                    imageUploadURL: '/upload_image'
                })
            </script>

        </div>

        <div>
            <p>the id is: ${article.id}</p>
            <button type="submit" name="id" value="${article.id}" >Submit</button>
        </div>

    </form>

</div>


</body>
</html>
