<%--
  Created by IntelliJ IDEA.
  User: Zorro
  Date: 2019/10/22
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<html>
<head>
    <title>SignUp</title>
</head>
<body>
<header>
    <p>user sign up</p>
<jsp:include page="/WEB-INF/view/nav.jsp"/>
</header>
<h1>Please Sign-Up your account: </h1>


<form class="form" action="/signupServlet" method="post">
    <p>Please input your username: </p>
    <input type="text" name="username" id="username" placeholder="Username" onblur="checkUsername()">
    <span id="warning" color="red">*</span>
    <p>Please input your password: </p>
    <input type="password" name="password" id="password" placeholder="Password">
    <p>Input your password again: </p>
    <input type="password" name="password" id="" placeholder="Password verify">

    <br>
    <br>
    <button type="submit" id="signup-button">Sign up!</button>
</form>

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
</body>
</html>
