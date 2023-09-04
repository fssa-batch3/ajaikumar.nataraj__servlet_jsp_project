<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <header>
      <button id="delete">Delete</button>
      <button id="logout" click="logout" type="button">
        <span class="glyphicon glyphicon-log-out"></span> Log out
      </button>
    </header>
     <h1>User Details</h1>
    <p>User ID: ${userId}</p>
    <p>User Name: ${userName}</p>
    <p>User Age: ${userAge}</p>
</body>
</html>