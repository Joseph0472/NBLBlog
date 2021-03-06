<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html class="no-js" lang="en">
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>My Post</title>

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="/css/base.css" type="text/css">
    <link rel="stylesheet" href="/css/vendor.css" type="text/css">
    <link rel="stylesheet" href="/css/main.css" type="text/css">
    <%--<link rel="stylesheet" href="./css/comment.css" type="text/css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js" type="text/javascript"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


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

</header> <!-- s-header -->

<!-- s-content
================================================== -->
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
                    <a href="#0">${article.username}</a>
                </li>
            </ul>
        </div>

        <div class="entry__media col-full">
            <div class="entry__post-thumb">
                <%--${article.imageFilename}--%>
                <c:if test="${article.imageFilename != null}">
                    <img style="display: block; margin: 0 auto; " src="../assets/images/${article.imageFilename}"
                         srcset="../assets/images/${article.imageFilename} 2000w,
                             ../assets/images/${article.imageFilename} 1000w
                             ../assets/images/${article.imageFilename} 500w"
                         sizes="(max-width: 2000px) 100vw, 2000px" alt="">
                </c:if>
            </div>
        </div>

        <div class="col-full entry__main">
            <p>${article.content}</p>
        </div><!-- s-entry__main -->

    </article><!-- end entry/article -->
    <!--
    ===============================================================================================================-->

    <div class="comments-wrap">

        <div id="comments" class="row">
            <div class="col-full">

                <h3 class="h2">Comments</h3>

                <!-- START commentlist -->
                <ol class="commentlist">
<c:forEach var="p_comments" items="${p_comments}">
                    <li class="thread-alt depth-1 comment">

                        <div class="comment__avatar">
                            <img class="avatar" src="./assets/avatars/${p_comments.avatarFilename}" alt="" width="50" height="50">
                        </div>

                        <div class="comment__content">

                            <div class="comment__info">
                                <div class="comment__author">UserName:${p_comments.username}</div>

                                <div class="comment__meta">
                                    <div class="comment__time">Date:${p_comments.date}</div>
                                    <div class="comment__reply">
                                        <div style="display: inline-block">
                                            <a href="./replyServlet?p_comments_id=${p_comments.id}"
                                               class="item-entry__thumb-link">Reply</a>
                                        </div>
                                        <div style="display: inline-block">
                                            <c:if test="${p_comments.userId == UserIdBySession || article.userId ==
                                        UserIdBySession}">
                                                <a href="./deleteCommentServlet?p_comments_id=${p_comments.id}"
                                                   class="item-entry__thumb-link">Delete</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="comment__text">
                                <p>${p_comments.content}</p>
                            </div>

                        </div>
    <c:forEach var="c_comments" items="${c_comments}">
        <c:if test="${c_comments.parentId == p_comments.id}">
                        <ul class="children" style="margin-left: 70px">

                            <li class="depth-2 comment">

                                <div class="comment__avatar" style=" left: 50px">
                                    <img class="avatar" src="./assets/avatars/${c_comments.avatarFilename}" alt="" width="50" height="50">
                                </div>

                                <div class="comment__content">

                                    <div class="comment__info">
                                        <div class="comment__author">UserName:${c_comments.username}</div>

                                        <div class="comment__meta">
                                            <div class="comment__time">Date:${c_comments.date}</div>
                                            <c:if test="${c_comments.userId == UserIdBySession || article.userId == UserIdBySession}">
                                                <a href="./deleteCommentServlet?c_comments_id=${c_comments.id}"
                                                   class="item-entry__thumb-link">Delete</a>
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="comment__text">
                                        <p>${c_comments.content}</p>
                                    </div>

                                </div>

                            </li>

                        </ul>
        </c:if>
    </c:forEach>

                    </li> <!-- end comment level 1 -->
    <hr>
</c:forEach>

                </ol>
                <!-- END commentlist -->

            </div> <!-- end col-full -->
        </div> <!-- end comments -->


    <!--
    ===============================================================================================================-->
        <div class="row comment-respond">

            <!-- START respond -->

            <h3 class="h2">Add Comment</h3>


            <form action="./ArticleContent" method="post" autocomplete="off" name="contactForm" id="contactForm">
                <fieldset>
                    <textarea name="content" placeholder="Write your comment here" class="full-width"></textarea>
                    <%--<ul>
                        <li><a title="" data-toggle="tooltip" data-placement="bottom"
                               data-original-title="Audio"><i class="fa fa-music"></i></a></li>
                        <li><a title="" data-toggle="tooltip" data-placement="bottom"
                               data-original-title="Video"><i class="fa fa-video-camera"></i></a></li>
                        <li><a title="" data-toggle="tooltip" data-placement="bottom"
                               data-original-title="Sound Record"><i class="fa fa-microphone"></i></a></li>
                        <li><a title="" data-toggle="tooltip" data-placement="bottom"
                               data-original-title="Picture"><i class="fa fa-picture-o"></i></a></li>
                    </ul>--%>
                    <button type="submit" class="btn btn--primary btn-wide btn--large full-width" name="articleId"
                            value="${article.id}"
                    ></i>Add Comment
                    </button>
                </fieldset>
            </form><!-- end form -->

        </div>
        <!-- END respond-->

    </div> <!-- end comment-respond -->

    </div> <!-- end comments-wrap -->
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
