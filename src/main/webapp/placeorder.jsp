
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("message", "You are not logged in! please login first to place order.");
	response.sendRedirect("login.jsp");
	return;
}
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place order</title>

<%@include file="components/common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">

		<div class="row mt-5">

			<div class="col-md-6">
				<!-- card -->
				<div class="card">

					<div class="card-body">
						<h3 class="text-center mb-4">Cart Details!</h3>
						<div class="cart-body"></div>

					</div>

				</div>

			</div>
			<div class="col-md-6">
				<!-- form details -->
				<div class="card">

					<div class="card-body">
						<h3 class="text-center mb-4">Your Details!</h3>
						<form action="">
							<div class="mb-3">
								<label for="name" class="form-label">Name </label> <input
									type="text" value="<%=user.getUserName()%>"
									class="form-control" id="name" name="name"
									placeholder="Enter name" required="required">
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email address</label> <input
									type="email" class="form-control"
									value="<%=user.getUserEmail()%>" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email"
									placeholder="Enter email" required="required">
							</div>
							<div class="mb-3">
								<label for="Phone" class="form-label">Phone </label> <input
									type="number" class="form-control"
									value="<%=user.getUserPhone()%>" id="phone" name="phone"
									placeholder="Enter phone number" required="required">
							</div>
							<div class="mb-3">
								<label for="address" class="form-label">Shipping Address
								</label>
								<textarea class="form-control" placeholder="Enter address"
									id="address" name="address" <%=user.getUserAddress()%>
									style="height: 150px" required="required"></textarea>
							</div>

							<div class="container text-center">
								<button class="btn btn-outline-success custom-bg" type="button" onclick="goToPayment()" >Order
									Now!</button>
								<button class="btn btn-outline-success" type="button" onclick="goToCategory()">Continue
									shopping</button>
							</div>
						</form>
					</div>

				</div>

			</div>

		</div>

	</div>

	<%@include file="components/common_modal.jsp"%>
	<%@include file="components/common_modal2.jsp"%>
</body>
</html>