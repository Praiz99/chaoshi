<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>product</title>

  <!--   <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">     -->
<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
 <link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/login.css" /> 
	
<script type="text/javascript"   >


	
$(function(){
$(".codes").click(function(){
$(this).attr("src",'<%=basePath%>code?w=90&l=4&c=4&h=30&type='+new Date())
});

$("input[type='button']").click(function(){
var username=$("#username").val();
var password=$("#password").val();
 var code=$("#code").val(); 
if(username==null||username==""){
alert("未输入用户名");
return false;
}
if(password==null||password==""){
alert("未输入密码");
return false
}
$.ajax({
	url:"login",
	type:"POST",
	data:{
	"username":username,
	"password":password,
	 "code":code 
	},
	success:function(msg){
	if(msg=="user_error"){
	
		alert("您输入的用户名或者密码错误");
	  window.location.href="gologin"; 
	  }
	  else if(msg=="code_error"){
	  alert("验证码错误");
	  window.location.href="gologin"; 
	  }else{
	  alert("登录成功");
	  window.location.href="main"; 
	  }
	}
});
});
});
</script>
<style type="text/css">

 
</style>
</head>
<body background="./images/4.jpg">


	<div id="top" style="background: #FFF;height: 50px">
		<div id="register">
		<a href="goregister" 
          style="height: 60px;background-color: #FFF;" >
	                                <span style="color: #000;font-size: 15px">
	                                <img alt="注册" class="img-circle" src="<%=basePath %>images/register2.png" width="20px" height="20px"/>
	                                		注册 
	                            </span>
	                            </a>
	    </div>
	    
	</div>
	<form style="text-align: center">
		<div class="main">
			<table>
				<tr>
					<td colspan="2"><h3 style="text-align: center">商品进销存系统</h3>
						<hr style="margin: 0"></td>
				</tr>
				<tr>
				<td>${msg }</td>
				</tr>
				<tr>
					<td><img class="person" src="./images/username.jpg"> <input
						type="text" id="username" name="username" placeholder="请输入用户名"
						class="message" maxlength="10"></td>
				</tr>
				<tr>
					<td><img class="mima" src="./images/password.png"> <input
						type="password" id="password" name="password" placeholder="请输入密码"
						class="message" maxlength="10"><td>
				</tr>
			 	<tr>
					<td><img class="code" src="./images/code.png" > <input id="code" 
						type="text"  placeholder="请输入验证码" name="code"
						 maxlength="4"> <img class="codes" title="点击切换验证码" style="cursor:pointer;" src=" <%=basePath%>code?w=90&h=30&c=4&l=4 "> </td>
				</tr>
					 
					<tr><td>  <input type="button" class="login" value="登录" id="login">  	</td></tr>
				
				 
			</table>
		
    	
		</div>
		
	


</body>

	
</body>
</html>