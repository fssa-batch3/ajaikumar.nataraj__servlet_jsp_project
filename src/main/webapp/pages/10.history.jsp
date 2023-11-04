<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ page import="com.fssa.rishi.model.User"%>

<%
ProductDetails product = (ProductDetails) request.getAttribute("updateProduct");
long id = (long) request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/CSS/10-upload.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<img onclick="back()" src="./assets/image/arrowback.png" alt="back"
			width="40px" />
		<div class="logo">
			<img onclick="home()" src="./assets/image/logo.png" alt="logo"
				width="90px" />
		</div>
		<div class="name">
			<a href="ProfileServlet?id=<%=id%>"> <img onclick="home()"
				src="./assets/image/profile.png" alt="logo" width="40px" />
			</a>
		</div>
	</header>

	<form action="RegisterProductUpdate?id=<%=product.getId()%>"
		method="post" class="full-card" id="form">
		<h3>Update your products</h3>
		<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null) {
			out.println("<p style='color: red;'>" + errorMessage + "</p>");
		}
		%>
		<div class="full_list">
			<div class="list">
				<nav>
					<label for="productImage">Product Image</label> <br /> <img
						src="<%=product.getUrl()%>" alt="Product Image" width="300px" style="border-radius: 10px;"
						id="productImage" /> <input type="hidden" name="url"
						value=<%=product.getUrl()%>>
				</nav>

				<nav>
					<label for="name">Product's Name</label> <br /> <input
						required="required" value=<%=product.getName()%> type="text"
						name="name" id="name" readonly />

				</nav>
				<nav>
					<label for="price">Product's Price</label> <br /> <input
						required="required" type="number" name="price" id="price"
						pattern="[0-9]{6}" maxlength="6" minlength="6"
						value=<%=product.getPrice()%> />

				</nav>
				<nav>
					<label for="qty">Product's Quantity</label> <br /> <input
						required="required" type="number" name="qty" id="qty"
						pattern="[0-9]{6}" maxlength="6" minlength="6"
						value=<%=product.getQuantity()%> />

				</nav>



			</div>
			<div class="list">
				<nav>
					<label for="type">Product's Type</label><br /> <input
						required="required" list="Types" name="type" id="type"
						autocomplete="off" value=<%=product.getType()%> readonly />

					<datalist id="Types">
						<option value="Fruit"></option>
						<option value="Vegetable"></option>
						<option value="Coffee & Tea"></option>
						<option value="Cereals & Grains"></option>
					</datalist>
				</nav>
				<nav>
					<label for="district">District</label> <br> <input required
						list="Districts" name="district" id="district"
						value=<%=product.getDistrict()%> placeholder="Select District"
						autocomplete="off" />
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
					<label for="address">Enter Address</label> <br /> <input
						required="required" type="text" id="address" name="address"
						value="10, Gandhi street, gobi." value=<%=product.getAddress()%> />
				</nav>
				<nav>
					<label for="pincode">Enter your Pincode</label><br /> <input
						required="required" type="text" id="pincode" name="pincode"
						value="654321" placeholder="Enter your Pincode" pattern="[0-9]{6}"
						maxlength="6" minlength="6" value=<%=product.getPincode()%> />
				</nav>
				<nav>
					<label for="description"> Description about your product </label> <br />
					<textarea required="required" name="description" id="description"
						class="description"> <%=product.getDescription()%> </textarea>
				</nav>
			</div>
		</div>

		<div class="btn-card">
			<button class="btn" id="add-btn" type="submit">Save</button>
		</div>
	</form>
	<script>
		function back() {
			window.history.back();
		}
	</script>
</body>
</html>