package com.myproject.DTO;

public class Product {

	private int pId;
	private String pName;
	private String pDiscription;
	private int pPrice;
	private String pPhoto;
	private int pDiscount;
	private int pQuantity;
	private int categoryId;
	
	public Product(int pId, String pName, String pDiscription, int pPrice, String pPhoto, int pDiscount,
			int pQuantity, int categoryId) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pDiscription = pDiscription;
		this.pPrice = pPrice;
		this.pPhoto = pPhoto;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.categoryId = categoryId;
	}
	public Product(String pName, String pDiscription, int pPrice, String pPhoto, int pDiscount, int pQuantity) {
		super();
		this.pName = pName;
		this.pDiscription = pDiscription;
		this.pPrice = pPrice;
		this.pPhoto = pPhoto;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
	}
	public Product() {
		super();
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDiscription() {
		return pDiscription;
	}
	public void setpDiscription(String pDiscription) {
		this.pDiscription = pDiscription;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpPhoto() {
		return pPhoto;
	}
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public int getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}
	
	public int getCategory() {
		return categoryId;
	}
	public void setCategory(int categoryId) {
		this.categoryId = categoryId;
	}
	@Override
	public String toString() {
		return pId + ", " + pName + ", " + pDiscription + ", " + pPrice
				+ ", " + pPhoto + ", " + pDiscount + ", " + pQuantity + ", "
				+ categoryId;
	}
	
	//calculating price after discount method
	public int getPriceAfterApplyingDiscount() {
		
		int disPrice = (int)((this.getpDiscount()/100.0)*this.getpPrice());
		
		return this.getpPrice()-disPrice;
	}
	
	
	
}
