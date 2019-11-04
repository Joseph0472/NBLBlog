<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html class="no-js" lang="en">
<head>
    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Edit Articles</title>

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

</head>
<body id="top">

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

        <form method="get" class="header__search-form" action="/search-article">
            <label>
                <span class="hide-content">Search for:</span>
                <input type="search" class="search-field" placeholder="Type Keywords" value="" name="search"
                       title="Search for:" autocomplete="off">
            </label>
            <input type="submit" class="search-submit" value="Search">
        </form>

        <a href="#0" title="Close Search" class="header__overlay-close">Close</a>

    </div>  <!-- end header__search -->

    <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
    <nav class="header__nav-wrap">

        <h2 class="header__nav-heading h6">Navigate to</h2>

        <ul class="header__nav">
            <li class="current"><a href="/articles" title="">Home</a></li>
            <li><a href="/newArticle" title="">Compose</a></li>
            <li class="has-children">
                <a href="/articles" title="">Articles</a>
                <ul class="sub-menu">
                    <li><a href="/articles">All articles</a></li>
                    <li><a href="/articlesByUsers">Your articles</a></li>
                </ul>
            </li>
            <li><a href="/updateInfo" title="">Profile</a></li>
            <li class="has-children">
                <a href="#0" title="">Gallery</a>
                <ul class="sub-menu">
                    <li><a href="/user_gallery">All</a></li>
                    <li><a href="/personal_gallery">Your gallery</a></li>
                </ul>
            </li>
            <li class="has-children">
                <a href="/user-login" title="">account</a>
                <ul class="sub-menu">
                    <li><a href="/user-login">Log in</a></li>
                    <li><a onclick="logoff()">Log out</a></li>
                    <li><a href="/user-signup">Sign up</a></li>
                </ul>
            </li>
        </ul> <!-- end header__nav -->

    </nav> <!-- end header__nav-wrap -->

</header> <!-- s-header -->

<section class="s-content s-content--top-padding">

    <div class="row narrow">

        <div class="col-full s-content__header">

            <h1 class="display-1 display-1--with-line-sep">Edit Article</h1>
        </div>
    </div>

    <div class="row narrow">
        <div class="s-content__main">

            <form action="changeArticle" method="post" enctype="multipart/form-data" class="contact-form">

                <div>
                    <label for="new-article-title">${article.title}</label>
                    <input type="text" name="title" class="full-width" id="new-article-title"
                           placeholder="New title here" required>
                </div>
                <div>
                    <label for="time">Publish time: </label>
                    <input type="date" id="date" name="time" value="">
                </div>
                <script>
                    defaultDate = document.querySelector('#date');
                    console.log(new Date())
                    defaultDate.valueAsDate = new Date();
                </script>
                <div>
                    <label for="new-article-image">New image: </label>
                    <input type="file" name="image" id="new-article-image">
                </div>
                <div>
                    <label for="new-article-body">New Content: </label>
                    <textarea name="content" id="new-article-body" placeholder="Your content here" rows="10"
                    >${article.content}</textarea>
                    <script>
                        new FroalaEditor('#new-article-body', {
                                requestWithCORS: true,
                                // Set the image upload URL.
                                imageUploadURL: '/upload_image',
                                videoUploadURL: '/upload_video',
                                audioUploadURL: '/upload_audio',
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
                                }
                            }
                        )

                    </script>
                </div>
                <br>
                <div>
                    <%--<p>the id is: ${article.id}</p>--%>
                    <button type="submit" name="id" value="${article.id}"
                            class="submit btn btn--primary btn--large full-width btn-space">Submit
                    </button>
                </div>
                <div>
                    <button type="reset" class="reset btn btn--large full-width">RESET</button>
                </div>
            </form>
        </div> <!-- s-content__main -->
    </div> <!-- end row -->
</section> <!-- end s-content -->

<!-- s-footer
    ================================================== -->
<footer class="s-footer">
    <div>
        <p style="text-align: center"> This website is made with <i class="fa fa-heart" aria-hidden="true"></i> by
            NeverBeLate* team </p>
    </div>
    <div class="go-top">
        <a class="smoothscroll" title="Back to Top" href="#top"></a>
    </div>
</footer> <!-- end s-footer -->

<!-- Java Script
================================================== -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>

<script type="text/javascript">
    function logoff() {
        var result = confirm("Are you sure to log off？");

        if (result) {
            location.href = "/tologoff";
        }
        setCookie("username", ' ', -1);
    }

    var setCookie = function (name, value, day) {
        if (day !== 0) {     //当设置的时间等于0时，不设置expires属性，cookie在浏览器关闭后删除
            var expires = day * 24 * 60 * 60 * 1000;
            var date = new Date(+new Date() + expires);
            document.cookie = name + "=" + escape(value) + ";expires=" + date.toUTCString();
        } else {
            document.cookie = name + "=" + escape(value);
        }
    };
</script>

</body>
</html>
