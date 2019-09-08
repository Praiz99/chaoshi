<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>editProduct</title>
<link rel="stylesheet" href="<%=basePath%>css/addProduct.css"
	type="text/css">
	<style type="text/css">
label {
      padding: 0 5px;
      font-size: 12px;
      border-radius: 5px;
      color: #333;
      border: 1px solid #ccc;
      background-color: #fff;
    }
    
    input[type="file"] {
      display: block;
      margin-top: 100px;
    }
	</style>
</head>
<body background="<%=basePath%>images/bg.jpg">
<a href="<%=basePath %>main">返回首页</a>
	<center>
		<form action="updateEmp" method="post">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" name="eid" value="${e.eid }"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>姓名</td>
					<td><input type="text" name="ename" value=${e.ename }></td>
				</tr>
				<tr>
					<td>生日</td>
					<td><input type="text" 
  						value="<fmt:formatDate value="${e.birthday }"  pattern="yyyy/MM/dd"/>"   
  						name="birthday"></td>
				</tr>
				<tr>
					<td>住址</td>
					<td><input type="text" name="address" value=${e.address }></td>
				</tr>
				<tr>
					<td>电话</td>
					<td><input type="text" name="phone" value=${e.phone }></td>
				</tr>
				<tr>
					<td>当前头像</td>
					<td><img src="<%=basePath %>images/${e.ephoto}" width="50px" height="50px">
					</td>
					
				</tr>
				<td colspan=2><input type="submit" value="完成"></td>
			</table>
		</form>
	</center>
</body>
</html>