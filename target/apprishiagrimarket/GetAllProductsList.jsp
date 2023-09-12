<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<style>
.product-card {
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px;
	max-width: 300px;
	height: auto;
}

.product-card h2 {
	margin: 0;
}

#coverpic {
	max-width: 100%;
	max-height: 200px;
	display: block;
	margin: auto;
}

#productContainer {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	flex-wrap: wrap;
	justify-content: center;
	align-items: flex-start;
	flex-wrap: wrap;
}

button {
	background-color: yellow;
	border: none;
}

.search-bar {
	margin: 20px 0;
}

img {
	width: 200px;
}
</style>
</head>
<body>
	<h1>All Products List</h1>
	<a href="ProfileServlet">Profile</a>
	<a href="LogoutServlet">Logout</a>

	<div class="search-bar">
		<input type="text" id="searchInput" placeholder="Search products...">
	</div>

	<div class="product-cards" id="productContainer">
		<c:forEach var="product" items="${PRODUCTS_LIST}">
			<div class="product-card">
				<img alt="img" src="${product.url}">
				<p>${product.name}</p>
				<p>${product.price}</p>
				<p>${product.quantity}</p>
				<p>${product.description}</p>
				<button>Add to Cart</button>
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
</body>
</html>
