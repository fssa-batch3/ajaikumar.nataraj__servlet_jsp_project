<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

.product-details {
    border: 1px solid #ddd;
    padding: 20px;
    margin-top: 20px;
}

.product-details h2 {
    color: #333;
}

.product-details p {
    color: #666;
}

</style>
</head>
<body>
    <div class="container">
        <h1>Agricultural Product Details</h1>
        <div class="product-details">
            <h2>${product.name}</h2>
            <p>Description: ${product.description}</p>
            <p>Price: $${product.price}</p>
            <p>Quantity Available: ${product.quantity}</p>
        </div>
    </div>
</body>
</html>