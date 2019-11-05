<%--
  Created by IntelliJ IDEA.
  User: Zorro
  Date: 2019/10/22
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<html class="no-js" lang="en">
<head>
    <!--- basic page needs
        ================================================== -->
    <meta charset="utf-8">
    <title>Sign up</title>

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link href="./froala-editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/css/avatar.css">

    <link rel="stylesheet" href="css/base.css" type="text/css">
    <link rel="stylesheet" href="css/vendor.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">

    <!-- script
    ================================================== -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
            <li><a href="/newArticle" title="">New</a></li>
            <li class="has-children">
                <a href="/articles" title="">Articles</a>
                <ul class="sub-menu">
                    <li><a href="/articles">All articles</a></li>
                    <li><a href="/articlesByUsers">Your articles</a></li>
                </ul>
            </li>
            <li class="has-children">
                <a href="/updateInfo" title="">Profile</a>
                <ul class="sub-menu">
                    <li><a href="/showInfo?id=${UserIdBySession}">Your Profile</a></li>
                    <li><a href="/updateInfo">Update Profile</a></li>
                </ul>
            </li>
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

<section class="s-content s-content--top-padding s-content--narrow">

    <div class="row narrow">
        <div class="col-full s-content__header">
            <h1 class="display-1 display-1--with-line-sep">Welcome to NeverBeLate*</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-full s-content__main">
            <form class="form" action="/signupServlet" method="post">
                <fieldset>
                    <label for="username">Username: </label>
                    <input type="text" name="username" id="username" onblur="checkUsername()" class="full-width">
                    <div id="warning" class="alert-box alert-box--success hideit">
                        <p>Recommend to use letters and numbers</p>
                        <i class="fa fa-times alert-box__close"></i>
                    </div>
                    <label for="password">Please input your password: </label>
                    <input type="password" name="password" id="password" class="full-width">
                    <div class="alert-box alert-box--success hideit">
                        <p>We are keeping your account safe and secure!</p>
                        <i class="fa fa-times alert-box__close"></i>
                    </div>
                    <label for="password">Please input your password again: </label>
                    <input type="password" name="password" id="" class="full-width" placeholder="Password verify">

                    <button type="submit" id="signup-button" class="submit btn btn--primary btn--large full-width">Sign up</button>
                </fieldset>
            </form>
        </div> <!-- s-content__main -->
    </div> <!-- end row -->

</section> <!-- end s-content -->

<script>
    function checkUsername() {
        $.ajax({
            type:"get",
            url:"/check-username",
            data:{username: $("#username").val()},
            dataType:"text",
            success: function (username) {
                $("#warning").text(username);
            }
        })
    }
</script>

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

</body>
</html>
