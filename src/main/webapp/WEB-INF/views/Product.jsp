<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${flag}">
<form:form action="addProduct" modelAttribute="product" method="post" enctype="multipart/form-data">
<table align="center">

<tr>
	<td colspan="2"><center><b><u>Enter Product Detail</u></b></br></center></td>
</tr>
<tr>
	<td><b>Product Name</b></td>
	<td>&nbsp<form:input path="productName"/></td>
</tr>
<tr>
	<td><b>Price</td>
	<td>&nbsp<form:input path="price"/></td>
</tr>
<tr>
	<td><b>Stock</b></td>
	<td>&nbsp<form:input path="quantity"/></td>
</tr>
<tr>
	<td><b>Category</b></td>
	<td>&nbsp<form:select path="categoryId">
	<form:option value="0" label="Select List"/>
	<form:options items="${categoryList }"/>
	</form:select></td>
</tr>
<tr>
	<td><b>Supplier</b></td>
	<td>&nbsp<form:input path="supplierId"/></td>
</tr>
<tr>
	<td><b>Product Description</b></td>
	<td>&nbsp<form:input path="productDesc"/></td>
</tr>
<tr>
<td><b>Product Image</b></td>
<td>&nbsp<form:input type="file" path="pimage"/></td>
</tr>

<tr>
	<td colspan="2"><center>
	</br><input type="submit" value="Insert Product" class="btn btn-primary"/>
	</center>
	</td>

</tr>
</table>
</form:form>
</c:if>

<c:if test="${!flag}">
<form:form action="http://localhost:8080/Project_01_Frontend/updateProduct/${product.productId }" modelAttribute="product" method="post" enctype="multipart/form-data">
<table align="center">

<tr>
	<td colspan="2"><center><b><u>Enter Product Detail</u></b></br></center></td>
</tr>
<tr>
	<td><b>Product Name</b></td>
	<td>&nbsp<form:input path="productName"/></td>
</tr>
<tr>
	<td><b>Price</b></td>
	<td>&nbsp<form:input path="price"/></td>
</tr>
<tr>
	<td><b>Stock</b></td>
	<td>&nbsp<form:input path="quantity"/></td>
</tr>
<tr>
	<td><b>Category</b></td>
	<td>&nbsp<form:select path="categoryId">
	<form:option value="0" label="Select List"/>
	<form:options items="${categoryList }"/>
	</form:select></td>
</tr>
<tr>
	<td><b>Supplier</b></td>
	<td>&nbsp<form:input path="supplierId"/></td>
</tr>
<tr>
	<td><b>Product Description</b></td>
	<td>&nbsp<form:input path="productDesc"/></td>
</tr>
<tr>
	<td colspan="2"><br></br><center>
	<input type="submit" value="Update Product" class="btn btn-info"/>
	</center>
	</td>

</tr>
</table>
</form:form>
</c:if>


<c:if test="${flag}">
<table align="center" class="table table-striped">
<tr><td colspan="8"><center><h3><b>Product Detail</b></h3></center></td></tr>
<tr>
	<td><b>Product Id</b></td>
	<td><b>Product Name</b></td>
	<td><b>Product Description</b></td>
	<td><b>Price</b></td>
	<td><b>Stock</b></td>
	<td><b>Category</b></td>
	<td><b>Supplier</b></td>
	<td><b>Operation</b></td>
</tr>
<c:forEach items="${productList}" var="product">
<tr>
	<td>${product.productId }</td>
	<td>${product.productName }</td>
	<td>${product.productDesc }</td>
	<td>${product.price }</td>
	<td>${product.quantity }</td>
	<td>${product.categoryId}</td>
	<td>${product.supplierId }</td>
	<td>
	<a href="<c:url value="/deleteProduct/${product.productId }"/>" class="btn btn-danger">Delete</a>
	<a href="<c:url value="/editProduct/${product.productId }"/>" class="btn btn-info">Edit</a>	
	</td>
</tr>
</c:forEach>
</table>
</c:if>
</body>