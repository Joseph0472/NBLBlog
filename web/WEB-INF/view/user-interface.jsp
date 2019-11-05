<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="en">
<head>
    <!--- basic page needs
        ================================================== -->
    <meta charset="utf-8">
    <title>Update Account</title>

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link href="./froala-editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/avatar.css">
    <link rel="stylesheet" href="css/base.css" type="text/css">
    <link rel="stylesheet" href="css/vendor.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">

    <style>
        .btn {
            transition-duration: 0.4s;
            cursor: pointer;
            padding: 8px 15px;
        }

        .btn:hover {
            background-color: #eff5f5;
            color: #024a26;
        }

        #iconModal img {
            height: 150px;
            width: 150px;
        }
    </style>

    <!-- script
    ================================================== -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/modernizr.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="jquery-3.4.1.min.js"></script>

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

<!-- s-content
================================================== -->
<section class="s-content s-content--top-padding s-content--narrow">

    <div class="row narrow">
        <div class="col-full s-content__header">
            <h1 class="display-1 display-1--with-line-sep">Account Info</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-full s-content__main">

                    <div>
                        <p></p><img src="./assets/avatars/${UserInfo.avatarFileName}" height="200" width="200">
                    </div>
                    <div>
                        <label for="fname">Name</label>
                        <p id="fname"> ${UserInfo.fname} ${UserInfo.lname}</p>
                    </div>
                    <div>
                        <label for="email">Email Address</label>
                        <p id="email">${UserInfo.emailAddress}</p>
                    </div>
                    <div>
                        <label for="phonenum">Phone</label>
                        <p id="phonenum">${UserInfo.phoneNum}</p>
                    </div>
                    <div>
                        <label>Date of Birth</label>
                        <p>${UserInfo.dob}</p>
                    </div>
                    <%--date here should be handled as String--%>
                    <div>
                        <label>Country</label>
                        <p>${UserInfo.country}</p>
                    </div>
                    <div>
                        <label for="description">Description</label>
                        <p id="description" >${UserInfo.description}</p>
                    </div>

                    <%--        <p>Choose a avatar or update your own one</p><input type="file" name="avatar" accept="image/png, image/jpeg" />--%>
                    <%--<p><time hidden name="timestamp" value="gettimestamp()">time</time></p>--%>

                    <input type="hidden" id="imgSrc" name="imgSrc">
        </div> <!-- s-content__main -->
    </div> <!-- end row -->

    <input type="hidden" id="userid" value="${UserIdBySession}">

</section> <!-- end s-content -->

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
