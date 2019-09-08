package com.product.dao;


import org.apache.ibatis.annotations.Param;

import com.product.bean.Umessage;
import com.product.bean.User;
/*@Repository*/
public interface UserDao {
	public User checkUserInfo(User u);
	public void insertUser(User u);
	public void updapass(int uid,String wpassword);
	public int Inspection_user(String username);
	public void upimg(@Param("uid")int uid,@Param("photo")String photo);
	public void add_advice(User user);
	public void add_favorite(int uid);
	public boolean select_favorite(int uid);
}
