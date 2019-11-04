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
    <title>Sort</title>
</head>
<body>

<div class="sort">
    <form action="/sort-article" method="get">
        <div id="option"> Sort By:
            <input type="radio" name="keyword-sort" value="username">Author
            <input type="radio" name="keyword-sort" value="title">Article Title
            <input type="radio" name="keyword-sort" value="time">publish time
            <button type="submit">Sort</button>
        </div>
        <script>
            defaultDate = document.querySelector('#date-sort');
            console.log(new Date())
            defaultDate.valueAsDate = new Date();
        </script>
    </form>
</div>


</body>
</html>
