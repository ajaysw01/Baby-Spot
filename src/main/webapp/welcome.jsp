<%@page import="com.mycart.helper.Helper"%>

<%
User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("message", "You are not logged in! please login first.");
	response.sendRedirect("login.jsp");
	return;
}
%>
<%
String cat = request.getParameter("category");

ProductDAO pdao = new ProductDAO();
List<Product> products = null;
if (cat == null || cat.trim().equals("all")) {
	products = pdao.getAllProducts();
} else {
	int cid = Integer.parseInt(cat.trim());
	products = pdao.getAllProductsById(cid);
}

CategoryDAO cdao = new CategoryDAO();
List<Category> categories = cdao.getCategories();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Commerce Home Page</title>
<style>
.discount-label {
	font-size: 13px !important;
	font-style: italic !important;
	text-decoration: line-through;
}

.product-card:hover {
	background: #e2e2e2;
	cursor: pointer;
}

.header {
	width: 100%;
	height: 70px;
	background-color: #F2F2F2;
}

.header nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 100%;
	padding: 0 20px;
}

.header nav ul {
	display: flex;
	list-style: none;
	height: 100%;
}

.header nav ul li {
	height: 100%;
	margin-right: 30px;
}

.header nav ul li a {
	font-size: 14px;
	color: #333;
	text-decoration: none;
	height: 100%;
	display: flex;
	align-items: center;
}

.header nav form {
	height: 100%;
	display: flex;
	align-items: center;
}

.header nav form input[type="text"] {
	border: 1px solid #E7E7E7;
	padding: 10px;
	font-size: 14px;
	width: 250px;
	height: 40px;
	border-radius: 20px;
	margin-right: 10px;
}

.header nav form button[type="submit"] {
	background-color: #333;
	color: #FFF;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 14px;
	cursor: pointer;
}

.slideshow {
	width: 100%;
	height: 500px;
	margin: auto;
	position: relative;
}

.slideshow img {
	width: 100%;
	height: 500px;
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
	transition: opacity 1s;
}

.slideshow img.active {
	opacity: 1;
}

.featured-products {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	margin-top: 50px;
}

.featured-products h2 {
	width: 100%;
	text-align: center;
	margin-bottom: 30px;
}

.featured-product {
	width: calc(33.33% - 30px);
	background-color: #FFF;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
	margin-bottom: 30px;
}

.featured-product img {
	width: 100%;
	height: 200px;
}

.featured-product h3 {
	font-size: 14px;
	color: #333;
	text-align: center;
	padding: 20px;
}

.featured-product p {
	font-size: 12px;
	color: #999;
	text-align: center;
	padding: 0 20px 20px;
}

.featured-product button {
	background-color: #333;
	color: #FFF;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 14px;
	cursor: pointer;
	width: 100%;
	margin-top: 20px;
}

.footer {
	width: 100%;
	height: 200px;
	background-color: #F2F2F2;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
}

.footer nav ul {
	display: flex;
	list-style: none;
	height: 100%;
}

.footer nav ul li {
	height: 100%;
	margin-right: 30px;
}

.footer nav ul li a {
	font-size: 14px;
	color: #333;
	text-decoration: none;
	height: 100%;
	display: flex;
	align-items: center;
}

.footer p {
	font-size: 12px;
	color: #999;
	margin-right: 30px;
}
</style>
<script>
var index = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("slides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.opacity = "0";
  }
  index++;
  if (index > slides.length) {index = 1}
  slides[index-1].style.opacity = "1";
  setTimeout(showSlides, 3000); // Change image every 5 seconds
}
</script>
<%@include file="components/common_CSS_JS.jsp"%>
</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="slideshow" onclick="showSlides()">
		<img class="slides active" src="images/img1.png"> <img
			class="slides" src="images/img2.png"> <img class="slides"
			src="images/img3.png"> <img class="slides"
			src="images/img4.png"> <img class="slides"
			src="images/img5.png"> <img class="slides"
			src="images/img6.png">

	</div>

	<div class="container-fluid">

		<div class="row mt-3 mx-2">
			<!-- Show categories -->
			<div class="col-md-2">

				<div class="list-group mt-4">
					<a href="home.jsp?category=all"
						class="list-group-item list-group-item-action active"
						aria-current="true"> All Categories</a>


					<%
					for (Category c : categories) {
					%>
					<a href="home.jsp?category=<%=c.getcId()%>"
						class="list-group-item list-group-item-action"><%=c.getcName()%></a>

					<%
					}
					%>

				</div>
			</div>


			<div class="col-md-10">


				<!-- row -->
				<div class="row mt-4">
					<!-- column -->
					<div class="col-md-12">
						<!-- card columns -->
						<div class="card-column">
							<div class="row row-cols-1 row-cols-md-2 g-4">

								<!-- Traversing Products -->
								<%
								for (Product p : products) {
								%>
								<!-- card -->
								<div class="card product-card">
									<!-- card Image -->
									<div class="container text-center">
										<img src="images/products/<%=p.getpPhoto()%>"
											style="max-height: 250px; max-width: 100%; width: auto;"
											class="card-img-top m-2" alt="...">
									</div>
									<!-- card Body -->
									<div class="card-body">

										<h5 class="card-title">
											<%=p.getpName()%>
										</h5>

										<p class="card-text">
											<%=Helper.get10Words(p.getpDiscription())%>
										</p>

									</div>
									<div class="container mb-3">

										<button class="btn btn-secondary btn-sm"
											style="color: white-space:; padding: 5px;" disabled>
											verified product <span><i class="fa fa-check"
												aria-hidden="true"></i></span>
										</button>
									</div>

									<div
										class="card-footer bg-transparent border-success text-center">
										<button class="btn custom-bg"
											onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add
											to cart</button>
										<button class="btn btn-outline-success">
											&#8377;
											<%=p.getPriceAfterApplyingDiscount()%>/- <span
												class="text-secondary discount-label"> &#8377; <%=p.getpPrice()%>
												<%=p.getpDiscount()%>%off
											</span>
										</button>
									</div>


								</div>

								<%
								}

								if (products.size() == 0) {
								out.println("<h2>No items in this category.</h2>");
								}
								%>

							</div>
						</div>

					</div>

				</div>



			</div>
		</div>
	</div>
	<div class="footer">
		<footer>

			<nav>
				<ul>
					<li><a href="welcome.jsp">Home</a></li>
					<li><a href="home.jsp">Shop</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</nav>
			<p>&copy; 2023 BabySpot Website</p>

		</footer>
	</div>
	<%@include file="components/common_modal.jsp"%>
	<%@include file="components/common_modal2.jsp"%>
</body>
</html>
