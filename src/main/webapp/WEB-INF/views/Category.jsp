<body style="background-color:rgb(180,180,180)">
<%@include file="Header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${flag}">
	<form:form action="addCategory" modelAttribute="category" method="post">
		<table align="center">

			<tr>
				<td colspan="2"><center>
						<b><u>Enter Category Details</u></b><br></br>
					</center></td>
			</tr>
			<tr>
				<td><b>Category Name</b></td>
				<td>&nbsp<form:input path="categoryName" /></td>
			</tr>

			<tr>
				<td><b>Category Description</b></td>
				<td>&nbsp<form:input path="categoryDesc" /></td>
			</tr>

			<tr>
				<td colspan="2"><center>
						</br> <input type="submit" value="Insert Category"
							class="btn btn-primary" />
					</center></td>

			</tr>
		</table>
	</form:form>
</c:if>

<c:if test="${!flag}">
<form:form action="http://localhost:8080/Project_01_Frontend/UpdateCategory/${category.categoryId }" modelAttribute="category" method="post" >
<table align="center">

<tr>
	<td colspan="2"><center><b><u>Enter Category Details</u></b></br></center></td>
</tr>
<tr>
	<td><b>Category Name</b></td>
	<td>&nbsp<form:input path="CategoryName"/></td>
</tr>
<tr>
	<td><b>Category Desc</b></td>
	<td>&nbsp<form:input path="CategoryDesc"/></td>
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
		<tr>
			<td bgcolor="" colspan="4"><center>
					<h3>
						<b>Category Details</b>
					</h3>
				</center></td>
		</tr>
		<tr>
			<td><b>Category Id</b></td>
			<td><b>Category Name</b></td>
			<td><b>Category Description</b></td>
			<td><b>Operation</b></td>
		</tr>
		<c:forEach items="${categoryList}" var="category">
			<tr>
				<td>${category.categoryId }</td>
				<td>${category.categoryName }</td>
				<td>${category.categoryDesc }</td>
				<td><a
					href="<c:url value="/deleteCategory/${category.categoryId }"/>"
					class="btn btn-danger">Delete</a> <a
					href="<c:url value="/editCategory/${category.categoryId }"/>"
					class="btn btn-info">Edit</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>