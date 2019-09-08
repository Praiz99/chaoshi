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
//�÷������������������֮��Ҳ����˵����ͼ��Ⱦ֮����е��ã���Ҫ���ڽ���һЩ��Դ���ͷ�
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}
//������ͼ֮ǰִ��
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
//����Handler����֮ǰִ��
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
			request.setAttribute("msg", "����δ��¼�����¼");
			request.getRequestDispatcher("gologin").forward(request,response);
			return false;
		}
	
		return true;
		
		
	}

}
