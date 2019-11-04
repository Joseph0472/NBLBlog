<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html class="no-js" lang="en">
head>

<!--- basic page needs
================================================== -->
<meta charset="utf-8">
<title>All Article</title>

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
                    <li><a onclick="logoff()">Log out</a></li>
                    <li><a href="/user-signup">Sign up</a></li>
                </ul>
            </li>
        </ul> <!-- end header__nav -->

    </nav> <!-- end header__nav-wrap -->

</header> <!-- s-header -->

<%--<c:if test = "${UserIdBySession >0}">--%>

<%--<h1>All post</h1>
<hr>

<div class="grid">

    <div class="card">
        <a href="./newArticle"><img class="card-header card-img" src="./assets/images/plus.png"></a>
        <div class="card-body">
            <h1 class="card-title">New Post</h1>
            <p>Click the image above to add a new article.</p>
        </div>
</div>--%>
<% Long nowDate = new Date().getTime();
    System.out.println(nowDate);%>

<section class="s-content">
    <div class="row entries-wrap wide">
        <div class="entries">
            <c:forEach items="${articlesByUser}" var="articles">
                <article class="col-block">
                    <div class="item-entry" data-aos="zoom-in">
                            <%--<c:set var="currentTime" value="<%= System.currentTimeMillis()%>"></c:set>
                            <c:if test="${article.date.getTime()-currentTime <= 0}">--%>
                            <%--                <img class="card-header card-img" src="./assets/images/${article.imageFilename}">--%>
                        <div class="item-entry__thumb">
                            <a href="./ArticleContent?id=${articles.id}" class="item-entry__thumb-link">
                                <img src="./assets/images/${articles.imageFilename}"
                                     srcset="./assets/images/${articles.imageFilename} 1x,
                                      ./assets/images/${articles.imageFilename} 2x"
                                     alt="">
                            </a>
                                <%--                    <p>${article.content}</p>--%>
                        </div>

                        <div class="item-entry__text">

                            <a href="./ArticleContent?id=${articles.id}">
                                <h1 class="item-entry__title">${articles.title}</h1></a>
                                <%--                    <p>${article.content}</p>--%>
                        </div>

                        <form action="editArticle" style="margin-bottom: 0">
                            <button type="submit" name="id" value="${articles.id}"
                                    class="btn btn--stroke full-width">
                                Edit
                            </button>
                        </form>

                        <form action="deleteArticle" style="margin-bottom: 0">
                            <button type="submit" name="id" value="${articles.id}"
                                    class="btn btn--stroke full-width">
                                Delete!
                            </button>
                        </form>

                        <div class="item-entry__date">
                            <a href="#0">${articles.date}</a>
                        </div>

                    </div>
                        <%--</c:if>--%>
                </article>
            </c:forEach>
        </div>
    </div>
</section>

<%--</c:if>--%>

<%--<c:if test = "${UserIdBySession == null}">--%>
<%--    <a href="/userlogin"><h3>please log in</h3></a>--%>
<%--</c:if>--%>

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
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/plugins.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>

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

</body>
</html>
