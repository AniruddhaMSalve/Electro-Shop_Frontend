<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>
<div class="container">
<form action="<c:url value="/addToCart/${product.productId}"/>" method="get">
<table align="center" class="table">
<tr>
	<td rowspan="10">
			<img src="<c:url value="/resources/images/${product.productId}.jpg"/>">
	</td>
</tr>
<tr>
	<td>Product Id</td>
	<td>${product.productId}</td>
</tr>

<tr>
	<td>Product Name</td>
	<td>${product.productName}</td>
</tr>

<tr>
	<td>Price</td>
	<td>${product.price}</td>
</tr>

<tr>
	<td>Supplier Id</td>
	<td>${product.supplierId}</td>
</tr>

<tr>
	<td>Product Description</td>
	<td>${product.productDesc}</td>
</tr>
<tr>
	<td>Quantity</td>
	<td><input type="text" name="quantity" required></td>
</tr>
</table>
<h3 align="center"><input type="Submit" value="ADD TO CART" class="btn btn-primary"/></h3>
</form>
</div></body>