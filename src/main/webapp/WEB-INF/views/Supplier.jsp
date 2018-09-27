<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${flag}">
<form:form action="addSupplier" modelAttribute="supplier" method="post">
<table align="center">

<tr>
	<td colspan="2"><center><b><u>Enter Supplier Details</u></b><br></br></center></td>
</tr>
<tr>
	<td><b>Supplier Name</b></td>
	<td>&nbsp<form:input path="supplierName"/></td>
</tr>
<tr>
	<td><b>Supplier Address</b></td>
	<td>&nbsp<form:input path="address"/></td>
</tr>

<tr>
	<td colspan="2"></br><center>
	<input type="submit" value="Insert Supplier" class="btn btn-primary"/>
	</center>
	</td>

</tr>
</table>
</form:form>
</c:if>

<c:if test="${!flag}">
<form:form action="http://localhost:8080/Project_01_Frontend/UpdateSupplier/${supplier.supplierId}" modelAttribute="supplier" method="post">
<table align="center">

<tr>
	<td colspan="2"><center><b><u>Supplier Details</u></b><br></br></center></td>
</tr>
<tr>
	<td><b>Supplier Name</b></td>
	<td>&nbsp<form:input path="supplierName"/></td>
</tr>
<tr>
	<td><b>Supplier Address</b></td>
	<td>&nbsp<form:input path="address"/></td>
</tr>

<tr>
	<td colspan="2"><center></br>
	<input type="submit" value="Update Supplier" class="btn btn-primary"/>
	</center>
	</td>

</tr>
</table>
</form:form>
</c:if>


<c:if test="${flag}">
<table align="center" class="table table-striped">
<tr><td colspan="3"><center><h3><b>Supplier Details</b></h3></center></td></tr>
<tr>
	<td><b>Supplier Id</b></td>
	<td><b>Supplier Name</b></td>
	<td><b>Supplier Address</b></td>
	<td><b>Operation</b></td>
</tr>
<c:forEach items="${supplierList}" var="supplier">
<tr>
	<td>${supplier.supplierId }</td>
	<td>${supplier.supplierName }</td>
	<td>${supplier.address }</td>
	<td>
	<a href="<c:url value="/deleteSupplier/${supplier.supplierId }"/>"class="btn btn-danger">Delete</a>
	<a href="<c:url value="/editSupplier/${supplier.supplierId }"/>"class="btn btn-info">Edit</a>	
	</td>
</tr>
</c:forEach>
</table>
</c:if>
</body>