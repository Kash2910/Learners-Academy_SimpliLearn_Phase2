<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<style type="text/css">
.container{
border: 2px solid white;
text-align: center;
width:95%;
height: 90%;
margin-left:50px;
margin-top:80px;
font-family:cursive;
}
.form{
border: 2px solid black;
width:40%;
height:80%;
margin-left:29%;
background-color:#03fcd7;
color:#e042f5;
font-weight:bold;
}

input:hover{
border: 2px solid green;
}

#lgnBtn{
margin-bottom: 10px;
width:80px;
height:30px;
font-size:18px;
font-family:cursive;
}
</style>
</head>
<body style="text-align: center;">
<div class="container">
<h1>Welcome to Learners Academy</h1>

             <!-- Welcome Page : enter the username and password same there is no database for it-->
  <div class="form">
<form action="LoginServlet" method="post">
<br>
Username<br>
<input type="text" name="user">
<br><br>
Password<br>
<input type="password" name="password">	
<br><br>
<input type="submit" value="login" id="lgnBtn">
<br>
<br>
</form>
</div>
</div>
</body>
</html>