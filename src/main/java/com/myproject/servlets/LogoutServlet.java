package com.myproject.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    // removing current user 
	    session.removeAttribute("current-user");
	    session.setAttribute("loggedIn", "false"); // set loggedIn to false
	    // sending response to login page
	    resp.sendRedirect("login.jsp");
	}

}
