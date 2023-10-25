<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<style type="text/css">
/* Reset some default browser styles */
body, h1, h2, p {
	margin: 0;
	padding: 0;
}

/* Overall page styles */
.body {
	background-color: #ffffff; /* Background color */
	font-family: Arial, sans-serif;
	text-align: center;
	padding: 20px;
}

/* Header styles */
h1 {
	font-size: 36px;
	color: #333; /* Header text color */
	margin-top: 20px;
}

/* Error message styles */
.error-message {
	color: red;
	font-weight: bold;
}

/* Form container styles */
.form {
	background-color: #fff; /* Form background color */
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Box shadow */
	max-width: 450px;
	margin: 20px auto;
}

/* Form input styles */
label {
	display: block;
	margin-top: 10px;
	text-align: left;
	font-weight: bold;
	font-size: 16px;
	color: #333;
}

input[type="text"], input[type="password"] {
	width: 95%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	margin-top: 15px;
	margin-right: 10px;
}

/* Sign-in button styles */
.btn {
	background-color: #007bff; /* Button background color */
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
	margin-top: 15px;
}

/* Sign-up link styles */
p a {
	color: #007bff;
	text-decoration: none;
}

/* Footer styles */
.footer {
	font-size: 14px;
	color: #777;
	margin-top: 20px;
}

.head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px
		2px, rgba(0, 0, 0, 0.09) 0px 8px 4px;
	color: white;
	height: 80px;
	width: 100%;
}

.topic {
	color: #2bae66ff;
	display: flex;
	justify-content: space-between;
	width: 700px;
}

.contact {
	background-color: #2bae66ff;
	height: 20px;
	font-size: 15px;
	color: white;
	display: flex;
	justify-content: space-evenly;
}

.contact p {
	margin-top: 2px;
}
</style>
</head>
<body class="body">
	<div class="contact">
		<p>+91 9876543210</p>
		<p>Rishi-market@agri.com</p>
	</div>
	<header class="head">
		<img onclick="back()" src="../assets/image/arrowback.png" alt="back"
			width="50px" />
		<div class="logo">
			<img onclick="home()" src="../assets/image/logo.png" alt="logo"
				width="90px" />
		</div>
		<div class="dropdown"></div>

	</header>
	<h1>Hi! User...</h1>

	<%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p style='color: red;'>" + errorMessage + "</p>");
	}
	%>


	<div class="form">
		<form action="<%=request.getContextPath()%>/LoginServlet"
			method="post" class="center" id="form">
			<nav>
				<img src="../assets/image/login.png" alt="profile" width="400px" />
			</nav>
			<input type="text" id="Email" name="email"
				placeholder="Enter your Email" value="gowtham@gmail.com" /><br /> <input
				value="Gowtham@123" placeholder="Enter your Password" name="password"
				type="password" id="Password" /> <br />
			<button class="btn" type="submit">Sign in</button>
		</form>
	</div>
	<p>
		If you don't have an account! <a
			href="<%=request.getContextPath()%>/pages/1.buy-signin.jsp"
			onclick="sign()">Signup</a>
	</p>
	<footer class="footer">Toll-Free no:1800 123 100</footer>
</body>
<script type="text/javascript">
	function back() {
		window.history.back();
	}
	function home() {
	    window.location.href = "<%=request.getContextPath()%>/index.jsp";
	}

</script>
</html>
<!-- 	<script src="../assets/JavaScript/buy_login.js"></script>  -->
<!-- <script>
      // to get id of form
      let buyer_logIn = document.getElementById("form");
      console.log(buyer_logIn);

      let arr = [];

      // function for get value from form
      buyer_logIn.addEventListener("submit", (event) => {
        event.preventDefault();
        try {
          // get details from local storage
          let user_data = JSON.parse(localStorage.getItem("newBuyerInfo"));
          console.log(user_data);

          // get value from form
          let Email = document
            .getElementById("Email")
            .value.toLowerCase()
            .trim();
          let Password = document.getElementById("Password").value;

          let match = false;

          // compare the values
          for (let find of user_data) {
            if (Email == find["Email"] && Password == find["Password"]) {
              match = true;
              arr.push(find);
              window.localStorage.setItem(
                "buyer_logIn",
                JSON.stringify(arr[0]["Email"])
              );
              break;
            } else {
              match = false;
            }
          }

          // details are same move to next page
          if (match == true) {
            alert("Successfully You login to your Account");

            window.location.href = "/pages/new_buyer.html";
          } else {
            alert("Login credentials not correct");
          }
        } catch (error) {
          console.error(error);
        }
      });

      function sign() {
        window.location.href = "/pages/1.buy-signin.html";
      }
    </script> -->