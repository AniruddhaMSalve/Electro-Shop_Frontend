<body style="background-color:rgb(93,241,255)">
<%@include file="Header.jsp"%>
<br><br></br></br>

<c:if test="${!sessionScope.loggedIn }">
<h2 align="center"><b>Please <a class="btn btn-lg btn-warning site-btn" href="<c:url value="/Login"/>">Login</a>&nbspor&nbsp<a class="btn btn-lg btn-warning site-btn" href="<c:url value="/Register"/>">Sign Up</a> Before You Continue.</b></h2>
<div>
    <div>
      <div class="container">
        <div>
            <div class="col-md-12">
                <div class="col-md-6">
                    <h1>Buy at <br>Electro-Shop</h1>
                    <h3>Find best product at your prices.</h3>
                    <c:if test="${!sessionScope.loggedIn }">
                    </c:if>
                </div>
                <div class="col-md-6">
                   <img src="http://wpocean.com/tf/html/naima/assets/img/app/about-app.png"class="img-responsive">
                </div>
                
            </div>
        
        </div>
      </div>
    </div>
    </div>

<h3 align="center"><b>Some of our products</b></h3>    
    <br></br>    
    

<div class="container">
	<div class="row">
		<c:forEach items="${productList}" var="product">

			<div class="column">
				<div class="col-md-4 col-xs-12 col-sm-6">
					<div class="thumbnail">
						<h4>
							<span data-toggle="tooltip" title="Bootstrap version">${product.productName}&nbsp;
								Rs.${product.price}/-</span>
						</h4>
						<img src="<c:url value="/resources/images/${product.productId}.jpg"/>" style="width:128px;height:128px;" alt="Image Not Supported"/> 
							<a href="<c:url value="/ProductDisplay/${product.productId}"/>"
							class="btn btn-primary col-xs-12" role="button">View Product</a>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</c:if>


<c:if test="${sessionScope.loggedIn }">
<c:if test="${sessionScope.role=='ROLE_ADMIN' }">

<h2 align="center"><b><u>Admin is not authorized to buy products.</u></b></h2>
<div>
    <div>
      <div class="container">
        <div>
            <div class="col-md-12">
                <div class="col-md-6">
                    <h1>Buy at <br>Electro-Shop</h1>
                    <h3>Find best product at your prices.</h3>
                    <c:if test="${!sessionScope.loggedIn }">
                    </c:if>
                </div>
                <div class="col-md-6">
                   <img src="http://wpocean.com/tf/html/naima/assets/img/app/about-app.png"class="img-responsive">
                </div>
                
            </div>
        
        </div>
      </div>
    </div>
    </div>

<h3 align="center"><b>Some of our products</b></h3>    
    <br></br>    
    

<div class="container">
	<div class="row">
		<c:forEach items="${productList}" var="product">

			<div class="column">
				<div class="col-md-4 col-xs-12 col-sm-6">
					<div class="thumbnail">
						<h4>
							<span data-toggle="tooltip" title="Bootstrap version">${product.productName}&nbsp;
								Rs.${product.price}/-</span>
						</h4>
						<img src="<c:url value="/resources/images/${product.productId}.jpg"/>" style="width:128px;height:128px;" alt="Image Not Supported"/> 
							<a href="<c:url value="/ProductDisplay/${product.productId}"/>"
							class="btn btn-primary col-xs-12" role="button">View Product</a>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

</c:if>
<c:if test="${sessionScope.role=='ROLE_USER' }">
<div class="container">
<form action="<c:url value="/addToCart/${product.productId}"/>" method="get">
<table align="center" class="table">
<tr>
	<td rowspan="10">
			<img src="<c:url value="/resources/images/${product.productId}.jpg"/>">
	</td>
</tr>
<tr>
	<td><b>Product Id</b></td>
	<td>${product.productId}</td>
</tr>

<tr>
	<td><b>Product Name</b></td>
	<td>${product.productName}</td>
</tr>

<tr>
	<td><b>Price</b></td>
	<td>${product.price}</td>
</tr>

<tr>
	<td><b>Supplier Id</b></td>
	<td>${product.supplierId}</td>
</tr>

<tr>
	<td><b>Product Description</b></td>
	<td>${product.productDesc}</td>
</tr>
<tr>
	<td><b>Quantity</b></td>
	<td><input type="text" name="quantity" required></td>
</tr>
</table>
<h3 align="center"><input type="Submit" value="ADD TO CART" class="btn btn-success"/></h3>
</form>
</div>
</c:if>
</c:if><%@include file="/WEB-INF/views/Footer.jsp" %>
</body>