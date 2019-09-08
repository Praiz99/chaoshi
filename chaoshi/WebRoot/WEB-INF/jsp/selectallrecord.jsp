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
<link rel="stylesheet" href="<%=basePath%>css/showProduct.css" type="text/css">

</head>

<body background="<%=basePath %>images/bg.jpg">

<a href="../main">返回首页</a>
	<center>
		<br>
		<table class="table">
			<tr>
			
			<td align="center" colspan="5">进退货记录</td>
			
			</tr>
			<tr>
				<td>ID</td>
				<td>商品名</td>
				<td>进退货数量</td>
				<td>进退货时间</td>
				<td>操作</td>
			</tr>

			<c:forEach items="${rlist}" var="r">
				<tr>
					<td>${r.rid }</td>
					<td>${r.pname }</td>
					<td>${r.num }</td>
					<td><fmt:formatDate value="${r.date }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
					<td>${r.caozuo}</td>
				</tr>
			</c:forEach>
		</table>
		    <div class="pagebody">
		    	<div class="pageitems">
		    		当前为第<span >${curPage} </span>页,总共有<span>${totalPages }</span>页,总记录数<span>${totalItems }</span>条
		    	</div>
		    <span>
       <c:if test="${curPage > 1}">
           <a href="../selectallrecord/1">[首页]</a>  
           <a href="../selectallrecord/${curPage-1 }">[上一页]</a>  
       </c:if>
       
       <c:if test="${curPage<totalPages}">
           <a href="../selectallrecord/${curPage+1 }">[下一页]</a>  
           <a href="../selectallrecord/${totalPages }">[尾页]</a>  
       </c:if>
   </span>
		    
             </div>
	</center>
	
	<script type="text/javascript" src="<%=basePath %>js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	 $(function () {
        //上一页
        var curPage = ${curPage};
        var totalPages = ${totalPages};
        $(".prePage").click(function () {
            if (curPage > 1){
                var pageNo = curPage-1;
                $(this).attr("href", "selectallrecord/"+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "selectallrecord/"+pageNo);
            }
        });
    })
    </script>
</body>
</html>