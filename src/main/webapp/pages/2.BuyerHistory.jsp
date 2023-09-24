<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Details</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	color: #2bae66ff;
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

.order-history {
	margin-top: 150px;
	text-align: center;
}
/* CSS for order cards */
.order-cards {
	display: flex;
	flex-wrap: wrap;
}

.order-card {
	border: 1px solid #ccc;
	padding: 15px;
	margin: 10px;
	max-width: 300px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	transition: transform 0.2s ease-in-out;
	text-align: start;
}

.delete-button {
	background-color: #dc3545; /* Red background color */
	color: #fff; /* White text color */
	padding: 5px 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	margin-top: 10px;
}

.dropdown {
	position: relative;
	display: inline-block;
	margin-right: 30px;
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
/* Customize other styles as needed */
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
				<a href="LogoutServlet"> <img src="./assets/image/logout.png"
					alt="logo" width="30px" />
				</a> <br> <a href="ProfileServlet?id=${userId}"> <img
					src="./assets/image/profile.png" alt="logo" width="30px" />
				</a>
			</div>
		</div>

		<!-- 	<div class="profile">
			<div>
				<a href="LogoutServlet"> <img 
					src="./assets/image/logout.png" alt="logo" width="30px" />
				</a>
			</div>
			<div class="name">
				<a href="ProfileServlet?id=${userId}"> <img 
					src="./assets/image/profile.png" alt="logo" width="50px" />
				</a>
			</div>
		</div>  -->
	</header>
	<main>
		<div class="order-history">
			<h2>Your Orders</h2>
			<div class="order-cards">
				<c:forEach var="order" items="${products}">
					<div class="order-card">
						<h3>Order ID: ${order.id}</h3>
						<p>Product Name: ${order.name}</p>
						<p>Price (Rs.): ${order.price}</p>
						<p>Quantity: ${order.quantity}</p>
						<p>Address: ${order.user_address}</p>
						<p>Order Date: ${order.ordered_date}</p>
						<!-- Add more order details as needed -->
						<a href="OrderedProductDeleteServlet?id=${order.id}">
							<button class="delete-button">Cancel Order</button>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>

	</main>
	<script>
		function back() {
			window.history.back();
		}
	</script>
</body>
</html>