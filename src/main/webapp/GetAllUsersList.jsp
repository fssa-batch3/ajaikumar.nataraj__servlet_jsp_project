<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
button {
	background-color: #2bae66ff;
	color: aliceblue;
	border: none;
	border-radius: 5px;
	font-size: 20px;
	width: 300px;
	height: 40px;
	margin-top: 20px;
}

button:hover {
	background-color: white;
	color: #2bae66ff;
	/* scale: 1.1; */
}

img {
	width: 300px;
	border-radius: 5px;
	margin-left: 100px;
}

body {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	max-width: 1240px;
	font-size: 27px;
	font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
		sans-serif;
}

.main {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	align-content: center;
	text-align: center;
	box-shadow: 1px 1px 3px 3px rgb(188, 219, 188);
	border-radius: 10px;
	height: 780px;
	margin-top: 10px;
}

.extraDetail {
	display: flex;
}

.profile {
	width: 400px;
}

input {
	width: 400px;
	align-items: start;
	font-size: 30px;
	border-radius: 5px;
	box-shadow: 1px 1px 1px 1px rgb(159, 223, 159);
	border: none;
}
input::placeholder {
    font-size: 14px; 
}

.form {
	width: 410px;
}

label {
	font-size: 25px;
}

/* for password eye symbol */
form i {
	margin-left: -40px;
	cursor: pointer;
}
</style>
<body>
	<form action="RegisterUserUpdate" method="POST" class="main">
        <div class="profile">
            <label for="User name">User name</label><br/>
            <input type="text" id="user_name" name="user_name" class="input" placeholder="User Name" /><br/>
            
            <label for="ph no">Phone Number</label>
            <input type="text" id="phone_number" name="phone_number" class="input" placeholder="Phone Number" /><br/>
            
            <label for="Home Address">Home Address</label>
            <input type="text" id="home_address" name="home_address" class="input" placeholder="Home Address" /><br/>
            
            <label for="Land Address">Land Address</label>
            <input type="text" id="land_address" name="land_address" class="input" placeholder="Land Address" /><br/>
            
            <label for="gender">Gender</label>
            <input type="text" id="gender" name="gender" class="input" placeholder="Gender (Male / Female)" /><br/>
            
            <label for="land">Land Type</label>
            <input type="text" id="land_type" name="land_type" class="input" placeholder="Farming land (Own / Tenant)" /><br/>
        </div>
        <div class="form">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="input" placeholder="Email" /><br/>
            
            <label for="Date of Birth">Date of Birth</label>
            <input type="date" id="dob" name="dob" class="input" /><br/>
            
            <label for="Pincode">Pincode</label>
            <input type="text" id="pincode" name="pincode" class="input" placeholder="Pincode" /><br/>
            
            <label for="district">District</label>
            <input type="text" id="district" name="district" class="input" placeholder="District" /><br/>
            
            <label for="state">State</label>
            <input type="text" id="state" name="state" class="input" placeholder="State" /><br/>
            
            <button type="submit">Update</button>
        </div>
    </form>
</body>
</html>