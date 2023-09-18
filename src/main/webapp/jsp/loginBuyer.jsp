<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Buyer</title>
<style>
.body {
	font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
		sans-serif;
	font-size: 30px;
	text-align: center;
	align-items: center;
	align-content: center;
}

.center {
	justify-content: space-between;
	align-content: center;
	/* border: 1px solid #2bae66ff; */
	box-shadow: 3px 3px 5px 5px rgb(217, 244, 217);
	height: 400px;
	width: 600px;
	border-radius: 10px;
}

.center input {
	border-radius: 8px;
}

.center label {
	margin-top: 30px;
}

input:valid {
	border: 2px solid rgb(15, 232, 15);
}

input:invalid {
	border: 2px solid red;
}

.btn {
	font-size: 30px;
	width: 300px;
	margin-top: 20px;
	background-color: #2bae66ff;
	color: white;
	border: none;
	box-shadow: 2px 2px 2px rgb(217, 244, 217);
	border-radius: 5px;
}

button:hover {
	color: #2bae66ff;
	background-color: whitesmoke;
}

.form {
	display: flex;
	align-content: center;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin-top: 40px;
}

.form input {
	font-size: 30px;
}

.footer {
	/* margin-top: 90px; */
	text-align: center;
	padding: 30px auto;
}

/* Media query*/
@media screen and (max-width: 600px) {
	* {
		width: 600px;
	}
	body {
		width: 600px;
		height: 800px;
		font-size: 20px;
		text-align: start;
		overflow: hidden;
	}
	.body {
		width: 600px;
	}
	.body img {
		width: 90px;
		text-align: none;
	}
	.form {
		width: 500px;
	}
	h1 {
		margin-left: 40px;
	}
	input {
		width: 400px;
	}
}
</style>
</head>
<body class="body">
	<h1>Hi! Buyer...</h1>

	<%
	String e = (String) request.getAttribute("ErrorMessage");
	if (e != null) {
	%>
	<span style="color: red;"><%=e%></span>
	<%
	}
	%>

	<div class="form">
		<form action="LoginBuyerServlet" method="post" class="center"
			id="form">


			<label>User Mail id:</label><br /> <input type="text" id="Email"
				required value="kannan@gmail.com" name="email" /><br /> <label>Password:</label><br />
			<input value="Ajai@12345" type="password" id="Password" required
				name="password" /> <br />
			<button class="btn" type="submit">Sign in</button>
		</form>
	</div>
	<p>
		If you don't have an account! <a href="#" onclick="sign()">Signup</a>
	</p>
	<footer class="footer">Toll-Free no:1800 123 100</footer>

</body>
</html>