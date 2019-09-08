<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>showsales</title>
<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"> 
<link rel="stylesheet" href="<%=basePath%>css/showProduct.css" type="text/css">
	
<script type="text/javascript">
$(function(){

$("#myButton").click(function(){
var caozuo=$("input[type='radio']:checked").val();
var pid=$("#pid").val();
var num=$("#num").val();

if(pid==0){
alert("未选择商品");
return false;
}
if(num==0){
alert("未输入数量");

return false
}

$.ajax({
	url:"goods",
	type:"POST",
	data:{
	"pid":pid,
	"num":num,
	"caozuo":caozuo
	},
	success:function(msg){
	if(msg=="success"){
		alert("成功"+$("input[type='radio']:checked+label").text());
	  window.location.href="order"; 
	  }
	  else{
	  alert("该商品数量少于您退货的数量");
	  
	  window.location.href="order"; 
	  }
	}
});

});
}
);
</script>
</head>
<body background="<%=basePath %>images/bg.jpg">

<a href="main">返回首页</a><br>
<a href="selectallrecord/1">查看进退货记录</a>

 <div class="alert alert-warning alert-dismissible" role="alert">
   <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> 
  <strong>警告!</strong>
   <c:forEach items="${olist}" var="o">
 		<c:if test="${o.pnum<20 }">
 		
    	<font color="red">${o.pname }</font> 
    </c:if>
   </c:forEach> 
   库存不足，请及时补货<br/> 	
 </div> 

	<center>
		<br>	
		<table class="table">
		<tr><h1>商品进退货</h1></tr>
			<tr>
				<td>ID</td>
				<td>商品名</td>
				<td>库存</td>
				<td>描述</td>
			</tr>
			<c:forEach items="${olist }" var="o">
				<tr>
					<td>${o.pid }</td>
					<td>${o.pname }</td>
					<td>${o.pnum }</td>
					<c:choose>
						<c:when test="${o.pnum>20 }">
							<td>库存充足</td>
						</c:when>
						<c:when test="${o.pnum<20 }">
							<td><font style="color: red;">库存不足*</font></td>
						</c:when>
					</c:choose>
					
				</tr>
			</c:forEach>
		</table>
		<form>
		
			
				<select  id="pid" class="form-control" style="width: 50%">
						<option value="0">--请选择商品--</option>
						<c:forEach items="${olist }" var="o">
							<option value="${o.pid }">${o.pname }</option>
						</c:forEach>
				</select><br>
				<input id="num"  class="form-control" type="text" name="num" placeholder="请输入进退货商品数量" style="width: 50%"><br/>
				<label for="jinhuo">进货</label><input name="caozuo" type="radio" id="jinhuo" value=true checked="checked" />
				<label for="tuihuo">退货</label><input name="caozuo" type="radio" id="tuihuo" value=false  />
				<button type="button" id="myButton"  class="btn btn-primary" >确定</button>
		</form>
	</center>
</body>
</html>