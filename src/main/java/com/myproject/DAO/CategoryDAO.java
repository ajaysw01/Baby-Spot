package com.myproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.myproject.DTO.Category;

public class CategoryDAO {
	
	private static String url = "jdbc:mysql://localhost:3306/my_cart";
	private static String un = "root";
	private static String psw = "root";
	private static Connection connection;
	private static PreparedStatement pstmt;

	private static boolean connectToDb() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(url, un, psw);
		System.out.println("connection established..");
		return true;
	}
	
	public boolean saveCategory(Category category) {
		
		String query = "INSERT INTO category(`cName`,`cDiscr`) VALUES(?,?)";
		try {
			if(connectToDb()) {
				connection.setAutoCommit(false);
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, category.getcName());
				pstmt.setString(2, category.getcDiscription());
				pstmt.executeUpdate();
			}
			connection.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Category> getCategories(){
		List<Category> categories =null;
		try {
			if(connectToDb() == true) {
				String query = "SELECT * FROM category";
				Statement statement = connection.createStatement();
				ResultSet result = statement.executeQuery(query);
			    categories = new ArrayList<>();
				while (result.next() == true) {
					Category cat = new Category();
					cat.setcId(result.getInt(1));
					cat.setcName(result.getString(2));
					cat.setcDiscription(result.getString(3));
					categories.add(cat);
				}
			}
			return categories;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}
	
	

}
