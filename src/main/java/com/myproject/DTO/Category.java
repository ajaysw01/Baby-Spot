package com.myproject.DTO;

import java.util.ArrayList;
import java.util.List;

public class Category {

	private int cId;
	private String cName;
	private String cDiscription;
	
	private List<Product> products = new ArrayList<>();
	public Category() {
		super();
	}
	public Category(int cId, String cName, String cDiscription) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cDiscription = cDiscription;
	}
	
	public Category(int cId, String cName, String cDiscription, List<Product> products) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cDiscription = cDiscription;
		this.products = products;
	}
	public Category(String cName, String cDiscription) {
		super();
		this.cName = cName;
		this.cDiscription = cDiscription;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcDiscription() {
		return cDiscription;
	}
	public void setcDiscription(String cDiscription) {
		this.cDiscription = cDiscription;
	}
	
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return cId + ", " + cName + ", " + cDiscription + ", " + products;
	}

	
}
