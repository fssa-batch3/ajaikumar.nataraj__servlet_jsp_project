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
<style type="text/css">
.dropdown {
	position: relative;
	display: inline-block;
	margin-right: 30px;
}

.dropdown-content {
	display: none;
	position: absolute;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

#noProductMessage {
	margin-left: 80%;
	text-align: center;
}

p {
	width: 500px;
}

/* Edit Button */
.edit-button {
	text-decoration: none; /* Remove underline for the link */
	display: inline-block; /* Ensure the link is inline with the button */
}

.edit-button button {
	background-color: blue; /* Change the background color */
	color: #fff; /* Change the text color */
	padding: 5px 10px; /* Add some padding for better appearance */
	border: none; /* Remove button border */
}

/* Delete Button */
.delete-button {
	background-color: red; /* Change the background color on hover */
	color: #fff; /* Change the text color */
	border: none; /* Remove button border */
	padding: 5px 10px; /* Add some padding for better appearance */
	cursor: pointer; /* Change cursor to indicate it's clickable */
}


</style>
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
		<div class="dropdown">
			<img alt="menu" src="./assets/image/menu.png" width="30px">
			<div class="dropdown-content">
				<a href="LogoutServlet"> <img src="./assets/image/logout.png"
					alt="logo" width="30px" />
				</a> <br> <a href="ProfileServlet?id=${userId}"> <img
					src="./assets/image/profile.png" alt="logo" width="30px" />
				</a>
			</div>
		</div>
		<!-- 	<div class="profile">
			<div>
				<a href="LogoutServlet"> <img onclick="home()"
					src="./assets/image/logout.png" alt="logo" width="30px" />
				</a>
			</div>
			<div class="name">
				<a href="ProfileServlet?id=${userId}"> <img onclick="home()"
					src="./assets/image/profile.png" alt="logo" width="50px" />
				</a>
			</div>
		</div> -->

	</header>
	<h1>All Products List</h1>
	<div class="search-bar">
		<input class="search-bar" type="text" id="searchInput"
			placeholder="Search products...">
	</div>

	<div class="product-cards" id="productContainer">
		<c:if test="${not empty products}">
			<c:forEach var="product" items="${products}">
				<div class="product-card">
					<img alt="img" src="${product.url}">
					<p>${product.name}</p>
					<p>Rs. ${product.price} / kg</p>
					<p>Available: ${product.quantity} Kg</p>
					<p>${product.description}</p>
					<a href="RegisterProductUpdate?id=${product.id}"
						class="edit-button"><button>Edit</button></a>
					<button type="button"
						onclick="valid('<%=request.getContextPath()%>', ${product.id})"
						class="delete-button">Delete</button>


				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty products}">
			<div id="noProductMessage">
				<img alt="failure" src="./assets/image/failure.png" width="500px">
				<p>You didn't add any products</p>
			</div>
		</c:if>

		<div id="noProductMessage" style="display: none;">
			<img alt="failure" src="./assets/image/failure.png" width="500px">
			<p>There is no product related to your search</p>
		</div>
	</div>

	<script>
	function valid(contextPath, productId) {
		  const result = confirm("Are you sure you want to delete?");
		  if (result) {
		    // Construct the URL using the provided parameters
		    window.location.href = contextPath + "/DeleteProductServlet?id=" + productId;
		  }
		  return false;
		}



		// Get the input element
		const searchInput = document.getElementById("searchInput");
		const productCards = document.querySelectorAll(".product-card");
		const noProductMessage = document.getElementById("noProductMessage");

		searchInput.addEventListener("input", function() {
			const query = searchInput.value.trim().toLowerCase();
			let found = false;

			productCards.forEach(function(card) {
				const productText = card.textContent.toLowerCase();
				if (productText.includes(query)) {
					card.style.display = "block";
					found = true;
				} else {
					card.style.display = "none";
				}
			});

			if (!found) {
				noProductMessage.style.display = "block";
			} else {
				noProductMessage.style.display = "none";
			}
		});

		function back() {
			window.history.back();
		}
	</script>
	<!--       <script src="../assets/JavaScript/seller_place_order.js"></script>  -->
</body>
</html>

