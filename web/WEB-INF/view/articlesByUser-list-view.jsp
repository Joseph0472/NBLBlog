<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>My Post</title>
    <meta name="description" content="">
    <meta name="author" content="">

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

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">

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
<%--<header>
    <jsp:include page="/WEB-INF/view/nav.jsp"/>
</header>--%>
<section class="s-content s-content--top-padding s-content--narrow">

    <article class="row entry format-standard">

        <div class="entry__header col-full">
            <h1 class="entry__header-title display-1">
                ${article.title}
            </h1>
            <ul class="entry__header-meta">
                <li class="date">${article.date}</li>
                <li class="byline">
                    By
                    <a href="#0">${article.userFullName}</a>
                </li>
            </ul>
        </div>

        <%--        <div class="card">--%>
        <%--            <a href="./newArticle"><img class="card-header card-img" src="./assets/images/plus.png"></a>--%>
        <%--            <div class="card-body">--%>
        <%--                <h1 class="card-title">New Post</h1>--%>
        <%--                <p>Click the image above to add a new article.</p>--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <%--        <c:forEach items="${articles}" var="article">--%>
        <div class="entry__media col-full">
            <div class="entry__post-thumb">
                <%--${article.imageFilename}--%>
                <c:if test="${article.imageFilename != null}">
                    <img src="./assets/images/${article.imageFilename}"
                         srcset="./assets/images/${article.imageFilename} 2000w,
                             ./assets/images/${article.imageFilename} 1000w
                             ./assets/images/${article.imageFilename} 500w"
                         sizes="(max-width: 2000px) 100vw, 2000px" alt="">
                </c:if>
            </div>
        </div>

        <div class="col-full entry__main">
            <p>${article.content}
            </p>
        </div><!-- s-entry__main -->

    </article><!-- end entry/article -->

    <%--            <div class="card">--%>
    <%--                <a href="./newArticle"><img class="card-header card-img" src="./assets/images/plus.png"></a>--%>
    <%--                <div class="card-body">--%>
    <%--                    <h1 class="card-title">New Post</h1>--%>
    <%--                    <p>Click the image above to add a new article.</p>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </c:forEach>--%>
    <div class="row">
        <div class="col-full s-content__main">
            <jsp:include page="/WEB-INF/view/nested-comment-view.jsp"/>

            <form action="./newcomment" , method="get" class="comment-form">
                <fieldset>
                    <div>
                        <label for="new-comment-body"></label>
                        <textarea name="content" id="new-comment-body" class="full-width" placeholder="Write your comment here" rows="10"
                                  required></textarea>
                        <br>
                        <button type="submit" class="submit btn btn--primary btn--large full-width">Submit</button>
                        <button type="reset" class="reset btn btn--info btn--large full-width">Clear</button>
                    </div>
                </fieldset>
            </form>
        </div> <!-- s-content__main -->
    </div><!-- end row -->
</section><!-- end s-extra -->

<!-- Java Script
    ================================================== -->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/plugins.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>

</body>
</html>
