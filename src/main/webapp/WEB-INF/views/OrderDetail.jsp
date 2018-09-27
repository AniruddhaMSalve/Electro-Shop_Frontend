<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>

<table align="center" class="table table-bordered">
<tr><td colspan="5"><h3 align="center">Your Order</h3></td></tr>
<tr>
	<td>Product Name</td>
	<td>Price</td>
	<td>Quantity</td>
	<td>Total Price</td>
</tr>
<c:forEach items="${cartItemList}" var="cartItemList">
<tr>
	<td>${cartItemList.productName }</td>
	<td>${cartItemList.price }</td>
	<td>${cartItemList.quantity }</td>
	<td>${cartItemList.quantity*cartItemList.price }</td>
</tr>
</c:forEach>
<tr>
	<td colspan="3">Grand Total</td>
	<td><b>${grandTotalPrice}</b></td>
</tr>
<tr>
	<td colspan="3"><a href="<c:url value="/Cart"/>" class="btn btn-info">Move To Cart</a></td>
	<td colspan="2"><a href="<c:url value="/Payment"/>" class="btn btn-danger">Proceed For Paymentt</a></td>
</tr>
</table></body>