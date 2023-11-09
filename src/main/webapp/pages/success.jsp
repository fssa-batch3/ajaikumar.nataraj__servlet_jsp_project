<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="5;url=<%=request.getContextPath()%>/GetAllProductServlet">

<!-- Redirect to another page after 5 seconds -->

<title>Insert title here</title>
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
	text-align: center;
	margin-top: 100px;
}

/* Heading styles */
h1 {
	font-size: 24px;
	text-align: center;
}

/* Success message styles */
.success-message {
	background-color: #4CAF50; /* Green background color */
	padding: 20px;
	border: 1px solid #4CAF50; /* Green border color */
	border-radius: 5px;
	text-align: center;
	color: #fff; /* White text color */
}

/* Redirect message styles */
.success-message p {
	margin: 10px 0;
	font-size: 18px;
}
</style>
</head>
<body>
	<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<nav></nav>
		<div class="logo">
			<img onclick="home()"
				src="<%=request.getContextPath()%>/assets/image/logo.png" alt="logo"
				width="90px" />
		</div>
		<nav></nav>
	</header>
	<div class="container">
		<img src="<%=request.getContextPath()%>/assets/image/tick_green.jpg"
			alt="Order Success Image" width="500px">
		<!-- Add your image URL here -->
		<h1>Order Successful</h1>
		<div class="success-message">
			<p>Your order has been placed successfully.</p>
			<p>You will be redirected to home page in 5 seconds..</p>
			<p>Your ordered products will be delivered within 2 days...</p>
		</div>
	</div>
	
</body>
</html>