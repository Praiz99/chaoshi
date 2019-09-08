package com.product.Interceptor;

import javax.security.auth.login.LoginContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.product.bean.User;

public class TestInterceptor implements HandlerInterceptor{
//该方法将在整个请求完成之后，也就是说在视图渲染之后进行调用，主要用于进行一些资源的释放
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}
//返回视图之前执行
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
//进入Handler方法之前执行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		

		String url=request.getRequestURI();
		if(url.indexOf("login")>=0||url.indexOf("register")>=0 || url.indexOf("code")>0 ||url.indexOf("Inspection_user")>0){
			return true;
		}
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "您还未登录，请登录");
			request.getRequestDispatcher("gologin").forward(request,response);
			return false;
		}
	
		return true;
		
		
	}

}
