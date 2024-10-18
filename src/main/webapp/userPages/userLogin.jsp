
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login</title>
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
	margin-top: -5%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 80%;
	max-width: 1200px;
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
	width: 90.3%;
	padding: 15px;
	margin: 10px 0;
	border: none;
	border-radius: 10px;
	background-color: #F5F5F5;
	font-size: 1em;
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

.signup-link {
	margin-top: 5% !important;
	text-align: center;
	margin-top: 20px;
	color: #3D3D3D;
}

.signup-link a {
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

hr {
	width: 40%;
	height: 1px;
	display: inline-block;
	margin-top: 15px;
	background-color: black;
	color: black;
}

.or {
	text-align: center;
	margin: 20px 0;
	color: black;
}

.or::before, .or::after {
	content: ' ';
	display: inline-block;
	width: 40%;
	height: 1px;
	background-color: black;
	vertical-align: middle;
}

.or::before {
	margin-right: 10px;
}

.or::after {
	margin-left:  10px;
	        
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
<style>
</style>
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h1>Login</h1>
			<form action="/mind_gauge/UserLogin" method="post">
				<input type="text" class="form-control mob"
					placeholder="Mobile(10 digits)" required id="mobile" name="mobile"
					required pattern="[0-9]{10}">
				<div class="password-container">
					<input type="password" class="form-control" placeholder="Password"
						required id="password" name="password"> <i
						class="fas fa-eye-slash toggle-password" id="togglePassword">
					</i>
				</div>
				<input type="submit" value="Log In" class="button">
			</form>
			<%
			String error = request.getParameter("error");
			if (error != null && error.equals("1")) {
			%>
			<p style="color: red; text-align: center">Invalid mobile or
				password. Try again</p>
			<%
			}
			%>
			<div class="signup-link">
				Don't have an account? <a
					href="/mind_gauge/userPages/userRegister.jsp"> Register Now </a>
			</div>
			<div class="or">or&nbsp;</div>
			<input type="submit" value="Login as Admin" class="button">

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

		togglePassword.addEventListener('click', function() {
			// Toggle the type attribute
			const type = password.getAttribute('type') === 'password' ? 'text'
					: 'password';
			password.setAttribute('type', type);

			// Toggle the eye slash icon
			this.classList.toggle('fa-eye');
			this.classList.toggle('fa-eye-slash');
		});
    
	</script>

	<script src="UserResources/js/jquery-3.3.1.min.js"></script>
	<script src="UserResources/js/popper.min.js"></script>
	<script src="UserResources/js/bootstrap.min.js"></script>
	<script src="UserResources/js/main.js"></script>

</body>
</html>
