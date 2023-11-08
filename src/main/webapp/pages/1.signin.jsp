<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  <link rel="stylesheet" href="../assets/CSS/1-sign.css" /> -->
<style type="text/css">
/* Reset some default browser styles */
body, h1, h2, p, label, input, textarea, button {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Overall page styles */
.body {
	background-color: #ffffff; /* Background color */
	font-family: Arial, sans-serif;
	text-align: center;
	width: 100%;
}

/* Header styles */
h1 {
	font-size: 100%;
	color: #333; /* Header text color */
	margin-top: 20px;
}

/* Form container styles */
.full {
	background-color: #fff; /* Form background color */
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Box shadow */
	max-width: 65%;
	margin: 20px auto;
}

/* Form input and textarea styles */
form div {
	margin: 10px 0;
	text-align: left;
}

.form {
	display: flex;
}

label {
	display: block;
	font-weight: bold;
	font-size: 16px;
	color: #333;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="password"],
	textarea {
	width: 100%;
	padding: 3%;
	border: 1px solid #ccc;
	border-radius: 5%;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

/* Password visibility toggle icon */
i.bi {
	cursor: pointer;
	position: absolute;
	right: 10px;
	top: 55%;
	transform: translateY(-50%);
}

/* Submit button styles */
button.sub {
	background-color: #2bae66ff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
}

/* Footer styles */
footer div {
	margin-top: 20px;
}

small {
	font-size: 14px;
	color: #777;
}

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
	width: 50%;
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
/* Media query for responsive design */
@media screen and (max-width: 600px) {
	/* Adjust styles for smaller screens if needed */
	body {
		font-size: 15px;
	}
	.full {
		max-width: 80%;
	}
	.head img {
		width: 30px;
	}
	.logo img {
		width: 60px;
	}
	.form {
		margin-top: 20px;
	}
	.full {
		padding: 10px;
	}
	.contact p {
		font-size: 14px;
	}
	.sub {
		font-size: 16px;
		padding: 10px 20px;
	}
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<title>Document</title>
</head>

<body class="body">
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
		<div class="dropdown"></div>

	</header>
	<div class="full">
		<h1>Welcome! to Rishi Organic Market</h1>
		<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null) {
			out.println("<p style='color: red;'>" + errorMessage + "</p>");
		}
		%>
		<form action="<%=request.getContextPath()%>/RegisterSellerServlet"
			method="post" class="form" id="form">
			<div>
				<img src="../assets/image/login_farmer.png" alt="farmer"
					width="100%" />
			</div>
			<div>
				<input type="text" id="name" name="name" pattern="[a-zA-Z]{8, 20}"
					placeholder="Enter yout name" autocomplete="off"
					title="Enter a single name" required autofocus /><br /> <br /> <input
					type="email" id="email" name="email" placeholder="Enter yout email"
					autocomplete="hgfgtyfygh" required /><br /> <br /> <input
					type="tel" id="phoneNumber" name="phoneNumber"
					placeholder="Enter yout phone number" pattern="[6-9]{1}[0-9]{9}"
					maxlength="10" minlength="10" autocomplete="hgfgtyfygh" required /><br />
				<br /> <input id="password" pattern="^(?!\s)(?!.*\s)[^\s]{6,}$"
					name="password" type="password" autocomplete="hg"
					placeholder="Enter yout password"
					title="- Don't leave spaces between the password
                  - Atleast 6 characters
                  - Use capital and small aiphabets"
					required /> <br /> <br />
				<textarea required pattern="[a-zA-Z]" name="address" id="address"
					placeholder="Enter yout address" cols="45" rows="5"></textarea>
				<br /> <br /> <input id="pincode" name="pincode" type="tel"
					placeholder="Enter yout pincode" pattern="[0-9]{6}" maxlength="6"
					minlength="6" /><br /> <br />

				<button class="sub" type="submit" value="submit" onclick="sign()">
					sign up</button>
			</div>
		</form>

		<footer>
			<div>

				<small> If you already sign in! Please <a
					href="2.buy-login.jsp"> Login..</a>
				</small>
			</div>
		</footer>
	</div>



	
</body>
</html>
