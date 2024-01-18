package com.myproject.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.myproject.DTO.User;

public class UserDAO {
	private static String url = "jdbc:mysql://localhost:3306/my_cart";
	private static String un = "root";
	private static String psw = "root";
	private static Connection connection;
	private static ResultSet result;
	private static PreparedStatement pstmt;
	private static Statement statement;
	
	private static boolean connectToDb() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(url, un, psw);
		return true;
	}
	
	public static boolean insertRecord(User user) {
		
		String query = "INSERT INTO `user`(`userName`,`userEmail`,`userPassword`,`userPhone`,`userAddress`,`userType`) VALUES(?,?,?,?,?,?)";
		
		try {
			if(connectToDb() == true) {
				connection.setAutoCommit(false);
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, user.getUserName());
				pstmt.setString(2, user.getUserEmail());
				pstmt.setString(3, user.getUserPassword());
				pstmt.setString(4, user.getUserPhone());
				pstmt.setString(5, user.getUserAddress());
				pstmt.setString(6, user.getUserType());
				int i = pstmt.executeUpdate();
				System.out.println(i +" rows updated");
				connection.commit();
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static User getUserByLogin(String email,String password) {
		User user = null;
		try {
			if(connectToDb() == true) {
				connection.setAutoCommit(false);
				
				String query="SELECT * FROM `user` WHERE `userEmail` = ? and `userPassword` = ? ";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				result = pstmt.executeQuery();
				
				while(result.next() == true) {
					user = new User();
					user.setUserId(result.getInt(1));
					user.setUserName(result.getString(2));
					user.setUserEmail(result.getString(3));
					user.setUserPassword(result.getString(4));
					user.setUserPhone(result.getString(5));
					user.setUserAddress(result.getString(6));
					user.setUserType(result.getString(7));
				}
			}
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public  int getUsersCount(){
		int count = 0;
		try {
			if(connectToDb()) {
				String str = "SELECT * FROM user";
				statement = connection.createStatement();
				result = statement.executeQuery(str);
				
				while (result.next()) {
					count++;
				}
				return count;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
