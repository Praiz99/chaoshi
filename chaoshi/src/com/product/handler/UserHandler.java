	package com.product.handler;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.product.bean.Favorite;
import com.product.bean.Umessage;
import com.product.bean.User;
import com.product.service.UserService;
import com.product.utils.ValidateCode;

@Controller
public class UserHandler {
	@Autowired
	private UserService us;
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public  String loginact(User u,String code, HttpServletRequest request) {
		User user=us.checkUserInfo(u);
		String msg=null;
		HttpSession session=request.getSession();
		String rightcode=(String)session.getAttribute("rightcode");
		
		if(user==null){
			msg="user_error";
			return msg;
		}else if(!code.toLowerCase().equals(rightcode.toLowerCase())){
			msg="code_error";
			return msg;
		}else{
			msg="success";
			Boolean favor=us.select_favorite(user.getUid());
			Favorite favorite=new Favorite();
			favorite.setFavor(favor);
			user.setFavorite(favorite);
			session.setAttribute("user", user);
			return msg;
		}		
		}

	@RequestMapping(value="/code",method=RequestMethod.GET)
	public void generateCpacha(
			@RequestParam(value="w",required=false,defaultValue="100")Integer width,
			@RequestParam(value="h",required=false,defaultValue="100")Integer height,
			@RequestParam(value="c",required=false,defaultValue="4")Integer codeCount,
			@RequestParam(value="l",required=false,defaultValue="4")Integer lineCount,
			String type,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		ValidateCode c=new ValidateCode(width,height,codeCount,lineCount);
		request.getSession().setAttribute("rightcode",c.getCode() );
		 c.write(response.getOutputStream());
	}
	@RequestMapping(value="/advice",method=RequestMethod.POST)
	public String useradvice(Umessage umessage,HttpServletRequest request){	
		User user=(User)request.getSession().getAttribute("user");
		user.setUmessages(umessage);
		us.add_advice(user);
		return "index";
	}
	@RequestMapping(value="/favorite")
	public String  favorite(HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		us.add_favorite(user.getUid());
		Boolean favor=us.select_favorite(user.getUid());
		Favorite favorite=new Favorite();
		favorite.setFavor(favor);
		user.setFavorite(favorite);
		request.getSession().setAttribute("user", user);
		return "redirect:/goindex";
	}
	@RequestMapping(value="/register" ,method=RequestMethod.POST)
	public String register(User u,/*@RequestParam("pic")MultipartFile pictureFile ,*/HttpServletRequest request) throws IllegalStateException, IOException{
		us.insertUser(u);
		request.setAttribute("username", u.getUsername());
		return "login";
	}
	@RequestMapping(value="/goregister")
	public String goregister(){
		return "register";
	}
	@RequestMapping(value="/Inspection_user/{val}")
	@ResponseBody
	public String Inspection_user(@PathVariable("val")String username){
		String info=null;
		if(us.Inspection_user(username)!=0){
			info="fail";
		}
		return info;
	}
	@RequestMapping(value="/updapass",method=RequestMethod.POST)
	public String updapass(@RequestParam("uid")int uid, @RequestParam("wpassword")String wpassword,HttpServletRequest request){
		us.updatpass(uid, wpassword);
		HttpSession session=request.getSession();
		session.setAttribute("userid", uid);
		return "index";
	}
	@RequestMapping(value="/main")
	public String main(){
		return "index";
	}
	@RequestMapping(value="/gologin")
	public String gologin(HttpSession session){
		session.invalidate();
		return "login";
	}
	@RequestMapping(value="/go_updapass")
	public String go_updapass()
	{
		return "updapass";
	}
	
	@RequestMapping(value="/goindex")
	public String goindex(){
		return "index";
	}
	private static final String filePath="D:/java程序/超市/chaoshi/WebRoot/images/";
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public String upload(@RequestParam("photo")MultipartFile file,HttpServletRequest request){
		//得到图片名
	     String fileName=file.getOriginalFilename();
	     //得到图片的扩展名
	     String suffixName=fileName.substring(fileName.lastIndexOf("."));
	     //获取一个随机的图片名
	     fileName= UUID.randomUUID()+suffixName;
	     User user=(User)request.getSession().getAttribute("user");
	     int uid=user.getUid();
	     String oldphoto=user.getPhoto();
	     File oldfile=new File("D:/java程序/超市/chaoshi/WebRoot/"+oldphoto);
	     if(oldfile.exists()){
	    	 oldfile.delete();
	     }
	     File dest=new File(filePath+fileName);
	     try {
	    	user.setPhoto("images/"+fileName);
		    request.getSession().setAttribute("user", user);
			file.transferTo(dest);
			us.upimg(uid,"images/"+fileName);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "redirect:/goindex";
	}
}
