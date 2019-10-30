<%--
  Created by IntelliJ IDEA.
  User: pjia958
  Date: 25/10/2019
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<br>

<a href="/startpage"> Start </a>      |
<a href="/user-login"> Login </a>      |
<a href="/updateInfo"> UserInfo</a>      |
<a href="/articles"> Articles </a>      |
<a href="/articlesByUsers"> Personal articles </a>      |
<a onclick="out()"> log off </a>
<p> hello: ${UserNameBySession}        your id is: ${UserIdBySession}</p>

<script type="text/javascript">
    function out(){
        var result = confirm("Are you sure to log off？");
        if(result){
            location.href="/tologoff";
        }
    }
</script>

<%--TODO:use js to show a username or nothing basic on the session content--%>