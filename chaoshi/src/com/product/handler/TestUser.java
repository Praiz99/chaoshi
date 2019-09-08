package com.product.handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

@Controller
public class TestUser {
	@RequestMapping(value="/Testlogin", method = RequestMethod.POST)
	public String login(HttpSession session,String username,String password){
		session.setAttribute("username", username);
		return "index";
	}
	@RequestMapping(value="/myTag")
	public String myTag(){
		return "MyTag";
	}
/*	 @Scheduled(cron = "0/5 * * * * ? ") // 间隔5秒执行
	    public void taskCycle() {
	        System.out.println("使用SpringMVC框架配置定时任务");
	    }*/
}
