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
<link rel="stylesheet" href="./assets/CSS/10-upload.css" />
</head>
<style>
button {
	background-color: #2bae66ff;
	color: aliceblue;
	border: none;
	border-radius: 5px;
	font-size: 20px;
	width: 300px;
	height: 40px;
	margin-top: 20px;
}

button:hover {
	background-color: white;
	color: #2bae66ff;
	/* scale: 1.1; */
}

body {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	max-width: 1240px;
	font-size: 27px;
	font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
		sans-serif;
}

.main {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	align-content: center;
	text-align: center;
	box-shadow: 1px 1px 3px 3px rgb(188, 219, 188);
	border-radius: 10px;
	height: 500px;
	margin-top: 10px;
}

.extraDetail {
	display: flex;
}

.profile {
	width: 400px;
}

input {
	width: 400px;
	align-items: start;
	font-size: 30px;
	border-radius: 5px;
	box-shadow: 1px 1px 1px 1px rgb(159, 223, 159);
	border: none;
}

input::placeholder {
	font-size: 14px;
}

.form {
	width: 410px;
}

label {
	font-size: 25px;
}

/* for password eye symbol */
form i {
	margin-left: -40px;
	cursor: pointer;
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
		<div>
		<a href="LogoutServlet"><button>Logout</button></a>
		</div>
	</header>


	<script>
		function back() {
			window.history.back();
		}
		

	</script>
	<form action="ProfileServlet?id=<%=user1.getId()%>" method="POST"
		class="main">



		<div class="profile">
			<label for="User name">User name</label><br /> <input type="text"
				id="user_name" name="username" class="input"
				value="<%=user1.getUsername()%>" placeholder="User Name" /><br />

			<label for="password">Password</label><br /> <input type="text"
				id="password" name="password" class="input"
				value="<%=user1.getPassword()%>" placeholder="Password" /><br /> <label
				for="ph_no">Phone Number</label> <input type="text"
				id="phone_number" name="phoneNo" class="input"
				value="<%=user1.getPhoneNumber()%>" placeholder="Phone Number" /><br />
			<label for="Home Address">Home Address</label> <input type="text"
				id="home_address" name="address" value="<%=user1.getAddress()%>"
				class="input" placeholder="Home Address" />
		</div>
		<div class="form">
			<label for="email">Email</label> <input type="email" id="email"
				name="email" class="input" value="<%=user1.getEmail()%>"
				placeholder="Email" /><br /> <label for="Date of Birth">Date
				of Birth</label> <input type="date" id="dob" name="dob" class="input"
				value="<%=user1.getDob()%>" /><br /> <label for="Pincode">Pincode</label>
			<input type="text" id="pincode" name="pincode" class="input"
				value="<%=user1.getPincode()%>" placeholder="Pincode" /><br /> <label for="district">District</label> <br> <input required
						list="Districts" name="district" id="district" value="<%=user1.getDistrict()%>" 
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
					</datalist><br />

			<button type="submit">Update</button>
			<a href="DeleteUserServlet?email=<%=user1.getEmail()%>">
				<button>Delete</button>
			</a>

		</div>
	</form>

	

</body>
</html>