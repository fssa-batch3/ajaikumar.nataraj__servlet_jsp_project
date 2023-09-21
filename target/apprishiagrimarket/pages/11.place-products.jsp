<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./assets/CSS/history.css" />
<title>Product List</title>
</head>
<body>
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
		<div class="name">
			<p onclick="profile()" id="newimg"></p>
		</div>
	</header>
	<h1>All Products List</h1>
	<div class="search-bar">
		<input class="search-bar" type="text" id="searchInput"
			placeholder="Search products...">
	</div>
	<nav>
		<a href="ProfileServlet?id=${userId}">
			<button>Profile</button>
		</a> <a href="LogoutServletSeller">
			<button>logout</button>
		</a>
	</nav>
	<div class="product-cards" id="productContainer">
		<c:forEach var="product" items="${products}">

			<div class="product-card">
				<img alt="img" src="${product.url}">
				<p>${product.name}</p>
				<p>Rs. ${product.price} / kg</p>
				<p>Available : ${product.quantity} Kg</p>
				<p>${product.description}</p>
				<a href="RegisterProductUpdate?id=${product.id}"><button>Edit</button>
				</a> <a href="DeleteProductServlet?id=${product.id}"><button>Delete</button></a>

			</div>


		</c:forEach>

	</div>

	<script>
		// Get the input element
		const searchInput = document.getElementById("searchInput");

		// Get all product cards
		const productCards = document.querySelectorAll(".product-card");

		// Add an event listener for input changes
		searchInput.addEventListener("input", function() {
			const query = searchInput.value.trim().toLowerCase();

			// Loop through all product cards and hide/show based on the search query
			productCards.forEach(function(card) {
				const productText = card.textContent.toLowerCase();
				if (productText.includes(query)) {
					card.style.display = "block";
				} else {
					card.style.display = "none";
				}
			});
		});
	</script>
	<!--       <script src="../assets/JavaScript/seller_place_order.js"></script>  -->
</body>
</html>

