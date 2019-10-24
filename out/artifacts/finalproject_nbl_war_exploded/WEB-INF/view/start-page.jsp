<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <script>

        function jumptoSignUpPage() {
            window.location.href="/usersignup";
        }
        function jumptoLogInPage() {
            window.location.href="/userlogin";
        }
    </script>
</head>

<body>
<h1>Welcome to the NBL blog login test page</h1>
<br>
<button type="button" value="sign-up" onclick="jumptoSignUpPage()">I'm a new user - SIGN UP</button>
<button type="button" value="log-in" onclick="jumptoLogInPage()">I have my account - LOG IN</button>
</body>
</html>