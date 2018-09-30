<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${!sessionScope.loggedIn }">
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body style="background-color:rgb(93,241,255)">
<%@include file="/WEB-INF/views/Header.jsp" %>
<br></br><br></br>
</br>
<div id="myCarousel" class="carousel slide head-t-mar-70" data-interval="false">
  <div>
    <div>
      <div class="container">
        <div>
            <div >
                <div >
                <h2 align="center"><b><u>You are not authorized to access this page.</u></b></h2>
                    <h1 align="center">Buy at <br>Electro-Shop</h1>
                    <h3 align="center">Find best product at your prices.</h3>
                    <h3 align="center"><a class="btn btn-lg btn-primary site-btn" href="<c:url value="/AboutUs"/>">Learn More</a>
                    <a class="btn btn-lg btn-primary site-btn" href="<c:url value="/ProductCatalog"/>">See our products</a></h3>
                </div>
                <!-- <div class="col-md-6">
                   <img src="http://wpocean.com/tf/html/naima/assets/img/app/about-app.png"class="img-responsive">
                </div> -->
                
            </div>
        
        </div>
      </div>
    </div>
</div>  
  
<div class="title-area area-padding">
    <div class="container">
        <div class="row text-center">
	    <div class="col-md-offset-2 col-md-8 col-sm-12 text-center"> 
                <h3>We provide all electronics products ranging from high-end computer processors to low-end microprocessors from only the best Suppliers.</h3>
            </div>
        </div>
    </div>
</div>
<div class="service-area area-padding">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-12">
                <div class="sec-title">
                    <h3 class="span">What sets us apart?</h3>
                    <p>WE BRING IT ALL TOGETHER.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="blog-section area-padding ">
<div class="container">
	<div class="row text-center">
	       <div class="col-sm-6 col-md-4">
							<div class="blog-box">
								<div class="blog-box-image">
									<img src="https://images.pexels.com/photos/6384/woman-hand-desk-office.jpg?w=940&h=650&auto=compress&cs=tinysrgb" class="img-responsive" alt="">
								</div>
								<div class="blog-box-content">
									<h4><a href="#">Wide Range Of Products</a></h4>
									<p>Our products ranges from processors to simple wires, from computer processors to microprocessors. All your requirements meets at one place.</p>
								</div>
							</div>
						</div> <!-- End Col -->					
			<div class="col-sm-6 col-md-4">
							<div class="blog-box">
								<div class="blog-box-image">
									<img src="https://images.pexels.com/photos/374897/pexels-photo-374897.jpeg?w=940&h=650&auto=compress&cs=tinysrgb" class="img-responsive" alt="">
								</div>
								<div class="blog-box-content">
									<h4><a href="#">Exceptional Product Quality</a></h4>
									<p>Our Supliers provides only high quality products which goes through rigorous testing before shipping.</p>
								</div>
							</div>
						</div> <!-- End Col -->				
			<div class="col-sm-6 col-md-4">
							<div class="blog-box">
								<div class="blog-box-image">
									<img src="https://images.pexels.com/photos/541522/pexels-photo-541522.jpeg?w=940&h=650&auto=compress&cs=tinysrgb" class="img-responsive" alt="">
								</div>
								<div class="blog-box-content">
									<h4><a href="#">Exceptional Customer Service</a></h4>
									<p>We take utmost pleasure in providing service to our customers. Our team is dedicated to the customers providing service whenever required at any time.</p>
								</div>
							</div>
						</div> <!-- End Col -->
    </div>
</div>
</div><div class="subscribe-area area-padding">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-12">
                <h3 class="span">Let's get started.</h3>
                <a class="btn btn-lg btn-primary site-btn" href="<c:url value="/Home"/>">Product Catalog</a>
            </div>
        </div>
    </div>
</div><%@include file="/WEB-INF/views/Footer.jsp" %></body>
</c:if>
<c:if test="${sessionScope.loggedIn }">
<c:if test="${sessionScope.role=='ROLE_USER' }">
<body style="background-color:rgb(93,241,255)">
<%@include file="Header.jsp"%>
<br><br></br></br>
<table align="center" class="table table-bordered">
<tr><td colspan="5"><h3 align="center"><b><u>Your Order</u></b></h3></td></tr>
<tr>
	<td><b>Order Id</b></td>
	<td><b>Order Date</b></td>
	<td><b>Total Amount</b></td>
	<td><b>Payment Mode</b></td>
</tr>
<c:forEach items="${orderList}" var="orderList">
<tr>
	<td>${orderList.orderId}</td>
	<td>${orderList.orderDate}</td>
	<td>${orderList.totalShoppingAmount}</td>
	<td>${orderList.pmode}</td>
</tr>
</c:forEach>
<tr>
	<td colspan="3"><b>Grand Total</b></td>
	<td><b>${grandTotalPrice}</b></td>
</tr>
</table><%@include file="/WEB-INF/views/Footer.jsp" %></body></c:if></c:if>