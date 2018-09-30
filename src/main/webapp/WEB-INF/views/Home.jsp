<body style="background-color:rgb(93,241,255)">
<%@include file="Header.jsp"%>
<br><br></br></br>
<div>
    <div>
      <div class="container">
        <div>
            <div>
                <div>
                   <h1 align="center">Buy at <br>Electro-Shop</h1>
                    <h3 align="center">Find best product at your prices.</h3>
                    <c:if test="${!sessionScope.loggedIn }">
                    <h3 align="center"><a class="btn btn-lg btn-primary site-btn" href="<c:url value="/Login"/>">Login </a> &nbsp or &nbsp  <a class="btn btn-lg btn-primary site-btn" href="<c:url value="/Register"/>"> Sign Up</a></h3>
    				</c:if>            
                </div>
                <!-- <div class="col-md-6">
                   <img src="http://wpocean.com/tf/html/naima/assets/img/app/about-app.png"class="img-responsive">
                </div> -->
                
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
<%@include file="/WEB-INF/views/Footer.jsp" %>
</body>
