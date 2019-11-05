<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  This page shows search result
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Home</title>

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
                    <li><a onclick="out()">Log out</a></li>
                    <li><a href="/user-signup">Sign up</a></li>
                </ul>
            </li>
        </ul> <!-- end header__nav -->

    </nav> <!-- end header__nav-wrap -->

</header> <!-- s-header -->

<section class="s-content s-content--top-padding s-content--narrow">

    <div class="row narrow">
        <div class="col-full s-content__header">
            <h1 class="display-1 display-1--with-line-sep">Search Results</h1>
        </div>
    </div>

    <div class="row narrow">
        <div class="col-full s-content__header">
            <form action="/search-article" method="get">
                <input id="name-and-title" type="search" name="search" class="full-width" value="${input}">
                <input type="radio" name="keyword" value="title">Title
                <input type="radio" name="keyword" value="username">Author
                <button type="submit">Search</button>
            </form>
        </div>
    </div>

    <div  class="row narrow">
        <div class="col-full s-content__header">
            <form action="/search-article" method="get">
                <div class="col-six tab-full" style="left: 235px;position: relative;top: -36px;">
                    <label for="time"></label>
                    <input type="date" id="date" name="time" value="">
                    <button type="submit">Search</button>
                    <script>
                        defaultDate = document.querySelector('#date');
                        console.log(new Date())
                        defaultDate.valueAsDate = new Date();
                    </script>
                </div>
            </form>
        </div>
    </div>

    <div class="row narrow">
        <div class="col-full s-content__header">
            <div class="sort">
                <form action="/sort-article" method="get">
                    <div id="option"> Sort By:
                        <input type="radio" name="keyword-sort" value="username">Author
                        <input type="radio" name="keyword-sort" value="title">Article Title
                        <input type="radio" name="keyword-sort" value="time">Publish time
                        <button type="submit">Sort</button>
                    </div>
                    <script>
                        defaultDate = document.querySelector('#date-sort');
                        console.log(new Date())
                        defaultDate.valueAsDate = new Date();
                    </script>
                </form>
            </div>
        </div>
    </div>

    <div id="display-article" class="row">
        <div class="col-full s-content__main">
            <c:if test="${empty articlesBySearch}">
                No search result found with your input ;-(
            </c:if>

            <c:forEach var="articles" items="${articlesBySearch}">
                <a href="./ArticleContent?id=${articles.id}">
                    <p class="card-title">Title: ${articles.title}</p></a>
                <p>Created by: ${articles.username}</p>
                <p>Date created: ${articles.date}</p>
                <hr>
            </c:forEach>
        </div>
    </div>

</section>

<!-- s-footer
    ================================================== -->
<footer class="s-footer">
    <div class="s-footer__main">
        <p style="text-align: center"> This website is made with <i class="fa fa-heart" aria-hidden="true"></i> by
            NeverBeLate* team </p>
    </div>
    <div class="go-top">
        <a class="smoothscroll" title="Back to Top" href="#top"></a>
    </div>
</footer> <!-- end s-footer -->

<!-- Java Script
    ================================================== -->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/plugins.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>

</body>
</html>
