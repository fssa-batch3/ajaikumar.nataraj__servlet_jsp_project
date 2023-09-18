<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.rishi.model.ProductDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.product-card {
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px;
	max-width: 300px;
	height: 370px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 255, 0, 0.5);
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
	flex-wrap: wrap
}

input, textarea {
	width: 220px;
	margin-top: 10px;
}

button {
	margin-left: 40px;
	border: none;
	background-color: lightgreen;
}

img {
	width: 200px;
}
</style>
</head>
<body>
	<h1>All Products List</h1>

	<nav>
		<a href="ProfileServlet?id=${userId}">
			<button>Profile</button>
		</a> <a href="LogoutServletSeller">
			<button>logout</button>
		</a>
	</nav>


	<div class="product-cards" id="productContainer">
		<c:forEach var="product" items="${products}">

			<c:if test="${userId == product.seller_id}">
				<div class="product-card">
					<img alt="img" src="${product.url}">
					<p>${product.name}</p>
					<p>Rs. ${product.price} / kg</p>
					<p>Available : ${product.quantity} Kg</p>
					<p>${product.description}</p>
					<a href="RegisterProductUpdate?id=${product.id}"><button>Edit</button>
					</a> <a href="DeleteProductServlet?id=${product.id}"><button>Delete</button></a>

				</div>
			</c:if>

		</c:forEach>
	</div>

</body>
</html>