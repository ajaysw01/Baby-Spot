package com.myproject.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Home extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		resp.setContentType("text/html");
		String user = req.getParameter("username");
		String psw = req.getParameter("password");
		PrintWriter writer = resp.getWriter();
		writer.println("<h1>Connection Established</h1>");
		writer.println(user);
		writer.println(psw);
	}
}
