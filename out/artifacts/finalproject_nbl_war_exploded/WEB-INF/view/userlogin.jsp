<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
		`<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>`
<script src="https://www.google.com/recaptcha/api.js?render=6Lcqnr8UAAAAAJEM7cFLvmTAQHUHorvyMVLVRw0L"></script>
	<script>
			grecaptcha.ready(() => {
                console.log('1. grecaptcha.ready');
				grecaptcha.execute('6Lcqnr8UAAAAAJEM7cFLvmTAQHUHorvyMVLVRw0L', {action: 'check'}).then((token) => {
					document.getElementById("g-recaptcha-response").value = token;
                    console.log('3. Get token from reCAPTCHA service => ', token);
                    console.log('4. Verifying Bot...');
					$.ajax({
						type: "post",
						url: "check",
						data: {"token": token},
						success: (res) => {
							console.log('5. Return => ', res);
						}

					}
					);

				});
			})
	</script>
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
<header>
	<p>user login</p>
	<jsp:include page="/WEB-INF/view/nav.jsp"/>
</header>
	<div class="wrapper">
		<div class="container">
			<h1>Welcome to the blog</h1>
			
			<form class="form" action="/login-result"  method="post">
                <label for="username">Username: </label><input type="text" name="username" id="username" placeholder="Username">
                <br>
                <label for="password">Password:</label><input type="password" name="password" id="password" placeholder="Password">
				<br>
				<br>
				<button type="submit" id="login-button" >Login</button>

			</form>
			<form action="/check" method="post">
				<input type="text" id="g-recaptcha-response">
			</form>
		</div>
	</div>
</div>
</body>
</html>