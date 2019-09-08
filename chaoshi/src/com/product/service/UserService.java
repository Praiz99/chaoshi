package com.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.bean.Umessage;
import com.product.bean.User;
import com.product.dao.UserDao;

@Service
public class UserService {
	@Autowired
	private UserDao ud; 
	
	public User checkUserInfo(User u) {
		return ud.checkUserInfo(u);
	}
	public void insertUser(User u){
		ud.insertUser(u);
	}
	public void updatpass(int uid,String wpassword){
		ud.updapass(uid, wpassword);
		
	}
	
	public int Inspection_user(String username){
		return ud.Inspection_user(username);
	}
	public void upimg(int uid,String photo){
			
		 ud.upimg(uid, photo);
	}
	public void add_advice(User user){
		ud.add_advice(user);
	}
	public void add_favorite(int uid){
		
		ud.add_favorite(uid);
	}
	public boolean select_favorite(int uid){
		return ud.select_favorite(uid);
	}
}
