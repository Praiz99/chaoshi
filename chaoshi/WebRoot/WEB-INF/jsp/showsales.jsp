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
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"> 
<link rel="stylesheet" href="<%=basePath%>css/showProduct.css" type="text/css">
<style type="text/css">
    .yuefen{display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    }	
</style>
</head>
<body background="<%=basePath %>images/bg.jpg">
<a href="main">返回首页</a>

	<center>
		<table class="table">
		<tr>
		<td colspan="5">
		<p align="center" ><font style="font-weight: bold;color: red;"><%=request.getSession().getAttribute("yuefen") %>月员工销量情况</font></p>
		</td>
		</tr>
			<tr>
				<td colspan="5">
					<div id="box" align="center">
						<form  action="showEmpSa" method="POST" >
						<select  name="yuefen" class="yuefen" >
							<option>===请选择月份===</option>
 		 					<option value="1">一月</option>
  							<option value="2">二月</option>
  							<option value="3">三月</option>
 		 					<option value="4">四月</option>
 		 					<option value="5">五月</option>
						</select>
						
							 <input type="submit" value="搜索" class="search"> 
						</form>
					</div>
				</td>
			</tr>
			<tr>
				<td>销量ID</td>
				<td>员工名</td>
				<td>商品名</td>
				<td>销量</td>
				<td>月份</td>
			</tr>

			<c:forEach items="${sslist }" var="s">
				<tr>
					<td>${s.sales_id }</td>>
					<td>${s.emp.ename}</td>
					<td>${s.product.pname }</td>
					<td>${s.total }</td>
					<td>${s.yuefen}</td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>