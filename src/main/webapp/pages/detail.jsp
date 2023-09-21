<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%
String errorMessage = (String) request.getAttribute("errorMessage");
ProductDetails product = (ProductDetails) request.getAttribute("Product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
		sans-serif;
	background-color: #f5f5f5;
}

.head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	color: white;
	height: 80px;
	font-size: 30px;
	position: fixed;
	width: 100%;
	top: 20px;
	background-color: white;
	left: 0px;
	z-index: 1;
}

.contact {
	background-color: #2bae66ff;
	height: 20px;
	font-size: 15px;
	color: white;
	display: flex;
	justify-content: space-evenly;
	position: fixed;
	top: 0px;
	width: 100%;
	left: 0px;
}

.contact p {
	margin-top: 2px;
}
/* Overall container styles */
.container {
	max-width: 800px; /* Adjust the width as needed */
	margin: 0 auto;
	padding: 20px;
	color: #fff; /* White text color */
	overflow: hidden; /* Clear floats */
	margin-top: 100px;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
}

/* Heading styles */
h1 {
	font-size: 24px;
	text-align: center;
}

/* Section heading styles */
h2 {
	font-size: 18px;
	margin-top: 20px;
}

/* Form section styles */
.form-section {
	background-color: #fff; /* White background color for each section */
	padding: 20px;
	margin: 20px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	clear: both; /* Clear floats */
}

/* Input and textarea styles */
input[type="text"], input[type="number"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

input[type="text"]::placeholder, input[type="number"]::placeholder, textarea::placeholder {
    color: lightgrey;
}


/* Submit button styles */
button[type="submit"] {
	background-color: green;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	float: right; /* Float submit button to the right */
}

/* Submit button hover effect */
button[type="submit"]:hover {
	background-color: #0056b3;
}

.first-div {
	display: flex;
}

.delivery-details {
	margin-left: 50px;
}
</style>

</head>
<body>
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
		<nav>
			<a href="ProfileServlet?id=${userId}">
				<button>Profile</button>
			</a> <a href="LogoutServlet">
				<button>logout</button>
			</a>
		</nav>
	</header>
	<div class="container">
		<form action="BuyNowServlet" method="post" class="order-form">
			<div class="first-div">
				<!-- Product Details Section -->
				<div class="form-section product-details">
					<input type="hidden" name="productId" value="<%=product.getId()%>">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" value="<%=product.getName()%>"> <br> <label
						for="description">Description:</label>
					<textarea id="description" name="description"><%=product.getDescription()%></textarea>
					<br> <label for="price">Price (Rs.):</label> <input
						type="text" id="price" name="price"
						value="<%=product.getPrice()%>"> <br> <label
						for="quantity">Quantity Available:</label> <input type="text"
						id="quantity" name="quantity" required autofocus placeholder="Enter your quantity">
				</div>

				<!-- Delivery Details Section -->
				<div class="form-section delivery-details">
					<label for="address">Address:</label>
					<textarea id="address" name="address" required
						placeholder="Enter your address"></textarea>
					<br> <label for="district">District:</label> <input
						type="text" id="district" name="district" required
						placeholder="Enter your district"> <br> <label
						for="phone">Phone Number:</label> <input type="text" id="phone"
						name="phone" required placeholder="Enter your phone number"> <br>
					<label for="pincode">Pincode:</label> <input type="number"
						id="pincode" name="pincode" required placeholder="Enter your pincode">
				</div>
			</div>
			<!-- Payment Details Section -->
			<div class="form-section payment-details">
				<label for="cardNumber">Card Number:</label> <input type="text"
					id="cardNumber" name="cardNumber" placeholder="Enter card number">
				<br> <label for="expiryDate">Expiry Date:</label> <input
					type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY">
				<br> <label for="cvv">CVV:</label> <input type="text" id="cvv"
					name="cvv" placeholder="Enter CVV"> <br>
			</div>
			<a href="BuyNowServlet?=<%=product.getId()%>">
				<button type="submit">Order</button>
			</a>
		</form>
	</div>
</body>
</html>
