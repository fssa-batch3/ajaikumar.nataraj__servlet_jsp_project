<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.rishi.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

h1 {
	color: #333;
	text-align: center;
	padding: 20px 0;
}

.profile-details {
	max-width: 600px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ddd;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center; /* Center the image */
}

.profile-details h2 {
	font-size: 24px;
	margin-bottom: 10px;
}

.profile-details p {
	font-size: 16px;
	margin-bottom: 10px;
}

strong {
	font-weight: bold;
}

.profile-image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	margin: 0 auto 20px;
	display: block;
}

.action-buttons {
	margin-top: 20px;
	text-align: center;
}

.action-buttons button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin-right: 10px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease-in-out;
}

.action-buttons button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<h1>User Profile</h1>

	<%
	User user = (User) request.getAttribute("user");
	if (user != null) {
	%>
	<div class="profile-details">
		<h2>User Details</h2>
		<p>
			<strong>Name:</strong>
			<%=user.getUsername()%></p>
		<p>
			<strong>Email:</strong>
			<%=user.getEmail()%></p>
		<p>
			<strong>Phone Number:</strong>
			<%=user.getPhoneNumber()%></p>
		<p>
			<strong>District:</strong>
			<%=user.getDistrict()%></p>
		<p>
			<strong>State:</strong>
			<%=user.getState()%></p>
		<p>
			<strong>Address:</strong>
			<%=user.getAddress()%></p>
		<p>
			<strong>Date Of Birth:</strong>
			<%=user.getDob()%></p>
		<p>
			<strong>Pincode:</strong>
			<%=user.getPincode()%></p>


		<div class="action-buttons">
			<button>
				<a href="ProfileServlet?id=<%= user.getId() %>">Edit</a>
			</button>
			<button>
				<a href="delete-confirmation.jsp">Delete</a>
			</button>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>