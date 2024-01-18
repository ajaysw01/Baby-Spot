<%@page import="com.myproject.DTO.Product"%>
<%@page import="com.myproject.DAO.ProductDAO"%>
<%@page import="com.myproject.DTO.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.myproject.DAO.CategoryDAO"%>
<%@page import="com.myproject.DTO.User"%>
<%
 	User user1 = (User)session.getAttribute("current-user");


%>

<nav class="navbar navbar-expand-lg navbar-light  custom-bg">

		<div class="container-fluid">
			<a class="navbar-brand" href="welcome.jsp"> <img alt="" src="images/logo.png" style="max-height:200px; max-width: 180px;" > </a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp"><i class="fa fa-home" aria-hidden="true" style="font-size: 25px"></i> <span><b style="font-size: 25px;">Home</b></span> </a></li>
						
						<%
						String cat1 = request.getParameter("category");

						ProductDAO pdao1 = new ProductDAO();
						List<Product> products1 = null;
						if (cat1 == null || cat1.trim().equals("all")) {
							products1 = pdao1.getAllProducts();
						} else {
							int cid = Integer.parseInt(cat1.trim());
							products1 = pdao1.getAllProductsById(cid);
						}	
						
							CategoryDAO cdao1 = new CategoryDAO();
							List<Category> categories1 = cdao1.getCategories();
						%>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="home.jsp" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa fa-list" aria-hidden="true" style="font-size: 22px"></i> <span><b style="font-size: 25px;">Categories</b></span>  </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%
							for (Category ca : categories1) {
						%>
						<li><a class="dropdown-item" href="home.jsp?category=<%=ca.getcId()%>"><%=ca.getcName()%></a></li>
						<%
							}
						%>	
						</ul>
				   </li>
				   <li class="nav-item"><a href="babynames.jsp" class="nav-link active"> <b style="font-size: 25px;">Baby Names</b> </a></li>

				</ul>


			<ul class="navbar-nav me-5 mb-2 mb-lg-0">
			
				<li class="nav-item active mb-2 mt-3 me-2"><a class="nav-link active"
					aria-current="page" href="about.jsp" > <b style="font-size: 25px;"> About Us </b>
				</a></li>
				<li class="nav-item active mb-2 mt-3"><a class="nav-link active"
					aria-current="page" href="#!" data-bs-toggle="modal" data-bs-target="#cart"> <i class="fa fa-cart-plus" style="font-size: 30px;"></i>
					<span class="ml-0 mb-2 cart-items" style="font-size: 25px; "> ( 0 )</span>
				</a></li>

				<%
				if (user1 == null) {
				%>
							<li class="nav-item active mb-2 mt-3"><a class="nav-link active"
								aria-current="page" href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true" style="font-size: 25px"></i> <span><b style="font-size: 25px;">Login</b></span> </a></li>
						
							<li class="nav-item active mb-2 mt-3"><a class="nav-link active"
								aria-current="page" href="register.jsp"><i class="fa fa-id-card" aria-hidden="true" style="font-size: 25px"></i> <span><b style="font-size: 25px;">Register</b></span> </a></li>
						
						<%
					}else{
						
						%>
							<li class="nav-item active mb-2 mt-3"><a class="nav-link active" data-bs-toggle="modal" data-bs-target="#myacc"
								aria-current="page"  href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>">  <i class="fa fa-user-circle-o" aria-hidden="true" style="font-size: 25px;"></i> <span> <b style="text-align: center; font-family: sans-serif; font-size: 25px;"> <%= user1.getUserName() %> </b></span> </a></li>
						
							<li class="nav-item active mb-2 mt-3"><a class="nav-link active"
								aria-current="page" href="LogoutServlet"><i class="fa fa-sign-out" aria-hidden="true" style="font-size: 25px"></i> <span><b style="font-size: 25px;">Logout</b></span> </a></li>
						<%
						
					}
				%>

				
				</ul>
			</div>
		</div>
</nav>