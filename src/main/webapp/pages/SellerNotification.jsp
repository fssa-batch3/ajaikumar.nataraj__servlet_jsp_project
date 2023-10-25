<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fssa.rishi.model.Order"%>
<%@ page import="com.fssa.rishi.model.User"%>


<%
long id = (long) request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
		sans-serif;
	background-color: #f5f5f5;
	display: block;
	justify-content: center;
	align-items: center; /* Vertically center the content */
	height: 50vh; /* 100% of the viewport height */
	margin: 0;
	justify-content: center; /* Remove default body margin */
}

.head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	color: white;
	height: 10%;
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

h2 {
	margin-top: 10%;
}

main {
	width: 100%;
	display: block;
	justify-content: center;
}
/* Style for the whole section */
section {
	display: flex;
	align-items: center;
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
	width: 60%;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add box shadow */
}

/* Style for the image */
section img {
	width: 100px;
	height: auto;
	margin-right: 20px;
}

/* Style for the first column */
section div:nth-child(2) {
	flex: 1;
	padding-right: 20px;
	border-right: 1px solid #ccc;
}

/* Style for the second column */
section div:nth-child(3) {
	flex: 2;
	padding-left: 20px;
}

/* Style for paragraphs inside columns */
section p {
	margin: 5px 0;
}
/* Style for the buttons */
button {
	padding: 10px 20px;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 10px; /* Add some spacing between buttons */
}

/* Style for the "Reject" button */
button.reject {
	background-color: #f44336; /* Red for "Reject" */
}

button.accept {
	background-color: #4caf50; /* Green for "Accept" */
}
/* Hover effect */
button:hover {
	opacity: 0.8; /* Slightly reduce opacity on hover */
}

/* Optional: Style for button click (active) state */
button:active {
	opacity: 1; /* Restore opacity on click */
}
</style>
</head>
<body>
	<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<img onclick="back()"
			src="<%=request.getContextPath()%>/assets/image/arrowback.png"
			alt="back" width="50px" />
		<div class="logo">
			<img onclick="home()"
				src="<%=request.getContextPath()%>/assets/image/logo.png" alt="logo"
				width="90px" />
		</div>

		<div class="dropdown">
			<img alt="menu"
				src="<%=request.getContextPath()%>/assets/image/menu.png"
				width="30px">
			<div class="dropdown-content">
				<a href="ProfileServlet?id=<%=id%>"> <img
					src="<%=request.getContextPath()%>/assets/image/profile.png"
					alt="logo" width="30px" />
				</a><br> <a href="LogoutServlet"> <img
					src="<%=request.getContextPath()%>/assets/image/logout.png"
					alt="logo" width="30px" />
				</a>
			</div>
		</div>
	</header>
	<main>
		<c:if test="${not empty products}">
			<script type="text/javascript">var totalAmount = 0;</script>

			<h2>Notifications</h2>
			
			<c:forEach var="order" items="${products}">
				<section>
					<img src="${order.url}" alt="Product Image" width="200px" />
					<div>
						<p>Name: ${order.name}</p>
						<p>Price: Rs. ${order.price}</p>
						<p>Quantity: ${order.quantity}</p>
						<script>
							var order = {
								price : ${order.price},
								quantity : ${order.quantity}
							};

							var amount = order.quantity * order.price;
							totalAmount += amount;
							document.write('<p>Total Amount: Rs. ' + amount
									+ '</p>');
						</script>
					</div>

					<div>
						<p>Name: ${order.username}</p>
						<p>Phone No: ${order.phone_number}</p>
						<p>Address: ${order.user_address}</p>
						<p>District: ${order.district}</p>
						<p>Pincode: ${order.pincode}</p>
						<p>Ordered Date: ${order.ordered_date}</p>
					</div>
					<a
						href="<%=request.getContextPath()%>/NotificationAccept?id=${order.id}&userId=<%= id %>">
						<button class="accept">Accept</button>
					</a> <a
						href="<%=request.getContextPath()%>/NotificationReject?id=${order.id}&userId=<%= id %>">
						<button class="reject">Reject</button>
					</a>
				</section>
			</c:forEach>
			<script type="text/javascript">
			document.write('<h3>Total Amount: Rs. ' + totalAmount
					+ '</h3>');
			</script>
		</c:if>
		<c:if test="${empty products}">
			<img alt="failure" src="./assets/image/failure.png" width="500px">
			<h4>There is no Notifications</h4>
		</c:if>

	</main>
</body>
</html>