<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html class="no-js" lang="en">>
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>All Article</title>
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

        <h2 class="header__nav-heading h6">Navigate to</h2>

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

<div class="container">

    <%--<h1>All post</h1>

    <div class="grid">

        &lt;%&ndash;<div class="card">
            &lt;%&ndash;<a href="./newArticle"><img class="card-header card-img" src="./assets/images/plus.png"
                                        style="height: 70px; width: 70px"></a>
            <div class="card-body">
                <h1 class="card-title">New Post</h1>
                <p>Click the image above to add a new article.</p>
            </div>&ndash;%&gt;
        </div>&ndash;%&gt;
        <form action="searchArticle">
            <label for="search">search</label><br>
            <input type="text" name="search" id="search" placeholder="Your search content here">
            <button type="submit" name="search">submit</button>
        </form>
    </div>--%><!-- end new article button and search button -->

    <section class="s-content">
        <div class="row entries-wrap wide">
            <div class="entries">
                <c:forEach items="${articles}" var="article">
                    <article class="col-block">
                        <div class="item-entry" data-aos="zoom-in">
                            <c:set var="currentTime" value="<%= System.currentTimeMillis()%>"></c:set>
                            <c:if test="${article.date.getTime()-currentTime <= 0}">
                                <%--                <img class="card-header card-img" src="./assets/images/${article.imageFilename}">--%>
                            <div class="item-entry__thumb">
                                <a href="./ArticleContent?id=${article.id}" class="item-entry__thumb-link">
                                    <img src="./assets/images/${article.imageFilename}"
                                         srcset="./assets/images/${article.imageFilename} 1x, ./assets/images/${article.imageFilename} 2x"
                                         alt="">
                                </a>
                                    <%--                    <p>${article.content}</p>--%>
                            </div>

                            <div class="item-entry__text">

                                <a href="./ArticleContent?id=${article.id}">
                                    <h1 class="item-entry__title">${article.title}</h1></a>
                                    <%--                    <p>${article.content}</p>--%>
                            </div>

                            <div class="entry__header col-full">
                                <a href="#0">${article.userFullName}</a>
                            </div>

                            <div class="item-entry__date">
                                <a href="#0">${article.date}</a>
                            </div>
                                <%--<form action="deleteArticle">
                                        <button type="submit" name="id" value="${article.id}">delete!</button>
                                    </form>

                                    <form action="editArticle">
                                        <button type="submit" name="id" value="${article.id}">edit</button>
                                    </form>--%>
                        </div>
                        </c:if>
                    </article>
                </c:forEach>
            </div>
        </div>
    </section>
</div>

<!-- Java Script
    ================================================== -->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/plugins.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>

</body>
</html>
