<%--
  Created by IntelliJ IDEA.
  User: pjia958
  Date: 28/10/2019
  Time: 3:28 PM
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
    <jsp:include page="/WEB-INF/view/nav.jsp"/>
</header>
<h1> ~~ Welcome to the user interface page ~~ </h1>
<p> Your true name is ${newAccountInfo.fname}   ${newAccountInfo.lname} </p>
<p></p>
<p></p>
<p></p>

</body>
</html>
