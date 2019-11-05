<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Liu_Shi
  Date: 10/31/19
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>

<div class="search">
    <form action="/search-article" method="get">
        <div id="name-and-title"> Search <input type="search" name="search"><br>
        By:
        <input type="radio" name="keyword" value="username">Author
        <input type="radio" name="keyword" value="title">Article Title
            <button type="submit">Search</button>
        </div>
    </form>

    <form action="/search-article" method="get">
    <label for="time">publish time</label>
    <input type="date" id="date" name="time" value="">
        <button type="submit">Search</button>
        <script>
            defaultDate = document.querySelector('#date');
            console.log(new Date())
            defaultDate.valueAsDate = new Date();
        </script>
    </form>
</div>

</body>
</html>
