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
<title>showProduct</title>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
<script src="<%=basePath %>js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="<%=basePath%>css/showProduct.css" type="text/css">

</head>
<body background="<%=basePath %>images/bg.jpg">

<a href="<%=basePath %>main">返回首页</a>

	<center>
		<br>
		<table class="table">
			<tr >
				<td colspan="4">
					<div id="box">
					<div class="btn-toolbar">
 
						<form action="getProductByName" method="POST">
							<input id="name" type="text" name="pname" placeholder="请输入商品名称">
							<input type="submit" value="搜索" class="search" >
					</form>
					</div>
				</td>
				<td colspan="4"><a data-toggle="modal" data-target="#add_produce" href="" >添加商品</a></td>
			</tr>
			<tr>
				<td>ID</td>
				<td>名字</td>
				<td>价格</td>
				<td>库存</td>
				<td>用途</td>
				<td>描述</td>
				<td colspan="2" align="center">操作</td>
			</tr>

			<c:forEach items="${plist}" var="p">
				<tr class="good">
					<td>${p.pid }</td>
					<td>${p.pname }</td>
					<td>${p.price }</td>
					<td>${p.pnum}</td>
					<td>${p.pstatus}</td>
					<td>${p.pdescribe}</td>
					<td><a  href="selectOneProduct/${p.pid}">修改</a></td>
					<td><a href="#" class="dele">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</center>
	<div id="add_produce" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">添加商品</h1>
                </div>
                <div class="modal-body">
                		
                
                    <form class="form-group message" action="addProduct" method="POST">
                    		<div class="form-group">
                                <label >商品名</label>
                                <input name="pname"  class="form-control" type="text" >
                            </div>
                            <div class="form-group">
                                <label>价格</label>
                                <input name="price"  class="form-control" type="text">
                            </div>
                             <div class="form-group">
                                <label >库存</label>
                                <input name="pnum"  class="form-control" type="text" >
                            </div> 
                            <div class="form-group">
                                <label >用途</label>
                                <input name="pstatus"  class="form-control" type="text" >
                            </div> 
                            <div class="form-group">
                                <label >描述</label>
                                <input name="pdescribe"  class="form-control" type="text" >
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
	$(".dele").click(function(){
	var pid=$(this).parent().parent().find("td:eq(0)").text();
	if(confirm("确认删除该条信息吗")){
	$.ajax({
	url:"delProduct/"+pid,
	type:"DELETE",
	success:function(msg){
	alert("删除成功");
	  window.location.href="showProduct"; 
	}
	});
	}
	});
	var random=Math.random();  //生成随机数：0.32273213103830223
	var demo= (2<<23);   //十进制数：16777216
	var list=random*demo;   //生成代表颜色的随机数：5414546.672569901
	var num=Math.floor(list);  //向下取整：5414546
	$(".good").css({"background": "#"+num.toString(16)})
	</script>
</body>
</html>