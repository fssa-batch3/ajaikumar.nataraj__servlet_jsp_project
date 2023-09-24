<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- <link rel="stylesheet" href="../assets/CSS/1-sign.css" /> -->
<style type="text/css">
/* Reset some default browser styles */
body, h1, h2, p, label, input, textarea, button {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
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

/* Form container styles */
.full {
	background-color: #fff; /* Form background color */
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Box shadow */
	max-width: 1000px;
	margin: 20px auto;
}

/* Form input and textarea styles */
form div {
	margin: 10px 0;
	text-align: left;
}

.form {
	display: flex;
}

label {
	display: block;
	font-weight: bold;
	font-size: 16px;
	color: #333;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="password"],
	textarea {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

/* Password visibility toggle icon */
i.bi {
	cursor: pointer;
	position: absolute;
	right: 10px;
	top: 55%;
	transform: translateY(-50%);
}

/* Submit button styles */
button.sub {
	background-color: #007bff; /* Button background color */
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
}

/* Login button styles */
button.log {
	background-color: #333; /* Button background color */
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
}

/* Footer styles */
footer div {
	margin-top: 20px;
}

small {
	font-size: 14px;
	color: #777;
}

/* Media query for responsive design */
@media screen and (max-width: 768px) {
	/* Adjust styles for smaller screens if needed */
	.full {
		max-width: 80%;
	}
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<title>Insert title here</title>
</head>
<body class="body">

	<div class="full">
		<h1>Welcome! to Rishi Organic Market</h1>
		<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null) {
			out.println("<p style='color: red;'>" + errorMessage + "</p>");
		}
		%>
		<form action="<%=request.getContextPath()%>/RegisterBuyerServlet"
			method="post" class="form" id="form">
			<div>
				<img src="../assets/image/buy_sign.png" alt="farmer" width="500px" />
			</div>
			<div>
				<!-- <p class="mandatory">* All fields are mandatory</p>  -->

				<input type="text" id="name" name="name" pattern="[a-zA-Z]{4, 20}"
					value="Ajaikumar" placeholder="Enter your name" autocomplete="off"
					title="Enter a single name" required autofocus /><br /> <br /> <input
					type="email" id="email" name="email" placeholder="Enter your email"
					value="ajai@gmail.com" autocomplete="hgfgtyfygh" required /><br />
				<br /> <input type="tel" id="phone_number" name="phone_number"
					value="9878796875" pattern="[6-9]{1}[0-9]{9}"
					placeholder="Enter your phone number" autocomplete="hgfgtyfygh"
					maxlength="10" required /><br /> <br /> <input type="password"
					pattern="^(?!\s)(?!.*\s)[^\s]{6,}$" value="Ajai@123"
					placeholder="Enter your password" autocomplete="hg" id="password"
					name="password"
					title="- Don't leave spaces between the password
            - Atleast 6 characters
            - Use capital and small aiphabets"
					required /> <br /> <br />
				<textarea required pattern="[a-zA-Z]" name="address" id="address"
					value="10, gandhi street, gobi." placeholder="Enter your address"
					cols="45" rows="5"></textarea>
				<input id="pincode" name="pincode" type="tel" pattern="[0-9]{6}"
					value="638236" placeholder="Enter your pincode" maxlength="6"
					minlength="6" /> <br />


				<button class="sub" type="submit" value="submit" onclick="sign()">
					Register Now</button>
			</div>
		</form>

		<footer>
			<div>

				<small><p>
						If you already sign in! Please <a href="2.buy-login.jsp">
							login..</a>
					</p></small>
			</div>
		</footer>
	</div>




</body>
</html>
<!--  <script src="../assets/JavaScript/buyer_signup.js"></script>
	<script>
      // get currentdate
      const today = new Date();
      const year = today.getFullYear();
      let month = today.getMonth() + 1;
      let day = today.getDate();

      // add leading zero if month or day is a single digit
      if (month < 10) {
        month = "0" + month;
      }

      if (day < 10) {
        day = "0" + day;
      }

      const currentDate = `${year}-${month}-${day}`;

      console.log(currentDate);
      // create an array and get the detail from form
      let signUpform = document.getElementById("form");
      document.createElement("newBuyerInfo");

      // code for the process while click the sign up button
      signUpform.addEventListener("submit", function (event) {
        event.preventDefault();
        let array = [];
        if (localStorage.getItem("newBuyerInfo") != null) {
          array = JSON.parse(localStorage.getItem("newBuyerInfo"));
        }

        let match = false;

        // to get the value from form by their ID
        const id = Date.now();
        console.log(id);
        const FullName = document.getElementById("full_name").value;
        const Email = document.getElementById("email").value.toLowerCase();
        const Phone_number = document.getElementById("phone_number").value;
        const Password = document.getElementById("password").value;
        const Home_Address = document.getElementById("address").value;
        const Confirm_Password =
          document.getElementById("conform_password").value;
        let joining_date = currentDate;

        // code for check password and confirm password are same or not
        if (Password != Confirm_Password) {
          alert("Password and Confirm password are not match");
          return false;
        } else {
          for (let i = 0; i < array.length; i++) {
            if (Email == array[i]["Email"]) {
              match = true;
            }
          }
        }
        // code for create the user details in an array by object
        if (match == true) {
          alert("Email is already Exist");
          return false;
        } else {
          let userObj = {
            FullName,
            id,
            Email,
            Phone_number,
            Password,
            Home_Address,
            Confirm_Password,
            joining_date,
          };
          console.log(userObj);

          array.push(userObj);
          const str = JSON.stringify(array);
          localStorage.setItem("newBuyerInfo", str);
          console.log(str);
          window.location.href = "/pages/2.buy-login.html";
        }
      });

      function log() {
        window.location.href = "/pages/2.buy-login.html";
      }

      // for create  user id
      const start = Date.now();
    </script> -->