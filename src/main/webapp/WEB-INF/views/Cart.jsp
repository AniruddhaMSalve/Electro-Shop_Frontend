<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>

<table align="center" class="table table-bordered">
<tr><td colspan="5"><h3 align="center">Your Cart</h3></td></tr>
<tr>
	<td>Product Name</td>
	<td>Price</td>
	<td>Quantity</td>
	<td>Total Price</td>
	<td>Operations</td>
</tr>
<c:forEach items="${cartItemList}" var="cartItemList">
<form action="<c:url value="/UpdateCartItem/${cartItemList.cartItemId }"/>" method="post">
<tr>
	<td>${cartItemList.productName }</td>
	<td>${cartItemList.price }</td>
	<td><input type="text" value="${cartItemList.quantity }" name="quantity" required/></td>
	<td>${cartItemList.quantity*cartItemList.price }</td>
	<td>
		<input type="submit" value="UPDATE" class="btn btn-info"/>
		<a href="<c:url value="/deleteCartItem/${cartItemList.cartItemId}"/>" class="btn btn-danger">Delete</a>
	</td>
</tr>
</form>
</c:forEach>
<tr>
	<td colspan="3">Grand Total</td>
	<td><b>${grandTotalPrice}</b></td>
</tr>
<tr>
	<td colspan="3"><a href="<c:url value="/ProductCatalog"/>" class="btn btn-info">Continue Shopping</a></td>
	<td colspan="2"><a href="<c:url value="/CheckOut"/>" class="btn btn-danger">Checkout</a></td>
</tr>
</table>
</body>