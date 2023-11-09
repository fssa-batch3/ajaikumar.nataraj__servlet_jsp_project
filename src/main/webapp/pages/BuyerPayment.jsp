<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment page</title>
<style>
.head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	color: white;
	height: 80px;
	width: 100%;
}

.contact {
	background-color: #2bae66ff;
	height: 20px;
	font-size: 15px;
	color: white;
	display: flex;
	justify-content: space-evenly;
}

.contact p {
	margin-top: 2px;
}

.dropdown {
	position: relative;
	display: inline-block;
	margin-right: 20px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 30px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

body {
	font-family: verdana;
	margin: 0px auto;
}

.container {
	max-width: 800px;
	margin: 20px auto;
}

.payment-form {
	background-color: #f5f5f5;
	padding: 20px;
	border-radius: 10px;
}

.payment-method {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.payment-method label {
	margin-right: 10px;
}

.qr-code {
	text-align: center;
}

.cod-instructions {
	margin-top: 20px;
}

.cod-instructions p {
	font-size: 18px;
	font-weight: bold;
}

/* Style the anchor (link) */
a {
	text-decoration: none; /* Remove underline from the link */
	display: inline-block; /* Make the link a block-level element */
	background-color: #007bff; /* Button background color */
	color: #fff; /* Button text color */
	padding: 10px 20px; /* Add padding to the button */
	border-radius: 5px; /* Rounded corners */
	transition: background-color 0.3s ease;
	/* Smooth background color transition */
}

/* Style the anchor on hover */
a:hover {
	background-color: #0056b3; /* Button background color on hover */
}

.btn {
	display: flex;
	justify-content: center;
}
/* Style the button text */
button {
	border: none; /* Remove button border */
	background: transparent; /* Transparent button background */
	color: inherit; /* Inherit text color from parent (anchor) */
	cursor: pointer; /* Change cursor to pointer on hover */
}
</style>
</head>
<body>
	<%
	User user1 = new User();
	user1 = (User) request.getAttribute("user");
	%>
	<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<img onclick="back()" src="./assets/image/arrowback.png" alt="back"
			width="50px" />
		<div class="logo">
			<img onclick="home()" src="./assets/image/logo.png" alt="logo"
				width="90px" />
		</div>
		<div class="dropdown">
			<img alt="menu" src="./assets/image/menu.png" width="30px">
			<div class="dropdown-content">
				<a href="LogoutServlet"><img src="./assets/image/logout.png"
					alt="logo" width="30px" /></a> <br> <a
					href="DeleteUserServlet?email=<%=user1.getEmail()%>"> <img
					src="./assets/image/delete.png" alt="logo" width="30px" />
				</a>
			</div>
		</div>

	</header>
	<div class="container">
		<div class="payment-form">
			<h2>Select Payment Method</h2>
			<div class="payment-method">
				<input type="radio" id="creditCard" name="paymentMethod"
					value="creditCard" checked> <label for="creditCard">Using
					UPI Id</label>
			</div>
			<div class="payment-method">
				<input type="radio" id="cashOnDelivery" name="paymentMethod"
					value="cashOnDelivery"> <label for="cashOnDelivery">Cash
					on Delivery</label>
			</div>

			<div class="qr-code">
				<h2>QR Code for Payment</h2>
				<!-- Placeholder QR code image (replace with actual generation) -->
				<img src="./assets/image/own qr code.jpg" alt="QR Code"
					width="250px">
			</div>

			<div class="cod-instructions">
				<h2>Cash on Delivery Instructions</h2>
				<p>Please have the exact amount in cash ready when the delivery
					arrives.</p>
				<p>Your product will be delivered within 2 days...</p>
			</div>
			<div class="btn">
				<a href="<%=request.getContextPath()%>/pages/success.jsp">
					<button>SUBMIT</button>
				</a>
			</div>
		</div>

	</div>

</body>
</html>