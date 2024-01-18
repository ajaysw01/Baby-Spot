package com.mycart.helper;

public class Helper {
	
	public static String get10Words(String descr) {
		
		String[] str = descr.split(" ");
		
		if(str.length > 10) {
			
			String res ="";
			for(int i = 0; i < 10; i++) {
				res = res + str[i]+" ";
			}
			return (res+"...");
		}else {
			
			return (descr+"...");
		}
		
	}
}
