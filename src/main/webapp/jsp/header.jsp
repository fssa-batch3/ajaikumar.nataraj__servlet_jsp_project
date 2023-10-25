<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
</head>



<%
String loggedInEmail = (String) session.getAttribute("loggedInEmail");
String id = (String) session.getAttribute("sellerId");

if (loggedInEmail == null) {
%>
<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
</li>
<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a>
</li>
<%
} else {
%>
<header class="head">
	<img onclick="back()" src="../assets/image/arrowback.png" alt="back"
		width="50px" />
	<div class="logo">
		<img onclick="home()" src="../assets/image/logo.png" alt="logo"
			width="90px" />
	</div>

	<div class="dropdown">
		<img alt="menu" src="../assets/image/menu.png" width="30px">
		<div class="dropdown-content">
			<a href="<%=request.getContextPath()%>/GetAllOwnProductsServlet">
				<img src="../assets/image/orders.png" alt="orders" width="30px" />
			</a> <br> <a
				href="<%=request.getContextPath()%>/GetAllProductServlet"> <img
				src="../assets/image/cart.png" alt="cart" width="30px" />
			</a><br> <a
				href="<%=request.getContextPath()%>/sellerNotificationServlet?userId=<%=id%>">
				<img src="../assets/image/notification.png" alt="notification"
				width="30px" />
			</a><br> <a
				href="<%=request.getContextPath()%>/ProfileServlet?id=<%=id%>">
				<img src="../assets/image/profile.png" alt="profile" width="30px" />
			</a><br> <a href="<%=request.getContextPath()%>/LogoutServlet"><img
				src="../assets/image/logout.png" alt="logo" width="30px" /></a>
		</div>
	</div>
</header>

<%
}
%>
