<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html class="no-js" lang="en">>
<head>
    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>My Articles</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/vendor.css">
    <link rel="stylesheet" href="css/main.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>

    <link href="./froala-editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="./froala-editor/js/froala_editor.pkgd.min.js"></script>
    <link href="./froala-editor/css/plugins/image.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="./froala-editor/js/plugins/image.min.js"></script>
    <link href="./froala-editor/css/plugins/image_manager.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="./froala-editor/js/plugins/image_manager.min.js"></script>
    <link href="./froala-editor/css/plugins/video.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="./froala-editor/js/plugins/video.min.js"></script>
    <link href="./froala-editor/css/third_party/embedly.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="./froala-editor/js/third_party/embedly.min.js"></script>
    <script type="text/javascript" src="./froala-editor/js/plugins/font_family.min.js"></script>
    <script type="text/javascript" src="./froala-editor/js/plugins/font_size.min.js"></script>

    <style>
        .btn-space {
            margin-top: 30px;
        }
    </style>

</head>
<body id="top">
<%--<header>
    <jsp:include page="/WEB-INF/view/nav.jsp"/>
</header>--%>

<!-- preloader
    ================================================== -->
<div id="preloader">
    <div id="loader" class="dots-fade">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>

<!-- header
    ================================================== -->
<header class="s-header header">

    <div class="header__logo">
        <a class="logo" href="/articles">
            <img src="assets/images/logo.png" alt="Homepage">
        </a>
    </div> <!-- end header__logo -->

    <a class="header__search-trigger" href="#0"></a>
    <div class="header__search">

        <form role="search" method="get" class="header__search-form" action="#">
            <label>
                <span class="hide-content">Search for:</span>
                <input type="search" class="search-field" placeholder="Type Keywords" value="" name="s"
                       title="Search for:" autocomplete="off">
            </label>
            <input type="submit" class="search-submit" value="Search">
        </form>

        <a href="#0" title="Close Search" class="header__overlay-close">Close</a>

    </div>  <!-- end header__search -->

    <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
    <nav class="header__nav-wrap">

        <ul class="header__nav">
            <li class="current"><a href="/articles" title="">Home</a></li>
            <li><a href="/newArticle" title="">Compose</a></li>
            <li><a href="/startpage" title="">Start</a></li>
            <li class="has-children">
                <a href="#0" title="">Account</a>
                <ul class="sub-menu">
                    <li><a href="/updateInfo">UPDATE ACCOUNT</a></li>
                    <li><a href="/articlesByUsers">YOUR ARTICLES</a></li>
                </ul>
            </li>
            <li><a href="/articles" title="">All Articles</a></li>
            <li><a href="/user-login" title="">Log In</a></li>
        </ul> <!-- end header__nav -->

    </nav> <!-- end header__nav-wrap -->

</header> <!-- s-header -->

<section class="s-content s-content--top-padding">

    <div class="row narrow">

        <div class="col-full s-content__header">

            <h1 class="display-1 display-1--with-line-sep">New Article</h1>
        </div>
    </div>

    <div class="row narrow">
        <div class="s-content__main">

            <form action="changeArticle" method="post" enctype="multipart/form-data">

                <div>
                    <h5>TITLE: </h5>
                    <label for="new-article-title">${article.title}</label>
                    <input type="text" name="title" class="full-width" id="new-article-title"
                           placeholder="input new title" required>
                </div>
                <div>
                    <label for="time" class="display-4">PUBLISH TIME: </label>
                    <input type="date" id="date" name="time" value="">
                </div>
                <script>
                    defaultDate = document.querySelector('#date');
                    console.log(new Date())
                    defaultDate.valueAsDate = new Date();
                </script>
                <div>
                    <label for="new-article-image" class="display-4">SELECT NEW IMAGE: </label>
                    <input type="file" name="image" id="new-article-image">
                </div>
                <div>
                    <label for="new-article-body" class="display-4">NEW CONTENT: </label>
                    <textarea name="content" id="new-article-body" placeholder="Your content here" rows="10"
                    >${article.content}</textarea>
                    <script>
                        new FroalaEditor('#new-article-body', {
                            requestWithCORS: true,
                            // Set the image upload URL.
                            imageUploadURL: '/upload_image',
                            videoUploadURL:'/upload_video',
                            audioUploadURL:'/upload_audio',
                            imageUploadParams: {
                                id: 'my_editor'
                            },
                            events: {
                                'image.beforeUpload': function (images) {
                                    // Return false if you want to stop the image upload.
                                },
                                // 'image.uploaded': function (response) {
                                //     sleep(5000)
                                //     // Image was uploaded to the server.
                                // },
                            }}
                        )

                    </script>
                </div>

                <div>
                    <%--<p>the id is: ${article.id}</p>--%>
                    <button type="submit" name="id" value="${article.id}"
                            class="submit btn btn--primary btn--large full-width btn-space">Submit
                    </button>
                </div>
            </form>
        </div> <!-- s-content__main -->
    </div> <!-- end row -->
</section> <!-- end s-content -->

<!-- Java Script
================================================== -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>

</body>
</html>
