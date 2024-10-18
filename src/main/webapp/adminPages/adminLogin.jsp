<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login to mind_gauge</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet" />
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
	background-color: #92AFD7;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	margin-top: -5%; display : flex;
	justify-content: space-between;
	align-items: center;
	width: 80%;
	max-width: 1200px;
	display: flex;
}

.form-container {
	width: 40%;
}

.form-container h1 {
	font-size: 2em;
	color: #3D3D3D;
	text-align: center;
}

.form-container form input {
	width: 90.3%; padding : 15px;
	margin: 10px 0;
	border: none;
	border-radius: 10px;
	background-color: #F5F5F5;
	font-size: 1em;
	padding: 15px;
}

.mob {
	width: 95.3% !important;
}

.form-container form .password-container {
	position: relative;
}

.form-container .password-container input {
	padding-right: 40px;
}

.form-container form .password-container .toggle-password {
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
}

.form-container form .button, .button {
	width: 102%;
	padding: 15px;
	border: none;
	border-radius: 10px;
	background-color: #1E2A5E;
	color: white;
	font-size: 1em;
	cursor: pointer;
	margin-top: 20px;
}

.home-link {
	margin-top: 5% !important;
	text-align: center;
	margin-top: 20px;
	color: #3D3D3D;
}

.home-link a {
	color: blue;
	text-decoration: none !important;
	font-weight: bold;
}

.image-container {
	width: 50%;
	height: 90% !important;
}

.image-container img {
	width: 100%;
}
 

footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	background-color: #333;
	color: #fff;
	text-align: center;
}
 
</style> 
</head>
<body>

	<div class="container">
		<div class="form-container">
			<h1>Login as Admin</h1>
			<form action="/mind_gauge/AdminLogin" method="post"
				onsubmit="return validateForm()">
				<input type="text" class="form-control mob"
					placeholder="Enter your username" id="username" name="username"
					required>
				<div class="password-container">
					<input type="password" class="form-control" placeholder="Password"
						id="password" name="password" required> <i
						class="fas fa-eye-slash toggle-password" id="togglePassword"> </i>
				</div>

				<input type="submit" value="Login" class="button">
			</form>
			<p id="error" style="color: red;"></p>
			<%
			String error = request.getParameter("error");
			if (error != null && error.equals("1")) {
			%>
			<p style="color: red; text-align: center;">Invalid username or password. Try again</p>
			<%
			}
			%>
			<div class="home-link">
				<a href="/mind_gauge/home.jsp">Back to Home</a>
			</div>
		</div>
		<div class="image-container">
			<img
				alt="Illustration of a person interacting with a large mobile device, with icons representing fingerprint and face recognition."
				src="https://demoquickly.com/assets/icons/My_password.png" />
		</div>
	</div>
	<footer>
		<p>&copy; 2024 MindGauge. All rights reserved.</p>
	</footer>
	<script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');

        togglePassword.addEventListener('click', function () {
            // Toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);

            // Toggle the eye slash icon
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>

	<script src="AdminResources/js/jquery-3.3.1.min.js"></script>
	<script src="AdminResources/js/popper.min.js"></script>
	<script src="AdminResources/js/bootstrap.min.js"></script>
	<script src="AdminResources/js/main.js"></script>

	<script>
		function validateForm() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			if (username.length > 20) {
				document.getElementById("error").innerHTML = "Username should not exceed 20 characters.";
				return false;
			}
			return true;
		}
	</script>

</body>
</html>