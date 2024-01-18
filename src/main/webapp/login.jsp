<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
	<script>
		function validateForm() {
			// Get form elements
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;

			// Define regular expressions for validation
			var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;

			// Validate email
			if (!emailRegex.test(email)) {
				alert("Invalid email");
				return false;
			}

			// Validate password
			if (!passwordRegex.test(password)) {
				alert("Password must contain at least 8 characters, including uppercase, lowercase, and numbers");
				return false;
			}

			return true;
		}
	</script>
<%@include file="components/common_CSS_JS.jsp" %>
</head>
<body>

	<%@include file = "components/navbar.jsp" %>
	<div class= "container">
		<div class= "row">
			<div class= "col-md-6 offset-md-3">
				<div class="card mt-3">
					<div style="display: flex; justify-content:center;" class="custom-bg">
						<input type="image" src="images/login.png" height="100" width="100">
					</div>
					
					<div class="card-body">
					
						<%@include file="components/message.jsp" %>
					
						<form  action="loginServlet" method="post" onsubmit="return validateForm()">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input name="email" type="email" class="form-control" placeholder="Email Id"
									id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text"></div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input  name ="password" type="password" class="form-control" placeholder="Password"
									id="password" >
									
								<input type="checkbox" name = "pswtoggle" onclick="togglePasswordVisibility()">
								<label for="exampleInputPassword1" class="form-label">Show Password</label>
							</div>
							<label class=" mb-2">Don't have an account?</label><a href="register.jsp" > Register here.</a>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
								<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>	
	<%@include file="components/common_modal.jsp"%>
	
</body>
</html>