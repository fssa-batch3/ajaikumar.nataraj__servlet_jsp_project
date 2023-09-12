<%@page import="com.fssa.rishi.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

img {
	width: 300px;
	border-radius: 5px;
	margin-left: 100px;
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
	height: 780px;
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
	<button onclick="goBack()">Back</button>

	<script>
		function goBack() {
			window.location.href = "GetAllProductServlet";
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
				class="input" placeholder="Home Address" /><br /> <label
				for="gender">Gender</label> <input type="text" id="gender"
				name="gender" value="<%=user1.getGender()%>" class="input"
				placeholder="Gender (Male / Female)" /><br />
		</div>
		<div class="form">
			<label for="email">Email</label> <input type="email" id="email"
				name="email" class="input" value="<%=user1.getEmail()%>"
				placeholder="Email" /><br /> <label for="Date of Birth">Date
				of Birth</label> <input type="date" id="dob" name="dob" class="input"
				value="<%=user1.getDob()%>" /><br /> <label for="Pincode">Pincode</label>
			<input type="text" id="pincode" name="pincode" class="input"
				value="<%=user1.getPincode()%>" placeholder="Pincode" /><br /> <label
				for="district">District</label> <input type="text" id="district"
				name="district" class="input" value="<%=user1.getDistrict()%>"
				placeholder="District" /><br /> <label for="state">State</label> <input
				type="text" id="state" name="state" class="input"
				value="<%=user1.getState()%>" placeholder="State" /><br />

			<button type="submit">Update</button>
			<a href="DeleteUserServlet?email=<%=user1.getEmail()%>">
				<button>Delete</button>
			</a>

		</div>
	</form>

	<script type="text/javascript">
		function back() {
			window.location.href = "GetAllProductServlet";

		}
	</script>

</body>
</html>