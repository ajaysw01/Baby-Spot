package com.myproject.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.myproject.DAO.UserDAO;
import com.myproject.DTO.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String email = req.getParameter("email");
	    String password = req.getParameter("password");
	    resp.setContentType("text/html");
	    PrintWriter writer = resp.getWriter();
	    
	    User user = UserDAO.getUserByLogin(email, password);
	    HttpSession session = req.getSession();
	    
	    if(user == null) {
	        session.setAttribute("message", "Invalid Login,Please try again");
	        resp.sendRedirect("login.jsp");
	    } else {
	        writer.println("<h2>Welcome! "+ user.getUserName() +"</h2>");
	        
	        // login
	        session.setAttribute("current-user", user);
	        session.setAttribute("loggedIn", "true"); // set loggedIn to true
	        if(user.getUserType().equalsIgnoreCase("admin")) {
	            // if user is admin then send user to admin page
	            resp.sendRedirect("admin.jsp");
	        } else if(user.getUserType().equalsIgnoreCase("normal")) {
	            // if user is admin then send user to admin page
	            resp.sendRedirect("normal.jsp");
	        }
	    }
	}

}
