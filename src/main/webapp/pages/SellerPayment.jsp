<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller Payment</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.payment-form {
	background-color: #f5f5f5;
	padding: 20px;
	border-radius: 10px;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="number"] {
	width: 97%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>

<body>


	<%
	String amount = request.getParameter("amount");
	int price = Integer.parseInt(amount);
	%>



	<div class="container">
		<h1>Seller Payment</h1>
		<div class="payment-form">
			<form action="<%=request.getContextPath()%>/PaymentProcessingServlet" method="post">
				<label for="amount">Amount:</label> <input type="number" id="amount"
					value=<%=price%> name="amount" min="1" step="0.01"> <label
					for="cardNumber">Card Number:</label> <input type="text"
					id="cardNumber" name="cardNumber"> <label for="expiry">Expiry
					Date:</label> <input type="text" id="expiry" name="expiry"
					placeholder="MM/YY"> <label for="cvv">CVV:</label> <input
					type="text" id="cvv" name="cvv">
					<button type="submit">Save</button>
			</form>
		</div>
	</div>
</body>
</html>