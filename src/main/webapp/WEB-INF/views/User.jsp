<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${flag}">
<form:form action="addUserAdmin" modelAttribute="user" method="post">
<table align="center">

<tr>
	<td colspan="2"><center><b><u>Enter User Details</u></b><br></br></center></td>
</tr>
<tr>
	<td><b>Username</b></td>
	<td>&nbsp<form:input path="username"/></td>
</tr>
<tr>
	<td><b>Password</b></td>
	<td>&nbsp<form:input path="password"/></td>
</tr>
<tr>
	<td><b>Customer Name</b></td>
	<td>&nbsp<form:input path="customerName"/></td>
</tr>
<tr>
	<td><b>Email Id</b></td>
	<td>&nbsp<form:input path="emailId"/></td>
</tr>
<tr>
	<td><b>Mobile Number</b></td>
	<td>&nbsp<form:input path="mobileNo"/></td>
</tr>
<tr>
	<td><b>Enabled</b></td>
	<td>&nbsp<form:input path="enabled"/></td>
</tr>
<tr>
	<td><b>Role</b></td>
	<td>&nbsp<form:input path="role"/></td>
</tr>

<tr>
	<td colspan="4"><center></br>
	<input type="submit" value="Insert User" class="btn btn-primary"/>
	</center>
	</td>

</tr>
</table>
</form:form>
</c:if>

<c:if test="${!flag}">
<form:form action="http://localhost:8080/Project_01_Frontend/UpdateUser/${user.userId }" modelAttribute="user" method="post">
<table align="center">

<tr>
	<td colspan="2"><center><b><u>Enter User Details</u></b><br></br></center></td>
</tr>
<tr>
	<td><b>Username</b></td>
	<td>&nbsp<form:input path="username"/></td>
</tr>
<tr>
	<td><b>Email Id</b></td>
	<td>&nbsp<form:input path="emailId"/></td>
</tr>
<tr>
	<td><b>Mobile Number</b></td>
	<td>&nbsp<form:input path="mobileNo"/></td>
</tr>
<tr>
	<td><b>Enabled</b></td>
	<td>&nbsp<form:input path="enabled"/></td>
</tr>
<tr>
	<td><b>Role</b></td>
	<td>&nbsp<form:input path="role"/></td>
</tr>

<tr>
	<td colspan="4"><center></br>
	<input type="submit" value="Update User" class="btn btn-primary"/>
	</center>
	</td>

</tr>
</table>
</form:form>
</c:if>


<c:if test="${flag}">
<table align="center" class="table table-striped">
<tr><td colspan="7"><center><h3><b>User Details</b></h3></center></td></tr>
<tr>
	<td><b>User Id</b></td>
	<td><b>Username</b></td>
	<td><b>Enabled</b></td>
	<td><b>Role</b></td>
	<td><b>Mobile Number</b></td>
	<td><b>Email Id</b></td>
	<td><b>Operation</b></td>
</tr>
<c:forEach items="${userList}" var="user">
<tr>
	<td>${user.userId }</td>
	<td>${user.username }</td>
	<td>${user.enabled }</td>
	<td>${user.role }</td>
	<td>${user.mobileNo }</td>
	<td>${user.emailId }</td>
	<td>
	<a href="<c:url value="/deleteUser/${user.userId }"/>" class="btn btn-danger">Delete</a>
	<a href="<c:url value="/editUser/${user.userId }"/>" class="btn btn-info">Edit</a>	
	</td>
</tr>
</c:forEach>
</table>
</c:if>
</body>