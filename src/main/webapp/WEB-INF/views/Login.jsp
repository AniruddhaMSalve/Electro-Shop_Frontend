<head>
<title>Login</title>
</head>
<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>

<form action="perform_login" method="post">
<table align="center">
<tr><td><h3>Please Log In or <a href="<c:url value="/Register"/>">Sign Up</a></h3></td></tr>
<tr><td colspan="2"><center>${errorInfo}</center></td></tr>
<tr><td colspan="2"><center><h2><b><u>Login Cerdentials</u></b></h2></center></td></tr>
<br></br>
<tr><td><b><h4>Enter Your Username</h4></b></td><td><input type="text" name="username"></td></tr>
<tr><td><b><h4>Enter Your Password</h4></b></td><td><input type="password" name="password"></td></tr>
<tr><td colspan="2"><input type="submit" value="Log-In" class="btn btn-primary btn-block"></td></tr>
</table>
</form>
</body>