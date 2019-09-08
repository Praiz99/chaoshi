<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>showProduct</title>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"> 
<script src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
<script src="<%=basePath %>js/bootstrap.min.js"></script> 
<style type="text/css">
img{
width:50px;
height:50px;	
}
</style>
</head>
<body background="<%=basePath %>images/bg.jpg">

<a href="main">返回首页</a>

	<center>
		<br>
		<table class="table">
			<tr>
				<td colspan="4">
					<div id="box">
						<form action="getEmpbyname" method="POST">
							 <input id="name" type="text" name="ename" placeholder="请输入员工名">
							<input type="submit" value="搜索" class="search" >
					</form>
					</div>
				</td>
				<td colspan="4"><a data-toggle="modal" data-target="#add_emp" href="">添加员工</a></td>
			</tr>
			<tr>
				<td>ID</td>
				<td>照片</td>
				<td>员工名</td>
				<td>生日</td>
				<td>住址</td>
				<td>电话</td>
				<td colspan="2" align="center">操作</td>
			</tr>

			<c:forEach items="${elist}" var="e">
				<tr class="emp">
					<td>${e.eid }</td>
					<td><img src="<%=basePath %>images/${e.ephoto}" /></td>
					<td>${e.ename }</td>
					<td><fmt:formatDate value="${e.birthday }" pattern="yyyy/MM/dd "/></td>
					<td>${e.address}</td>
					<td>${e.phone}</td>
					<td><a class="btn btn-primary" href="selectOneEmp/${e.eid}" role="button">修改</a></td>
					<td>
					<button type="button" class="btn btn-outline-danger">删除</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</center>
	<div id="add_emp" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">添加员工</h1>
                </div>
                <div class="modal-body">
                    <form class="form-group message" action="addEmp" method="POST">
                    		<div class="form-group">
                                <label >员工姓名</label>
                                <input name="ename"  class="form-control" type="text" >
                            </div>
                       
                             <div class="form-group">
                                <label >生日</label>
                                <input name="birthday"  class="form-control" type="text" >
                            </div> 
                            <div class="form-group">
                                <label >地址</label>
                                <input name="address"  class="form-control" type="text" >
                            </div> 
                            <div class="form-group">
                                <label >电话</label>
                                <input name="phone"  class="form-control" type="text" >
                            </div> 
                   
                            <div class="text-right">
                                <button class="btn btn-primary"  type="submit" >确定</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>  
                    </form>
                </div>
            </div>
        </div>
    </div>
	<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	$(".btn-outline-danger").click(function(){
	var delEmpId=$(this).parent().parent().find("td:eq(0)").text();
	if(confirm("确认删除该条信息吗")){
	$.ajax({
	url:"delEmp/"+delEmpId,
	type:"DELETE",
	success:function(msg){
	alert("删除成功");
	  window.location.href="showEmp"; 
	}
	});
	}
	});
	
	var random=Math.random();  //生成随机数：0.32273213103830223
	var demo= (2<<23);   //十进制数：16777216
	var list=random*demo;   //生成代表颜色的随机数：5414546.672569901
	var num=Math.floor(list);  //向下取整：5414546
	$(".emp").css({"background": "#"+num.toString(16)})
	</script>
	
	
</body>
</html>