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
<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<img onclick="back()" src="../assets/image/arrowback.png" alt="back"
			width="40px" />
		<div class="logo">
			<img onclick="home()" src="../assets/image/logo.png" alt="logo"
				width="90px" />
		</div>

		<div>
			<a href="<%=request.getContextPath()%>/ProfileServlet?id=<%=id%>">
				<img src="../assets/image/profile.png" alt="profile" width="40px" />
			</a>
		</div>
	</header>

<%
}
%>
