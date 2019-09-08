package com.product.bean;

import java.util.List;

public class User {
	private int uid;
	private String username;
	private String password;
	private  String photo;
	private Favorite favorite;
	
	private  Umessage umessages;
	private static int balance=100000;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public static int getBalance() {
		return balance;
	}
	public static void setBalance(int balance) {
		User.balance = balance;
	}
	public Umessage getUmessages() {
		return umessages;
	}
	public void setUmessages(Umessage umessages) {
		this.umessages = umessages;
	}
	public Favorite getFavorite() {
		return favorite;
	}
	public void setFavorite(Favorite favorite) {
		this.favorite = favorite;
	}



}
