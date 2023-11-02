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
	border-radius: 3px;
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

#noProductMessage {
	text-align: center;
}

p {
	width: 100%;
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
			<c:choose>
				<c:when test="${empty products}">
					<form action="BuyerHistoryServlet" method="GET">
						<c:choose>
							<c:when test="${status == 0}">
								<label for="filterAccepted"> <input type="radio"
									id="filterAccepted" name="statusFilter" value="1"
									onclick="updateValue()"> Accepted
								</label>
								<label for="filterRejected"> <input type="radio"
									id="filterRejected" name="statusFilter" value="-1"
									onclick="updateValue()"> Rejected
								</label>
							</c:when>
							<c:when test="${status == 1}">
								<label for="filterPending"> <input type="radio"
									id="filterPending" name="statusFilter" value="0"
									onclick="updateValue()"> Pending
								</label>
								<label for="filterRejected"> <input type="radio"
									id="filterRejected" name="statusFilter" value="-1"
									onclick="updateValue()"> Rejected
								</label>
							</c:when>
							<c:when test="${status == -1}">
								<label for="filterAccepted"> <input type="radio"
									id="filterAccepted" name="statusFilter" value="1"
									onclick="updateValue()"> Accepted
								</label>
								<label for="filterPending"> <input type="radio"
									id="filterPending" name="statusFilter" value="0"
									onclick="updateValue()"> Pending
								</label>
							</c:when>
						</c:choose>
					</form>
					<div id="noProductMessage">
						<img alt="failure" src="./assets/image/failure.png" width="500px">
						<p>No orders available.</p>
					</div>
				</c:when>
				<c:otherwise>
					<%
					int value = 0;
					%>
					<form action="BuyerHistoryServlet" method="GET">
						<c:choose>
							<c:when test="${status == 0}">
								<label for="filterAccepted"> <input type="radio"
									id="filterAccepted" name="statusFilter" value="1"
									onclick="updateValue()"> Accepted
								</label>
								<label for="filterRejected"> <input type="radio"
									id="filterRejected" name="statusFilter" value="-1"
									onclick="updateValue()"> Rejected
								</label>
							</c:when>
							<c:when test="${status == 1}">
								<label for="filterPending"> <input type="radio"
									id="filterPending" name="statusFilter" value="0"
									onclick="updateValue()"> Pending
								</label>
								<label for="filterRejected"> <input type="radio"
									id="filterRejected" name="statusFilter" value="-1"
									onclick="updateValue()"> Rejected
								</label>
							</c:when>
							<c:when test="${status == -1}">
								<label for="filterAccepted"> <input type="radio"
									id="filterAccepted" name="statusFilter" value="1"
									onclick="updateValue()"> Accepted
								</label>
								<label for="filterPending"> <input type="radio"
									id="filterPending" name="statusFilter" value="0"
									onclick="updateValue()"> Pending
								</label>
							</c:when>
						</c:choose>
					</form>


					<c:choose>
						<c:when test="${status == 0}">
							<h2>Pending Orders</h2>

						</c:when>
						<c:when test="${status == 1}">
							<h2>Accepted Orders</h2>

						</c:when>
						<c:when test="${status == -1}">
							<h2>Rejected Orders</h2>
						</c:when>
					</c:choose>
					<div class="order-cards">

						<c:forEach var="order" items="${products}">

							<div class="order-card">
								<h2>Order ID: ${order.id}</h2>
								<img alt="img" src="${order.url}" width="250px">
								<p>Product Name: ${order.name}</p>
								<p>Price (Rs.): ${order.price}</p>
								<p>Quantity: ${order.quantity}</p>
								<p>Address: ${order.user_address}</p>
								<p>Order Date: ${order.ordered_date}</p>
								<!-- Add more order details as needed -->
								<c:choose>
									<c:when test="${order.status == 0 || order.status == 1}">
										<a href="OrderedProductDeleteServlet?id=${order.id}">
											<button class="delete-button">Cancel Order</button>
										</a>
									</c:when>
									<c:otherwise>
										<button class="delete-button">Order Rejected</button>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>


					</div>
					<!-- 	<h2>Pending Orders</h2>

					<div class="order-cards">

						<c:forEach var="order" items="${products}">

							<c:choose>
								<c:when test="${order.status == 0}">

									<div class="order-card">
										<h2>Order ID: ${order.id}</h2>
										<p>Product Name: ${order.name}</p>
										<p>Price (Rs.): ${order.price}</p>
										<p>Quantity: ${order.quantity}</p>
										<p>Address: ${order.user_address}</p>
										<p>Order Date: ${order.ordered_date}</p>
					<a href="OrderedProductDeleteServlet?id=${order.id}">
						<button class="delete-button">Cancel Order</button>
					</a>
		</div>
		</c:when>
		</c:choose>
		</c:forEach>

		</div>
		<h2>Rejected Orders</h2>

		<div class="order-cards">

			<c:forEach var="order" items="${products}">

				<c:choose>
					<c:when test="${order.status == -1}">

						<div class="order-card">
							<h2>Order ID: ${order.id}</h2>
							<p>Product Name: ${order.name}</p>
							<p>Price (Rs.): ${order.price}</p>
							<p>Quantity: ${order.quantity}</p>
							<p>Address: ${order.user_address}</p>
							<p>Order Date: ${order.ordered_date}</p>

						</div>
					</c:when>
				</c:choose>
			</c:forEach>

		</div>
		-->

				</c:otherwise>
			</c:choose>
		</div>
	</main>

	<script>
		function back() {
			window.history.back();
		}

		function updateValue() {
			var radioButtons = document
					.querySelectorAll('input[name="statusFilter"]');

			for (var i = 0; i < radioButtons.length; i++) {
				if (radioButtons[i].checked) {
					value = parseInt(radioButtons[i].value);
					break; // Exit the loop as soon as one radio button is selected
				}
			}

			// Submit the form
			document.querySelector('form').submit();
		}
	</script>
</body>
</html>