﻿<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html class="no-js" lang="en">
<head>
	<!--- basic page needs
    ================================================== -->
	<meta charset="UTF-8">
	<title>User Login</title>
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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://www.google.com/recaptcha/api.js?render=6Lcqnr8UAAAAAJEM7cFLvmTAQHUHorvyMVLVRw0L"></script>
	<script>
		grecaptcha.ready(() => {
			console.log('1. grecaptcha.ready');
			grecaptcha.execute('6Lcqnr8UAAAAAJEM7cFLvmTAQHUHorvyMVLVRw0L', {action: 'check'}).then((token) => {
				document.getElementById("g-recaptcha-response").value = token;
				console.log('3. Get token from reCAPTCHA service => ', token);
				console.log('4. Verifying Bot...');
				$.ajax({
							type: "post",
							url: "check",
							data: {"token": token},
							success: (res) => {
								console.log(res);
								if (parseFloat(res)<=0.5){
									console.log("robot");
									window.location = './robot';
								}
							}

						}
				);

			});
		})
	</script>
	<script>
		// onload function should be added in order to check the
		function checkLogon() {
			var name = document.getElementById("username").value;
			var pass = document.getElementById("password").value;

			if ((name == null || name == "") || (pass == null || pass == "")) {
				alert("Warning: Empty username or password");
			} else {
				if (true) {
					alert("Login Success!");
					window.location.href = "login-result.jsp";
				} else {
					alert("Wrong username or password.");
				}
			}
		}

	</script>
	<script>
		function setUsernameCookie() {
			let value = document.querySelector('#username').value;
			document.cookie = "value=" + value + "; path=/";
		}
	</script>
</head>

<body>

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
			<form class="form" action="/login-result" method="post">
				<fieldset>
					<label for="username">Username: </label>
					<input type="text" name="username" id="username" class="full-width" placeholder="Username">

					<label for="password">Password:</label>
					<input type="password" name="password" id="password" class="full-width" placeholder="Password">

					<button type="submit" id="login-button" class="submit btn btn--primary btn--large full-width" onclick="setUsernameCookie()">
						LOG IN
					</button>
					<a href="/user-signup" id="signup-button" class="btn btn-warning btn--large full-width" role="button">
						NOT A USER? SIGN UP HERE
					</a>
				</fieldset>
			</form>
			<form action="/check" method="post">
				<input type="text" id="g-recaptcha-response">
			</form>
		</div> <!-- s-content__main -->
	</div> <!-- end row -->
</section> <!-- end s-content -->

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
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>

</body>
</html>