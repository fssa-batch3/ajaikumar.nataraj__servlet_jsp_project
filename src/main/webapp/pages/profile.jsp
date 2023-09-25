<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="./assets/CSS/10-upload.css" /> -->
</head>
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

.topic {
	color: #2bae66ff;
	display: flex;
	justify-content: space-between;
	width: 700px;
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

/* Reset some default browser styles */
body, h1, h2, p, label, input, button {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

h2 {
	margin-top: 5%;
}
/* Overall page styles */
body {
	font-family: Arial, sans-serif;
	text-align: center;
	padding: 20px;
}

/* Profile container styles */
.profile-container {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	gap: 20px;
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Profile left (edit) side styles */
.profile-left {
	flex: 1;
	text-align: left;
}

/* Profile right (details) side styles */
.profile-right {
	flex: 1;
	text-align: left;
}

/* Form group styles */
.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	font-weight: bold;
	font-size: 16px;
	color: #333;
	margin-bottom: 5px;
}

.input {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

button {
	background-color: #007bff; /* Button background color */
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
}

.delete-button {
	background-color: #ff5555; /* Delete button background color */
}

.dropdown {
	position: relative;
	display: inline-block;
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

/* Media query for responsive design */
@media screen and (max-width: 768px) {
	.profile-container {
		flex-direction: column;
		align-items: center;
	}
	.profile-left, .profile-right {
		width: 100%;
	}
}
</style>
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


	<script>
		function back() {
			window.history.back();
		}
	</script>
	<h2>Profile Details</h2>
	<%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p style='color: red;'>" + errorMessage + "</p>");
	}
	%>

	<form action="ProfileServlet?id=<%=user1.getId()%>" method="POST">
		<div class="profile-container">



			<div class="profile-left">
				<div>
					<div class="form-group">
						<label for="username">User Name</label> <input type="text"
							id="username" name="username" class="input"
							value="<%=user1.getUsername()%>" placeholder="User Name" required>
					</div>
					<div class="form-group">
						<label for="phone_number">Phone Number</label> <input type="tel"
							id="phone_number" name="phone_number" class="input"
							minlength="10" maxlength="10" pattern="[6-9]{1}[0-9]{9}"
							value="<%=user1.getPhoneNumber()%>" placeholder="Phone Number"
							required>
					</div>
					<div class="form-group">
						<label for="home_address">Home Address</label> <input type="text"
							id="home_address" name="address" value="<%=user1.getAddress()%>"
							class="input" placeholder="Home Address" required>
					</div>
				</div>
			</div>
			<div class="profile-right">
				<div class="form-group">
					<label for="email">Email</label> <input type="email" id="email"
						name="email" class="input" value="<%=user1.getEmail()%>"
						placeholder="Email" readonly>
				</div>
				<div class="form-group">
					<label for="dob">Date of Birth</label>
					<%
					java.util.Calendar calendar = java.util.Calendar.getInstance();
					calendar.add(java.util.Calendar.YEAR, -18); // Subtract 18 years
					java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
					String maxDOB = dateFormat.format(calendar.getTime());
					%>
					<input type="date" id="dob" name="dob" class="input"
						value="<%=user1.getDob()%>" max="<%=maxDOB%>">
				</div>


				<div class="form-group">
					<label for="pincode">Pincode</label> <input type="text"
						id="pincode" name="pincode" class="input" placeholder="Pincode"
						value="<%=user1.getPincode()%>" required pattern="[0-9]{6}"
						maxlength="6" />
				</div>
				<div class="form-group">
					<label for="district">District</label> <input required
						class="input" list="Districts" name="district" id="district"
						type="text" value="<%=user1.getDistrict()%>"
						placeholder="Select District" autocomplete="off">
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
				</div>

			</div>
		</div>
		<button type="submit" onclick="showUpdateAlert()">Update</button>

	</form>


	<script>
		function back() {
			window.history.back();
		}

		function showUpdateAlert() {
			// Display an alert with your message
			alert("Are you sure you want to update");
		}
	</script>
</body>
</html>