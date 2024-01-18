package com.myproject.DTO;

public class User {

	private int userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userPhone;
	private String userAddress;
	private String userType;
	
	public User() {
		super();
	}

	public User(String userName, String userEmail, String userPassword, String userPhone, String userAddress,String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public User(int userId, String userName, String userEmail, String userPassword, String userPhone,
			String userAddress,String userType) {
		super();
		this.userId = userId;
		this.userName = userName;
		
		
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return  userId + ", " + userName + ", " + userEmail + ", "
				+ userPassword + ", " + userPhone + ", " + userAddress + ", " + userType;
	}
	
	
	
}
