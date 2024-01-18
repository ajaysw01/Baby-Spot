package com.myproject.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import com.myproject.DAO.CategoryDAO;
import com.myproject.DAO.ProductDAO;
import com.myproject.DTO.Category;
import com.myproject.DTO.Product;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		//check if the add category operation call or add product operation call
		String operation = request.getParameter("operation");
		
		if(operation.trim().equals("addCategory")) {
			//Fetching the add Category details
			String categoryTitle = request.getParameter("catTitle");
			String categoryDisc = request.getParameter("catDisc");
			
			Category category = new Category();
			category.setcName(categoryTitle);
			category.setcDiscription(categoryDisc);
			
			//calling saveCategory method of CategoryDAO class
			CategoryDAO cdao = new CategoryDAO();
			cdao.saveCategory(category);

			//sending message "category added successfully!" to admin page.
			HttpSession session = request.getSession();
			session.setAttribute("message", "Category added successfully!");
			response.sendRedirect("admin.jsp");
			return;
		}else if(operation.trim().equals("addProduct")) {
			
			//Fetching add product details
			String productTitle = request.getParameter("prodTitle");
			int productPrice = Integer.parseInt(request.getParameter("prodPrice"));
			int productDiscount = Integer.parseInt(request.getParameter("prodDiscount"));
			int productQuantity = Integer.parseInt(request.getParameter("prodQuant"));
			int catid = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("prodPhoto");
			String productDiscription = request.getParameter("prodDiscription");
			
			//creating object of Product class
			Product product = new Product();
			product.setpName(productTitle);
			product.setpPrice(productPrice);
			product.setpDiscount(productDiscount);
			product.setpQuantity(productQuantity);
			product.setpPhoto(part.getSubmittedFileName());
			product.setpDiscription(productDiscription);
			product.setCategory(catid);
			
			//calling addProductDetails() method from ProductDAO class
			ProductDAO dao = new ProductDAO();
			dao.addProductDetails(product);
			
			//uploading products images 
			//finding the path to upload photo
			ServletContext context = getServletContext();
			
			String uploadPath = getServletContext().getRealPath("images") +File.separator +"products"+File.separator + part.getSubmittedFileName();
            String realPath = uploadPath + File.separator + part.getSubmittedFileName();
			
			//String realPath = request.getServletContext().getRealPath("images")+File.separator +"products"+File.separator + part.getSubmittedFileName();
			
			try {

				//image uploading code..
				FileOutputStream fos = new FileOutputStream(realPath);
				
				InputStream is = part.getInputStream();
				
				//reading data
				byte [] data = new byte[is.available()];
				
				is.read(data);
				
				//writing data
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			//sending message "category added successfully!" to admin page.
			HttpSession session = request.getSession();
			session.setAttribute("message", "Product added successfully!");
			response.sendRedirect("admin.jsp");
			return;
		}
		
	
	}

}
