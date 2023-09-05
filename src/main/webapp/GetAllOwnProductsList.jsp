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
	height: auto;
	background-color: lightgrey;
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
</style>
</head>
<body>
	<h1>All Products List</h1>
	<a href="LogoutServletSeller">
		<button>logout</button>
	</a>

	<div class="product-cards" id="productContainer">
		<c:forEach var="product" items="${products}">

			<div class="product-card">
				<input type="text" value="${product.name}" /> <input type="number"
					value="${product.price}" /> <input type="number"
					value="${product.quantity}" />
				<textarea>${product.description}</textarea>
				<a
					href="RegisterProductUpdate?id=${product.id}&name=${product.name}&price=${product.price}&quantity=${product.quantity}&description=${product.description}">
					<button>Update</button>
				</a> <a href="DeleteProductServlet?id=${product.id}"><button>Delete</button></a>

			</div>
		</c:forEach>
	</div>

</body>
</html>