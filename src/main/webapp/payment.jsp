<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>Mock Payment Gateway</title>
	<style>
		form {
			width: 500px;
			margin: 50px auto;
			text-align: center;
		}
		input[type="text"], input[type="date"], input[type="number"] {
			width: 100%;
			padding: 10px;
			margin: 10px 0;
			box-sizing: border-box;
		}
		input[type="submit"] {
			width: 100%;
			padding: 10px;
			margin: 20px 0;
			background-color: green;
			color: white;
			border: none;
			cursor: pointer;
		}
		input[type="submit"]:hover {
			background-color: darkgreen;
		}
		.success {
			width: 500px;
			margin: 50px auto;
			text-align: center;
			font-size: 18px;
			color: green;
		}
	</style>
</head>
<body>
	<form id="payment-form">
		<h1>Payment Gateway</h1>
		<input type="text" placeholder="Cardholder Name" required>
		<input type="number" placeholder="Card Number" required>
		<input type="date" placeholder="Expiration Date" required>
		<input type="number" placeholder="CVV" required>
		<input type="submit" value="Pay">
	</form>
	<div class="success" style="display: none;">Payment Successful</div>
	<script>
		const form = document.getElementById("payment-form");
		form.addEventListener("submit", function(event) {
			event.preventDefault();
			form.style.display = "none";
			document.querySelector(".success").style.display = "block";
		});
	</script>
</body>
</html>
