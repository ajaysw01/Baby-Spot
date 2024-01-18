 
<%@page import="com.myproject.DAO.UserDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.myproject.DTO.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.myproject.DAO.CategoryDAO"%>
<%@page import="com.myproject.DTO.User"%>
<%
	User user = (User)session.getAttribute("current-user");

	if(user == null){
		
		session.setAttribute("message", "You are not logged in! please login first.");
		response.sendRedirect("login.jsp");
		return;
	}
	
	if(user.getUserType().equalsIgnoreCase("normal")){
		
		session.setAttribute("message", "You are not admin! You can not access this page.");
		response.sendRedirect("login.jsp");
		return;
	}

%>

<!-- getting categories list from CategoryDAO class -->

						<%
						    CategoryDAO cdao = new CategoryDAO();
							List<Category> categories= cdao.getCategories();
							
							UserDAO udao = new UserDAO();
							int count = udao.getUsersCount();
							
							ProductDAO pdao = new ProductDAO();
							List<Product> products =  pdao.getAllProducts();
						%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="components/common_CSS_JS.jsp"%>
<style type="text/css">
.admin .card {
	border: 1px solid #4aedc4;
}

.admin .card:hover {
	background: #e2e2e2;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container admin">

		<div class="container-fluid">

			<%@include file="components/message.jsp"%>

		</div>

		<div class="row mt-3">
			<%-- First column --%>
			<div class="col-md-4">
				<%-- first Box --%>
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid " alt="users_icon"
								src="images/group.png">
						</div>
						<h1><%= count %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>

			<%-- second column --%>
			<div class="col-md-4">

				<%-- second Box --%>
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid " alt="users_icon"
								src="images/categories.png">
						</div>
						<h1> <%= categories.size() %> </h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>

			<%-- Third column --%>
			<div class="col-md-4">

				<%-- Third Box --%>
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid " alt="users_icon"
								src="images/products.png">
						</div>
						<h1> <%= products.size() %> </h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>

		<%-- Second Row --%>
		<div class="row mt-3">
			<%-- First column --%>
			<div class="col-md-6">

				<%-- First Box --%>
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-category-Modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid " alt="users_icon"
								src="images/apps.png">
						</div>

						<h1 class="text-uppercase text-muted">Add categories</h1>
					</div>
				</div>

			</div>

			<%-- Second column --%>
			<div class="col-md-6">

				<%-- Second Box --%>
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-product-Modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px" class="img-fluid " alt="users_icon"
								src="images/add-product.png">
						</div>

						<h1 class="text-uppercase text-muted">Add products</h1>
					</div>
				</div>

			</div>
		</div>

	</div>


	<%-- add-Category-modal --%>

	<!-- Modal -->
	<div class="modal fade" id="add-category-Modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title" id="exampleModalLabel">Add category
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addCategory">

						<div class="mb-3">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required="required" />
						</div>

						<div class="mb-3">
							<textarea style="height: 150px" class="form-control"
								placeholder="Enter category discription" name="catDisc"
								required="required"></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add category</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>

	<%-- End Of add-Category-modal --%>

	<%-- add-Product-modal --%>

	<!-- Modal -->
	<div class="modal fade" id="add-product-Modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title" id="exampleModalLabel">Add product
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addProduct">

						<div class="mb-3">
							<input type="text" class="form-control" name="prodTitle"
								placeholder="Enter product title" required="required" />
						</div>

						<div class="mb-3">
							<input type="number" class="form-control" name="prodPrice"
								placeholder="Enter product Price" required="required" />
						</div>

						<div class="mb-3">
							<input type="number" class="form-control" name="prodDiscount"
								placeholder="Enter product discount" required="required" />
						</div>

						<div class="mb-3">
							<input type="number" class="form-control" name="prodQuant"
								placeholder="Enter product quantity" required="required" />
						</div>


						

						<div class="mb-3">
							<label for="category">select category of the product</label> <select
								name="catId" class="form-control" id="" required="required">

								<%
									for(Category c :categories){
									
								%>

								<option value="<%= c.getcId() %>">
									<%= c.getcName() %>
								</option>

								<%
									}
								%>

							</select>
						</div>

						<div class="mb-3">
							<label for="pic">select image of the product</label> <input
								type="file" class="form-control" name="prodPhoto"
								placeholder="Enter product image" required="required" />
						</div>

						<div class="mb-3">
							<textarea style="height: 150px" class="form-control"
								placeholder="Enter product discription" name="prodDiscription"
								required="required"></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>

	<%-- End Of add-Product-modal --%>
	<%@include file="components/common_modal.jsp"%>
	<%@include file="components/common_modal2.jsp"%>
</body>
</html>