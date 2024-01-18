<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<script>
		function validateForm() {
			// Get form elements
			var name = document.getElementById("name").value;
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var phone = document.getElementById("phone").value;
			var address = document.getElementById("address").value;

			// Define regular expressions for validation
			var nameRegex = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
			var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
			var phoneRegex = /^[0-9]{10}$/;
			var addressRegex = /^[a-zA-Z0-9\s,'-]*$/;

			// Validate name
			if (!nameRegex.test(name)) {
				alert("Invalid name, please enter characters only");
				return false;
			}

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

			// Validate phone number
			if (!phoneRegex.test(phone)) {
				alert("Invalid phone number,please enetr only 10 digits");
				return false;
			}

			// Validate address
			if (!addressRegex.test(address)) {
				alert("Invalid address");
				return false;
			}

			return true;
		}
	</script>
<%@include file="components/common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-5">
						<%@include file="components/message.jsp"%>
						<div style="display: flex; justify-content: center;">
							<input type="image" src="images/registration.png" height="120"
								width="100">
						</div>
						<h3 class="text-center my-3">Sign up here !!</h3>
						<form action="registration" method="post" onsubmit="return validateForm()">
							<div class="mb-3">
								<label for="name">User Name</label> <input type="text"
									class="form-control" name="name" id="name"
									placeholder="Enter here">
							</div>

							<div class="mb-3">
								<label for="email">User Email</label> <input type="email"
									class="form-control" name="email" id="email"
									placeholder="Enter here">
							</div>

							<div class="mb-3">
								<label for="password">User Password</label> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Enter here">
							</div>

							<div class="mb-3">
								<label for="phone">Phone No</label> <input type="number"
									class="form-control" name="phone" id="phone"
									placeholder="Enter here">
							</div>

							<div class="mb-3">
								<label for="address">User Address</label>
								<textarea class="form-control" placeholder="Enter here"
									name="address" id="address" required="required">
								</textarea>
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success">Register</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>
							<div class="container text-left">
								<label for="address">Already have an account?</label><a
									href="login.jsp">login</a>
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