<head>
<title>Login</title>
</head>
<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>

<form action="addUser" modelAttribute="user" method="post">
<table align="center">
<h2 align="center">Please Sign Up Here</h2>
<tr><td colspan="2"><center><h2><b><u>Enter Your Cerdentials</u></b></h2></center></td></tr>
<br></br>
<tr><td><b><h4>Full Name</h4></b></td><td><input type="text" name="customerName"></td></tr>
<tr><td><b><h4>Username</h4></b></td><td><input type="text" name="username"></td></tr>
<tr><td><b><h4>Password</h4></b></td><td><input type="password" name="password"></td></tr>
<tr><td><b><h4>Email Id</h4></b></td><td><input type="text" name="emailId"></td></tr>
<tr><td><b><h4>Mobile Number</h4></b></td><td><input type="text" name="mobileNo"></td></tr>
<tr><td colspan="2"><input type="submit" value="Sign Up" class="btn btn-primary btn-block"></td></tr>
</table>
</form>
</body>