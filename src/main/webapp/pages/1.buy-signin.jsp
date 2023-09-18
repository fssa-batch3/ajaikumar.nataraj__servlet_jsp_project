<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../assets/CSS/1-sign.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<title>Insert title here</title>
</head>
<body class="body">

	<div class="full">
		<h1>Welcome! to Rishi Organic Market</h1>
		<form action="<%= request.getContextPath()%>/RegisterBuyerServlet" method="post" class="form"
			id="form">
			<div>
				<img src="../assets/image/buy_sign.png" alt="farmer" width="500px" />
				<label for="pincode">Pincode</label> <br /> <input id="pincode"
					name="pincode" type="tel" pattern="[0-9]{6}" maxlength="6"
					minlength="6" />
			</div>
			<div>
				<!-- <p class="mandatory">* All fields are mandatory</p>  -->

				<label for="name">Full Name:</label><br /> <input type="text"
					id="name" name="name" pattern="[a-zA-Z]{8, 20}" autocomplete="off"
					title="Enter a single name" required autofocus /><br /> <label
					for="email">Mail id:</label><br /> <input type="email" id="email"
					name="email" autocomplete="hgfgtyfygh" required /><br /> <label
					for="phone_number">Phone no:</label><br /> <input type="tel"
					id="phone_number" name="phone_number" pattern="[6-9]{1}[0-9]{9}"
					autocomplete="hgfgtyfygh" maxlength="10" required /><br /> <label
					for="password">Password:</label><br /> <input type="password"
					pattern="^(?!\s)(?!.*\s)[^\s]{6,}$" autocomplete="hg" id="password"
					name="password"
					title="- Don't leave spaces between the password
            - Atleast 6 characters
            - Use capital and small aiphabets"
					required /><i class="bi bi-eye-slash" id="togglePassword"></i><br />
				<label for="confirm_password">Confirm Password:</label><br /> <input
					type="password" id="confirm_password" name="confirm_password"
					pattern="^(?!\s)(?!.*\s)[^\s]{6,}$" autocomplete="hg" required /><i
					class="bi bi-eye-slash" id="toggleConformPassword"></i> <br /> <label
					for="address">Address</label> <br />
				<textarea required pattern="[a-zA-Z]" name="address" id="address"
					cols="45" rows="5"></textarea>


				<button class="sub" type="submit" value="submit" onclick="sign()">
					Register Now</button>
			</div>
		</form>

		<footer>
			<div>
				<button class="log" type="submit" onclick="log()">Login</button>

				<small><p>If you already sign in! Please Login..</p></small>
			</div>
		</footer>
	</div>

	<script type="text/javascript">
		function log() {
			window.location.href = "2.buy-login.jsp";
		}
	</script>

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
</body>
</html>