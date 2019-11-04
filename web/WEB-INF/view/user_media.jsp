<%--
  Display all media gallery
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">

<head>

    <!--- basic page needs
    ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show all images and video</title>

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/base.css" type="text/css">
    <link rel="stylesheet" href="css/vendor.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js" type="text/javascript"></script>
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
                    <li><a href="#0">Log out</a></li>
                    <li><a href="/user-signup">Sign up</a></li>
                </ul>
            </li>
        </ul> <!-- end header__nav -->

    </nav> <!-- end header__nav-wrap -->

</header> <!-- s-header -->

<section class="s-content s-content--top-padding s-content--narrow">

    <div class="row narrow">
        <div class="col-full s-content__header">
            <h1 class="display-1 display-1--with-line-sep">All images and video</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-full s-content__main">

    <c:forEach items="${fileNameList}" var="fileNameList" varStatus="vs">
        <div class="part">
            <%--<p>userId:${userId}</p>
            <p>fileName:${fileNameList}</p>--%>
            <img src="./assets/images/${fileNameList}">

        </div>
    </c:forEach>
    <c:forEach items="${videoNameList}" var="videoNameList" varStatus="vs">
        <div class="part">
            <%--<p>userId:${userId}</p>
            <p>videoName:${videoNameList}</p>--%>
            <video width="320" height="240" controls="controls">
                <source src="./assets/video/${videoNameList}" type="video/mp4" />
                <source src="./assets/video/${videoNameList}" type="video/ogg" />
                <source src="./assets/video/${videoNameList}" type="video/webm" />
            </video>
        </div>
    </c:forEach>
        </div> <!-- s-content__main -->
    </div> <!-- end row -->

</section>

<!-- s-footer
    ================================================== -->
<footer class="s-footer">
    <div>
        <p style="text-align: center"> This website is made with <i class="fa fa-heart" aria-hidden="true"></i> by NeverBeLate* team </p>
    </div>
    <div class="go-top">
        <a class="smoothscroll" title="Back to Top" href="#top"></a>
    </div>
</footer> <!-- end s-footer -->

<!-- Java Script
    ================================================== -->
<script type="text/javascript">
    function logoff(){
        var result = confirm("Are you sure to log off？");

        if(result){
            location.href="/tologoff";
        }
        setCookie("username", ' ', -1);
    }

    var setCookie = function (name, value, day) {
        if(day !== 0){     //当设置的时间等于0时，不设置expires属性，cookie在浏览器关闭后删除
            var expires = day * 24 * 60 * 60 * 1000;
            var date = new Date(+new Date()+expires);
            document.cookie = name + "=" + escape(value) + ";expires=" + date.toUTCString();
        }else{
            document.cookie = name + "=" + escape(value);
        }
    };
</script>

<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/plugins.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>

</body>
</html>
