<%@page import="com.myproject.DTO.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
User user3 = (User) session.getAttribute("current-user");

if(user3 == null){
	session.setAttribute("message", "You are not logged in! please login first.");
	response.sendRedirect("login.jsp");
	return;
}

%>
<!-- Modal -->
<div class="modal fade" id="myacc"  tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">My Account</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="container">
					<label class="label"><i class="fa fa-comments" aria-hidden="true"></i> <b>Name:</b> <span> <%= user3.getUserName() %> </span> <span> <i style="size: 30px; " class="fa fa-pencil" aria-hidden="true"></i></span> </label><br/><br>
				<label class="label"><i class="fa fa-envelope" aria-hidden="true"></i> <b>Email:</b> <span> <%= user3.getUserEmail() %> </span> <span> <i class="fa fa-pencil" aria-hidden="true"></i></span> </label><br/><br>
				<label class="label"><i class="fa fa-key" aria-hidden="true"></i> <b>Password:</b> <span> <%= user3.getUserPassword() %> </span>
				 <span> <i class="fa fa-pencil" aria-hidden="true"></i></span> </label><br/><br>
				<label class="label"><i class="fa fa-phone" aria-hidden="true"></i> <b>Phone No:</b> <span> <%= user3.getUserPhone() %> </span>
				 <span> <i class="fa fa-pencil" aria-hidden="true"></i></span> </label><br/><br>
				<label class="label"> <i class="fa fa-address-book" aria-hidden="true"></i> <b>Address: </b> <span> <%= user3.getUserAddress() %> </span>
				 <span> <i class="fa fa-pencil" aria-hidden="true"></i></span> </label><br/><br>
				</div>
				
				
				


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary checkout-btn custom-bg">
				Save
				</button>
			</div>
		</div>
	</div>
</div>