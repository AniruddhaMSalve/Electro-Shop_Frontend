<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>
<div class="container">
<div class="row">
	<c:forEach items="${productList }" var="product">
	<div class="column">
		<div class="col-md-4 col-xs-12 col-sm-6">
			<div class="thumbnail">
			<h4>
			<span data-toggle="toltip" title="Bootstrap version">${product.productName }&nbsp; Rs.${product.price }/-</span>
			</h4>
			<img src="<c:url value="/resources/images/${product.productId}.jpg"/>" width="100" height="100" alt="Image Not Supported"/>
			<a href="<c:url value="/ProductDisplay/${product.productId }"/>" class="btn btn-primary col-xs-12" role="button">View Product</a>
			<div class="clearfix"></div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
</div></body>