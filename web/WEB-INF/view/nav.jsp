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
<a href="/updateInfo"> UpdateUserInfo</a>      |
<a href="/showInfo?id=${UserIdBySession}"> CheckUserInfo</a>      |
<a href="/articles"> Articles </a>      |
<a href="/articlesByUsers"> Personal articles </a>      |
<a onclick="logoff()"> log off </a>
<p> hello: ${UserNameBySession}        your id is: ${UserIdBySession}   login status: ${LoginStatusBySession}</p>

<script type="text/javascript">
    function logoff(){
        var result = confirm("Are you sure to log off？");

        if(result){
            location.href="/tologoff";
        }
        setCookie("username", ' ', -1);
        //
        // var getCookie = function (name) {
        //     var arr;
        //     var reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        //     if (arr = document.cookie.match(reg))
        //         return unescape(arr[2]);
        //     else
        //         return null;
        // };
    }

    var setCookie = function (name, value, day) {
        if(day !== 0){
            var expires = day * 24 * 60 * 60 * 1000;
            var date = new Date(+new Date()+expires);
            document.cookie = name + "=" + escape(value) + ";expires=" + date.toUTCString();
        }else{
            document.cookie = name + "=" + escape(value);
        }
    };
</script>

<%--TODO:use js to show a username or nothing basic on the session content--%>