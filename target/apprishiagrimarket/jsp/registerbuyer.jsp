<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<title>Registration Buyer Page</title>
<style>
body {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	/* font-size: 25px;
	/* background-color: rgb(227, 241, 233); */
	text-align: center;
	justify-content: center;
	display: flex;
	align-items: center;
	align-content: center;
}

input:valid {
	border: 2px solid rgb(15, 232, 15);
}

input:invalid {
	border: 2px solid red;
}

textarea:valid {
	border: 2px solid rgb(15, 232, 15);
}

textarea:invalid {
	border: 2px solid red;
}

.body {
	font-size: 30px;
	color: black;
}

.head {
	text-align: center;
}

.sub {
	margin-top: 20px;
}

.form {
	display: flex;
	text-align: center;
	align-items: center;
	align-content: center;
	border: 1px solid #2bae66ff;
	box-shadow: 3px 3px 3px 3px rgb(217, 244, 217);
	width: 950px;
	height: 600px;
	border-radius: 6px;
	position: relative;
}

.form input {
	font-size: 30px;
	border-radius: 6px;
}

textarea {
	font-size: 30px;
	width: 370px;
	border-radius: 6px;
	height: 100px;
}

.full {
	justify-content: center;
}

.log {
	margin-top: 30px;
}

button {
	font-size: 30px;
	border-radius: 5px;
	width: 200px;
	color: #2bae66ff;
	background-color: aliceblue;
	border: 1px solid #2bae66ff;
}

button:hover {
	background-color: #2bae66ff;
	color: aliceblue;
}

h1 {
	font-size: 33px;
	/* display: flex; */
	color: seagreen;
}

button:hover {
	scale: 1.1;
}

/* for password eye symbol */
form i {
	margin-left: -30px;
	cursor: pointer;
}

.mandatory {
	font-size: 10px;
	position: absolute;
	top: 0;
	right: 5px;
	color: red;
}
/* Media query*/
@media screen and (max-width: 600px) {
	* {
		font-size: 25px;
		margin-left: -50px;
	}
	.head img {
		margin-left: 80px;
		width: 80px;
	}
	.form input {
		font-size: 20px;
	}
	.h {
		margin-top: -110px;
		margin-left: 50px;
	}
	.fs {
		margin-left: -345px;
		width: 500px;
		height: 500px;
	}
	.form {
		margin-left: 40px;
		margin-top: 120px;
	}
	.center {
		width: 300px;
	}
	.sub {
		margin-left: 100px;
	}
	.log {
		margin-left: -50px;
	}
	button {
		font-size: 20px;
		width: 150px;
	}
}
</style>
</head>
<body class="body">
	<div class="full">
		<h1>Welcome! to Rishi Organic Market</h1>
		<form action="RegisterBuyerServlet" method="post" class="form"
			id="form">
			<div>
				<img src="./assets/image/buy_sign.png" alt="farmer" width="500px" />
				<label for="pincode">Pincode</label> <br /> <input id="pincode"
					name="pincode" type="tel" pattern="[0-9]{6}" maxlength="6"
					minlength="6" />
			</div>
			<div>
				<p class="mandatory">* All fields are mandatory</p>

				<label for="name">Full Name:</label><br /> <input type="text"
					id="name" name="name" pattern="[a-zA-Z]{8, 20}" autocomplete="off"
					title="Enter a single name" required autofocus /><br /> <label
					for="email">Mail id:</label><br /> <input type="email" id="email"
					name="email" autocomplete="hgfgtyfygh" required /><br /> <label
					for="phone_number">Phone no:</label><br /> <input type="tel"
					id="phone_number" name="phone_number" pattern="[6-9]{1}[0-9]{9}"
					autocomplete="hgfgtyfygh" maxlength="10" required /><br /> <label
					for="password">Password:</label><br /> <input type="password"
					pattern="^(?!\s)(?!.*\s)[^\s]{6,}$" autocomplete="hg" id="password"
					name="password"
					title="- Don't leave spaces between the password
            - Atleast 6 characters
            - Use capital and small aiphabets"
					required /><i class="bi bi-eye-slash" id="togglePassword"></i><br />
				<label for="confirm_password">Confirm Password:</label><br /> <input
					type="password" id="confirm_password" name="confirm_password"
					pattern="^(?!\s)(?!.*\s)[^\s]{6,}$" autocomplete="hg" required /><i
					class="bi bi-eye-slash" id="toggleConformPassword"></i> <br /> <label
					for="address">Address</label> <br />
				<textarea required pattern="[a-zA-Z]" name="address" id="address"
					cols="45" rows="5"></textarea>


				<button class="sub" type="submit" value="submit" onclick="sign()">
					Register Now</button>
			</div>
		</form>

		<footer>
			<div>
				<a a href="loginBuyer.jsp">
					<button class="log" type="submit" onclick="log()">Login</button>
				</a> <small><p>If you already sign in! Please Login..</p></small>
			</div>
		</footer>
	</div>



</body>
</html>