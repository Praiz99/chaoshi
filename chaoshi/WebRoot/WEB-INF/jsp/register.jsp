<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/login&register.css">
		<link rel="icon" type="image/x-ico" href="images/stu.ico">
		<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
		function checkName(){
		var username=document.getElementById("username").value;
		var password=document.getElementById("password").value;
		var regexName = /^[0-9a-zA-Z]{3,10}$/;
		var regexPassword = /^[0-9]{6}$/;
		if(username.length==0 || username==null){
		alert("注册的用户名不能为空");
		return false;
		}
		if(password.length == 0 || password == null){
				alert("注册的密码不能为空");
				return false;
		}
		else if (!regexName.test(username) || !regexPassword.test(password)) {
			alert("注册的用户名或者密码不符合要求");
			return false;
		} else {
		alert("注册成功");
		
			return true;
		}
	
		}
		$(function(){
			$(":input[name='username']").change(function(){
			var val=$(this).val();
			val=$.trim(val);
			if(val!=""){
			$.ajax({
			url:"Inspection_user/"+val,
			type:"GET",
			success:function(data)
			{
			var str=data;
			if(str=="fail"){
			$("#message").html("<font color='red'>该用户名已存在</font>");
			}else{
			$("#message").html("<font color='red'>该用户名可用</font>");
			}
			}
			});
			
			
			}
			});
		});
		</script>
	</head>
	<body>

					<a href="gologin">首页</a>
		<!--Main-->
		<main>
			<div class="container">
				<form class="register_form" action="register" method="post" onsubmit="return checkName();">
					<h3>超市进存销系统</h3>
					用户名:<input id="username" type="text" autofocus="autofocus" name="username" value placeholder="用户名必须为3-10位英文字母" required="required"><br>
					<div id="message"></div>
					密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="text" id="password" name="password" value placeholder="密码必须为6位数字" required="required"><br>
					
					<!-- 头&nbsp;&nbsp;&nbsp;&nbsp;像:<input type="file" name="pic" ><br> -->
					<input id="submit" type="submit" name="submit" value="注册">
				</form>
			</div>
		</main>
	</body>
</html>
