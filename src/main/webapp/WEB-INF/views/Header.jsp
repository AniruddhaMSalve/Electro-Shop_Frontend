<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Electro-Shop</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/whhg.css">

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
			
			<a class="navbar-brand" href="Home">Electro-Shop</a>
			</div>
			
			<c:if test="${!sessionScope.loggedIn }">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<c:url value="/Home"/>">Home</a>
				<li><a href="<c:url value="/Login"/>">Login</a></li>
				<li><a href="<c:url value="/Register"/>">Register</a></li>
			</ul>
			</c:if>
			<c:if test="${sessionScope.loggedIn }">
				<c:if test="${sessionScope.role=='ROLE_USER' }">
				<ul class="nav navbar-nav">			
				<li class="active"><a href="<c:url value="/Home"/>">Home</a>
				<li><a href="<c:url value="/ProductCatalog"/>">Product Catalog</a></li>
				
			</ul>
			</c:if></c:if>
			<c:if test="${sessionScope.loggedIn }">
				<c:if test="${sessionScope.role=='ROLE_ADMIN' }">
				<ul class="nav navbar-nav">
				
				<li class="active"><a href="<c:url value="/Home"/>">Home</a>
				<li><a href="<c:url value="/ProductCatalog"/>">Product Catalog</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin List<span class="caret"></span></a>
      			<ul class="dropdown-menu">
	      			<li><a href="<c:url value="/User"/>">Manage User</a></li>
					<li><a href="<c:url value="/Product"/>">Manage Product</a></li>
					<li><a href="<c:url value="/Category"/>">Manage Category</a></li>
					<li><a href="<c:url value="/Supplier"/>">Manage Supplier</a></li>		
        		</ul>
      			</li>
			</ul>
			</c:if></c:if>
			
			<div class="nav navbar-nav navbar-right">
			 <li><a href="<c:url value="/AboutUs"/>">About Us</a></li>
    		 <li><a href="<c:url value="/ContactUs"/>">Contact Us</a></li>
			 <c:if test="${sessionScope.loggedIn }">
			 <c:if test="${sessionScope.role=='ROLE_ADMIN' }">
			 <li><i class="material-icons" style="font-size:48px;color:rgb(93,241,255)">account_circle</i></li>
			 <li><a href="#">Welcome ${sessionScope.username }</a>
			 <li><a href="perform_logout" class="btn btn-danger"><font color="yellow">Logout</font></a></li>
			 
			 </c:if>
			 <c:if test="${sessionScope.role=='ROLE_USER' }">
			 <li><i class="material-icons" style="font-size:48px;color:rgb(93,241,255)">account_circle</i></li>
			 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Welcome ${sessionScope.username }<span class="caret"></span></a>
			 <ul class="dropdown-menu">
			 	<li><a href="<c:url value="/Cart"/>">Your Cart</a></li>
			 	<li><a href="<c:url value="/Order"/>">Your Orders</a></li>
			 	<li><a href="<c:url value="/Invoice"/>">Your Invoice</a></li>
			 	<li><a href="perform_logout" class="btn btn-danger"><font color="yellow">Logout</font></a></li>
			 
			 </ul>
			 </c:if>
			</c:if>	
			 </div>
		</div>
	</nav>
</div>
</body>