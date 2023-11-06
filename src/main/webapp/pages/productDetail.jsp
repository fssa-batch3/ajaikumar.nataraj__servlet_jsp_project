<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ page import="com.fssa.rishi.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
User user = new User();
ProductDetails product = new ProductDetails();
user = (User) request.getAttribute("user");
product = (ProductDetails) request.getAttribute("products");
long id = (long) request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Verdana;
	background-color: #f5f5f5;
	color: #2bae66ff;
}

.head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	color: white;
	height: 80px;
	font-size: 30px;
	position: fixed;
	width: 100%;
	top: 20px;
	background-color: white;
	left: 0px;
	z-index: 1;
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

.contact {
	background-color: #2bae66ff;
	height: 20px;
	font-size: 15px;
	color: white;
	display: flex;
	justify-content: space-evenly;
	position: fixed;
	top: 0px;
	width: 100%;
	left: 0px;
}

.contact p {
	margin-top: 2px;
}

.dropdown {
	position: relative;
	display: inline-block;
	margin-right: 30px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.full {
	display: flex;
	justify-content: space-around;
	margin-top: 150px;
	height: 470px;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	font-size: 20px;
}

.full section {
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	justify-content: center;
	height: 430px;
	border-radius: 5px;
}

.img_div {
	display: flex;
}

.full_div {
	padding-left: 15px;
	width: 40%;
}

.card_div {
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	justify-content: center;
	font-size: 15px;
	border-radius: 5px;
	text-align: center;
}

.card_div img {
	border-radius: 5px;
}

footer {
	display: flex;
	justify-content: space-around;
	width: 100%;
	margin-top: 20px;
}

a {
	font-size: 15px;
	text-decoration: none;
	color: white;
}

.aTag {
	color: #2bae66ff;
}

.buy-now {
	color: white;
	background-color: green;
	padding: 15px 25px;
	font-size: 16px;
	border-radius: 50px;
	border: none;
}

.cart-btn {
	color: black;
	background-color: yellow;
	padding: 15px 25px;
	font-size: 16px;
	border-radius: 50px;
	border: none;
}

.buttons {
	display: flex;
	justify-content: space-evenly;
	text-align: center;
	width: 100%;
}
</style>
</head>
<body>
	<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<img onclick="back()"
			src="<%=request.getContextPath()%>/assets/image/arrowback.png"
			alt="back" width="40px" />
		<div class="logo">
			<img onclick="home()"
				src="<%=request.getContextPath()%>/assets/image/logo.png" alt="logo"
				width="90px" />
		</div>


		<a href="<%=request.getContextPath()%>/ProfileServlet?id=<%=id%>">
			<img src="<%=request.getContextPath()%>/assets/image/profile.png"
			alt="profile" width="40px" />
		</a>
	</header>

	<main>
		<section class="full">
			<section class="img_div">
				<div class="full_div">
					<img src="<%=product.getUrl()%>" alt="Product Image" width="250px"
						id="productImage" />
				</div>
				<div class="full_div">
					<p>
						Name :
						<%=product.getName()%></p>
					<p>
						Price: Rs.
						<%=product.getPrice()%>
						/ kg
					</p>

					<p>
						Available Qty :
						<%=product.getQuantity()%>
						kg
					</p>
					<p>
						Description :
						<%=product.getDescription()%></p>



					<div class="buttons">
						<a href="BuyNowServlet?id=<%=product.getId()%>"><button
								class="buy-now">Buy Now</button></a> <a
							href="AddToCartServlet?id=<%=product.getId()%>"><button
								class="cart-btn">Add to Cart</button></a>
					</div>



				</div>
			</section>
			<section class="full_div">
				<p>
					Name :
					<%=user.getUsername()%></p>
				<p>
					Ph. no :
					<%=user.getPhoneNumber()%></p>
				<p>
					Email :
					<%=user.getEmail()%></p>
				<p>
					Address :
					<%=user.getAddress()%></p>
				<p>
					Place :
					<%=user.getDistrict() != null ? user.getDistrict() + "," : ""%>
					<%=user.getPincode()%></p>
				<p></p>

			</section>
		</section>
	</main>

</body>
</html>