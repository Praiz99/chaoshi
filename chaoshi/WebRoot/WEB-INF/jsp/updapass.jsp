<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <base href="<%=basePath%>">
     <style type="text/css">
     .error{
     color:red;
     
     }
     </style>
 

  </head>

 
  <body background="<%=basePath %>images/bg.jpg">
	<a href="main">返回首页</a>

    <form id="myform" action="updapass" method="POST" onsubmit="return checkpd();">
	 

			<div class="form-group" align="center">
				
				<input type="hidden" name="uid" value="${ sessionScope.user.uid }" />
				<label>旧密码</label> <br/>
				<input  type="text" placeholder="${sessionScope.user.password }" disabled><br/>	
                 <label>新密码<font color="red">*</font></label>
               <input type="text" class="form-control" name="wpassword" id="wpassword" placeholder="请设置新的登录密码" requeired minlength="6" maxlength="6" style="width: 50%"/>
               <label>确认密码<font color="red">*</font></label>
                <input type="text"  class="form-control"  id="cpassword" name="comfirmpassword" placeholder="请再次填写新的确认密码"  requeired equalTo="#wpassword" style="width: 50%"/><br/>    
                <button type="submit" name="submit" class="btn btn-primary">确认提交</button>
            </div>
            
			
	</form>
	
 	<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.validate.js"></script> 
	<script type="text/javascript">
       
		
	 	 $(' #myform').validate({
        messages:{
            wpassword:{
                required:'密码是必须的',
                minlength:'密码必须为6位',
                maxlength:'密码必须为6位'
            },
            comfirmpassword:{equalTo:'两次输入的新密码不一致'} 
        }
    })
    
    $(".btn").click(function(){
    if(confirm("请确认是否修改")){
    return ture}
    })
     function checkpd(){
		var password=document.getElementById("wpassword").value;
		var comfirmpassword=document.getElementById("cpassword").value;
		var regexPassword = /^[0-9]{6}$/;
		if(comfirmpassword==null || comfirmpassword=="" || password==null || password=="" ){
			alert("密码不能为空");
			return false;
		}
		if(comfirmpassword!=password){
		alert("两次密码不一致");
		return false;
		}
		
		else if (!regexPassword.test(password)) {
			alert("密码不符合要求");
			return false;
		} else {
			return true;
		}
	
		} 
    </script>
     
		
		
     
  	</body>
</html>
