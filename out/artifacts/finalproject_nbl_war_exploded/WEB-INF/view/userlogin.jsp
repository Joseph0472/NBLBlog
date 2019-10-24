<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
	<script>
		// onload function should be added in order to check the
		function checkLogon() {
			var name = document.getElementById("username").value;
			var pass = document.getElementById("password").value;

			if((name==null || name=="") || (pass==null || pass=="")){
				alert("Warning: Empty username or password");
			}
			else{
				if(true){
					alert("Login Success!");
					window.location.href="login-result.jsp";
				}
				else{
					alert("Wrong username or password.");
				}
			}
		}

	</script>
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<h1>Welcome to the blog</h1>
			
			<form class="form" action="/login-result" method="post">
				<p>Username: </p>
				<input type="text" name="username" id="username" placeholder="Username">
				<p>Password: </p>
				<input type="password" name="password" id="password" placeholder="Password">
				<br>
				<br>
				<button type="submit" id="login-button">Login</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>