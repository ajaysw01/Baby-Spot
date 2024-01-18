package com.myproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.myproject.DTO.Product;

public class ProductDAO {

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
	
	public boolean addProductDetails(Product product) {
		try {
			if(connectToDb() == true) {
				connection.setAutoCommit(false);
				String query = "INSERT INTO product(`pName`,`pDiscr`,`pPrice`,`pPhoto`,`pDiscount`,`pQuantity`,`category_id`) VALUES(?,?,?,?,?,?,?)";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, product.getpName());
				pstmt.setString(2, product.getpDiscription());	
				pstmt.setInt(3, product.getpPrice());
				pstmt.setString(4, product.getpPhoto());
				pstmt.setInt(5, product.getpDiscount());
				pstmt.setInt(6, product.getpQuantity());
				pstmt.setInt(7, product.getCategory());
				pstmt.executeUpdate();
			}
			connection.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//get all products
	
	public List<Product> getAllProducts(){
		List<Product> products = null;
		try {
			if(connectToDb() == true) {
				Statement statement = connection.createStatement();
				
				String query = "SELECT * FROM product";
				ResultSet res = statement.executeQuery(query);
				products = new ArrayList<>();
				while(res.next() == true) {
					Product product = new Product();
					product.setpId(res.getInt(1));
					product.setpName(res.getString(2));
					product.setpDiscription(res.getString(3));
					product.setpPrice(res.getInt(4));
					product.setpPhoto(res.getString(5));
					product.setpDiscount(res.getInt(6));
					product.setpQuantity(res.getInt(7));
					product.setCategory(res.getInt(8));
					products.add(product);
				}
			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	//get all products of given id
	public List<Product> getAllProductsById(int cid){
		List<Product> products = null;
		try {
			if(connectToDb() == true) {
				
				String query = "SELECT * FROM product WHERE category_id = ?";
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setInt(1, cid);
				ResultSet res = pstmt.executeQuery();
				products = new ArrayList<>();
				while(res.next() == true) {
					Product product = new Product();
					product.setpId(res.getInt(1));
					product.setpName(res.getString(2));
					product.setpDiscription(res.getString(3));
					product.setpPrice(res.getInt(4));
					product.setpPhoto(res.getString(5));
					product.setpDiscount(res.getInt(6));
					product.setpQuantity(res.getInt(7));
					product.setCategory(res.getInt(8));
					products.add(product);
				}
			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
}
