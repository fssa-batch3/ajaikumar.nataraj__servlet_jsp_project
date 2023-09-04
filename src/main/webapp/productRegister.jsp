<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Register</title>
<style type="text/css">
body {
	font-size: 30px;
	color: #2bae66ff;
	font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
		sans-serif;
}

.btn_div {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
}

.head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	color: white;
	height: 80px;
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

button:hover {
	color: #2bae66ff;
	background-color: aliceblue;
	transition: 1s;
}

.head img {
	border-radius: 5px;
	color: aliceblue;
}

.title {
	color: #2bae66ff;
	/* margin-top: -40px; */
	/* margin-left: 200px; */
}

input {
	font-size: 30px;
	margin-top: 5px;
	border: none;
	border-radius: 5px;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
}

.main ::placeholder {
	font-size: 40px;
}

.sec {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
}

.full_list {
	display: flex;
	justify-content: space-evenly;
	margin-top: 40px;
}

.list {
	width: 500px;
}

.list nav {
	margin-top: 15px;
}

.footer {
	display: flex;
	justify-content: center;
	text-align: center;
	align-items: center;
	align-content: center;
	margin-top: 20px;
}

.footer button {
	width: 200px;
	background-color: #2bae66ff;
	color: white;
	padding: 15px 30px;
	border-radius: 10px;
	font-size: 25px;
	border: none;
}

.footer button:hover {
	color: #2bae66ff;
	background-color: aliceblue;
	transition: 1s;
}

.add img {
	margin-left: 150px;
}

.btn {
	font-size: 20px;
	border: none;
	border-radius: 5px;
	width: 140px;
	height: 40px;
	background-color: #2bae66ff;
	color: white;
}

.btn-card {
	margin-top: 20px;
	display: flex;
	justify-content: center;
}

.detail, .img {
	border: none;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
}

.details {
	height: 350px;
}

.full-card {
	border-radius: 10px;
	height: 600px;
	background-color: white;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
}

.full-card h3 {
	text-align: center;
}

.description {
	width: 580px;
	height: 100px;
}

.output-btn {
	width: 300px;
	height: 40px;
	border: none;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
}

.div_card-output {
	height: 440px;
	background-color: rgb(191, 227, 191);
	text-align: center;
	float: right;
	border-radius: 10px;
}

.steps {
	margin-top: 300px;
	margin-bottom: 440px;
	margin-left: 100px;
}
</style>
</head>
<body>
	<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<img onclick="back()" src="../assets/image/arrowback.png" alt="back"
			width="50px" />
		<div class="logo">
			<img src="./images/logo.png" alt="Image" width=70px>

		</div>
		<div class="name">
			<p onclick="profile()" id="newimg"></p>
		</div>
	</header>



	<a href="../assets/image/apple.jpg"></a>
	<section class="sec"></section>

	<form method="post" action="RegisterProductServlet" class="full-card"
		id="form">
		<h3>Upload your products</h3>
		<div class="full_list">
			<div class="list">
				<nav>
					<label for="url">Product's Url</label> <input type="url" name="url"
						id="url" placeholder="Enter Image Url" />
				</nav>
				<nav>
					<label for="name">Product's Name</label> <input required="required"
						type="text" name="name" id="name" value="Graphes"
						placeholder="Your Product's Name" />
				</nav>
				<nav>
					<label for="type">Product's Type</label> <input required="required"
						list="Types" name="type" id="type" placeholder="Type"
						autocomplete="off" value="Fruit" />
					<datalist id="Types">
						<option value="Fruit"></option>
						<option value="Vegetable"></option>
						<option value="Coffee & Tea"></option>
						<option value="Cereals & Grains"></option>
					</datalist>
				</nav>
				<nav>
					<label for="description"> Description about your product </label> <br />
					<input required="required" name="description" type="text"
						id="description" class="description"
						value="It is good fruit with nutrients"
						placeholder="Description about your products" />
				</nav>
			</div>
			<div class="list">
				<nav>
					<label for="price">Product's Price</label> <input
						required="required" type="number" name="price" id="price"
						value="100" placeholder="Enter Your Product's Price per kg" />
				</nav>
				<nav>
					<label for="qty">Product's Quantity</label> <input
						required="required" type="number" name="qty" id="qty" value="100"
						placeholder="Enter Your Product's Quantity" />
				</nav>
				<nav>
					<label for="city">City Name</label> <input required="required"
						type="text" id="city" name="city" value="Gobi"
						placeholder="Enter Your City Name" />
				</nav>
				<nav>
					<label for="address">Enter Address</label> <input required="required"
						type="text" id="address" name="address" value="10, Gandhi street, gobi."
						placeholder="Enter Your Address" />
				</nav>
				<nav>
					<label for="pincode">Enter your Pincode</label> <input
						required="required" type="number" id="pincode" name="pincode"
						value="654321" placeholder="Enter your Pincode" />
				</nav>
			</div>
		</div>

		<div class="btn-card">
			<button class="btn" id="add-btn">Add</button>
		</div>
	</form>

	<div class="add_detail"></div>

	<footer id="form" class="footer">
		<button type="button" onclick="history()">History</button>
	</footer>
	<script type="text/javascript">
		function history() {
			window.location.href = "GetAllOwnProductsServlet";

		}
	</script>
</body>
</html>