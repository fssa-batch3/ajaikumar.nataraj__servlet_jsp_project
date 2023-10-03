<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%
long id = (long) session.getAttribute("sellerId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<title>Document</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
}

.head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	color: white;
	height: 60px;
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

.name {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 30px;
	color: white;
	border-radius: 100px;
	width: 50px;
	height: 50px;
	background-color: #2bae66ff;
}
/* Header container */
.head {
	color: #fff; /* Text color */
	padding: 10px 20px; /* Padding around the header */
	display: flex; /* Make the header contents display in a row */
	justify-content: space-between;
	/* Distribute elements evenly horizontally */
	align-items: center; /* Center elements vertically */
}

/* Style for the back button */
.head img[alt="back"] {
	cursor: pointer; /* Add a pointer cursor on hover */
}

/* Style for the logo */
.logo img[alt="logo"] {
	width: 90px; /* Set the logo width */
	cursor: pointer; /* Add a pointer cursor on hover */
}

/* Style for the profile section */
.profile {
	display: flex; /* Make the profile section contents display in a row */
	align-items: center; /* Center elements vertically */
}

/* Style for the profile links */
.profile a {
	text-decoration: none; /* Remove underline from links */
	margin-right: 10px; /* Add some spacing between links */
	color: #fff; /* Text color for links */
}

/* Style for the profile icons */
.profile img[alt="logo"], .profile img[alt="profile"], .profile img[alt="cart"]
	{
	width: 50px; /* Set the icon width */
	cursor: pointer; /* Add a pointer cursor on hover */
}

/* Add more specific styles or adjust the styles as needed */

/* Form container */
.full-card {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	margin-top: 30px;
}

/* Form heading */
.full-card h3 {
	text-align: center;
	font-size: 24px;
	margin-bottom: 20px;
	color: #333;
}

/* Form input fields and labels */
nav {
	margin-bottom: 20px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
	color: #555;
}

input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	color: #333;
}

/* Style the select input */
input[type="text"][list] {
	background-color: transparent;
	border: none;
}

datalist {
	display: none;
}

/* Form button */
.btn-card {
	text-align: center;
	margin-top: 20px;
}

.btn {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn:hover {
	background-color: #45a049;
}

.dropdown {
	position: relative;
	display: inline-block;
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

/* Additional styling for responsive design can be added as needed */
</style>
<!--  <link rel="stylesheet" href="../assets/CSS/10-upload.css" /> -->
</head>
<body>
	<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<img onclick="back()" src="../assets/image/arrowback.png" alt="back"
			width="50px" />
		<div class="logo">
			<img onclick="home()" src="../assets/image/logo.png" alt="logo"
				width="90px" />
		</div>

		<div class="dropdown">
			<img alt="menu" src="../assets/image/menu.png" width="30px">
			<div class="dropdown-content">
				<a href="<%=request.getContextPath()%>/GetAllOwnProductsServlet">
					<img src="../assets/image/orders.png" alt="orders" width="30px" />
				</a> <br> <a
					href="<%=request.getContextPath()%>/GetAllProductServlet"> <img
					src="../assets/image/cart.png" alt="cart" width="30px" />
				</a><br> <a
					href="<%=request.getContextPath()%>/ProfileServlet?id=<%=id%>">
					<img src="../assets/image/profile.png" alt="profile" width="30px" />
				</a><br> <a
					href="<%=request.getContextPath()%>/sellerNotificationServlet?id=<%=id%>">
					<img src="../assets/image/notification.png" alt="notification" width="30px" />
				</a>
			</div>
		</div>
	</header>
	<section class="output_section"></section>
	<a href="../assets/image/apple.jpg"></a>
	<section class="sec"></section>
	<form action="<%=request.getContextPath()%>/RegisterProductServlet"
		method="post" class="full-card" id="form">
		<h3>Upload your products</h3>
		<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null) {
			out.println("<p style='color: red; width=100%;'>" + errorMessage + "</p>");
		}
		%>
		<div class="full_list">
			<div class="list">
				<nav>
					<input class="image" type="file" name="url" id="url"><br>
				</nav>
				<nav>
					<input required="required" type="text" name="name" id="name"
						value="Graphes" placeholder="Your Product's Name" />
				</nav>
				<nav>
					<input required="required" list="Types" name="type" id="type"
						placeholder="Select Type" autocomplete="off" />
					<datalist id="Types">
						<option value="Fruit"></option>
						<option value="Vegetable"></option>
						<option value="Coffee & Tea"></option>
						<option value="Cereals & Grains"></option>
					</datalist>
				</nav>
				<nav>
					<input required="required" name="description" type="text"
						id="description" class="description"
						value="It is good fruit with nutrients"
						placeholder="Description about your products" />
				</nav>
			</div>
			<div class="list">
				<nav>
					<input required="required" type="number" name="price" id="price"
						value="100" placeholder="Enter Your Product's Price per kg" />
				</nav>
				<nav>
					<input required="required" type="number" name="qty" id="qty"
						value="100" placeholder="Enter Your Product's Quantity" />
				</nav>
				<nav>
					<input required list="Districts" name="district" id="district"
						placeholder="Select District" autocomplete="off" />
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
				</nav>

				<nav>
					<input required="required" type="text" id="address" name="address"
						value="10, Gandhi street, gobi." placeholder="Enter Your Address" />
				</nav>
				<nav>
					<input required="required" type="number" id="pincode"
						name="pincode" value="654321" placeholder="Enter your Pincode" />
				</nav>
			</div>
		</div>

		<div class="btn-card">
			<button class="btn" id="add-btn">Add</button>
		</div>
	</form>

	<div class="add_detail"></div>

	<script>
		function back() {
			window.history.back();
		}

		image.addEventListener("change", function(e) {
			let file = e.target.files[0];

			let reader = new FileReader();
			reader.onload = function(e) {
				let fileContent = e.target.result;
			};
			reader.readAsDataURL(file);
		});
	</script>

</body>
</html>
