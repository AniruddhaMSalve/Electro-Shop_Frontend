<head>
<title>Login</title>
</head>
<body style="background-color:rgb(93,241,255)">
<%@include file="Header.jsp"%>
<br><br></br></br>
<form action="addUser" modelAttribute="user" method="post">
<table align="center">
<h2 align="center">Please Sign Up Here</h2>
<tr><td colspan="2"><center><h2><b><u>Enter Your Cerdentials</u></b></h2></center></td></tr>
<br></br>
<tr><td><b><h4>Full Name</h4></b></td><td><input type="text" maxlength="25" name="customerName"></td></tr>
<tr><td><b><h4>Username</h4></b></td><td><input type="text" maxlength="15" name="username" required="required"></td></tr>
<tr><td><b><h4>Password</h4></b></td><td><input type="password" name="password" required="required"></td></tr>
<tr><td><b><h4>Email Id</h4></b></td><td><input type="email" name="emailId" required="required"></td></tr>
<tr><td><b><h4>Mobile Number</h4></b></td><td><input type="text" maxlength="10" name="mobileNo" required="required"></td></tr>
<tr><td colspan="2"><input type="submit" value="Sign Up" class="btn btn-success btn-block"></td></tr>
</table>
</form><%@include file="/WEB-INF/views/Footer.jsp" %>
</body>