<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<title>Document</title>
<link rel="stylesheet" href="../assets/CSS/10-upload.css" />
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
			<img onclick="home()" src="../assets/image/logo.png" alt="logo"
				width="90px" />
		</div>
		<div class="name">
			<c:set var="userId" value="${userId}" />
			<a href="<%=request.getContextPath()%>/profileServlet?id=${userId}">
				<button class="btn">Profile</button>
			</a>



		</div>
	</header>

	<div class="btn_div">

		<a href="<%=request.getContextPath()%>/GetAllOwnProductsServlet">
			<button class="btn">History</button>
		</a> <a href="<%=request.getContextPath()%>/GetAllProductServlet">
			<button class="btn">Go to Buy</button>
		</a>
	</div>
	<section class="output_section"></section>

	<a href="../assets/image/apple.jpg"></a>
	<section class="sec"></section>

	<form action="<%=request.getContextPath()%>/RegisterProductServlet"
		method="post" class="full-card" id="form">
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
						autocomplete="off" />
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
					<label for="district">District</label> <br> <input required
						list="Districts" name="district" id="district"
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
					</datalist>
				</nav>

				<nav>
					<label for="address">Enter Address</label> <input
						required="required" type="text" id="address" name="address"
						value="10, Gandhi street, gobi." placeholder="Enter Your Address" />
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


</body>
</html>
