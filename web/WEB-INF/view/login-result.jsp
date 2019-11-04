<%--
  Created by IntelliJ IDEA.
  User: Zorro
  Date: 2019/10/22
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
</header>
<h1>Login success...</h1>
<%--<p>Hello: ${UserNameBySession}, your user id is: ${UserIdBySession}</p>--%>
<input type="hidden" id="UsernameCookie" value="${UserNameBySession}">
<input type="hidden" id="LoginStatusBySession" value="${LoginStatusBySession}">
</p>
<meta http-equiv="refresh" content="0;url=/articles">
<script>
    window.addEventListener("load", function setUsernameCookie() {

        let loginstatus = document.querySelector('#LoginStatusBySession')
        if (loginstatus == true) {
            let username = document.querySelector('#usernameCookie').value;
            document.cookie = "username=" + username + "; path=/";
        }
    });
</script>
</body>
</html>
