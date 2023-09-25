<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.User"%>

<%
String errorMessage = (String) request.getAttribute("errorMessage");
ProductDetails product = (ProductDetails) request.getAttribute("Product");
long id = (long) request.getAttribute("userId");
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
	align-item: center;
	align-content: center;
}

/* Input and textarea styles */
input[type="text"], input[type="number"], input[type="tel"], textarea {
	width: 95%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

input[type="text"]::placeholder, input[type="number"]::placeholder,
	textarea::placeholder {
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

.dropdown {
	position: relative;
	display: inline-block;
	margin-right: 20px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
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
		<div class="dropdown">
			<img alt="menu" src="./assets/image/menu.png" width="30px">
			<div class="dropdown-content">
				<a href="ProfileServlet?id=<%=id%>"> <img
					src="./assets/image/profile.png" alt="logo" width="30px" />
				</a><br> <a href="LogoutServlet"> <img
					src="./assets/image/logout.png" alt="logo" width="30px" />
				</a>
			</div>
		</div>

	</header>
	<div class="container">
		<form action="BuyNowServlet" method="post" class="order-form">
			<div class="first-div">
				<!-- Product Details Section -->
				<div class="form-section product-details">
					<input type="hidden" name="productId" value="<%=product.getId()%>">
					<label for="name">Name:</label> <input type="text" id="name"
						readonly name="name" value="<%=product.getName()%>"> <br>
					<label for="description">Description:</label>
					<textarea id="description" name="description" readonly><%=product.getDescription()%></textarea>
					<br> <label for="price">Price (Rs.):</label> <input
						type="text" id="price" name="price" readonly
						value="<%=product.getPrice()%>"> <br> <label
						for="quantity">Quantity Available:</label> <input type="tel"
						maxlength="2" pattern="[0-9]{1-2}" min="1" value="1" id="quantity"
						name="quantity" required autofocus
						placeholder="Enter your quantity">
				</div>

				<!-- Delivery Details Section -->
				<div class="form-section delivery-details">
					<label for="address">Address:</label>
					<textarea id="address" name="address" required
						placeholder="Enter your address">10, gandhi street, gobi</textarea>

					<br> <label for="district">District:</label><input required
						list="Districts" name="district" id="district" type="text"
						value="<%=product.getDistrict()%>" placeholder="Select District"
						autocomplete="off" />
					<datalist id="Districts">
						<option value="Ariyalur">Ariyalur</option>
						<option value="Chennai">Chennai</option>
						<option value="Coimbatore">Coimbatore</option>
						<option value="Cuddalore">Cuddalore</option>
						<option value="Dharmapuri">Dharmapuri</option>
						<option value="Dindigul">Dindigul</option>
						<option value="Erode">Erode</option>
						<option value="Kallakurichi">Kallakurichi</option>
						<option value="Kanchipuram">Kanchipuram</option>
						<option value="Kanyakumari">Kanyakumari</option>
						<option value="Karur">Karur</option>
						<option value="Krishnagiri">Krishnagiri</option>
						<option value="Madurai">Madurai</option>
						<option value="Nagapattinam">Nagapattinam</option>
						<option value="Namakkal">Namakkal</option>
						<option value="Nilgiris">Nilgiris</option>
						<option value="Perambalur">Perambalur</option>
						<option value="Pudukkottai">Pudukkottai</option>
						<option value="Ramanathapuram">Ramanathapuram</option>
						<option value="Salem">Salem</option>
						<option value="Sivaganga">Sivaganga</option>
						<option value="Tenkasi">Tenkasi</option>
						<option value="Thanjavur">Thanjavur</option>
						<option value="Theni">Theni</option>
						<option value="Thoothukudi (Tuticorin)">Thoothukudi
							(Tuticorin)</option>
						<option value="Tiruchirapalli">Tiruchirapalli</option>
						<option value="Tirunelveli">Tirunelveli</option>
						<option value="Tirupathur">Tirupathur</option>
						<option value="Tiruppur">Tiruppur</option>
						<option value="Tiruvallur">Tiruvallur</option>
						<option value="Tiruvannamalai">Tiruvannamalai</option>
						<option value="Tiruvarur">Tiruvarur</option>
						<option value="Vellore">Vellore</option>
						<option value="Viluppuram">Viluppuram</option>
						<option value="Virudhunagar">Virudhunagar</option>
					</datalist>
					<br> <label for="phone">Phone Number:</label> <input
						type="tel" id="phone" name="phone" required minlength="10"
						maxlength="10" pattern="[6-9]{1}[0-9]{9}" value="9876543214"
						placeholder="Enter your phone number"> <br> <label
						for="pincode">Pincode:</label><input type="tel" id="pincode"
						name="pincode" required placeholder="Enter your 6-digit pincode"
						value="654321" minlength="6" maxlength="6" pattern="[0-9]{6}">
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
	<script>
		function back() {
			window.history.back();
		}
	</script>
</body>
</html>
