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
    <jsp:include page="/view/nav.jsp"/>
</header>
<h1>Your name and login status:</h1>
<p>Hello: ${UserNameBySession}, your user id is: ${UserIdBySession}</p>
</p>
</body>
</html>
