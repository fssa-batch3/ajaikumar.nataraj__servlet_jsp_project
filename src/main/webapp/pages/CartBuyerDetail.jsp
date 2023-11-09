<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.User"%>
<%
String errorMessage = (String) request.getAttribute("errorMessage");
User user = (User) request.getAttribute("User");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buyer Detail</title>
<style type="text/css">
* {
	font-family: verdana;
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
	width: 100%;
	top: 0px;
	left: 0px;
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
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

/* Overall form container */
form {
	max-width: 500px;
	margin: auto;
	margin-top: 150px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

/* Address section */
.address label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.address input[type="text"], input[type="tel"] {
	width: 95%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

/* Payment details section */
.payment-details label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.payment-details input[type="text"] {
	width: 95%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

/* Button */
button[type="submit"] {
	background-color: #0074d9;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	font-weight: bold;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

/* Additional styling for the expiry date and CVV inputs */
#expiryDate, #cvv {
	width: 45%;
	margin-right: 5%;
}

/* Responsive styling for smaller screens */
@media ( max-width : 768px) {
	form {
		max-width: 100%;
	}
	.payment-details label, .payment-details input[type="text"] {
		width: 100%;
	}
	#expiryDate, #cvv {
		width: 100%;
		margin-right: 0;
	}
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
			width="40px" />
		<div class="logo">
			<img onclick="home()" src="./assets/image/logo.png" alt="logo"
				width="90px" />
		</div>

		<a href="ProfileServlet?id=<%=user.getId()%>"> <img
			src="./assets/image/profile.png" alt="logo" width="40px" />
		</a>

	</header>
	<form class="form" action="CartBuyerDetailServlet" method="post">
		<h1>Payment Page</h1>

		<div class="address">
			<label for="userAddress">Address:</label> <input type="text"
				value="<%=user.getAddress()%>" id="userAddress" name="address"
				required> <label for="userDistrict">District:</label> <input
				list="Districts" type="text"
				value="<%=user.getDistrict() != null ? user.getDistrict() : ""%>"
				id="userDistrict" name="district" required
				placeholder="Select District">
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

			<input id="pincode" name="pincode" type="tel" pattern="[0-9]{6}"
				value="<%=user.getPincode()%>" placeholder="Enter your pincode"
				maxlength="6" min="6" /> <label for="userDistrict">District:</label>
			<input type="tel" id="phone_number" name="phone_number"
				value="<%=user.getPhoneNumber()%>" pattern="[6-9]{1}[0-9]{9}"
				placeholder="Enter your phone number" autocomplete="hgfgtyfygh"
				maxlength="10" required />
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

		<button type="submit">Submit</button>

	</form>

</body>
</html>