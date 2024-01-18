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

public class UserRegistration extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//getting data from Registration Page
		resp.setContentType("text/html");
		PrintWriter writer = resp.getWriter();
		String user_Name = req.getParameter("name");
		String user_Email = req.getParameter("email");
		String user_Password = req.getParameter("password");
		String user_Phone = req.getParameter("phone");
		String user_Address = req.getParameter("address");
		
		//creating user object
		User user = new User(user_Name, user_Email, user_Password, user_Phone, user_Address,"normal");
		//calling insertRecord method
		if(UserDAO.insertRecord(user) == true) {
			
			HttpSession session = req.getSession();
			session.setAttribute("message", "Registration successful !!");
			resp.sendRedirect("register.jsp");
		}
	
	}

}
